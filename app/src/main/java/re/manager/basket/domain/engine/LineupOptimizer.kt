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

        return tactic.copy(
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
    }
}
