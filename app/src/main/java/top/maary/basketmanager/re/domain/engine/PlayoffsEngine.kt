package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.*

object PlayoffsEngine {

    fun generatePlayoffFirstRound(gameId: Long, eastStandings: List<StandingsItem>, westStandings: List<StandingsItem>): List<PlayoffSeries> {
        val series = mutableListOf<PlayoffSeries>()
        if (eastStandings.size < 8 || westStandings.size < 8) return series

        // Eastern Conference (1v8, 4v5, 2v7, 3v6)
        series.add(createSeries(gameId, Conference.EAST, 1, 1, 8, eastStandings[0].teamId, eastStandings[7].teamId))
        series.add(createSeries(gameId, Conference.EAST, 1, 4, 5, eastStandings[3].teamId, eastStandings[4].teamId))
        series.add(createSeries(gameId, Conference.EAST, 1, 2, 7, eastStandings[1].teamId, eastStandings[6].teamId))
        series.add(createSeries(gameId, Conference.EAST, 1, 3, 6, eastStandings[2].teamId, eastStandings[5].teamId))

        // Western Conference (1v8, 4v5, 2v7, 3v6)
        series.add(createSeries(gameId, Conference.WEST, 1, 1, 8, westStandings[0].teamId, westStandings[7].teamId))
        series.add(createSeries(gameId, Conference.WEST, 1, 4, 5, westStandings[3].teamId, westStandings[4].teamId))
        series.add(createSeries(gameId, Conference.WEST, 1, 2, 7, westStandings[1].teamId, westStandings[6].teamId))
        series.add(createSeries(gameId, Conference.WEST, 1, 3, 6, westStandings[2].teamId, westStandings[5].teamId))

        return series
    }

    fun updateSeriesAfterMatch(series: PlayoffSeries, winnerTeamId: Long): PlayoffSeries {
        val t1Wins = if (winnerTeamId == series.team1Id) series.team1Wins + 1 else series.team1Wins
        val t2Wins = if (winnerTeamId == series.team2Id) series.team2Wins + 1 else series.team2Wins
        val seriesWinner = when {
            t1Wins >= 4 -> series.team1Id
            t2Wins >= 4 -> series.team2Id
            else -> null
        }
        return series.copy(
            team1Wins = t1Wins,
            team2Wins = t2Wins,
            winnerTeamId = seriesWinner
        )
    }

    private fun createSeries(
        gameId: Long,
        conference: Conference,
        round: Int,
        seed1: Int,
        seed2: Int,
        team1Id: Long,
        team2Id: Long
    ): PlayoffSeries {
        return PlayoffSeries(
            id = 0,
            gameId = gameId,
            conference = conference,
            round = round,
            seed1 = seed1,
            seed2 = seed2,
            team1Id = team1Id,
            team2Id = team2Id,
            team1Wins = 0,
            team2Wins = 0,
            winnerTeamId = null
        )
    }
}
