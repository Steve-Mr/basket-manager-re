package re.manager.basket.domain.engine

import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TacticEntity

class LineupOptimizer {

    fun optimize(players: List<PlayerEntity>, tactic: TacticEntity): TacticEntity {
        // Sort players by their match value
        val sortedPlayers = players.sortedByDescending { it.getValue() }

        if (sortedPlayers.size < 10) return tactic

        // Pick top 5 as starters, next 5 as reserves
        return tactic.copy(
            titPG = sortedPlayers[0].id,
            titSG = sortedPlayers[1].id,
            titSF = sortedPlayers[2].id,
            titPF = sortedPlayers[3].id,
            titC = sortedPlayers[4].id,
            resPG = sortedPlayers[5].id,
            resSG = sortedPlayers[6].id,
            resSF = sortedPlayers[7].id,
            resPF = sortedPlayers[8].id,
            resC = sortedPlayers[9].id
        )
    }
}
