package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Position
import top.maary.basketmanager.re.domain.model.Team
import kotlin.math.roundToInt
import kotlin.random.Random

object FreeAgencyEngine {

    fun calculateExpectedSalary(player: Player): Int {
        val rating = player.overallRating
        val age = player.age
        val pot = player.potential

        val baseSalary = when {
            rating >= 90 -> 18_000_000 + ((rating - 90) * 1_500_000).toInt()
            rating >= 85 -> 12_000_000 + ((rating - 85) * 1_200_000).toInt()
            rating >= 80 -> 7_000_000 + ((rating - 80) * 1_000_000).toInt()
            rating >= 75 -> 4_000_000 + ((rating - 75) * 600_000).toInt()
            rating >= 70 -> 2_000_000 + ((rating - 70) * 400_000).toInt()
            else -> 1_000_000
        }

        val ageFactor = if (age > 32) (1.0 - (age - 32) * 0.1).coerceAtLeast(0.4) else 1.0
        val potFactor = if (age < 25 && pot > 7) (1.0 + (pot - 7) * 0.1) else 1.0

        val estimated = (baseSalary * ageFactor * potFactor).roundToInt()
        // Round to nearest 50,000
        return ((estimated / 50_000) * 50_000).coerceAtLeast(800_000)
    }

    fun evaluateCpuSignings(
        teams: List<Team>,
        freeAgents: List<Player>,
        teamPlayersMap: Map<Long, List<Player>>,
        userTeamId: Long
    ): List<Pair<Player, Team>> {
        val signings = mutableListOf<Pair<Player, Team>>()
        val availableAgents = freeAgents.toMutableList()

        for (team in teams.filter { it.id != userTeamId }) {
            val roster = teamPlayersMap[team.id] ?: emptyList()
            if (roster.size >= 15) continue

            val currentPayroll = roster.sumOf { it.salary }
            val capSpace = team.salaryCap - currentPayroll
            if (capSpace <= 1_000_000) continue

            // Find weakest position
            val positionCounts = Position.entries.filter { it != Position.NONE }.associateWith { pos ->
                roster.count { it.positionFirst == pos || it.positionSecond == pos }
            }
            val needPos = positionCounts.minByOrNull { it.value }?.key ?: Position.POINT_GUARD

            val target = availableAgents.filter { (it.positionFirst == needPos || it.positionSecond == needPos) && calculateExpectedSalary(it) <= capSpace }
                .maxByOrNull { it.overallRating }

            if (target != null) {
                val salary = calculateExpectedSalary(target)
                val years = if (target.age < 27) Random.nextInt(2, 5) else Random.nextInt(1, 3)
                val signedPlayer = target.copy(
                    teamId = team.id,
                    salary = salary,
                    yearsContract = years
                )
                signings.add(signedPlayer to team)
                availableAgents.remove(target)
            }
        }
        return signings
    }
}
