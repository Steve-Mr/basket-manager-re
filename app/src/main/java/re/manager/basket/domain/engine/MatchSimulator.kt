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
        calculateMinutes(true)
        calculateMinutes(false)

        val localTitPairs = localPlayers.filter { isTitular(it, localTactic) }.mapNotNull { p -> localResults[p.id]?.let { r -> p to r } }
        val localResPairs = localPlayers.filter { isReserve(it, localTactic) }.mapNotNull { p -> localResults[p.id]?.let { r -> p to r } }
        val visitorTitPairs = visitorPlayers.filter { isTitular(it, visitorTactic) }.mapNotNull { p -> visitorResults[p.id]?.let { r -> p to r } }
        val visitorResPairs = visitorPlayers.filter { isReserve(it, visitorTactic) }.mapNotNull { p -> visitorResults[p.id]?.let { r -> p to r } }

        rulete = Rulete(
            localTitulars = localTitPairs,
            localReserves = localResPairs,
            visitorTitulars = visitorTitPairs,
            visitorReserves = visitorResPairs,
            localTactic = localTactic,
            visitorTactic = visitorTactic,
            localTeamId = match.teamLocalId
        )

        var possessions = Constants.BASE_POSSESSIONS
        var currentPos = 0
        while (currentPos < possessions) {
            val isVisitorAttacking = currentPos % 2 == 0

            playPossession(currentPos, isVisitorAttacking)

            if (currentPos == possessions - 1 && getTotalPoints(true) == getTotalPoints(false)) {
                possessions += Constants.OVERTIME_POSSESSIONS
                // Overtime handling could be more precise but following original tie logic
            }
            currentPos++
        }

        return finalizeMatch()
    }

    private fun playPossession(pos: Int, isVisitorAttacking: Boolean) {
        val isLocalAttacking = !isVisitorAttacking

        // 1. Injury Check
        if (Random.nextInt(100) < Constants.INJURY_CHECK_PROB) {
            val playerPair = rulete.pickPlayer(0, isLocalAttacking, if (isLocalAttacking) match.teamLocalId else match.teamVisitorId)
            playerPair?.let { (player, _) ->
                // Note: stateInjury = -1 means "bruised" or just got injured in this match
                // Logic based on com.blank.bm15.model.core.Simulate.java:playPossession
                val defenseModifier = getDefenseModifier(player, isLocalAttacking)
                val injuryCheckValue = (player.stateEnergy * (player.skillPhysique + defenseModifier)) / 100
                if (!accomplishedAction(injuryCheckValue, 1.0f)) {
                    if (player.stateInjury == 0) {
                        // Mark as bruising
                        injuredPlayers.add(player.copy(stateInjury = -1))
                    } else if (player.stateInjury == -1) {
                        // Serious injury
                        val damageType = Random.nextInt(101)
                        val duration = when {
                            damageType <= Constants.INJURY_TYPE_MINOR_PROB -> Random.nextInt(2, 8)
                            damageType <= Constants.INJURY_TYPE_MEDIUM_PROB -> Random.nextInt(8, 50)
                            else -> Random.nextInt(50, 181)
                        }
                        injuredPlayers.add(player.copy(stateInjury = duration))
                    }
                }
            }
        }

        // 2. Steal Check
        val stealerPair = rulete.pickPlayer(3, !isLocalAttacking, if (!isLocalAttacking) match.teamLocalId else match.teamVisitorId)
        if (stealerPair != null && accomplishedAction(stealerPair.first.skillSteal + getDefenseModifier(stealerPair.first, !isLocalAttacking), 0.5f)) {
            stealerPair.second.copy(steals = stealerPair.second.steals + 1).also {
                updateResult(it, !isLocalAttacking)
            }
            return
        }

        // 3. Turnover Check
        val passerPair = rulete.pickPlayer(5, isLocalAttacking, if (isLocalAttacking) match.teamLocalId else match.teamVisitorId)
        if (passerPair != null && !accomplishedAction(passerPair.first.skillPass + getAttackModifier(passerPair.first, isLocalAttacking), 0.6f)) {
            passerPair.second.copy(passesKo = passerPair.second.passesKo + 1).also {
                updateResult(it, isLocalAttacking)
            }
            return
        }

        // 4. Assistance Check
        var assistanceModifier = 0
        if (Random.nextInt(100) < 34) {
            val astPair = rulete.pickPlayer(5, isLocalAttacking, if (isLocalAttacking) match.teamLocalId else match.teamVisitorId)
            if (astPair != null && accomplishedAction(astPair.first.skillPass + getAttackModifier(astPair.first, isLocalAttacking), 1.0f)) {
                astPair.second.copy(passesOk = astPair.second.passesOk + 1, assists = astPair.second.assists + 1).also {
                    updateResult(it, isLocalAttacking)
                }
                assistanceModifier = 5
            }
        }

        // 5. Shot Selection
        val attackingTactic = if (isLocalAttacking) localTactic else visitorTactic
        val isInterior = Random.nextInt(100) < attackingTactic.shotIntPercent
        val isTriple = !isInterior && Random.nextInt(100) < attackingTactic.shotTriplePercent
        val shotType = if (isInterior) 1 else if (isTriple) 3 else 2

        val shooterPair = rulete.pickPlayer(if (isInterior) 6 else 7, isLocalAttacking, if (isLocalAttacking) match.teamLocalId else match.teamVisitorId)
        if (shooterPair == null) return

        var shotValue = (if (isInterior) shooterPair.first.skillShotInterior else shooterPair.first.skillShotExterior) + getAttackModifier(shooterPair.first, isLocalAttacking)
        shotValue += (shotValue * assistanceModifier) / 100

        // 6. Block Check
        val blockerPair = rulete.pickPlayer(2, !isLocalAttacking, if (!isLocalAttacking) match.teamLocalId else match.teamVisitorId)
        val attemptBlockProb = if (isInterior) 11 else 9
        if (Random.nextInt(100) < attemptBlockProb && blockerPair != null) {
            if (blockerPair.first.skillBlock + getDefenseModifier(blockerPair.first, !isLocalAttacking) + getRandomGauss(0, 100) > getRandomGauss(0, 100) + shotValue) {
                blockerPair.second.copy(blocks = blockerPair.second.blocks + 1).also {
                    updateResult(it, !isLocalAttacking)
                }
                return
            }
        }

        // 7. Shot Success
        val modifier = if (isInterior) 0.65f else if (isTriple) 0.45f else 0.55f
        if (accomplishedAction(shotValue, modifier)) {
            val updated = when(shotType) {
                1 -> shooterPair.second.copy(shotsIntOk = shooterPair.second.shotsIntOk + 1, points = shooterPair.second.points + 2)
                2 -> shooterPair.second.copy(shotsExt2Ok = shooterPair.second.shotsExt2Ok + 1, points = shooterPair.second.points + 2)
                else -> shooterPair.second.copy(shotsExt3Ok = shooterPair.second.shotsExt3Ok + 1, points = shooterPair.second.points + 3)
            }
            updateResult(updated, isLocalAttacking)
        } else {
            val updated = when(shotType) {
                1 -> shooterPair.second.copy(shotsIntKo = shooterPair.second.shotsIntKo + 1)
                2 -> shooterPair.second.copy(shotsExt2Ko = shooterPair.second.shotsExt2Ko + 1)
                else -> shooterPair.second.copy(shotsExt3Ko = shooterPair.second.shotsExt3Ko + 1)
            }
            updateResult(updated, isLocalAttacking)

            // 8. Rebound
            if (Random.nextInt(100) < 76) {
                val offRebPair = rulete.pickPlayer(4, isLocalAttacking, if (isLocalAttacking) match.teamLocalId else match.teamVisitorId)
                val defRebPair = rulete.pickPlayer(4, !isLocalAttacking, if (!isLocalAttacking) match.teamLocalId else match.teamVisitorId)

                if (offRebPair != null && defRebPair != null &&
                    offRebPair.first.skillRebound + getDefenseModifier(offRebPair.first, isLocalAttacking) + getRandomGauss(0, 100) >
                    defRebPair.first.skillRebound + getDefenseModifier(defRebPair.first, !isLocalAttacking) + getRandomGauss(0, 100)) {

                    offRebPair.second.copy(rebounds = offRebPair.second.rebounds + 1).also { updateResult(it, isLocalAttacking) }

                    // Recursive possession logic from Simulate.java
                    if (loseManyPoints(isLocalAttacking)) {
                        playPossession(pos, isVisitorAttacking)
                    }
                } else if (defRebPair != null) {
                    defRebPair.second.copy(rebounds = defRebPair.second.rebounds + 1).also { updateResult(it, !isLocalAttacking) }

                    // Recursive possession logic from Simulate.java
                    if (loseManyPoints(!isLocalAttacking)) {
                        playPossession(pos, !isVisitorAttacking)
                    }
                }
            }
        }
    }

    private fun finalizeMatch(): MatchFullResult {
        val totalLocal = getTotalPoints(true)
        val totalVisitor = getTotalPoints(false)

        val finalizedMatch = match.copy(
            localQ1 = (totalLocal * 0.25).toInt(),
            localQ2 = (totalLocal * 0.25).toInt(),
            localQ3 = (totalLocal * 0.25).toInt(),
            localQ4 = totalLocal - ((totalLocal * 0.25).toInt() * 3),
            visitorQ1 = (totalVisitor * 0.25).toInt(),
            visitorQ2 = (totalVisitor * 0.25).toInt(),
            visitorQ3 = (totalVisitor * 0.25).toInt(),
            visitorQ4 = totalVisitor - ((totalVisitor * 0.25).toInt() * 3)
        )

        return MatchFullResult(
            match = finalizedMatch,
            playerResults = localResults.values.toList() + visitorResults.values.toList(),
            injuries = injuredPlayers.toList()
        )
    }

    private fun calculateMinutes(isLocal: Boolean) {
        val tactic = if (isLocal) localTactic else visitorTactic
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
        val random = Random.nextInt(0, 101)
        if (random == 0) return true
        if (random == 100) return false
        return random.toFloat() <= skill.toFloat() * modifier
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
