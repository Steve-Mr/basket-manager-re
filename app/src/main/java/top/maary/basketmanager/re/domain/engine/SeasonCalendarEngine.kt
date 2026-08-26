package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.Match
import top.maary.basketmanager.re.domain.model.Team
import kotlin.random.Random

object SeasonCalendarEngine {

    fun generateSeasonSchedule(gameId: Long, teams: List<Team>): List<Match> {
        val matches = mutableListOf<Match>()
        if (teams.size < 30) return matches

        val teamMap = teams.associateBy { it.name }
        val teamList = teams.toList()
        val n = teamList.size // 30 teams

        // Generate round-robin schedule structure
        // A complete round-robin of 30 teams has 29 rounds (each round 15 matches).
        // To get 82 games per team (41 home, 41 away):
        // 82 games across 166 matchdays (roughly 7-8 matches per matchday).
        
        val fixtures = mutableListOf<Pair<Long, Long>>() // (HomeTeamId, AwayTeamId)
        
        // 1. Division matchups (4 games against each of 4 division opponents = 16 games)
        val byDivision = teamList.groupBy { it.division }
        byDivision.values.forEach { divTeams ->
            for (i in divTeams.indices) {
                for (j in i + 1 until divTeams.size) {
                    val t1 = divTeams[i].id
                    val t2 = divTeams[j].id
                    // 2 home, 2 away
                    fixtures.add(t1 to t2)
                    fixtures.add(t1 to t2)
                    fixtures.add(t2 to t1)
                    fixtures.add(t2 to t1)
                }
            }
        }

        // 2. Same conference, other divisions (3 or 4 games against each of 10 teams = 36 games)
        val byConference = teamList.groupBy { it.conference }
        byConference.values.forEach { confTeams ->
            for (i in confTeams.indices) {
                for (j in i + 1 until confTeams.size) {
                    val t1 = confTeams[i]
                    val t2 = confTeams[j]
                    if (t1.division != t2.division) {
                        fixtures.add(t1.id to t2.id)
                        fixtures.add(t2.id to t1.id)
                        // Add 1 or 2 extra to reach ~36 games
                        if ((t1.id + t2.id) % 2 == 0L) {
                            fixtures.add(if ((t1.id + t2.id) % 4 == 0L) t1.id to t2.id else t2.id to t1.id)
                        }
                    }
                }
            }
        }

        // 3. Inter-conference matchups (2 games against each of 15 non-conference opponents = 30 games)
        val eastTeams = byConference[top.maary.basketmanager.re.domain.model.Conference.EAST] ?: emptyList()
        val westTeams = byConference[top.maary.basketmanager.re.domain.model.Conference.WEST] ?: emptyList()
        for (east in eastTeams) {
            for (west in westTeams) {
                fixtures.add(east.id to west.id)
                fixtures.add(west.id to east.id)
            }
        }

        // Total games = 16 + 36 + 30 = 82 games per team -> 30 * 82 / 2 = 1230 total matches
        // Distribute across 166 matchdays (roughly 7-8 matches per day)
        fixtures.shuffle(Random(gameId + 12345))

        var currentMatchday = 1
        var matchesInCurrentDay = 0
        val maxDays = 166

        for ((homeId, awayId) in fixtures) {
            matches.add(
                Match(
                    id = 0,
                    gameId = gameId,
                    matchday = currentMatchday,
                    teamLocalId = homeId,
                    teamVisitorId = awayId,
                    isPlayed = false
                )
            )
            matchesInCurrentDay++
            if (matchesInCurrentDay >= 8 && currentMatchday < maxDays) {
                currentMatchday++
                matchesInCurrentDay = 0
            }
        }

        return matches
    }
}
