package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.Conference
import top.maary.basketmanager.re.domain.model.Match
import top.maary.basketmanager.re.domain.model.Team
import kotlin.random.Random

object SeasonCalendarEngine {

    fun generateSeasonSchedule(gameId: Long, teams: List<Team>): List<Match> {
        val matches = mutableListOf<Match>()
        if (teams.size < 30) return matches

        val teamList = teams.sortedBy { it.id }
        val teamIdList = teamList.map { it.id }

        // 6 divisions of 5 teams each
        val divisions = teamList.groupBy { it.division }.values.toList()
        val eastTeams = teamList.filter { it.conference == Conference.EAST }
        val westTeams = teamList.filter { it.conference == Conference.WEST }

        val fixtures = mutableListOf<Pair<Long, Long>>() // (HomeTeamId, AwayTeamId)

        // 1. Division: 4 games against each of 4 division opponents (16 games per team -> 2 home, 2 away)
        for (div in divisions) {
            for (i in div.indices) {
                for (j in i + 1 until div.size) {
                    val t1 = div[i].id
                    val t2 = div[j].id
                    fixtures.add(t1 to t2)
                    fixtures.add(t1 to t2)
                    fixtures.add(t2 to t1)
                    fixtures.add(t2 to t1)
                }
            }
        }

        // 2. Same conference, non-division: 36 games per team
        // (6 opponents x 4 games = 24 games; 4 opponents x 3 games = 12 games)
        for (confTeams in listOf(eastTeams, westTeams)) {
            for (i in confTeams.indices) {
                for (j in i + 1 until confTeams.size) {
                    val t1 = confTeams[i]
                    val t2 = confTeams[j]
                    if (t1.division != t2.division) {
                        val pairHash = ((t1.id * 31 + t2.id + gameId) % 5).toInt()
                        if (pairHash in listOf(0, 1, 2)) {
                            // 4 games: 2 home, 2 away
                            fixtures.add(t1.id to t2.id)
                            fixtures.add(t1.id to t2.id)
                            fixtures.add(t2.id to t1.id)
                            fixtures.add(t2.id to t1.id)
                        } else {
                            // 3 games
                            if ((t1.id + t2.id + gameId) % 2L == 0L) {
                                fixtures.add(t1.id to t2.id)
                                fixtures.add(t1.id to t2.id)
                                fixtures.add(t2.id to t1.id)
                            } else {
                                fixtures.add(t1.id to t2.id)
                                fixtures.add(t2.id to t1.id)
                                fixtures.add(t2.id to t1.id)
                            }
                        }
                    }
                }
            }
        }

        // 3. Inter-conference: 15 non-conference opponents x 2 games = 30 games per team (1 home, 1 away)
        for (east in eastTeams) {
            for (west in westTeams) {
                fixtures.add(east.id to west.id)
                fixtures.add(west.id to east.id)
            }
        }

        // Total fixtures = 1230 games across 166 matchdays (~7-8 games per day)
        // Shuffle with seed to guarantee unique schedule per game session / season
        val rng = Random(gameId * 7919 + System.currentTimeMillis())
        fixtures.shuffle(rng)

        val totalDays = 166
        val matchdays = Array(totalDays) { mutableListOf<Pair<Long, Long>>() }
        val teamScheduledDays = mutableMapOf<Long, MutableSet<Int>>()
        teamIdList.forEach { teamScheduledDays[it] = mutableSetOf() }

        for ((homeId, awayId) in fixtures) {
            val homeDays = teamScheduledDays[homeId] ?: mutableSetOf()
            val awayDays = teamScheduledDays[awayId] ?: mutableSetOf()

            // Find valid days where NEITHER team is already playing
            val validDays = (0 until totalDays).filter { d ->
                !homeDays.contains(d) && !awayDays.contains(d)
            }

            if (validDays.isNotEmpty()) {
                // Select day with fewest games to balance the schedule evenly (7-8 per day)
                val bestDay = validDays.minByOrNull { matchdays[it].size } ?: validDays.first()
                matchdays[bestDay].add(homeId to awayId)
                homeDays.add(bestDay)
                awayDays.add(bestDay)
            } else {
                // Fallback (extremely rare): place in earliest possible day
                for (d in 0 until totalDays) {
                    if (!homeDays.contains(d) && !awayDays.contains(d)) {
                        matchdays[d].add(homeId to awayId)
                        homeDays.add(d)
                        awayDays.add(d)
                        break
                    }
                }
            }
        }

        // Convert to Match models
        for (dayIdx in 0 until totalDays) {
            val dayNumber = dayIdx + 1
            for ((homeId, awayId) in matchdays[dayIdx]) {
                matches.add(
                    Match(
                        id = 0,
                        gameId = gameId,
                        matchday = dayNumber,
                        teamLocalId = homeId,
                        teamVisitorId = awayId,
                        isPlayed = false
                    )
                )
            }
        }

        return matches
    }
}
