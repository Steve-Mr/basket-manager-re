package com.basketmanager.re.domain.engine

import com.basketmanager.re.domain.model.*
import kotlin.math.abs
import kotlin.random.Random

data class MatchSimulationResult(
    val match: Match,
    val playerResults: List<MatchResult>,
    val updatedPlayers: List<Player>,
    val mvpPlayer: Player?,
    val generatedNews: List<NewsItem>
)

object MatchSimulationEngine {

    fun simulateMatch(
        match: Match,
        localTeam: Team,
        visitorTeam: Team,
        localPlayers: List<Player>,
        visitorPlayers: List<Player>,
        localTactic: Tactic,
        visitorTactic: Tactic,
        isPlayoffs: Boolean = false,
        userTeamId: Long = 0
    ): MatchSimulationResult {
        // 1. Prepare lineups
        val localStarters = getPlayersByIds(localPlayers, localTactic.starterIds)
        val localReserves = getPlayersByIds(localPlayers, localTactic.reserveIds)
        val visitorStarters = getPlayersByIds(visitorPlayers, visitorTactic.starterIds)
        val visitorReserves = getPlayersByIds(visitorPlayers, visitorTactic.reserveIds)

        val localRotation = (localStarters + localReserves).distinctBy { it.id }
        val visitorRotation = (visitorStarters + visitorReserves).distinctBy { it.id }

        // Track box scores in mutable maps
        val boxScores = mutableMapOf<Long, MatchResultBuilder>()
        localRotation.forEach { p ->
            boxScores[p.id] = MatchResultBuilder(
                matchId = match.id,
                gameId = match.gameId,
                playerId = p.id,
                playerName = p.name,
                teamId = localTeam.id,
                matchday = match.matchday
            )
        }
        visitorRotation.forEach { p ->
            boxScores[p.id] = MatchResultBuilder(
                matchId = match.id,
                gameId = match.gameId,
                playerId = p.id,
                playerName = p.name,
                teamId = visitorTeam.id,
                matchday = match.matchday
            )
        }

        // Calculate minutes played based on bench importance
        assignMinutes(localStarters, localReserves, localTactic.benchImportance, boxScores)
        assignMinutes(visitorStarters, visitorReserves, visitorTactic.benchImportance, boxScores)

        // Base match modifiers
        val localBaseMod = if (isPlayoffs) 2 else 1
        val visitorBaseMod = 0

        val localModAttack = mutableMapOf<Long, Int>()
        val localModDefense = mutableMapOf<Long, Int>()
        val visitorModAttack = mutableMapOf<Long, Int>()
        val visitorModDefense = mutableMapOf<Long, Int>()

        localRotation.forEach { p ->
            var bonus = 0
            if (p.id == localTactic.starOnePlayerId) bonus += 3
            else if (p.id == localTactic.starTwoPlayerId) bonus += 2
            else if (p.id == localTactic.starThreePlayerId) bonus += 1

            localModAttack[p.id] = localTactic.gameType + localBaseMod + p.getPenalty(p.positionFirst) + bonus
            localModDefense[p.id] = (-localTactic.gameType) + localBaseMod + p.getPenalty(p.positionFirst) + bonus
        }

        visitorRotation.forEach { p ->
            var bonus = 0
            if (p.id == visitorTactic.starOnePlayerId) bonus += 3
            else if (p.id == visitorTactic.starTwoPlayerId) bonus += 2
            else if (p.id == visitorTactic.starThreePlayerId) bonus += 1

            visitorModAttack[p.id] = visitorTactic.gameType + visitorBaseMod + p.getPenalty(p.positionFirst) + bonus
            visitorModDefense[p.id] = (-visitorTactic.gameType) + visitorBaseMod + p.getPenalty(p.positionFirst) + bonus
        }

        // 2. Play 120 possessions (60 each)
        var possessions = 120
        var isOvertime = false
        var otPossessions = 0

        var localTotalPts = 0
        var visitorTotalPts = 0

        fun getTeamPoints(isLocal: Boolean): Int {
            val tId = if (isLocal) localTeam.id else visitorTeam.id
            return boxScores.values.filter { it.teamId == tId }.sumOf { it.calculatePoints() }
        }

        for (pos in 0 until possessions) {
            val isLocalAttack = (pos % 2 == 1)
            val attackTeam = if (isLocalAttack) localTeam else visitorTeam
            val defenseTeam = if (isLocalAttack) visitorTeam else localTeam
            val attackPlayers = if (isLocalAttack) localRotation else visitorRotation
            val defensePlayers = if (isLocalAttack) visitorRotation else localRotation
            val attackTactic = if (isLocalAttack) localTactic else visitorTactic
            val attackMods = if (isLocalAttack) localModAttack else visitorModAttack
            val defenseMods = if (isLocalAttack) visitorModDefense else localModDefense

            if (attackPlayers.isEmpty() || defensePlayers.isEmpty()) continue

            playSinglePossession(
                attackPlayers = attackPlayers,
                defensePlayers = defensePlayers,
                attackTactic = attackTactic,
                attackMods = attackMods,
                defenseMods = defenseMods,
                boxScores = boxScores
            )

            // Overtime check at final possession
            if (pos == possessions - 1) {
                localTotalPts = getTeamPoints(isLocal = true)
                visitorTotalPts = getTeamPoints(isLocal = false)
                if (localTotalPts == visitorTotalPts) {
                    possessions += 6 // 3 extra possessions each
                    isOvertime = true
                    otPossessions += 6
                }
            }
        }

        localTotalPts = getTeamPoints(isLocal = true)
        visitorTotalPts = getTeamPoints(isLocal = false)

        // Safety check if still tied after overtime
        if (localTotalPts == visitorTotalPts) {
            val randomScorer = localRotation.randomOrNull()
            if (randomScorer != null) {
                boxScores[randomScorer.id]?.shotsFreeOk = (boxScores[randomScorer.id]?.shotsFreeOk ?: 0) + 1
                localTotalPts += 1
            }
        }

        // 3. Quarter Breakdown
        val (lQ1, lQ2, lQ3, lQ4, lOt) = distributeQuarters(localTotalPts, isOvertime)
        val (vQ1, vQ2, vQ3, vQ4, vOt) = distributeQuarters(visitorTotalPts, isOvertime)

        val updatedMatch = match.copy(
            name = "$visitorTotalPts ${visitorTeam.name} @ $localTotalPts ${localTeam.name}",
            localScore = localTotalPts,
            visitorScore = visitorTotalPts,
            localQuarter1 = lQ1,
            localQuarter2 = lQ2,
            localQuarter3 = lQ3,
            localQuarter4 = lQ4,
            localOt = lOt,
            visitorQuarter1 = vQ1,
            visitorQuarter2 = vQ2,
            visitorQuarter3 = vQ3,
            visitorQuarter4 = vQ4,
            visitorOt = vOt,
            isPlayed = true
        )

        // 4. Update player energy, form, fatigue
        val updatedPlayers = mutableListOf<Player>()
        val winnerTeamId = if (localTotalPts > visitorTotalPts) localTeam.id else visitorTeam.id

        fun updateTeamPostMatch(teamPlayers: List<Player>, tactic: Tactic, isWinner: Boolean) {
            val benchImp = tactic.benchImportance
            val formBonus = if (isWinner) 2 else -2
            teamPlayers.forEach { p ->
                val isStarter = tactic.starterIds.contains(p.id)
                val isReserve = tactic.reserveIds.contains(p.id)

                val newForm: Int
                val newEnergy: Int

                when {
                    isStarter -> {
                        newForm = (p.stateForm + Random.nextInt(6 - benchImp, 12 - benchImp) + formBonus).coerceIn(30, 99)
                        newEnergy = (p.stateEnergy - Random.nextInt(7 - benchImp, 13 - benchImp)).coerceIn(10, 99)
                    }
                    isReserve -> {
                        newForm = (p.stateForm + Random.nextInt(benchImp - 4, benchImp + 1) + formBonus).coerceIn(30, 99)
                        newEnergy = (p.stateEnergy - Random.nextInt(benchImp - 1, benchImp + 4)).coerceIn(20, 99)
                    }
                    else -> {
                        newForm = (p.stateForm - Random.nextInt(0, 4)).coerceIn(30, 99)
                        newEnergy = (p.stateEnergy + Random.nextInt(2, 6)).coerceIn(20, 99)
                    }
                }
                updatedPlayers.add(p.copy(stateForm = newForm, stateEnergy = newEnergy))
            }
        }

        updateTeamPostMatch(localPlayers, localTactic, localTotalPts > visitorTotalPts)
        updateTeamPostMatch(visitorPlayers, visitorTactic, visitorTotalPts > localTotalPts)

        // 5. Finalize Box Scores & News
        val finalBoxScores = boxScores.values.map { it.build() }
        val allSimulatedPlayers = (localRotation + visitorRotation).distinctBy { it.id }
        val bestPerResult = finalBoxScores.maxByOrNull { it.per }
        val mvpPlayer = allSimulatedPlayers.find { it.id == bestPerResult?.playerId }

        val newsItems = mutableListOf<NewsItem>()
        if (localTeam.id == userTeamId || visitorTeam.id == userTeamId || isPlayoffs) {
            val userWon = (winnerTeamId == userTeamId)
            val type = if (isPlayoffs) NewsType.PLAYOFFS else if (userWon) NewsType.WON else NewsType.LOST
            val title = if (userWon) "Victory: ${updatedMatch.name}" else "Defeat: ${updatedMatch.name}"
            val body = "MVP: ${mvpPlayer?.shortName ?: "N/A"} (${bestPerResult?.points ?: 0} PTS, ${bestPerResult?.rebounds ?: 0} REB, ${bestPerResult?.passesOk ?: 0} AST)."
            newsItems.add(
                NewsItem(
                    gameId = match.gameId,
                    matchday = match.matchday,
                    type = type,
                    title = title,
                    body = body,
                    team1Id = localTeam.id,
                    team2Id = visitorTeam.id,
                    playerId = mvpPlayer?.id
                )
            )
        }

        return MatchSimulationResult(
            match = updatedMatch,
            playerResults = finalBoxScores,
            updatedPlayers = updatedPlayers,
            mvpPlayer = mvpPlayer,
            generatedNews = newsItems
        )
    }

