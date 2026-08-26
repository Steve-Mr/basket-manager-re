package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.*
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
        val localStarters = getPlayersByIds(localPlayers, localTactic.starterIds)
        val localReserves = getPlayersByIds(localPlayers, localTactic.reserveIds)
        val visitorStarters = getPlayersByIds(visitorPlayers, visitorTactic.starterIds)
        val visitorReserves = getPlayersByIds(visitorPlayers, visitorTactic.reserveIds)

        val localRotation = (localStarters + localReserves).distinctBy { it.id }
        val visitorRotation = (visitorStarters + visitorReserves).distinctBy { it.id }

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

        assignMinutes(localStarters, localReserves, localTactic.benchImportance, boxScores)
        assignMinutes(visitorStarters, visitorReserves, visitorTactic.benchImportance, boxScores)

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

        val ruleteEngine = RuleteEngine(
            localTeam = localTeam,
            visitorTeam = visitorTeam,
            localTitulars = localStarters,
            localReserves = localReserves,
            visitorTitulars = visitorStarters,
            visitorReserves = visitorReserves,
            localTactic = localTactic,
            visitorTactic = visitorTactic,
            localAttackMods = localModAttack,
            localDefenseMods = localModDefense,
            visitorAttackMods = visitorModAttack,
            visitorDefenseMods = visitorModDefense,
            boxScores = boxScores
        )

        val injuryMap = mutableMapOf<Long, Int>()
        localPlayers.forEach { injuryMap[it.id] = it.stateInjury }
        visitorPlayers.forEach { injuryMap[it.id] = it.stateInjury }

        val localCanInjure = localPlayers.count { it.stateInjury == 0 } > 12
        val visitorCanInjure = visitorPlayers.count { it.stateInjury == 0 } > 12

        // Authentic NBA Pace: ~190 total possessions (~95 possessions per team)
        var possessions = 190
        var isOvertime = false
        var otPossessions = 0

        fun getTeamPoints(isLocal: Boolean): Int {
            val tId = if (isLocal) localTeam.id else visitorTeam.id
            return boxScores.values.filter { it.teamId == tId }.sumOf { it.calculatePoints() }
        }

        var posIdx = 0
        while (posIdx < possessions) {
            val isLocalAttack = (posIdx % 2 == 1)
            val attackTeam = if (isLocalAttack) localTeam else visitorTeam
            val defenseTeam = if (isLocalAttack) visitorTeam else localTeam
            val attackTactic = if (isLocalAttack) localTactic else visitorTactic
            val attackMods = if (isLocalAttack) localModAttack else visitorModAttack
            val defenseMods = if (isLocalAttack) visitorModDefense else localModDefense
            val canInjure = if (isLocalAttack) localCanInjure else visitorCanInjure

            playSinglePossessionAuthentic(
                attackTeam = attackTeam,
                defenseTeam = defenseTeam,
                attackTactic = attackTactic,
                attackMods = attackMods,
                defenseMods = defenseMods,
                canInjure = canInjure,
                rulete = ruleteEngine,
                boxScores = boxScores,
                injuryMap = injuryMap
            )

            if (posIdx == possessions - 1) {
                val lPts = getTeamPoints(isLocal = true)
                val vPts = getTeamPoints(isLocal = false)
                if (lPts == vPts) {
                    possessions += 8
                    isOvertime = true
                    otPossessions += 8
                }
            }
            posIdx++
        }

        var localTotalPts = getTeamPoints(isLocal = true)
        var visitorTotalPts = getTeamPoints(isLocal = false)

        if (localTotalPts == visitorTotalPts) {
            val randomScorer = localRotation.randomOrNull()
            if (randomScorer != null) {
                boxScores[randomScorer.id]?.shotsFreeOk = (boxScores[randomScorer.id]?.shotsFreeOk ?: 0) + 1
                localTotalPts += 1
            }
        }

        val (lQ1, lQ2, lQ3, lQ4, lOt) = distributeQuartersAuthentic(localTotalPts, isOvertime)
        val (vQ1, vQ2, vQ3, vQ4, vOt) = distributeQuartersAuthentic(visitorTotalPts, isOvertime)

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
                val rawInj = injuryMap[p.id] ?: p.stateInjury
                val newInjury = if (rawInj == -1) 0 else rawInj

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
                updatedPlayers.add(p.copy(stateForm = newForm, stateEnergy = newEnergy, stateInjury = newInjury))
            }
        }

        updateTeamPostMatch(localPlayers, localTactic, localTotalPts > visitorTotalPts)
        updateTeamPostMatch(visitorPlayers, visitorTactic, visitorTotalPts > localTotalPts)

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

        updatedPlayers.filter { it.teamId == userTeamId && it.stateInjury > 0 && (injuryMap[it.id] ?: 0) > 0 }.forEach { injP ->
            newsItems.add(
                NewsItem(
                    gameId = match.gameId,
                    matchday = match.matchday,
                    type = NewsType.INJURED,
                    title = "Injury: ${injP.shortName}",
                    body = "${injP.name} suffered an injury and will miss ${injP.stateInjury} days.",
                    team1Id = injP.teamId,
                    playerId = injP.id
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

    private fun playSinglePossessionAuthentic(
        attackTeam: Team,
        defenseTeam: Team,
        attackTactic: Tactic,
        attackMods: Map<Long, Int>,
        defenseMods: Map<Long, Int>,
        canInjure: Boolean,
        rulete: RuleteEngine,
        boxScores: MutableMap<Long, MatchResultBuilder>,
        injuryMap: MutableMap<Long, Int>
    ) {
        // 1. Injury roll (only if healthy players > 12)
        if (canInjure && skillAttempt(3)) {
            val injuredCandidate = rulete.getRulete(0, attackTeam.id)
            if (injuredCandidate != null) {
                val defMod = defenseMods[injuredCandidate.id] ?: 0
                val check = (injuredCandidate.stateEnergy * (injuredCandidate.skillPhysique + defMod)) / 100
                if (!accomplishedAction(check, 1.0f)) {
                    val currentInj = injuryMap[injuredCandidate.id] ?: 0
                    if (currentInj == 0) {
                        injuryMap[injuredCandidate.id] = -1 // Knock, sit remainder of match
                    } else if (currentInj == -1) {
                        val damageType = Random.nextInt(100)
                        val days = when {
                            damageType <= 85 -> Random.nextInt(2, 6)
                            damageType <= 98 -> Random.nextInt(7, 21)
                            else -> Random.nextInt(22, 60)
                        }
                        injuryMap[injuredCandidate.id] = days
                    }
                }
            }
        }

        // 2. Steal attempt (14% chance)
        if (skillAttempt(14)) {
            val stealer = rulete.getRulete(3, defenseTeam.id)
            if (stealer != null && accomplishedAction(stealer.skillSteal + (defenseMods[stealer.id] ?: 0), 0.5f)) {
                val ballHandler = rulete.getRulete(5, attackTeam.id)
                boxScores[stealer.id]?.steals = (boxScores[stealer.id]?.steals ?: 0) + 1
                if (ballHandler != null) {
                    boxScores[ballHandler.id]?.passesKo = (boxScores[ballHandler.id]?.passesKo ?: 0) + 1
                }
                return
            }
        }

        // 3. Turnover / Bad pass (16% chance)
        if (skillAttempt(16)) {
            val passer = rulete.getRulete(5, attackTeam.id)
            if (passer != null && !accomplishedAction(passer.skillPass + (attackMods[passer.id] ?: 0), 0.6f)) {
                boxScores[passer.id]?.passesKo = (boxScores[passer.id]?.passesKo ?: 0) + 1
                return
            }
        }

        // 4. Assist check (34% chance)
        var assistanceModifier = 0
        var assistPlayer: Player? = null
        if (skillAttempt(34)) {
            val passer = rulete.getRulete(5, attackTeam.id)
            if (passer != null && accomplishedAction(passer.skillPass + (attackMods[passer.id] ?: 0), 1.0f)) {
                assistanceModifier = 6
                assistPlayer = passer
            }
        }

        // 5. Shot Selection & Execution
        val shotType: Int // 1 = Interior, 2 = Exterior 2PT, 3 = Exterior 3PT
        val shotModifier: Float
        val attemptBlock: Int
        val shooter: Player?
        var shotValue = 0

        if (skillAttempt(attackTactic.shotInteriorPercent)) {
            shotModifier = 0.68f
            shotType = 1
            attemptBlock = 11
            shooter = rulete.getRulete(6, attackTeam.id)
            if (shooter != null) {
                shotValue = shooter.skillShotInterior + (attackMods[shooter.id] ?: 0)
            }
        } else {
            if (skillAttempt(attackTactic.shotTriplePercent)) {
                shotModifier = 0.48f
                shotType = 3
            } else {
                shotModifier = 0.58f
                shotType = 2
            }
            attemptBlock = 9
            shooter = rulete.getRulete(7, attackTeam.id)
            if (shooter != null) {
                shotValue = shooter.skillShotExterior + (attackMods[shooter.id] ?: 0)
            }
        }

        if (shooter == null) return

        var effectiveShotValue = shotValue + ((shotValue * assistanceModifier) / 100)
        var isFoul = false
        var shotsFree = 0

        val opponentBlocker = rulete.getRulete(2, defenseTeam.id)
        if (skillAttempt(attemptBlock) && opponentBlocker != null &&
            opponentBlocker.skillBlock + (defenseMods[opponentBlocker.id] ?: 0) + getRandomGauss() > getRandomGauss() + effectiveShotValue) {
            boxScores[opponentBlocker.id]?.blocks = (boxScores[opponentBlocker.id]?.blocks ?: 0) + 1
            return
        }

        if (skillAttempt(15) && opponentBlocker != null &&
            getRandomGauss() + effectiveShotValue > opponentBlocker.skillBlock + (defenseMods[opponentBlocker.id] ?: 0) + getRandomGauss()) {
            boxScores[opponentBlocker.id]?.fouls = (boxScores[opponentBlocker.id]?.fouls ?: 0) + 1
            isFoul = true
            effectiveShotValue -= 10
        }

        if (accomplishedAction(effectiveShotValue, shotModifier)) {
            when (shotType) {
                1 -> boxScores[shooter.id]?.shotsInteriorOk = (boxScores[shooter.id]?.shotsInteriorOk ?: 0) + 1
                2 -> boxScores[shooter.id]?.shotsExteriorDoubleOk = (boxScores[shooter.id]?.shotsExteriorDoubleOk ?: 0) + 1
                else -> boxScores[shooter.id]?.shotsExteriorTripleOk = (boxScores[shooter.id]?.shotsExteriorTripleOk ?: 0) + 1
            }
            if (assistPlayer != null && assistPlayer.id != shooter.id) {
                boxScores[assistPlayer.id]?.passesOk = (boxScores[assistPlayer.id]?.passesOk ?: 0) + 1
            }
            if (isFoul) {
                shotsFree = 1
            }
        } else {
            when (shotType) {
                1 -> boxScores[shooter.id]?.shotsInteriorKo = (boxScores[shooter.id]?.shotsInteriorKo ?: 0) + 1
                2 -> boxScores[shooter.id]?.shotsExteriorDoubleKo = (boxScores[shooter.id]?.shotsExteriorDoubleKo ?: 0) + 1
                else -> boxScores[shooter.id]?.shotsExteriorTripleKo = (boxScores[shooter.id]?.shotsExteriorTripleKo ?: 0) + 1
            }
            if (isFoul) {
                shotsFree = if (shotType == 3) 3 else 2
            } else if (skillAttempt(76)) {
                val attRebounder = rulete.getRulete(4, attackTeam.id)
                val defRebounder = rulete.getRulete(4, defenseTeam.id)
                if (attRebounder != null && defRebounder != null &&
                    attRebounder.skillRebound + (attackMods[attRebounder.id] ?: 0) + getRandomGauss() >
                    defRebounder.skillRebound + (defenseMods[defRebounder.id] ?: 0) + getRandomGauss()) {
                    boxScores[attRebounder.id]?.rebounds = (boxScores[attRebounder.id]?.rebounds ?: 0) + 1
                } else if (defRebounder != null) {
                    boxScores[defRebounder.id]?.rebounds = (boxScores[defRebounder.id]?.rebounds ?: 0) + 1
                }
            }
        }

        for (i in 0 until shotsFree) {
            val ftSkill = shooter.skillShotFree + (attackMods[shooter.id] ?: 0)
            if (accomplishedAction(ftSkill, 1.0f)) {
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
        val minLow = (benchImportance - 1) * 4
        val minHigh = benchImportance * 4
        reserves.forEach { r ->
            val reserveMin = benchImportance + Random.nextInt(minLow, minHigh + 1)
            boxScores[r.id]?.minutesPlayed = reserveMin.coerceIn(4, 24)
        }
        starters.forEach { s ->
            val benchAvg = (benchImportance * 3) + Random.nextInt(1, 4)
            val starterMin = (48 - benchAvg).coerceIn(24, 42)
            boxScores[s.id]?.minutesPlayed = starterMin
        }
    }

    private fun distributeQuartersAuthentic(totalPts: Int, isOvertime: Boolean): List<Int> {
        val distributions = listOf(
            listOf(21, 24, 29),
            listOf(17, 24, 28),
            listOf(22, 26, 33)
        )
        val selected = distributions.random().shuffled()
        val p1 = (totalPts * selected[0]) / 100
        val p2 = (totalPts * selected[1]) / 100
        val p3 = (totalPts * selected[2]) / 100
        var p4 = totalPts - p1 - p2 - p3
        var otPts = 0

        if (isOvertime) {
            otPts = (totalPts * 0.08).toInt().coerceAtLeast(2)
            p4 -= otPts
        }

        return listOf(p1, p2, p3, p4, otPts)
    }

    private fun skillAttempt(percent: Int): Boolean {
        val random = Random.nextInt(0, 101)
        return random <= percent
    }

    private fun accomplishedAction(skillValue: Int, multiplier: Float): Boolean {
        val random = Random.nextInt(0, 101)
        if (random == 0) return true
        if (random == 100) return false
        return random.toFloat() <= (skillValue.toFloat() * multiplier)
    }

    private fun getRandomGauss(): Int {
        val r1 = Random.nextInt(100)
        val r2 = Random.nextInt(100)
        val r3 = Random.nextInt(100)
        return listOf(r1, r2, r3).sorted()[1]
    }

    private fun getPlayersByIds(players: List<Player>, ids: List<Long>): List<Player> {
        return ids.mapNotNull { id -> players.find { it.id == id } }
    }
}
