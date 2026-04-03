package re.manager.basket.domain.engine

import re.manager.basket.data.entity.PlayerEntity
import kotlin.random.Random

import re.manager.basket.data.entity.MatchResultEntity
import re.manager.basket.data.entity.TacticEntity
import re.manager.basket.domain.model.Position

class Rulete(
    private val localTitulars: List<PlayerEntity>,
    private val localReserves: List<PlayerEntity>,
    private val visitorTitulars: List<PlayerEntity>,
    private val visitorReserves: List<PlayerEntity>,
    private val localTactic: TacticEntity,
    private val visitorTactic: TacticEntity,
    private val localTeamId: Int,
    private val resultsProvider: (Int) -> MatchResultEntity?
) {

    fun pickPlayer(skillIndex: Int, isLocal: Boolean, teamId: Int): PlayerEntity? {
        val tactic = if (isLocal) localTactic else visitorTactic
        val benchWeight = 6 - tactic.benchImportance

        val isTitularPick = Random.nextInt(0, 6) < benchWeight

        val list = if (isTitularPick) {
            if (isLocal) localTitulars else visitorTitulars
        } else {
            if (isLocal) localReserves else visitorReserves
        }

        if (list.isEmpty()) return null

        val totalWeight = list.sumOf { p ->
            resultsProvider(p.id)?.let { r -> getTotalRulete(p, r, skillIndex) } ?: 0
        }

        if (totalWeight <= 0) return list.firstOrNull()

        var randomVal = Random.nextInt(1, totalWeight + 1)
        for (player in list) {
            val res = resultsProvider(player.id) ?: continue
            randomVal -= getTotalRulete(player, res, skillIndex)
            if (randomVal <= 0) return player
        }
        return list.lastOrNull()
    }

    private fun getTotalRulete(player: PlayerEntity, result: MatchResultEntity, ruleteSkill: Int): Int {
        if (player.stateInjury > 0 || result.foulsMade >= 6 || result.minutesPlayed <= 0) return 0

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