    private fun playSinglePossession(
        attackPlayers: List<Player>,
        defensePlayers: List<Player>,
        attackTactic: Tactic,
        attackMods: Map<Long, Int>,
        defenseMods: Map<Long, Int>,
        boxScores: MutableMap<Long, MatchResultBuilder>
    ) {
        val ballHandler = attackPlayers.random()
        val defender = defensePlayers.random()

        // 1. Steal check (15% chance)
        if (Random.nextInt(100) < 15) {
            val stealPower = defender.skillSteal + (defenseMods[defender.id] ?: 0)
            val protectPower = ballHandler.skillPass + (attackMods[ballHandler.id] ?: 0)
            if (Random.nextInt(100) < (stealPower - protectPower + 40).coerceIn(10, 80)) {
                boxScores[defender.id]?.steals = (boxScores[defender.id]?.steals ?: 0) + 1
                boxScores[ballHandler.id]?.passesKo = (boxScores[ballHandler.id]?.passesKo ?: 0) + 1
                return
            }
        }

        // 2. Turnover check (10% chance)
        if (Random.nextInt(100) < 10) {
            if (Random.nextInt(100) > (ballHandler.skillPass + (attackMods[ballHandler.id] ?: 0)).coerceIn(30, 95)) {
                boxScores[ballHandler.id]?.passesKo = (boxScores[ballHandler.id]?.passesKo ?: 0) + 1
                return
            }
        }

        // 3. Assist check
        var assistBonus = 0
        var assistPlayer: Player? = null
        if (Random.nextInt(100) < 35) {
            val passer = attackPlayers.random()
            if (Random.nextInt(100) < (passer.skillPass + (attackMods[passer.id] ?: 0))) {
                assistBonus = 5
                assistPlayer = passer
            }
        }

        // 4. Shot Selection
        val shooter = attackPlayers.random()
        val interiorChance = attackTactic.shotInteriorPercent
        val tripleChance = attackTactic.shotTriplePercent
        val roll = Random.nextInt(100)

        val shotType: Int // 1 = Interior 2pt, 2 = Exterior 2pt, 3 = 3pt
        val baseAccuracy: Double
        val shotSkill: Int

        if (roll < interiorChance) {
            shotType = 1
            baseAccuracy = 0.65
            shotSkill = shooter.skillShotInterior + (attackMods[shooter.id] ?: 0)
        } else if (roll < interiorChance + tripleChance) {
            shotType = 3
            baseAccuracy = 0.45
            shotSkill = shooter.skillShotExterior + (attackMods[shooter.id] ?: 0)
        } else {
            shotType = 2
            baseAccuracy = 0.55
            shotSkill = shooter.skillShotExterior + (attackMods[shooter.id] ?: 0)
        }

        // Block check (10% chance)
        val shotBlocker = defensePlayers.random()
        if (Random.nextInt(100) < 10) {
            val blockPower = shotBlocker.skillBlock + (defenseMods[shotBlocker.id] ?: 0)
            if (Random.nextInt(100) < (blockPower - shotSkill + 30).coerceIn(5, 60)) {
                boxScores[shotBlocker.id]?.blocks = (boxScores[shotBlocker.id]?.blocks ?: 0) + 1
                when (shotType) {
                    1 -> boxScores[shooter.id]?.shotsInteriorKo = (boxScores[shooter.id]?.shotsInteriorKo ?: 0) + 1
                    2 -> boxScores[shooter.id]?.shotsExteriorDoubleKo = (boxScores[shooter.id]?.shotsExteriorDoubleKo ?: 0) + 1
                    3 -> boxScores[shooter.id]?.shotsExteriorTripleKo = (boxScores[shooter.id]?.shotsExteriorTripleKo ?: 0) + 1
                }
                return
            }
        }

        // Foul check (12% chance)
        val isFoul = Random.nextInt(100) < 12
        if (isFoul) {
            boxScores[defender.id]?.fouls = (boxScores[defender.id]?.fouls ?: 0) + 1
        }

        val effectiveSkill = (shotSkill * (1.0 + assistBonus / 100.0)).toInt()
        val isMade = Random.nextInt(100) < (effectiveSkill * baseAccuracy).toInt().coerceIn(15, 92)

        if (isMade) {
            when (shotType) {
                1 -> boxScores[shooter.id]?.shotsInteriorOk = (boxScores[shooter.id]?.shotsInteriorOk ?: 0) + 1
                2 -> boxScores[shooter.id]?.shotsExteriorDoubleOk = (boxScores[shooter.id]?.shotsExteriorDoubleOk ?: 0) + 1
                3 -> boxScores[shooter.id]?.shotsExteriorTripleOk = (boxScores[shooter.id]?.shotsExteriorTripleOk ?: 0) + 1
            }
            if (assistPlayer != null && assistPlayer.id != shooter.id) {
                boxScores[assistPlayer.id]?.passesOk = (boxScores[assistPlayer.id]?.passesOk ?: 0) + 1
            }
            if (isFoul) {
                // And-one free throw
                simulateFreeThrows(shooter, 1, attackMods, boxScores)
            }
        } else {
            when (shotType) {
                1 -> boxScores[shooter.id]?.shotsInteriorKo = (boxScores[shooter.id]?.shotsInteriorKo ?: 0) + 1
                2 -> boxScores[shooter.id]?.shotsExteriorDoubleKo = (boxScores[shooter.id]?.shotsExteriorDoubleKo ?: 0) + 1
                3 -> boxScores[shooter.id]?.shotsExteriorTripleKo = (boxScores[shooter.id]?.shotsExteriorTripleKo ?: 0) + 1
            }
            if (isFoul) {
                val numFt = if (shotType == 3) 3 else 2
                simulateFreeThrows(shooter, numFt, attackMods, boxScores)
            } else {
                // Rebound battle (75% defensive, 25% offensive)
                if (Random.nextInt(100) < 75) {
                    val reb = defensePlayers.maxByOrNull { it.skillRebound + Random.nextInt(20) } ?: defender
                    boxScores[reb.id]?.rebounds = (boxScores[reb.id]?.rebounds ?: 0) + 1
                } else {
                    val reb = attackPlayers.maxByOrNull { it.skillRebound + Random.nextInt(20) } ?: shooter
                    boxScores[reb.id]?.rebounds = (boxScores[reb.id]?.rebounds ?: 0) + 1
                }
            }
        }
    }

