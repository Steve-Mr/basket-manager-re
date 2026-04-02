package re.manager.basket.domain.engine

import re.manager.basket.data.entity.PlayerEntity
import kotlin.random.Random

import re.manager.basket.data.entity.MatchResultEntity
import re.manager.basket.data.entity.TacticEntity
import re.manager.basket.domain.model.Position

class Rulete(
    private val localTitulars: List<Pair<PlayerEntity, MatchResultEntity>>,
    private val localReserves: List<Pair<PlayerEntity, MatchResultEntity>>,
    private val visitorTitulars: List<Pair<PlayerEntity, MatchResultEntity>>,
    private val visitorReserves: List<Pair<PlayerEntity, MatchResultEntity>>,
    private val localTactic: TacticEntity,
    private val visitorTactic: TacticEntity,
    private val localTeamId: Int
) {
    private val totalWeights = Array(2) { Array(2) { IntArray(9) } } // [isLocal][isTitular][skillIndex]

    init {
        calculateTotalWeights()
    }

    private fun calculateTotalWeights() {
        // Local
        for (i in 0..8) {
            totalWeights[1][1][i] = localTitulars.sumOf { getTotalRulete(it.first, it.second, i) }
            totalWeights[1][0][i] = localReserves.sumOf { getTotalRulete(it.first, it.second, i) }
        }
        // Visitor
        for (i in 0..8) {
            totalWeights[0][1][i] = visitorTitulars.sumOf { getTotalRulete(it.first, it.second, i) }
            totalWeights[0][0][i] = visitorReserves.sumOf { getTotalRulete(it.first, it.second, i) }
        }
    }

    fun pickPlayer(skillIndex: Int, isLocal: Boolean, teamId: Int): Pair<PlayerEntity, MatchResultEntity>? {
        val tactic = if (isLocal) localTactic else visitorTactic
        val benchImportance = 6 - tactic.benchImportance

        val isTitularPick = Random.nextInt(0, (benchImportance).coerceAtLeast(1)) < benchImportance

        val list = if (isTitularPick) {
            if (isLocal) localTitulars else visitorTitulars
        } else {
            if (isLocal) localReserves else visitorReserves
        }

        val totalWeight = totalWeights[if (isLocal) 1 else 0][if (isTitularPick) 1 else 0][skillIndex]
        if (totalWeight <= 0) return list.firstOrNull()

        var randomVal = Random.nextInt(1, totalWeight + 1)
        for (pair in list) {
            randomVal -= getTotalRulete(pair.first, pair.second, skillIndex)
            if (randomVal <= 0) return pair
        }
        return list.lastOrNull()
    }

    private fun getTotalRulete(player: PlayerEntity, result: MatchResultEntity, ruleteSkill: Int): Int {
        if (player.stateInjury > 0 || result.foulsMade >= 6) return 0

        val minutesPlayed = result.minutesPlayed
        var minutesPlayedForPoints = minutesPlayed

        val tactic = if (player.teamId == localTeamId) localTactic else visitorTactic
        if (player.id == tactic.star1) minutesPlayedForPoints += 9
        if (player.id == tactic.star2) minutesPlayedForPoints += 6
        if (player.id == tactic.star3) minutesPlayedForPoints += 3

        val pos = getMatchPosition(player, tactic)

        return when (ruleteSkill) {
            0 -> minutesPlayed
            1 -> (player.skillPhysique + getDefenseModifier(player, tactic)) * PlayerEntity.getBaseOfPosition(pos.id, 1) * minutesPlayed
            2 -> (player.skillBlock + getDefenseModifier(player, tactic)) * PlayerEntity.getBaseOfPosition(pos.id, 2) * minutesPlayed
            3 -> (player.skillSteal + getDefenseModifier(player, tactic)) * PlayerEntity.getBaseOfPosition(pos.id, 3) * minutesPlayed
            4 -> (player.skillRebound + getDefenseModifier(player, tactic)) * PlayerEntity.getBaseOfPosition(pos.id, 4) * minutesPlayed
            5 -> (player.skillPass + getAttackModifier(player, tactic)) * PlayerEntity.getBaseOfPosition(pos.id, 5) * minutesPlayed
            6 -> (player.skillShotInterior + getAttackModifier(player, tactic)) * PlayerEntity.getBaseOfPosition(pos.id, 6) * minutesPlayedForPoints
            7 -> (player.skillShotExterior + getAttackModifier(player, tactic)) * PlayerEntity.getBaseOfPosition(pos.id, 7) * minutesPlayedForPoints
            8 -> (player.skillShotFree + getAttackModifier(player, tactic)) * PlayerEntity.getBaseOfPosition(pos.id, 8) * minutesPlayedForPoints
            else -> 0
        }
    }

    private fun getMatchPosition(player: PlayerEntity, tactic: TacticEntity): Position {
        return when (player.id) {
            tactic.titPG, tactic.resPG -> Position.PG
            tactic.titSG, tactic.resSG -> Position.SG
            tactic.titSF, tactic.resSF -> Position.SF
            tactic.titPF, tactic.resPF -> Position.PF
            tactic.titC, tactic.resC -> Position.C
            else -> player.positionFirst
        }
    }

    // These modifiers should be calculated once per match and stored, but for now we re-calc
    // In original code, they are temp fields on Player object
    private fun getAttackModifier(player: PlayerEntity, tactic: TacticEntity): Int {
        return tactic.gameType + player.getPenalty(getMatchPosition(player, tactic))
    }

    private fun getDefenseModifier(player: PlayerEntity, tactic: TacticEntity): Int {
        return -tactic.gameType + player.getPenalty(getMatchPosition(player, tactic))
    }
}
