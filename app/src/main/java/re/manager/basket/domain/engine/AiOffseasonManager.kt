package re.manager.basket.domain.engine

import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TeamEntity
import kotlin.random.Random
import re.manager.basket.util.CurrencyUtils

object AiOffseasonManager {
    /**
     * Replicates the exact behavior of ManageRenewals.java's AI renewal logic.
     * Evaluates all AI players whose contracts are expiring (yearsContract = 0)
     * and decides whether to renew them or release them to Free Agency.
     */
    fun processAiRenewals(
        players: List<PlayerEntity>,
        teamsById: Map<Int, TeamEntity>,
        userTeamId: Int?
    ): List<PlayerEntity> {
        val updatedPlayers = mutableListOf<PlayerEntity>()

        for (player in players) {
            // We only process AI players whose contract is up (0 years).
            // User players are handled via UI interactions.
            if (player.yearsContract == 0 && player.teamId != null && player.teamId != userTeamId) {

                val teamId = player.teamId
                val teamPlayers = players.filter { it.teamId == teamId }

                // Original AI evaluation logic:
                // 1. Is best in position? (Simplified as top 2 by average skill in that position)
                val samePositionPlayers = teamPlayers.filter { it.positionFirst == player.positionFirst }
                    .sortedByDescending { it.getAverageSkillAll() }

                val isBest = samePositionPlayers.firstOrNull()?.id == player.id
                val isSecondBest = samePositionPlayers.getOrNull(1)?.id == player.id
                val isUnique = samePositionPlayers.size == 1

                // Conditions for AI to attempt renewal
                val shouldAttempt = when {
                    isBest || isSecondBest -> true
                    isUnique -> true
                    player.age < 24 && player.potential > 7 && teamPlayers.size < 14 -> true
                    player.age > 33 && player.getAverageSkillAll() > 80 -> true
                    else -> false
                }

                if (shouldAttempt) {
                    val offerPosition = Random.nextInt(0, 3) // 0, 1, 2
                    var renew = Random.nextInt(0, 10) < offerPosition + player.loyalty

                    if (!renew) {
                        val offerPosition2 = Random.nextInt(2, 5) // 2, 3, 4
                        renew = Random.nextInt(0, 10) < offerPosition2 + player.loyalty
                    }

                    if (renew) {
                        val newYears = when {
                            player.age <= 25 -> Random.nextInt(2, 5) // 2 to 4
                            player.age <= 30 -> Random.nextInt(1, 5) // 1 to 4
                            player.age <= 34 -> Random.nextInt(1, 4) // 1 to 3
                            else -> Random.nextInt(1, 3) // 1 to 2
                        }

                        // Roughly calculate a new salary
                        val baseValue = player.getValue()
                        var newSalary = (baseValue * 100000).toInt().coerceAtLeast(500000)

                        // Add some randomness +/- 15%
                        val variation = newSalary * Random.nextInt(-15, 16) / 100
                        newSalary += variation
                        newSalary = (newSalary / 1000) * 1000 // Round to thousands

                        updatedPlayers.add(player.copy(
                            yearsContract = newYears,
                            salary = newSalary
                        ))
                    } else {
                        // Release player
                        updatedPlayers.add(player.copy(
                            teamId = null,
                            salary = 0
                        ))
                    }
                } else {
                    // Release player
                    updatedPlayers.add(player.copy(
                        teamId = null,
                        salary = 0
                    ))
                }
            } else if (player.yearsContract == 0 && player.teamId == null) {
                // Already a free agent but contract ran out? Ensure it stays 0
                if (player.salary != 0) {
                     updatedPlayers.add(player.copy(salary = 0))
                }
            }
        }

        return updatedPlayers
    }
}