    private fun simulateFreeThrows(
        shooter: Player,
        numThrows: Int,
        attackMods: Map<Long, Int>,
        boxScores: MutableMap<Long, MatchResultBuilder>
    ) {
        val ftSkill = (shooter.skillShotFree + (attackMods[shooter.id] ?: 0)).coerceIn(40, 95)
        for (i in 0 until numThrows) {
            if (Random.nextInt(100) < ftSkill) {
                boxScores[shooter.id]?.shotsFreeOk = (boxScores[shooter.id]?.shotsFreeOk ?: 0) + 1
            } else {
                boxScores[shooter.id]?.shotsFreeKo = (boxScores[shooter.id]?.shotsFreeKo ?: 0) + 1
            }
        }
    }

    private fun assignMinutes(
        starters: List<Player>,
        reserves: List<Player>,
        benchImportance: Int,
        boxScores: MutableMap<Long, MatchResultBuilder>
    ) {
        val benchMinPerPlayer = (benchImportance * 4) + Random.nextInt(-2, 3)
        reserves.forEach { r ->
            boxScores[r.id]?.minutesPlayed = benchMinPerPlayer.coerceIn(8, 24)
        }
        starters.forEach { s ->
            boxScores[s.id]?.minutesPlayed = (48 - benchMinPerPlayer).coerceIn(24, 40)
        }
    }

