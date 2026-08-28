package top.maary.basketmanager.re.engine

import org.junit.Assert.*
import org.junit.Test
import top.maary.basketmanager.re.domain.engine.PlayoffsEngine
import top.maary.basketmanager.re.domain.model.*

class PlayoffsEngineTest {

    @Test
    fun testPlayoffProgressionThroughAllRounds() {
        val gameId = 1L

        // 1. Create Standings for 8 East and 8 West teams
        val eastStandings = (1..8).map { seed ->
            StandingsItem(
                teamId = seed.toLong(),
                teamName = "East Team $seed",
                conference = Conference.EAST,
                division = Division.E1_ATLANTIC,
                gamesWon = 60 - seed * 2,
                gamesLost = 22 + seed * 2,
                pointsScored = 8000,
                pointsAllowed = 7500
            )
        }

        val westStandings = (9..16).map { seed ->
            val rank = seed - 8
            StandingsItem(
                teamId = seed.toLong(),
                teamName = "West Team $rank",
                conference = Conference.WEST,
                division = Division.W3_PACIFIC,
                gamesWon = 60 - rank * 2,
                gamesLost = 22 + rank * 2,
                pointsScored = 8000,
                pointsAllowed = 7500
            )
        }

        // 2. Round 1 Generation
        val round1Series = PlayoffsEngine.generatePlayoffFirstRound(gameId, eastStandings, westStandings)
        assertEquals(8, round1Series.size)
        assertEquals(4, round1Series.count { it.conference == Conference.EAST })
        assertEquals(4, round1Series.count { it.conference == Conference.WEST })

        // Check 1v8 matchup
        val east1v8 = round1Series.find { it.conference == Conference.EAST && it.seed1 == 1 && it.seed2 == 8 }
        assertNotNull(east1v8)
        assertEquals(1L, east1v8!!.team1Id)
        assertEquals(8L, east1v8.team2Id)

        // Simulate Round 1 winners (Higher seeds win 4-0)
        val finishedRound1 = round1Series.map { s ->
            s.copy(team1Wins = 4, team2Wins = 0, winnerTeamId = s.team1Id)
        }

        // 3. Conference Semifinals Generation
        val semis = PlayoffsEngine.generateConferenceSemifinals(gameId, finishedRound1)
        assertEquals(4, semis.size)
        assertEquals(2, semis.count { it.conference == Conference.EAST })
        assertEquals(2, semis.count { it.conference == Conference.WEST })

        // Simulate Semis winners (Higher seeds win 4-1)
        val finishedSemis = semis.map { s ->
            s.copy(team1Wins = 4, team2Wins = 1, winnerTeamId = s.team1Id)
        }

        // 4. Conference Finals Generation
        val confFinals = PlayoffsEngine.generateConferenceFinals(gameId, finishedSemis)
        assertEquals(2, confFinals.size)
        val eastFinal = confFinals.find { it.conference == Conference.EAST }
        val westFinal = confFinals.find { it.conference == Conference.WEST }
        assertNotNull(eastFinal)
        assertNotNull(westFinal)

        // Simulate Conference Champions
        val finishedEastFinal = eastFinal!!.copy(team1Wins = 4, team2Wins = 2, winnerTeamId = eastFinal.team1Id)
        val finishedWestFinal = westFinal!!.copy(team1Wins = 4, team2Wins = 3, winnerTeamId = westFinal.team1Id)

        // 5. NBA Finals Generation
        val nbaFinals = PlayoffsEngine.generateNbaFinals(gameId, listOf(finishedEastFinal, finishedWestFinal))
        assertNotNull(nbaFinals)
        assertEquals(4, nbaFinals!!.round)
        assertNull(nbaFinals.conference)
        assertEquals(finishedEastFinal.winnerTeamId, nbaFinals.team1Id)
        assertEquals(finishedWestFinal.winnerTeamId, nbaFinals.team2Id)

        // 6. Home/Away 2-2-1-1-1 distribution test
        val (h1, a1) = PlayoffsEngine.determinePlayoffHomeTeam(nbaFinals, 0) // Game 1
        assertEquals(nbaFinals.team1Id, h1)
        val (h3, a3) = PlayoffsEngine.determinePlayoffHomeTeam(nbaFinals, 2) // Game 3
        assertEquals(nbaFinals.team2Id, h3)
        val (h7, a7) = PlayoffsEngine.determinePlayoffHomeTeam(nbaFinals, 6) // Game 7
        assertEquals(nbaFinals.team1Id, h7)
    }

    @Test
    fun testUpdateSeriesAfterMatch() {
        val series = PlayoffSeries(
            id = 1,
            gameId = 1,
            conference = Conference.EAST,
            round = 1,
            seed1 = 1,
            seed2 = 8,
            team1Id = 100,
            team2Id = 200,
            team1Wins = 3,
            team2Wins = 2,
            winnerTeamId = null
        )

        // Team 1 wins game 6 -> reaches 4 wins -> clinched series
        val updated = PlayoffsEngine.updateSeriesAfterMatch(series, winnerTeamId = 100)
        assertEquals(4, updated.team1Wins)
        assertEquals(2, updated.team2Wins)
        assertEquals(100L, updated.winnerTeamId)
    }
}
