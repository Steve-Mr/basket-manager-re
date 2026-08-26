package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.MatchResult
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Tactic
import top.maary.basketmanager.re.domain.model.Team
import kotlin.random.Random

class RuleteEngine(
    private val localTeam: Team,
    private val visitorTeam: Team,
    private val localTitulars: List<Player>,
    private val localReserves: List<Player>,
    private val visitorTitulars: List<Player>,
    private val visitorReserves: List<Player>,
    private val localTactic: Tactic,
    private val visitorTactic: Tactic,
    private val localAttackMods: Map<Long, Int>,
    private val localDefenseMods: Map<Long, Int>,
    private val visitorAttackMods: Map<Long, Int>,
    private val visitorDefenseMods: Map<Long, Int>,
    private val boxScores: Map<Long, MatchResultBuilder>
) {

    fun getRulete(skillIndex: Int, teamId: Long): Player? {
        val isLocal = (teamId == localTeam.id)
        val tactic = if (isLocal) localTactic else visitorTactic
        val titulars = if (isLocal) localTitulars else visitorTitulars
        val reserves = if (isLocal) localReserves else visitorReserves

        val benchImp = (6 - tactic.benchImportance).coerceIn(1, 5)
        val pickTitulars = Random.nextInt(benchImp + 1) < benchImp

        val candidateList = if (pickTitulars) titulars else reserves
        if (candidateList.isEmpty()) return null

        val weights = candidateList.map { p ->
            getTotalRulete(p, skillIndex, isLocal)
        }
        val totalWeight = weights.sum()
        if (totalWeight <= 0) return candidateList.randomOrNull()

        var roll = Random.nextInt(totalWeight) + 1
        for (i in candidateList.indices) {
            roll -= weights[i]
            if (roll <= 0) return candidateList[i]
        }
        return candidateList.firstOrNull()
    }

    private fun getTotalRulete(player: Player, skillIndex: Int, isLocal: Boolean): Int {
        val box = boxScores[player.id]
        if (player.stateInjury > 0 || box == null || box.fouls >= 6) {
            return 0
        }

        var minutes = box.minutesPlayed
        if (minutes <= 0) minutes = 1

        val tactic = if (isLocal) localTactic else visitorTactic
        var minutesForPoints = minutes
        if (player.id == tactic.starOnePlayerId) minutesForPoints += 9
        else if (player.id == tactic.starTwoPlayerId) minutesForPoints += 6
        else if (player.id == tactic.starThreePlayerId) minutesForPoints += 3

        val posId = player.positionFirst.id
        val attackMod = if (isLocal) (localAttackMods[player.id] ?: 0) else (visitorAttackMods[player.id] ?: 0)
        val defenseMod = if (isLocal) (localDefenseMods[player.id] ?: 0) else (visitorDefenseMods[player.id] ?: 0)

        return when (skillIndex) {
            0 -> minutes
            1 -> (player.skillPhysique + defenseMod).coerceAtLeast(1) * Player.getBaseOfPosition(posId, 1) * minutes
            2 -> (player.skillBlock + defenseMod).coerceAtLeast(1) * Player.getBaseOfPosition(posId, 2) * minutes
            3 -> (player.skillSteal + defenseMod).coerceAtLeast(1) * Player.getBaseOfPosition(posId, 3) * minutes
            4 -> (player.skillRebound + defenseMod).coerceAtLeast(1) * Player.getBaseOfPosition(posId, 4) * minutes
            5 -> (player.skillPass + attackMod).coerceAtLeast(1) * Player.getBaseOfPosition(posId, 5) * minutes
            6 -> (player.skillShotInterior + attackMod).coerceAtLeast(1) * Player.getBaseOfPosition(posId, 6) * minutesForPoints
            7 -> (player.skillShotExterior + attackMod).coerceAtLeast(1) * Player.getBaseOfPosition(posId, 7) * minutesForPoints
            8 -> (player.skillShotFree + attackMod).coerceAtLeast(1) * Player.getBaseOfPosition(posId, 8) * minutesForPoints
            else -> minutes
        }
    }
}
