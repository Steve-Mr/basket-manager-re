package re.manager.basket.domain.generator

import re.manager.basket.data.entity.MatchEntity

object SeasonCalendar {
    fun generateMatches(gameId: Int): List<MatchEntity> {
        val matches = mutableListOf<MatchEntity>()
        val teamsCount = 30

        // Generate a standard regular season schedule (approx 166 matchdays)
        for (day in 1..166) {
            // Simplified scheduling logic: each team plays once every few days
            if (day % 2 == 0) {
                for (i in 0 until (teamsCount / 2)) {
                    val local = (i + day) % teamsCount + 1
                    val visitor = (teamsCount - 1 - i + day) % teamsCount + 1
                    if (local != visitor) {
                        matches.add(MatchEntity(
                            gameId = gameId,
                            matchday = day,
                            teamLocalId = local,
                            teamVisitorId = visitor
                        ))
                    }
                }
            }
        }
        return matches
    }
}
