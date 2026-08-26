package com.basketmanager.re.domain.engine

import com.basketmanager.re.domain.model.Player
import com.basketmanager.re.domain.model.Position
import com.basketmanager.re.domain.model.Tactic
import kotlin.random.Random

object LineupOptimizer {

    fun optimizeLineup(players: List<Player>, currentTactic: Tactic): Tactic {
        val available = players.filter { it.isHealthy }.toMutableList()
        val starters = mutableMapOf<Position, Player>()
        val reserves = mutableMapOf<Position, Player>()

        // 1. Assign starters for primary positions
        for (pos in listOf(Position.POINT_GUARD, Position.SHOOTING_GUARD, Position.SMALL_FORWARD, Position.POWER_FORWARD, Position.CENTER)) {
            val best = available.filter { it.positionFirst == pos && it.stateEnergy >= 40 }
                .maxByOrNull { it.getMatchValue(pos) }
            if (best != null) {
                starters[pos] = best
                available.remove(best)
            }
        }

        // 2. Handle secondary positions for unfilled starter slots
        for (pos in listOf(Position.POINT_GUARD, Position.SHOOTING_GUARD, Position.SMALL_FORWARD, Position.POWER_FORWARD, Position.CENTER)) {
            if (starters[pos] == null) {
                val best = available.filter { (it.positionSecond == pos || it.positionFirst == pos) && it.stateEnergy >= 30 }
                    .maxByOrNull { it.getMatchValue(pos) }
                if (best != null) {
                    starters[pos] = best
                    available.remove(best)
                }
            }
        }

        // Fill remaining starter slots with best available regardless of position if needed
        for (pos in listOf(Position.POINT_GUARD, Position.SHOOTING_GUARD, Position.SMALL_FORWARD, Position.POWER_FORWARD, Position.CENTER)) {
            if (starters[pos] == null && available.isNotEmpty()) {
                val best = available.maxByOrNull { it.getMatchValue(pos) }
                if (best != null) {
                    starters[pos] = best
                    available.remove(best)
                }
            }
        }

        // 3. Assign reserves
        for (pos in listOf(Position.POINT_GUARD, Position.SHOOTING_GUARD, Position.SMALL_FORWARD, Position.POWER_FORWARD, Position.CENTER)) {
            val best = available.filter { it.positionFirst == pos && it.stateEnergy >= 20 }
                .maxByOrNull { it.getMatchValue(pos) }
            if (best != null) {
                reserves[pos] = best
                available.remove(best)
            }
        }

        for (pos in listOf(Position.POINT_GUARD, Position.SHOOTING_GUARD, Position.SMALL_FORWARD, Position.POWER_FORWARD, Position.CENTER)) {
            if (reserves[pos] == null) {
                val best = available.filter { it.positionSecond == pos }
                    .maxByOrNull { it.getMatchValue(pos) }
                if (best != null) {
                    reserves[pos] = best
                    available.remove(best)
                }
            }
        }

        for (pos in listOf(Position.POINT_GUARD, Position.SHOOTING_GUARD, Position.SMALL_FORWARD, Position.POWER_FORWARD, Position.CENTER)) {
            if (reserves[pos] == null && available.isNotEmpty()) {
                val best = available.maxByOrNull { it.getMatchValue(pos) }
                if (best != null) {
                    reserves[pos] = best
                    available.remove(best)
                }
            }
        }

        // 4. Determine Top 3 Stars from starters + reserves
        val rotation = starters.values + reserves.values
        val sortedStars = rotation.sortedByDescending { it.overallRating }
        val star1 = sortedStars.getOrNull(0)?.id
        val star2 = sortedStars.getOrNull(1)?.id
        val star3 = sortedStars.getOrNull(2)?.id

        return currentTactic.copy(
            starterPgId = starters[Position.POINT_GUARD]?.id,
            starterSgId = starters[Position.SHOOTING_GUARD]?.id,
            starterSfId = starters[Position.SMALL_FORWARD]?.id,
            starterPfId = starters[Position.POWER_FORWARD]?.id,
            starterCId = starters[Position.CENTER]?.id,
            reservePgId = reserves[Position.POINT_GUARD]?.id,
            reserveSgId = reserves[Position.SHOOTING_GUARD]?.id,
            reserveSfId = reserves[Position.SMALL_FORWARD]?.id,
            reservePfId = reserves[Position.POWER_FORWARD]?.id,
            reserveCId = reserves[Position.CENTER]?.id,
            starOnePlayerId = star1,
            starTwoPlayerId = star2,
            starThreePlayerId = star3
        )
    }
}
