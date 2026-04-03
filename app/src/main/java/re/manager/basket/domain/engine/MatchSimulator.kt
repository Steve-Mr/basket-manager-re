package re.manager.basket.domain.engine

import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.entity.MatchResultEntity
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TacticEntity
import re.manager.basket.domain.model.Constants
import kotlin.random.Random

import re.manager.basket.domain.model.Position

class MatchSimulator(
    private val match: MatchEntity,
    private val localPlayers: List<PlayerEntity>,
    private val visitorPlayers: List<PlayerEntity>,
    private val localTactic: TacticEntity,
    private val visitorTactic: TacticEntity
) {
    private val localResults = mutableMapOf<Int, MatchResultEntity>()
    private val visitorResults = mutableMapOf<Int, MatchResultEntity>()
    private lateinit var rulete: Rulete

    private fun createInitialResults() {
        localPlayers.forEach { player ->
            localResults[player.id] = MatchResultEntity(
                gameId = match.gameId,
                matchId = match.id,
                matchday = match.matchday,
                playerId = player.id,
                name = player.name
            )
        }
        visitorPlayers.forEach { player ->
            visitorResults[player.id] = MatchResultEntity(
                gameId = match.gameId,
                matchId = match.id,
                matchday = match.matchday,
                playerId = player.id,
                name = player.name
            )
        }
    }

    private val injuredPlayers = mutableListOf<PlayerEntity>()

    fun simulate(): MatchFullResult {
        createInitialResults()

        // Safety: If any team has no starters, auto-assign for this match
        val optimizer = LineupOptimizer()
        val effectiveLocalTactic = if (localTactic.titPG == 0) optimizer.optimize(localPlayers, localTactic) else localTactic
        val effectiveVisitorTactic = if (visitorTactic.titPG == 0) optimizer.optimize(visitorPlayers, visitorTactic) else visitorTactic

        calculateMinutes(true, effectiveLocalTactic)
        calculateMinutes(false, effectiveVisitorTactic)

        rulete = Rulete(
            localTitulars = localPlayers.filter { isTitular(it, effectiveLocalTactic) },
            localReserves = localPlayers.filter { isReserve(it, effectiveLocalTactic) },
            visitorTitulars = visitorPlayers.filter { isTitular(it, effectiveVisitorTactic) },
            visitorReserves = visitorPlayers.filter { isReserve(it, effectiveVisitorTactic) },
            localTactic = effectiveLocalTactic,
            visitorTactic = effectiveVisitorTactic,
            localTeamId = match.teamLocalId,
            resultsProvider = { id -> localResults[id] ?: visitorResults[id] }
        )

        var possessions = Constants.BASE_POSSESSIONS
        var currentPos = 0
        while (currentPos < possessions) {
            // Correct possession alternate: In original code, i % 2 == 0 is visitor attacking
            val isVisitorAttacking = currentPos % 2 == 0

            playPossession(currentPos, isVisitorAttacking)

            if (currentPos == possessions - 1 && getTotalPoints(true) == getTotalPoints(false)) {
                possessions += Constants.OVERTIME_POSSESSIONS
            }
            currentPos++
        }

        return finalizeMatch()
    }

    private fun playPossession(pos: Int, isVisitorAttacking: Boolean) {
        val isLocalAttacking = !isVisitorAttacking

        // 1. Injury Check
        if (Random.nextInt(100) < Constants.INJURY_CHECK_PROB) {
            val player = rulete.pickPlayer(0, isLocalAttacking, if (isLocalAttacking) match.teamLocalId else match.teamVisitorId)
            player?.let { p ->
                val defenseModifier = getDefenseModifier(p, isLocalAttacking)
                val injuryCheckValue = (p.stateEnergy * (p.skillPhysique + defenseModifier)) / 100
                if (!accomplishedAction(injuryCheckValue, 1.0f)) {
                    if (p.stateInjury == 0) {
                        injuredPlayers.add(p.copy(stateInjury = -1))
                    } else if (p.stateInjury == -1) {
                        val damageType = Random.nextInt(101)
                        val duration = when {
                            damageType <= Constants.INJURY_TYPE_MINOR_PROB -> Random.nextInt(2, 8)
                            damageType <= Constants.INJURY_TYPE_MEDIUM_PROB -> Random.nextInt(8, 50)
                            else -> Random.nextInt(50, 181)
                        }
                        injuredPlayers.add(p.copy(stateInjury = duration))
                    }
                }
            }
        }

        // 2. Steal Check
        val stealer = rulete.pickPlayer(3, !isLocalAttacking, if (!isLocalAttacking) match.teamLocalId else match.teamVisitorId)
        if (stealer != null && accomplishedAction(stealer.skillSteal + getDefenseModifier(stealer, !isLocalAttacking), 0.5f)) {
            val res = (if (!isLocalAttacking) localResults else visitorResults)[stealer.id]!!
            updateResult(res.copy(steals = res.steals + 1), !isLocalAttacking)
            return
        }

        // 3. Turnover Check
        val passer = rulete.pickPlayer(5, isLocalAttacking, if (isLocalAttacking) match.teamLocalId else match.teamVisitorId)
        if (passer != null && !accomplishedAction(passer.skillPass + getAttackModifier(passer, isLocalAttacking), 0.6f)) {
            val res = (if (isLocalAttacking) localResults else visitorResults)[passer.id]!!
            updateResult(res.copy(passesKo = res.passesKo + 1), isLocalAttacking)
            return
        }

        // 4. Assistance Check
        var assistanceModifier = 0
        if (Random.nextInt(100) < 34) {
            val ast = rulete.pickPlayer(5, isLocalAttacking, if (isLocalAttacking) match.teamLocalId else match.teamVisitorId)
            if (ast != null && accomplishedAction(ast.skillPass + getAttackModifier(ast, isLocalAttacking), 1.0f)) {
                val res = (if (isLocalAttacking) localResults else visitorResults)[ast.id]!!
                updateResult(res.copy(passesOk = res.passesOk + 1, assists = res.assists + 1), isLocalAttacking)
                assistanceModifier = 5
            }
        }

        // 5. Shot Selection
        val attackingTactic = if (isLocalAttacking) localTactic else visitorTactic

        // Refined shooting probability based on tactic and original logic
        val shotRoll = Random.nextInt(100)
        val isInterior = shotRoll < attackingTactic.shotIntPercent
        val isTriple = !isInterior && Random.nextInt(100) < attackingTactic.shotTriplePercent
        val shotType = if (isInterior) 1 else if (isTriple) 3 else 2

        // Always attempt to pick a shooter to avoid skipping possessions
        val shooter = rulete.pickPlayer(if (isInterior) 6 else 7, isLocalAttacking, if (isLocalAttacking) match.teamLocalId else match.teamVisitorId)
        if (shooter == null) return

        var shotValue = (if (isInterior) shooter.skillShotInterior else shooter.skillShotExterior) + getAttackModifier(shooter, isLocalAttacking)
        shotValue += (shotValue * assistanceModifier) / 100

        // 6. Block Check
        val blocker = rulete.pickPlayer(2, !isLocalAttacking, if (!isLocalAttacking) match.teamLocalId else match.teamVisitorId)
        val attemptBlockProb = if (isInterior) 11 else 9
        if (Random.nextInt(100) < attemptBlockProb && blocker != null) {
            if (blocker.skillBlock + getDefenseModifier(blocker, !isLocalAttacking) + getRandomGauss(0, 100) > getRandomGauss(0, 100) + shotValue) {
                val res = (if (!isLocalAttacking) localResults else visitorResults)[blocker.id]!!
                updateResult(res.copy(blocks = res.blocks + 1), !isLocalAttacking)
                return
            }
        }

        // 7. Shot Success
        val modifier = if (isInterior) 0.65f else if (isTriple) 0.45f else 0.55f
        if (accomplishedAction(shotValue, modifier)) {
            val res = (if (isLocalAttacking) localResults else visitorResults)[shooter.id]!!
            val updated = when(shotType) {
                1 -> res.copy(shotsIntOk = res.shotsIntOk + 1, points = res.points + 2)
                2 -> res.copy(shotsExt2Ok = res.shotsExt2Ok + 1, points = res.points + 2)
                else -> res.copy(shotsExt3Ok = res.shotsExt3Ok + 1, points = res.points + 3)
            }
            updateResult(updated, isLocalAttacking)
        } else {
            val res = (if (isLocalAttacking) localResults else visitorResults)[shooter.id]!!
            val updated = when(shotType) {
                1 -> res.copy(shotsIntKo = res.shotsIntKo + 1)
                2 -> res.copy(shotsExt2Ko = res.shotsExt2Ko + 1)
                else -> res.copy(shotsExt3Ko = res.shotsExt3Ko + 1)
            }
            updateResult(updated, isLocalAttacking)

            // 8. Rebound
            if (Random.nextInt(100) < 76) {
                val offRebounder = rulete.pickPlayer(4, isLocalAttacking, if (isLocalAttacking) match.teamLocalId else match.teamVisitorId)
                val defRebounder = rulete.pickPlayer(4, !isLocalAttacking, if (!isLocalAttacking) match.teamLocalId else match.teamVisitorId)

                if (offRebounder != null && defRebounder != null &&
                    offRebounder.skillRebound + getDefenseModifier(offRebounder, isLocalAttacking) + getRandomGauss(0, 100) >
                    defRebounder.skillRebound + getDefenseModifier(defRebounder, !isLocalAttacking) + getRandomGauss(0, 100)) {

                    val res = (if (isLocalAttacking) localResults else visitorResults)[offRebounder.id]!!
                    updateResult(res.copy(rebounds = res.rebounds + 1), isLocalAttacking)

                    if (loseManyPoints(isLocalAttacking)) {
                        playPossession(pos, isVisitorAttacking)
                    }
                } else if (defRebounder != null) {
                    val res = (if (!isLocalAttacking) localResults else visitorResults)[defRebounder.id]!!
                    updateResult(res.copy(rebounds = res.rebounds + 1), !isLocalAttacking)
                }
            }
        }
    }

    private fun finalizeMatch(): MatchFullResult {
        val totalLocal = getTotalPoints(true)
        val totalVisitor = getTotalPoints(false)

        // Standard quarter distribution logic based on original game
        val quarters = listOf(21, 24, 29) // Reference from Simulate.java:getQuarters

        fun distribute(total: Int): List<Int> {
            val q1 = (total * 0.22).toInt()
            val q2 = (total * 0.25).toInt()
            val q3 = (total * 0.28).toInt()
            val q4 = total - q1 - q2 - q3
            return listOf(q1, q2, q3, q4)
        }

        val lq = distribute(totalLocal)
        val vq = distribute(totalVisitor)

        val finalizedMatch = match.copy(
            localQ1 = lq[0],
            localQ2 = lq[1],
            localQ3 = lq[2],
            localQ4 = lq[3],
            visitorQ1 = vq[0],
            visitorQ2 = vq[1],
            visitorQ3 = vq[2],
            visitorQ4 = vq[3]
        )

        return MatchFullResult(
            match = finalizedMatch,
            playerResults = localResults.values.toList() + visitorResults.values.toList(),
            injuries = injuredPlayers.toList()
        )
    }

    private fun calculateMinutes(isLocal: Boolean, tactic: TacticEntity) {
        val results = if (isLocal) localResults else visitorResults
        val benchImportance = tactic.benchImportance

        val titulares = if (isLocal) localPlayers.filter { isTitular(it, tactic) } else visitorPlayers.filter { isTitular(it, tactic) }
        val reservas = if (isLocal) localPlayers.filter { isReserve(it, tactic) } else visitorPlayers.filter { isReserve(it, tactic) }

        for (i in 0 until 5) {
            val tit = titulares.getOrNull(i)
            val res = reservas.getOrNull(i)
            val resMinutes = benchImportance + Random.nextInt((benchImportance - 1) * 4, benchImportance * 4 + 1)

            tit?.let { p -> results[p.id]?.let { r -> results[p.id] = r.copy(minutesPlayed = 48 - resMinutes) } }
            res?.let { p -> results[p.id]?.let { r -> results[p.id] = r.copy(minutesPlayed = resMinutes) } }
        }
    }

    private fun updateResult(result: MatchResultEntity, isLocal: Boolean) {
        if (isLocal) localResults[result.playerId] = result else visitorResults[result.playerId] = result
    }

    private fun getTotalPoints(isLocal: Boolean): Int {
        return (if (isLocal) localResults else visitorResults).values.sumOf { it.points }
    }

    private fun isTitular(player: PlayerEntity, tactic: TacticEntity) =
        player.id == tactic.titPG || player.id == tactic.titSG || player.id == tactic.titSF || player.id == tactic.titPF || player.id == tactic.titC

    private fun isReserve(player: PlayerEntity, tactic: TacticEntity) =
        player.id == tactic.resPG || player.id == tactic.resSG || player.id == tactic.resSF || player.id == tactic.resPF || player.id == tactic.resC

    private fun loseManyPoints(isLocalGettingRebound: Boolean): Boolean {
        // Logic from com.blank.bm15.model.core.Simulate.java:loseManyPoints
        val teamGettingReboundPlayers = if (isLocalGettingRebound) localPlayers else visitorPlayers
        val otherTeamPlayers = if (isLocalGettingRebound) visitorPlayers else localPlayers
        val tacticGetting = if (isLocalGettingRebound) localTactic else visitorTactic
        val tacticOther = if (isLocalGettingRebound) visitorTactic else localTactic

        val avgGetting = teamGettingReboundPlayers.filter { isTitular(it, tacticGetting) || isReserve(it, tacticGetting) }
            .map { it.getAverageSkillAll() }.average().let { if (it.isNaN()) 40.0 else it }
        val avgOther = otherTeamPlayers.filter { isTitular(it, tacticOther) || isReserve(it, tacticOther) }
            .map { it.getAverageSkillAll() }.average().let { if (it.isNaN()) 40.0 else it }

        val difference = Math.abs(avgGetting - avgOther).toInt() + 2

        val pointsGetting = getTotalPoints(isLocalGettingRebound)
        val pointsOther = getTotalPoints(!isLocalGettingRebound)

        return pointsGetting + difference < pointsOther
    }

    private fun getMatchPosition(player: PlayerEntity, isLocal: Boolean): Position {
        val tactic = if (isLocal) localTactic else visitorTactic
        return when (player.id) {
            tactic.titPG, tactic.resPG -> Position.PG
            tactic.titSG, tactic.resSG -> Position.SG
            tactic.titSF, tactic.resSF -> Position.SF
            tactic.titPF, tactic.resPF -> Position.PF
            tactic.titC, tactic.resC -> Position.C
            else -> player.positionFirst
        }
    }

    private fun getAttackModifier(player: PlayerEntity, isLocal: Boolean) = (if (isLocal) localTactic else visitorTactic).gameType + player.getPenalty(getMatchPosition(player, isLocal))
    private fun getDefenseModifier(player: PlayerEntity, isLocal: Boolean) = -(if (isLocal) localTactic else visitorTactic).gameType + player.getPenalty(getMatchPosition(player, isLocal))

    private fun accomplishedAction(skill: Int, modifier: Float): Boolean {
        // Original logic from Simulate.java:accomplishedAction
        // The skill value includes tactical modifiers and penalties.
        val random = Random.nextInt(0, 101)
        if (random == 0) return true
        if (random == 100) return false
        return random.toFloat() <= (skill.toFloat() * modifier)
    }

    private fun getRandomGauss(min: Int, max: Int): Int {
        val range = (max - min + 1).coerceAtLeast(1)
        val rolls = listOf(Random.nextInt(min, min + range), Random.nextInt(min, min + range), Random.nextInt(min, min + range)).sorted()
        return rolls[1]
    }
}

data class MatchFullResult(
    val match: MatchEntity,
    val playerResults: List<MatchResultEntity>,
    val injuries: List<PlayerEntity> = emptyList()
)