    private fun distributeQuarters(totalPts: Int, isOvertime: Boolean): List<Int> {
        val basePts = if (isOvertime) (totalPts * 0.9).toInt() else totalPts
        val otPts = totalPts - basePts

        val q1 = (basePts * Random.nextDouble(0.22, 0.28)).toInt()
        val q2 = (basePts * Random.nextDouble(0.22, 0.28)).toInt()
        val q3 = (basePts * Random.nextDouble(0.22, 0.28)).toInt()
        val q4 = basePts - q1 - q2 - q3

        return listOf(q1, q2, q3, q4, if (isOvertime) otPts else 0)
    }

    private fun getPlayersByIds(players: List<Player>, ids: List<Long>): List<Player> {
        return ids.mapNotNull { id -> players.find { it.id == id } }
    }
}

class MatchResultBuilder(
    val matchId: Long,
    val gameId: Long,
    val playerId: Long,
    val playerName: String,
    val teamId: Long,
    val matchday: Int,
    var minutesPlayed: Int = 0,
    var fouls: Int = 0,
    var blocks: Int = 0,
    var steals: Int = 0,
    var rebounds: Int = 0,
    var passesOk: Int = 0,
    var passesKo: Int = 0,
    var shotsFreeOk: Int = 0,
    var shotsFreeKo: Int = 0,
    var shotsInteriorOk: Int = 0,
    var shotsInteriorKo: Int = 0,
    var shotsExteriorDoubleOk: Int = 0,
    var shotsExteriorDoubleKo: Int = 0,
    var shotsExteriorTripleOk: Int = 0,
    var shotsExteriorTripleKo: Int = 0
) {
    fun calculatePoints(): Int {
        return (shotsFreeOk * 1) + (shotsInteriorOk * 2) + (shotsExteriorDoubleOk * 2) + (shotsExteriorTripleOk * 3)
    }

    fun build(): MatchResult {
        return MatchResult(
            matchId = matchId,
            gameId = gameId,
            playerId = playerId,
            playerName = playerName,
            teamId = teamId,
            matchday = matchday,
            minutesPlayed = minutesPlayed,
            points = calculatePoints(),
            fouls = fouls,
            blocks = blocks,
            steals = steals,
            rebounds = rebounds,
            passesOk = passesOk,
            passesKo = passesKo,
            shotsFreeOk = shotsFreeOk,
            shotsFreeKo = shotsFreeKo,
            shotsInteriorOk = shotsInteriorOk,
            shotsInteriorKo = shotsInteriorKo,
            shotsExteriorDoubleOk = shotsExteriorDoubleOk,
            shotsExteriorDoubleKo = shotsExteriorDoubleKo,
            shotsExteriorTripleOk = shotsExteriorTripleOk,
            shotsExteriorTripleKo = shotsExteriorTripleKo
        )
    }
}
