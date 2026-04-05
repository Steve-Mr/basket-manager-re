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

    private var bonoAverageAge = 0
    private var bonoAverageAll = 0
    private var localBaseMatchModifier = 1
    private var visitorBaseMatchModifier = 0

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

        calculateMatchBonus(effectiveLocalTactic, effectiveVisitorTactic)

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
            resultsProvider = { id -> localResults[id] ?: visitorResults[id] },
            matchModifiers = MatchModifiers(localBaseMatchModifier, visitorBaseMatchModifier, bonoAverageAge, bonoAverageAll)
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

        return finalizeMatch(effectiveLocalTactic, effectiveVisitorTactic)
    }

    private fun calculateMatchBonus(localTactic: TacticEntity, visitorTactic: TacticEntity) {
        localBaseMatchModifier = if (match.matchday >= 167) 2 else 1
        visitorBaseMatchModifier = 0

        var localTotalAge = 0
        var localTotalSkill = 0.0
        val localActiveIds = with(localTactic) { setOf(titPG, titSG, titSF, titPF, titC, resPG, resSG, resSF, resPF, resC) }
        val localActivePlayers = localPlayers.filter { it.id in localActiveIds }

        localActivePlayers.forEach { p ->
            val pos = getMatchPosition(p, true)
            val skill = p.getAverageSkillAllByPosition(pos)
            if (skill >= 90.0) localBaseMatchModifier++
            localTotalAge += p.age
            localTotalSkill += skill * (if (isTitular(p, localTactic)) 2 else 1)
        }
        val localAvgAge = if (localActivePlayers.isNotEmpty()) localTotalAge / localActivePlayers.size else 0
        val localAvgSkill = if (localActivePlayers.isNotEmpty()) (localTotalSkill / localActivePlayers.size).toInt() else 0

        var visitorTotalAge = 0
        var visitorTotalSkill = 0.0
        val visitorActiveIds = with(visitorTactic) { setOf(titPG, titSG, titSF, titPF, titC, resPG, resSG, resSF, resPF, resC) }
        val visitorActivePlayers = visitorPlayers.filter { it.id in visitorActiveIds }

        visitorActivePlayers.forEach { p ->
            val pos = getMatchPosition(p, false)
            val skill = p.getAverageSkillAllByPosition(pos)
            if (skill >= 90.0) visitorBaseMatchModifier++
            visitorTotalAge += p.age
            visitorTotalSkill += skill * (if (isTitular(p, visitorTactic)) 2 else 1)
        }
        val visitorAvgAge = if (visitorActivePlayers.isNotEmpty()) visitorTotalAge / visitorActivePlayers.size else 0
        val visitorAvgSkill = if (visitorActivePlayers.isNotEmpty()) (visitorTotalSkill / visitorActivePlayers.size).toInt() else 0

        bonoAverageAge = if (match.matchday < 167) (localAvgAge - visitorAvgAge) / 2 else 0
        bonoAverageAll = (localAvgSkill - visitorAvgSkill) / 2
    }

    private fun playPossession(pos: Int, initialIsVisitorAttacking: Boolean) {
        var currentIsVisitorAttacking = initialIsVisitorAttacking
        var playExtraPossession = true

        // Iterative approach to handle extra possessions (e.g. from rebounds in loseManyPoints logic)
        // to avoid potential StackOverflowError while maintaining original game logic.
        while (playExtraPossession) {
            playExtraPossession = false
            val isLocalAttacking = !currentIsVisitorAttacking

            // 1. Injury Check
        if (skillAttempt(Constants.INJURY_CHECK_PROB)) {
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
        if (skillAttempt(Constants.STEAL_CHECK_PROB)) {
            val stealer = rulete.pickPlayer(3, !isLocalAttacking, if (!isLocalAttacking) match.teamLocalId else match.teamVisitorId)
            if (stealer != null && accomplishedAction(stealer.skillSteal + getDefenseModifier(stealer, !isLocalAttacking), Constants.STEAL_SKILL_MODIFIER)) {
                val res = (if (!isLocalAttacking) localResults else visitorResults)[stealer.id]!!
                updateResult(res.copy(steals = res.steals + 1.0), !isLocalAttacking)
                return
            }
        }

        // 3. Turnover Check
        if (skillAttempt(Constants.TURNOVER_CHECK_PROB)) {
            val passer = rulete.pickPlayer(5, isLocalAttacking, if (isLocalAttacking) match.teamLocalId else match.teamVisitorId)
            if (passer != null && !accomplishedAction(passer.skillPass + getAttackModifier(passer, isLocalAttacking), Constants.TURNOVER_SKILL_MODIFIER)) {
                val res = (if (isLocalAttacking) localResults else visitorResults)[passer.id]!!
                updateResult(res.copy(passesKo = res.passesKo + 1.0), isLocalAttacking)
                return
            }
        }

        // Foul Check (Random foul during possession, not on shot)
        if (skillAttempt(Constants.FOUL_CHECK_PROB)) {
            val opponent = rulete.pickPlayer(0, !isLocalAttacking, if (!isLocalAttacking) match.teamLocalId else match.teamVisitorId)
            opponent?.let { o ->
                val res = (if (!isLocalAttacking) localResults else visitorResults)[o.id]!!
                updateResult(res.copy(foulsMade = res.foulsMade + 1.0), !isLocalAttacking)
            }
        }

        // 4. Assistance Check
        var assistanceModifier = 0
        if (skillAttempt(Constants.ASSISTANCE_CHECK_PROB)) {
            val ast = rulete.pickPlayer(5, isLocalAttacking, if (isLocalAttacking) match.teamLocalId else match.teamVisitorId)
            if (ast != null && accomplishedAction(ast.skillPass + getAttackModifier(ast, isLocalAttacking), 1.0f)) {
                val res = (if (isLocalAttacking) localResults else visitorResults)[ast.id]!!
                updateResult(res.copy(passesOk = res.passesOk + 1.0, assists = res.assists + 1.0), isLocalAttacking)
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

            val shotValue = (if (isInterior) shooter.skillShotInterior else shooter.skillShotExterior) + getAttackModifier(shooter, isLocalAttacking)
            // assistanceModifier application logic 100% matches Simulate.java:
            // int shotValue2 = shotValue + ((shotValue * assistanceModifier) / 100);
            var currentShotValue = shotValue + ((shotValue * assistanceModifier) / 100)

            // 6. Block Check
        val blocker = rulete.pickPlayer(2, !isLocalAttacking, if (!isLocalAttacking) match.teamLocalId else match.teamVisitorId)
        val attemptBlockProb = if (isInterior) Constants.BLOCK_ATTEMPT_PROB_INTERIOR else Constants.BLOCK_ATTEMPT_PROB_EXTERIOR

        if (skillAttempt(attemptBlockProb) && blocker != null) {
            if (blocker.skillBlock + getDefenseModifier(blocker, !isLocalAttacking) + getRandomGauss(0, 100) > getRandomGauss(0, 100) + currentShotValue) {
                val res = (if (!isLocalAttacking) localResults else visitorResults)[blocker.id]!!
                updateResult(res.copy(blocks = res.blocks + 1.0), !isLocalAttacking)
                return
            }
        }

        // Foul on shot
        var shotsFree = 0
        if (skillAttempt(Constants.FOUL_ON_SHOT_PROB) && blocker != null) {
            if (getRandomGauss(0, 100) + currentShotValue > blocker.skillBlock + getDefenseModifier(blocker, !isLocalAttacking) + getRandomGauss(0, 100)) {
                val res = (if (!isLocalAttacking) localResults else visitorResults)[blocker.id]!!
                updateResult(res.copy(foulsMade = res.foulsMade + 1.0), !isLocalAttacking)
                currentShotValue -= 10
                shotsFree = -1 // Marker for foul
            }
        }

        // 7. Shot Success
        val modifier = if (isInterior) Constants.SHOT_MODIFIER_INTERIOR else if (isTriple) Constants.SHOT_MODIFIER_TRIPLE else Constants.SHOT_MODIFIER_EXTERIOR
        if (accomplishedAction(currentShotValue, modifier)) {
            val res = (if (isLocalAttacking) localResults else visitorResults)[shooter.id]!!
            val updated = when(shotType) {
                1 -> res.copy(shotsIntOk = res.shotsIntOk + 1.0)
                2 -> res.copy(shotsExt2Ok = res.shotsExt2Ok + 1.0)
                else -> res.copy(shotsExt3Ok = res.shotsExt3Ok + 1.0)
            }
            updateResult(updated, isLocalAttacking)
            if (shotsFree == -1) shotsFree = 1
        } else {
            val res = (if (isLocalAttacking) localResults else visitorResults)[shooter.id]!!
            val updated = when(shotType) {
                1 -> res.copy(shotsIntKo = res.shotsIntKo + 1.0)
                2 -> res.copy(shotsExt2Ko = res.shotsExt2Ko + 1.0)
                else -> res.copy(shotsExt3Ko = res.shotsExt3Ko + 1.0)
            }
            updateResult(updated, isLocalAttacking)
            if (shotsFree == -1) shotsFree = if (shotType == 3) 3 else 2

            // 8. Rebound
            if (shotsFree == 0 && skillAttempt(Constants.REBOUND_TRIGGER_PROB)) {
                val offRebounder = rulete.pickPlayer(4, isLocalAttacking, if (isLocalAttacking) match.teamLocalId else match.teamVisitorId)
                val defRebounder = rulete.pickPlayer(4, !isLocalAttacking, if (!isLocalAttacking) match.teamLocalId else match.teamVisitorId)

                if (offRebounder != null && defRebounder != null &&
                    offRebounder.skillRebound + getDefenseModifier(offRebounder, isLocalAttacking) + getRandomGauss(0, 100) >
                    defRebounder.skillRebound + getDefenseModifier(defRebounder, !isLocalAttacking) + getRandomGauss(0, 100)) {

                        val res = (if (isLocalAttacking) localResults else visitorResults)[offRebounder.id]!!
                        updateResult(res.copy(rebounds = res.rebounds + 1.0), isLocalAttacking)

                        if (loseManyPoints(isLocalAttacking)) {
                            playExtraPossession = true
                            // Team attacking again: currentIsVisitorAttacking remains same
                        }
                    } else if (defRebounder != null) {
                        val res = (if (!isLocalAttacking) localResults else visitorResults)[defRebounder.id]!!
                        updateResult(res.copy(rebounds = res.rebounds + 1.0), !isLocalAttacking)

                        if (loseManyPoints(!isLocalAttacking)) {
                            playExtraPossession = true
                            currentIsVisitorAttacking = !currentIsVisitorAttacking
                        }
                    }
                }
            }

            // Free Throws: Fixed 1:1 statistical accumulation
            if (shotsFree > 0) {
                val shooterRes = (if (isLocalAttacking) localResults else visitorResults)[shooter.id]!!
                var okInc = 0.0
                var koInc = 0.0
                repeat(shotsFree) {
                    if (accomplishedAction(shooter.skillShotFree + getAttackModifier(shooter, isLocalAttacking), 1.0f)) {
                        okInc += 1.0
                    } else {
                        koInc += 1.0
                    }
                }
                updateResult(shooterRes.copy(
                    shotsFreeOk = shooterRes.shotsFreeOk + okInc,
                    shotsFreeKo = shooterRes.shotsFreeKo + koInc
                ), isLocalAttacking)
            }
        }
    }

    private fun Double.toOriginalInt(): Int = this.toInt()

    private fun finalizeMatch(localTactic: TacticEntity, visitorTactic: TacticEntity): MatchFullResult {
        val totalLocal = getTotalPoints(true)
        val totalVisitor = getTotalPoints(false)

        var localBono = 0
        var visitorBono = 0
        if (match.matchday < 167) {
            if (totalLocal > totalVisitor) { localBono = 1; visitorBono = -1 } else { localBono = -1; visitorBono = 1 }
        } else {
            if (totalLocal > totalVisitor) { localBono = 2; visitorBono = -2 } else { localBono = -2; visitorBono = 2 }
        }

        val evolver = StateEvolver()
        val evolved = mutableListOf<PlayerEntity>()
        localPlayers.forEach { p ->
            evolved.add(evolver.evolvePlayerAfterMatch(p, isTitular(p, localTactic), isReserve(p, localTactic), localTactic.benchImportance, localBono))
        }
        visitorPlayers.forEach { p ->
            evolved.add(evolver.evolvePlayerAfterMatch(p, isTitular(p, visitorTactic), isReserve(p, visitorTactic), visitorTactic.benchImportance, visitorBono))
        }

        fun getQuarters(): List<Int> {
            val list = when(Random.nextInt(1, 4)) {
                1 -> mutableListOf(21, 24, 29)
                2 -> mutableListOf(17, 24, 28)
                else -> mutableListOf(22, 26, 33)
            }
            list.shuffle()
            return list
        }

        fun distribute(total: Int): List<Int> {
            val q = getQuarters()
            val q1 = (total * q[0]) / 100
            val q2 = (total * q[1]) / 100
            val q3 = (total * q[2]) / 100
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

        // Finalize points and star prefixes for each MatchResultEntity before returning
        val finalizeResults = { results: Collection<MatchResultEntity>, tactic: TacticEntity ->
            results.map { r ->
                val starPrefix = when (r.playerId) {
                    tactic.star1 -> "(+3) "
                    tactic.star2 -> "(+2) "
                    tactic.star3 -> "(+1) "
                    else -> ""
                }
                r.copy(
                    name = starPrefix + r.name,
                    points = (r.shotsFreeOk.toOriginalInt() * 1) + (r.shotsIntOk.toOriginalInt() * 2) + (r.shotsExt2Ok.toOriginalInt() * 2) + (r.shotsExt3Ok.toOriginalInt() * 3)
                )
            }
        }

        return MatchFullResult(
            match = finalizedMatch,
            playerResults = finalizeResults(localResults.values, localTactic) + finalizeResults(visitorResults.values, visitorTactic),
            evolvedPlayers = evolved,
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
        val results = if (isLocal) localResults.values else visitorResults.values
        var total = 0
        results.forEach { r ->
            total += r.shotsFreeOk.toOriginalInt() * 1
            total += r.shotsIntOk.toOriginalInt() * 2
            total += r.shotsExt2Ok.toOriginalInt() * 2
            total += r.shotsExt3Ok.toOriginalInt() * 3
        }
        return total
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

        // Original uses SUM of averages of titulars and reserves
        val sumGetting = (teamGettingReboundPlayers.filter { isTitular(it, tacticGetting) }.map { it.getAverageSkillAll() }.average().let { if (it.isNaN()) 40.0 else it } +
                          teamGettingReboundPlayers.filter { isReserve(it, tacticGetting) }.map { it.getAverageSkillAll() }.average().let { if (it.isNaN()) 40.0 else it }).toInt()

        val sumOther = (otherTeamPlayers.filter { isTitular(it, tacticOther) }.map { it.getAverageSkillAll() }.average().let { if (it.isNaN()) 40.0 else it } +
                        otherTeamPlayers.filter { isReserve(it, tacticOther) }.map { it.getAverageSkillAll() }.average().let { if (it.isNaN()) 40.0 else it }).toInt()

        val difference = Math.abs(sumGetting - sumOther) + 2

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

    private fun getAttackModifier(player: PlayerEntity, isLocal: Boolean): Int {
        val tactic = if (isLocal) localTactic else visitorTactic
        val base = tactic.gameType + (if (isLocal) localBaseMatchModifier else visitorBaseMatchModifier) + player.getPenalty(getMatchPosition(player, isLocal))

        return if (isLocal) {
            val allBono = if (isTitular(player, tactic)) bonoAverageAll else 0
            base + bonoAverageAge + allBono
        } else base
    }

    private fun getDefenseModifier(player: PlayerEntity, isLocal: Boolean): Int {
        val tactic = if (isLocal) localTactic else visitorTactic
        val base = -tactic.gameType + (if (isLocal) localBaseMatchModifier else visitorBaseMatchModifier) + player.getPenalty(getMatchPosition(player, isLocal))

        return if (isLocal) base + bonoAverageAge + bonoAverageAll else base
    }

    private fun skillAttempt(prob: Int): Boolean = Random.nextInt(0, 101) <= prob

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
    val evolvedPlayers: List<PlayerEntity>,
    val injuries: List<PlayerEntity> = emptyList()
)
