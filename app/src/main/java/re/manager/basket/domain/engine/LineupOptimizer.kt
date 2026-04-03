package re.manager.basket.domain.engine

import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TacticEntity
import re.manager.basket.domain.model.Position

class LineupOptimizer {

    fun optimize(players: List<PlayerEntity>, tactic: TacticEntity): TacticEntity {
        if (players.size < 10) return tactic

        val availablePlayers = players.toMutableList()

        fun pickBestFor(position: Position): Int {
            val best = availablePlayers
                .filter { it.positionFirst == position || it.positionSecond == position }
                .maxByOrNull { it.getValue() }
                ?: availablePlayers.maxBy { it.getValue() }

            availablePlayers.remove(best)
            return best.id
        }

        val optimized = tactic.copy(
            titPG = pickBestFor(Position.PG),
            titSG = pickBestFor(Position.SG),
            titSF = pickBestFor(Position.SF),
            titPF = pickBestFor(Position.PF),
            titC = pickBestFor(Position.C),
            resPG = pickBestFor(Position.PG),
            resSG = pickBestFor(Position.SG),
            resSF = pickBestFor(Position.SF),
            resPF = pickBestFor(Position.PF),
            resC = pickBestFor(Position.C)
        )

        // 100% Original Logic: Identify top 3 players in the lineup as Stars
        val lineupIds = listOf(
            optimized.titPG, optimized.titSG, optimized.titSF, optimized.titPF, optimized.titC,
            optimized.resPG, optimized.resSG, optimized.resSF, optimized.resPF, optimized.resC
        ).toSet()

        val stars = players.filter { it.id in lineupIds }
            .sortedByDescending { it.getValue() }
            .take(3)

        return optimized.copy(
            star1 = stars.getOrNull(0)?.id,
            star2 = stars.getOrNull(1)?.id,
            star3 = stars.getOrNull(2)?.id
        )
    }
}
