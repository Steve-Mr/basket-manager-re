package re.manager.basket.domain.generator

import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.entity.TeamEntity
import re.manager.basket.domain.model.Conference
import re.manager.basket.domain.model.Division
import kotlin.random.Random

object SeasonCalendar {
    fun generateMatches(gameId: Int, teams: List<TeamEntity>): List<MatchEntity> {
        val regularSeasonDays = 166

        // 1. Group teams
        val teamsById = teams.associateBy { it.id }
        val allTeamIds = teams.map { it.id }
        val eastTeams = teams.filter { it.conference == Conference.EAST }.map { it.id }
        val westTeams = teams.filter { it.conference == Conference.WEST }.map { it.id }

        // 2. Generate required pairings (NBA-style approx)
        // 82 games total per team:
        // - 4 games vs 4 division opponents (16 games)
        // - 4 games vs 6 in-conference non-division opponents (24 games)
        // - 3 games vs 4 in-conference non-division opponents (12 games)
        // - 2 games vs 15 out-of-conference opponents (30 games)
        // Total: 16 + 24 + 12 + 30 = 82 games.

        val pairingsCount = mutableMapOf<Pair<Int, Int>, Int>()

        fun addPair(t1: Int, t2: Int, count: Int) {
            val p = if (t1 < t2) t1 to t2 else t2 to t1
            pairingsCount[p] = count
        }

        fun processConference(conferenceTeams: List<Int>) {
            val teamsByDiv = conferenceTeams.groupBy { teamsById[it]!!.division }
            val divisions = teamsByDiv.keys.toList()

            // Division games
            for (div in divisions) {
                val divTeams = teamsByDiv[div]!!
                for (i in divTeams.indices) {
                    for (j in i + 1 until divTeams.size) {
                        addPair(divTeams[i], divTeams[j], 4)
                    }
                }
            }

            // Cross-division games within the same conference
            // Each team plays 6 opponents 4 times and 4 opponents 3 times.
            // There are 10 such opponents.
            // We use a simple rotation to ensure everyone gets 6x4 and 4x3.
            for (i in divisions.indices) {
                val divA = divisions[i]
                val teamsA = teamsByDiv[divA]!!
                for (j in i + 1 until divisions.size) {
                    val divB = divisions[j]
                    val teamsB = teamsByDiv[divB]!!

                    for (idxA in teamsA.indices) {
                        for (idxB in teamsB.indices) {
                            val tA = teamsA[idxA]
                            val tB = teamsB[idxB]

                            // Deterministic assignment to ensure 6x4 and 4x3 for each team
                            // In a 3-division conference (5 teams each), a team has 10 non-div opponents.
                            // This logic needs to be careful.
                            // Let's use a simpler approach:
                            // Each team in Div A plays 3 teams in Div B four times and 2 teams three times (3*4 + 2*3 = 18)
                            // Plus 3 teams in Div C four times and 2 teams three times (3*4 + 2*3 = 18)
                            // Total 18 + 18 = 36 games.
                            // 3+3 = 6 opponents with 4 games, 2+2 = 4 opponents with 3 games. Correct!

                            if ((idxA + idxB) % 5 < 3) {
                                addPair(tA, tB, 4)
                            } else {
                                addPair(tA, tB, 3)
                            }
                        }
                    }
                }
            }
        }

        processConference(eastTeams)
        processConference(westTeams)

        // Inter-conference: 2 games each
        for (t1 in eastTeams) {
            for (t2 in westTeams) {
                addPair(t1, t2, 2)
            }
        }

        // 3. Flatten pairings into a list of single games
        val gamesPool = mutableListOf<Pair<Int, Int>>()
        pairingsCount.forEach { (pair, count) ->
            val t1 = pair.first
            val t2 = pair.second
            repeat(count) {
                // Alternate home/away roughly
                if (Random.nextBoolean()) gamesPool.add(t1 to t2) else gamesPool.add(t2 to t1)
            }
        }

        // 4. Distribute games into days (1 to 166)
        var finalSchedule: List<MatchEntity>? = null
        var totalAttempts = 0

        while (finalSchedule == null && totalAttempts < 20) {
            totalAttempts++
            gamesPool.shuffle()

            val schedule = Array(regularSeasonDays + 1) { mutableListOf<Pair<Int, Int>>() }
            val teamBusyOnDay = Array(regularSeasonDays + 1) { mutableSetOf<Int>() }
            val gamesRemaining = gamesPool.toMutableList()

            // Greedily place games, but with a bit of randomness in day selection
            val iterator = gamesRemaining.iterator()
            while (iterator.hasNext()) {
                val game = iterator.next()
                val startDay = Random.nextInt(1, regularSeasonDays + 1)
                var placed = false
                for (offset in 0 until regularSeasonDays) {
                    val day = (startDay + offset - 1) % regularSeasonDays + 1
                    if (schedule[day].size < 15 && game.first !in teamBusyOnDay[day] && game.second !in teamBusyOnDay[day]) {
                        schedule[day].add(game)
                        teamBusyOnDay[day].add(game.first)
                        teamBusyOnDay[day].add(game.second)
                        iterator.remove()
                        placed = true
                        break
                    }
                }
                if (!placed) break // Failed to place this game, retry full shuffle
            }

            if (gamesRemaining.isEmpty()) {
                finalSchedule = schedule.flatMapIndexed { day, games ->
                    if (day == 0) emptyList()
                    else games.map { (local, visitor) ->
                        MatchEntity(
                            gameId = gameId,
                            matchday = day,
                            teamLocalId = local,
                            teamVisitorId = visitor
                        )
                    }
                }
            }
        }

        return finalSchedule ?: emptyList() // Should not happen with 166 days and 82 games
    }
}
