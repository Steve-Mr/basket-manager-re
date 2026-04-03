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

    private val playerModifiers = mutableMapOf<Int, Pair<Int, Int>>() // playerId -> (attackMod, defenseMod)

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

    private fun calculateMatchModifiers() {
        var localBaseMatchModifier = if (match.matchday >= 167) 2 else 1
        var localTeamAgeSum = 0
        var localTeamAllSum = 0.0
        localPlayers.forEach { p ->
            val pos = getMatchPosition(p, true)
            val avg = p.getAverageSkillAllByPosition(pos)
            if (avg >= 90.0) localBaseMatchModifier++
            localTeamAgeSum += p.age
            localTeamAllSum += avg * (if (isTitular(p, localTactic)) 2.0 else 1.0)
        }
        val localAvgAge = if (localPlayers.isNotEmpty()) localTeamAgeSum / localPlayers.size else 25
        val localAvgAll = if (localPlayers.isNotEmpty()) localTeamAllSum / localPlayers.size else 70.0

        var visitorBaseMatchModifier = 0
        var visitorTeamAgeSum = 0
        var visitorTeamAllSum = 0.0
        visitorPlayers.forEach { p ->
            val pos = getMatchPosition(p, false)
            val avg = p.getAverageSkillAllByPosition(pos)
            if (avg >= 90.0) visitorBaseMatchModifier++
            visitorTeamAgeSum += p.age
            visitorTeamAllSum += avg * (if (isTitular(p, visitorTactic)) 2.0 else 1.0)
        }
        val visitorAvgAge = if (visitorPlayers.isNotEmpty()) visitorTeamAgeSum / visitorPlayers.size else 25
        val visitorAvgAll = if (visitorPlayers.isNotEmpty()) visitorTeamAllSum / visitorPlayers.size else 70.0

        val bonoAverageAge = if (match.matchday < 167) (localAvgAge - visitorAvgAge) / 2 else 0
        val bonoAverageAll = (localAvgAll - visitorAvgAll).toInt() / 2

        // Set Local modifiers
        localPlayers.forEach { p ->
            val isTit = isTitular(p, localTactic)
            val pos = getMatchPosition(p, true)
            val penalty = p.getPenalty(pos)
            val attMod = localTactic.gameType + localBaseMatchModifier + penalty + bonoAverageAge + (if (isTit) bonoAverageAll else 0)
            val defMod = -localTactic.gameType + localBaseMatchModifier + penalty + bonoAverageAge + bonoAverageAll
            playerModifiers[p.id] = attMod to defMod
        }

        // Set Visitor modifiers
        visitorPlayers.forEach { p ->
            val pos = getMatchPosition(p, false)
            val penalty = p.getPenalty(pos)
            val attMod = visitorTactic.gameType + visitorBaseMatchModifier + penalty
            val defMod = -visitorTactic.gameType + visitorBaseMatchModifier + penalty
            playerModifiers[p.id] = attMod to defMod
        }
    }

    private val injuredPlayers = mutableListOf<PlayerEntity>()

    fun simulate(): MatchFullResult {
        createInitialResults()
        calculateMatchModifiers()

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
            // Correct possession alternate: i % 2 == 0 is visitor attacking
            val isVisitorAttacking = currentPos % 2 == 0
            val teamAttackId = if (isVisitorAttacking) match.teamVisitorId else match.teamLocalId
            val teamDefenseId = if (isVisitorAttacking) match.teamLocalId else match.teamVisitorId

            playPossession(currentPos, isVisitorAttacking, teamAttackId, teamDefenseId)

            if (currentPos == possessions - 1 && getTotalPoints(true) == getTotalPoints(false)) {
                possessions += Constants.OVERTIME_POSSESSIONS
            }
            currentPos++
        }

        return finalizeMatch()
    }

    private fun playPossession(pos: Int, isVisitorAttacking: Boolean, teamAttackId: Int, teamDefenseId: Int) {
        val isLocalAttacking = !isVisitorAttacking
        var isFoul = false
        var shotsFree = 0

        // 1. Injury Check
        if (Random.nextInt(101) < 4) { // Constants.INJURY_CHECK_PROB is 4
            val player = rulete.pickPlayer(0, isLocalAttacking, teamAttackId)
            player?.let { p ->
                val defMod = playerModifiers[p.id]?.second ?: 0
                val injuryCheckValue = (p.stateEnergy * (p.skillPhysique + defMod)) / 100
                if (!accomplishedAction(injuryCheckValue, 1.0f)) {
                    if (p.stateInjury == 0) {
                        injuredPlayers.add(p.copy(stateInjury = -1))
                    } else if (p.stateInjury == -1) {
                        val damageType = Random.nextInt(101)
                        val duration = when {
                            damageType <= 80 -> Random.nextInt(2, 8)
                            damageType <= 99 -> Random.nextInt(8, 50)
                            else -> Random.nextInt(50, 181)
                        }
                        injuredPlayers.add(p.copy(stateInjury = duration))
                    }
                }
            }
        }

        // 2. Steal Check
        val stealer = rulete.pickPlayer(3, !isLocalAttacking, teamDefenseId)
        if (stealer != null && accomplishedAction(stealer.skillSteal + (playerModifiers[stealer.id]?.second ?: 0), 0.5f)) {
            val res = (if (!isLocalAttacking) localResults else visitorResults)[stealer.id]!!
            updateResult(res.copy(steals = res.steals + 1), !isLocalAttacking)
            return
        }

        // 3. Turnover Check
        val passer = rulete.pickPlayer(5, isLocalAttacking, teamAttackId)
        if (passer != null && !accomplishedAction(passer.skillPass + (playerModifiers[passer.id]?.first ?: 0), 0.6f)) {
            val res = (if (isLocalAttacking) localResults else visitorResults)[passer.id]!!
            updateResult(res.copy(passesKo = res.passesKo + 1), isLocalAttacking)
            return
        }

        // 4. Random Foul check before shot
        if (Random.nextInt(101) <= 10) {
            val fowler = rulete.pickPlayer(0, !isLocalAttacking, teamDefenseId)
            if (fowler != null) {
                val res = (if (!isLocalAttacking) localResults else visitorResults)[fowler.id]!!
                updateResult(res.copy(foulsMade = res.foulsMade + 1), !isLocalAttacking)
            }
        }

        // 5. Assistance Check
        var assistanceModifier = 0
        if (Random.nextInt(101) <= 34) {
            val ast = rulete.pickPlayer(5, isLocalAttacking, teamAttackId)
            if (ast != null && accomplishedAction(ast.skillPass + (playerModifiers[ast.id]?.first ?: 0), 1.0f)) {
                val res = (if (isLocalAttacking) localResults else visitorResults)[ast.id]!!
                updateResult(res.copy(passesOk = res.passesOk + 1, assists = res.assists + 1), isLocalAttacking)
                assistanceModifier = 5
            }
        }

        // 6. Shot Selection
        val attackingTactic = if (isLocalAttacking) localTactic else visitorTactic
        val shotRoll = Random.nextInt(101)
        val isInterior = shotRoll <= attackingTactic.shotIntPercent
        val isTriple = !isInterior && Random.nextInt(101) <= attackingTactic.shotTriplePercent
        val shotType = if (isInterior) 1 else if (isTriple) 3 else 2

        val shooter = rulete.pickPlayer(if (isInterior) 6 else if (isTriple) 7 else 7, isLocalAttacking, teamAttackId)
        if (shooter == null) return

        var shotValue = (if (isInterior) shooter.skillShotInterior else shooter.skillShotExterior) + (playerModifiers[shooter.id]?.first ?: 0)
        shotValue += (shotValue * assistanceModifier) / 100

        // 7. Block Check
        val blocker = rulete.pickPlayer(2, !isLocalAttacking, teamDefenseId)
        val attemptBlockProb = if (isInterior) 11 else 9
        if (Random.nextInt(101) <= attemptBlockProb && blocker != null) {
            if (blocker.skillBlock + (playerModifiers[blocker.id]?.second ?: 0) + getRandomGauss(0, 100) > getRandomGauss(0, 100) + shotValue) {
                val res = (if (!isLocalAttacking) localResults else visitorResults)[blocker.id]!!
                updateResult(res.copy(blocks = res.blocks + 1), !isLocalAttacking)
                return
            }
        }

        // 8. Foul during shot check
        if (Random.nextInt(101) <= 15) {
            val fowler = blocker ?: rulete.pickPlayer(0, !isLocalAttacking, teamDefenseId)
            if (fowler != null && getRandomGauss(0, 100) + shotValue > fowler.skillBlock + (playerModifiers[fowler.id]?.second ?: 0) + getRandomGauss(0, 100)) {
                val res = (if (!isLocalAttacking) localResults else visitorResults)[fowler.id]!!
                updateResult(res.copy(foulsMade = res.foulsMade + 1), !isLocalAttacking)
                isFoul = true
                shotValue -= 10
            }
        }

        // 9. Shot Success
        val modifier = if (isInterior) 0.65f else if (isTriple) 0.45f else 0.55f
        if (accomplishedAction(shotValue, modifier)) {
            val res = (if (isLocalAttacking) localResults else visitorResults)[shooter.id]!!
            val updated = when(shotType) {
                1 -> res.copy(shotsIntOk = res.shotsIntOk + 1, points = res.points + 2)
                2 -> res.copy(shotsExt2Ok = res.shotsExt2Ok + 1, points = res.points + 2)
                else -> res.copy(shotsExt3Ok = res.shotsExt3Ok + 1, points = res.points + 3)
            }
            updateResult(updated, isLocalAttacking)
            if (isFoul) shotsFree = 1
        } else {
            val res = (if (isLocalAttacking) localResults else visitorResults)[shooter.id]!!
            val updated = when(shotType) {
                1 -> res.copy(shotsIntKo = res.shotsIntKo + 1)
                2 -> res.copy(shotsExt2Ko = res.shotsExt2Ko + 1)
                else -> res.copy(shotsExt3Ko = res.shotsExt3Ko + 1)
            }
            updateResult(updated, isLocalAttacking)
            if (isFoul) shotsFree = if (shotType == 3) 3 else 2

            // 10. Rebound
            if (shotsFree == 0 && Random.nextInt(101) <= 76) {
                val offRebounder = rulete.pickPlayer(4, isLocalAttacking, teamAttackId)
                val defRebounder = rulete.pickPlayer(4, !isLocalAttacking, teamDefenseId)

                if (offRebounder != null && defRebounder != null &&
                    offRebounder.skillRebound + (playerModifiers[offRebounder.id]?.second ?: 0) + getRandomGauss(0, 100) >
                    defRebounder.skillRebound + (playerModifiers[defRebounder.id]?.second ?: 0) + getRandomGauss(0, 100)) {

                    val res = (if (isLocalAttacking) localResults else visitorResults)[offRebounder.id]!!
                    updateResult(res.copy(rebounds = res.rebounds + 1), isLocalAttacking)
                    if (loseManyPoints(isLocalAttacking)) playPossession(pos, isVisitorAttacking, teamAttackId, teamDefenseId)
                } else if (defRebounder != null) {
                    val res = (if (!isLocalAttacking) localResults else visitorResults)[defRebounder.id]!!
                    updateResult(res.copy(rebounds = res.rebounds + 1), !isLocalAttacking)
                    if (loseManyPoints(!isLocalAttacking)) playPossession(pos, !isVisitorAttacking, teamDefenseId, teamAttackId)
                }
            }
        }

        // 11. Free Throws
        for (i in 0 until shotsFree) {
            val res = (if (isLocalAttacking) localResults else visitorResults)[shooter.id]!!
            if (accomplishedAction(shooter.skillShotFree + (playerModifiers[shooter.id]?.first ?: 0), 1.0f)) {
                updateResult(res.copy(shotsFreeOk = res.shotsFreeOk + 1, points = res.points + 1), isLocalAttacking)
            } else {
                updateResult(res.copy(shotsFreeKo = res.shotsFreeKo + 1), isLocalAttacking)
            }
        }
    }

    private fun finalizeMatch(): MatchFullResult {
        val totalLocal = getTotalPoints(true)
        val totalVisitor = getTotalPoints(false)

        val qDist = listOf(
            listOf(21, 24, 29),
            listOf(17, 24, 28),
            listOf(22, 26, 33)
        ).random().shuffled()

        fun distribute(total: Int): List<Int> {
            val q1 = (qDist[0] * total) / 100
            val q2 = (qDist[1] * total) / 100
            val q3 = (qDist[2] * total) / 100
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

    private fun accomplishedAction(skill: Int, modifier: Float): Boolean {
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
