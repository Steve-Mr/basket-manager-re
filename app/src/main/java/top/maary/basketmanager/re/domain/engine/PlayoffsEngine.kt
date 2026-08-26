package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.*

object PlayoffsEngine {

    fun generatePlayoffFirstRound(gameId: Long, eastStandings: List<StandingsItem>, westStandings: List<StandingsItem>): List<PlayoffSeries> {
        val series = mutableListOf<PlayoffSeries>()
        if (eastStandings.size < 8 || westStandings.size < 8) return series

        // Eastern Conference Round 1 (1v8, 4v5, 2v7, 3v6)
        series.add(createSeries(gameId, Conference.EAST, 1, 1, 8, eastStandings[0].teamId, eastStandings[7].teamId))
        series.add(createSeries(gameId, Conference.EAST, 1, 4, 5, eastStandings[3].teamId, eastStandings[4].teamId))
        series.add(createSeries(gameId, Conference.EAST, 1, 2, 7, eastStandings[1].teamId, eastStandings[6].teamId))
        series.add(createSeries(gameId, Conference.EAST, 1, 3, 6, eastStandings[2].teamId, eastStandings[5].teamId))

        // Western Conference Round 1 (1v8, 4v5, 2v7, 3v6)
        series.add(createSeries(gameId, Conference.WEST, 1, 1, 8, westStandings[0].teamId, westStandings[7].teamId))
        series.add(createSeries(gameId, Conference.WEST, 1, 4, 5, westStandings[3].teamId, westStandings[4].teamId))
        series.add(createSeries(gameId, Conference.WEST, 1, 2, 7, westStandings[1].teamId, westStandings[6].teamId))
        series.add(createSeries(gameId, Conference.WEST, 1, 3, 6, westStandings[2].teamId, westStandings[5].teamId))

        return series
    }

    fun generateConferenceSemifinals(gameId: Long, round1Series: List<PlayoffSeries>): List<PlayoffSeries> {
        val nextRound = mutableListOf<PlayoffSeries>()
        val eastRound1 = round1Series.filter { it.conference == Conference.EAST }
        val westRound1 = round1Series.filter { it.conference == Conference.WEST }

        // East: Winner(1v8) vs Winner(4v5), Winner(2v7) vs Winner(3v6)
        if (eastRound1.size >= 4 && eastRound1.all { it.winnerTeamId != null }) {
            val w1 = eastRound1[0].winnerTeamId!!
            val w4 = eastRound1[1].winnerTeamId!!
            val w2 = eastRound1[2].winnerTeamId!!
            val w3 = eastRound1[3].winnerTeamId!!

            nextRound.add(createSeries(gameId, Conference.EAST, 2, 1, 4, w1, w4))
            nextRound.add(createSeries(gameId, Conference.EAST, 2, 2, 3, w2, w3))
        }

        // West: Winner(1v8) vs Winner(4v5), Winner(2v7) vs Winner(3v6)
        if (westRound1.size >= 4 && westRound1.all { it.winnerTeamId != null }) {
            val w1 = westRound1[0].winnerTeamId!!
            val w4 = westRound1[1].winnerTeamId!!
            val w2 = westRound1[2].winnerTeamId!!
            val w3 = westRound1[3].winnerTeamId!!

            nextRound.add(createSeries(gameId, Conference.WEST, 2, 1, 4, w1, w4))
            nextRound.add(createSeries(gameId, Conference.WEST, 2, 2, 3, w2, w3))
        }

        return nextRound
    }

    fun generateConferenceFinals(gameId: Long, round2Series: List<PlayoffSeries>): List<PlayoffSeries> {
        val nextRound = mutableListOf<PlayoffSeries>()
        val eastRound2 = round2Series.filter { it.conference == Conference.EAST }
        val westRound2 = round2Series.filter { it.conference == Conference.WEST }

        if (eastRound2.size >= 2 && eastRound2.all { it.winnerTeamId != null }) {
            val w1 = eastRound2[0].winnerTeamId!!
            val w2 = eastRound2[1].winnerTeamId!!
            nextRound.add(createSeries(gameId, Conference.EAST, 3, 1, 2, w1, w2))
        }

        if (westRound2.size >= 2 && westRound2.all { it.winnerTeamId != null }) {
            val w1 = westRound2[0].winnerTeamId!!
            val w2 = westRound2[1].winnerTeamId!!
            nextRound.add(createSeries(gameId, Conference.WEST, 3, 1, 2, w1, w2))
        }

        return nextRound
    }

    fun generateNbaFinals(gameId: Long, round3Series: List<PlayoffSeries>): PlayoffSeries? {
        val eastConfFinal = round3Series.find { it.conference == Conference.EAST }
        val westConfFinal = round3Series.find { it.conference == Conference.WEST }

        if (eastConfFinal?.winnerTeamId != null && westConfFinal?.winnerTeamId != null) {
            return PlayoffSeries(
                id = 0,
                gameId = gameId,
                conference = null,
                round = 4,
                seed1 = 1,
                seed2 = 1,
                team1Id = eastConfFinal.winnerTeamId!!,
                team2Id = westConfFinal.winnerTeamId!!,
                team1Wins = 0,
                team2Wins = 0,
                winnerTeamId = null
            )
        }
        return null
    }

    fun determinePlayoffHomeTeam(series: PlayoffSeries, gameIndexInSeries: Int): Pair<Long, Long> {
        // 2-2-1-1-1 NBA Playoff format
        val isTeam1Home = when (gameIndexInSeries) {
            0, 1, 4, 6 -> true
            else -> false
        }
        return if (isTeam1Home) series.team1Id to series.team2Id else series.team2Id to series.team1Id
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
