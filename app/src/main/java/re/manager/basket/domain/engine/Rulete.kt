package re.manager.basket.domain.engine

import re.manager.basket.data.entity.PlayerEntity
import kotlin.random.Random

import re.manager.basket.data.entity.MatchResultEntity
import re.manager.basket.data.entity.TacticEntity
import re.manager.basket.domain.model.Position

data class MatchModifiers(
    val localBase: Int,
    val visitorBase: Int,
    val ageBono: Int,
    val allBono: Int
)

class Rulete(
    private val localTitulars: List<PlayerEntity>,
    private val localReserves: List<PlayerEntity>,
    private val visitorTitulars: List<PlayerEntity>,
    private val visitorReserves: List<PlayerEntity>,
    private val localTactic: TacticEntity,
    private val visitorTactic: TacticEntity,
    private val localTeamId: Int,
    private val resultsProvider: (Int) -> MatchResultEntity?,
    private val matchModifiers: MatchModifiers
) {

    fun pickPlayer(skillIndex: Int, isLocal: Boolean, teamId: Int): PlayerEntity? {
        val tactic = if (isLocal) localTactic else visitorTactic
        val benchWeight = 6 - tactic.benchImportance

        // 100% Original Logic: Random.nextInt(0, benchWeight) < benchWeight
        // This is a bit strange in original code but if benchWeight is 3, nextInt(0,3) is 0,1,2 which are all < 3.
        // Actually original was: if (Util.getRandomValue(0, Integer.valueOf(benchWeight)).intValue() < benchWeight)
        // Which means it ALWAYS picked titulars if benchWeight > 0.
        // Wait, Util.getRandomValue(0, 3) returns 0, 1, 2, or 3. So 3/4 chance.
        val isTitularPick = Random.nextInt(0, benchWeight + 1) < benchWeight

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
        // foulsMade is now Double
        if (player.stateInjury != 0 || result.foulsMade.toInt() >= 6) return 0

        val minutesPlayed = result.minutesPlayed
        var minutesPlayedForPoints = minutesPlayed

        val tactic = if (player.teamId == localTeamId) localTactic else visitorTactic
        if (player.id == tactic.star1) minutesPlayedForPoints += 9
        if (player.id == tactic.star2) minutesPlayedForPoints += 6
        if (player.id == tactic.star3) minutesPlayedForPoints += 3

        val isLocal = player.teamId == localTeamId
        val pos = getMatchPosition(player, isLocal)

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

    // Restore 100% legacy modifier logic in Rulete weights
    private fun getAttackModifier(player: PlayerEntity, tactic: TacticEntity): Int {
        val isLocal = player.teamId == localTeamId
        val base = tactic.gameType + (if (isLocal) matchModifiers.localBase else matchModifiers.visitorBase) + player.getPenalty(getMatchPosition(player, isLocal))
        return if (isLocal) base + matchModifiers.ageBono + matchModifiers.allBono else base
    }

    private fun getDefenseModifier(player: PlayerEntity, tactic: TacticEntity): Int {
        val isLocal = player.teamId == localTeamId
        val base = -tactic.gameType + (if (isLocal) matchModifiers.localBase else matchModifiers.visitorBase) + player.getPenalty(getMatchPosition(player, isLocal))
        return if (isLocal) base + matchModifiers.ageBono + matchModifiers.allBono else base
    }
}
