package re.manager.basket.domain.engine

import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TacticEntity
import kotlin.random.Random

class MatchSimulator(
    private val match: MatchEntity,
    private val localPlayers: List<PlayerEntity>,
    private val visitorPlayers: List<PlayerEntity>,
    private val localTactic: TacticEntity,
    private val visitorTactic: TacticEntity
) {
    fun simulate(): MatchEntity {
        var localScore = 0
        var visitorScore = 0

        // 120 Possessions as per original logic
        repeat(120) { possession ->
            val attackingTeamIsLocal = possession % 2 == 1
            // Basic possession simulation
            // In a full implementation, we'd add Steal, turnover, shot selection, etc.
        }

        return match.copy(
            localQ1 = localScore / 4, // Placeholder
            visitorQ1 = visitorScore / 4
        )
    }

    private fun getRandomGauss(min: Int, max: Int): Int {
        val rolls = listOf(
            Random.nextInt(min, max + 1),
            Random.nextInt(min, max + 1),
            Random.nextInt(min, max + 1)
        ).sorted()
        return rolls[1]
    }
}
