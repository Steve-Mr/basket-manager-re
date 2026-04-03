package re.manager.basket.domain.engine

import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.entity.PlayoffEntity
import re.manager.basket.domain.model.Conference
import re.manager.basket.domain.model.Constants

class PlayoffManager(private val database: AppDatabase) {

    suspend fun managePlayoffs(gameId: Int, currentDay: Int) {
        if (currentDay == 167) {
            generatePlayoffSeeding(gameId)
        }
        if (currentDay >= 167) {
            createPlayoffMatchesIfNeeded(gameId, currentDay)
        }
    }

    private suspend fun generatePlayoffSeeding(gameId: Int) {
        val standings = database.leagueDao().getStandings(gameId)
        val teams = database.teamDao().getTeamsByGame(gameId)

        val eastTeams = teams.filter { it.conference == Conference.EAST }
        val westTeams = teams.filter { it.conference == Conference.WEST }

        val eastStandings = standings.filter { s -> eastTeams.any { it.id == s.teamId } }.take(8)
        val westStandings = standings.filter { s -> westTeams.any { it.id == s.teamId } }.take(8)

        val playoffs = mutableListOf<PlayoffEntity>()

        eastStandings.forEachIndexed { index, standing ->
            playoffs.add(PlayoffEntity(
                gameId = gameId,
                teamId = standing.teamId,
                position = index + 1,
                gamesWon = standing.gamesWon,
                pointsScored = standing.pointsScored,
                pointsDiff = standing.pointsScored - standing.pointsAllowed
            ))
        }

        westStandings.forEachIndexed { index, standing ->
            playoffs.add(PlayoffEntity(
                gameId = gameId,
                teamId = standing.teamId,
                position = index + 1,
                gamesWon = standing.gamesWon,
                pointsScored = standing.pointsScored,
                pointsDiff = standing.pointsScored - standing.pointsAllowed
            ))
        }

        database.playoffDao().deleteByGame(gameId)
        database.playoffDao().insertAll(playoffs)
    }

    private suspend fun createPlayoffMatchesIfNeeded(gameId: Int, currentDay: Int) {
        val matches = mutableListOf<MatchEntity>()

        when (currentDay) {
            167 -> generateRoundMatches(gameId, 1, Constants.PLAYOFFS_ROUND_1_START, matches)
            182 -> generateRoundMatches(gameId, 2, Constants.PLAYOFFS_ROUND_2_START, matches)
            197 -> generateRoundMatches(gameId, 3, Constants.PLAYOFFS_ROUND_3_START, matches)
            212 -> generateRoundMatches(gameId, 4, Constants.PLAYOFFS_ROUND_4_START, matches)
        }

        if (matches.isNotEmpty()) {
            database.matchDao().insertAll(matches)
        }
    }

    private suspend fun generateRoundMatches(gameId: Int, round: Int, startDay: Int, matches: MutableList<MatchEntity>) {
        val allPlayoffs = database.playoffDao().getPlayoffsByGame(gameId)
        val teams = database.teamDao().getTeamsByGame(gameId)

        val eastPlayoffs = allPlayoffs.filter { pid -> teams.find { it.id == pid.teamId }?.conference == Conference.EAST }
            .sortedBy { it.position }
        val westPlayoffs = allPlayoffs.filter { pid -> teams.find { it.id == pid.teamId }?.conference == Conference.WEST }
            .sortedBy { it.position }

        when (round) {
            1 -> { // Quarters: 1-8, 2-7, 3-6, 4-5
                createSeries(gameId, eastPlayoffs[0], eastPlayoffs[7], startDay, matches)
                createSeries(gameId, eastPlayoffs[1], eastPlayoffs[6], startDay, matches)
                createSeries(gameId, eastPlayoffs[2], eastPlayoffs[5], startDay, matches)
                createSeries(gameId, eastPlayoffs[3], eastPlayoffs[4], startDay, matches)

                createSeries(gameId, westPlayoffs[0], westPlayoffs[7], startDay, matches)
                createSeries(gameId, westPlayoffs[1], westPlayoffs[6], startDay, matches)
                createSeries(gameId, westPlayoffs[2], westPlayoffs[5], startDay, matches)
                createSeries(gameId, westPlayoffs[3], westPlayoffs[4], startDay, matches)
            }
            2 -> { // Semis: Winner(1-8) vs Winner(4-5), Winner(2-7) vs Winner(3-6)
                val e18 = getWinner(gameId, eastPlayoffs[0], eastPlayoffs[7], 4)
                val e45 = getWinner(gameId, eastPlayoffs[3], eastPlayoffs[4], 4)
                val e27 = getWinner(gameId, eastPlayoffs[1], eastPlayoffs[6], 4)
                val e36 = getWinner(gameId, eastPlayoffs[2], eastPlayoffs[5], 4)

                val w18 = getWinner(gameId, westPlayoffs[0], westPlayoffs[7], 4)
                val w45 = getWinner(gameId, westPlayoffs[3], westPlayoffs[4], 4)
                val w27 = getWinner(gameId, westPlayoffs[1], westPlayoffs[6], 4)
                val w36 = getWinner(gameId, westPlayoffs[2], westPlayoffs[5], 4)

                if (e18 != null && e45 != null) createSeries(gameId, e18, e45, startDay, matches)
                if (e27 != null && e36 != null) createSeries(gameId, e27, e36, startDay, matches)
                if (w18 != null && w45 != null) createSeries(gameId, w18, w45, startDay, matches)
                if (w27 != null && w36 != null) createSeries(gameId, w27, w36, startDay, matches)
            }
            3 -> { // Conference Finals
                val e1845 = getWinner(gameId, getWinner(gameId, eastPlayoffs[0], eastPlayoffs[7], 4), getWinner(gameId, eastPlayoffs[3], eastPlayoffs[4], 4), 8)
                val e2736 = getWinner(gameId, getWinner(gameId, eastPlayoffs[1], eastPlayoffs[6], 4), getWinner(gameId, eastPlayoffs[2], eastPlayoffs[5], 4), 8)
                val w1845 = getWinner(gameId, getWinner(gameId, westPlayoffs[0], westPlayoffs[7], 4), getWinner(gameId, westPlayoffs[3], westPlayoffs[4], 4), 8)
                val w2736 = getWinner(gameId, getWinner(gameId, westPlayoffs[1], westPlayoffs[6], 4), getWinner(gameId, westPlayoffs[2], westPlayoffs[5], 4), 8)

                if (e1845 != null && e2736 != null) createSeries(gameId, e1845, e2736, startDay, matches)
                if (w1845 != null && w2736 != null) createSeries(gameId, w1845, w2736, startDay, matches)
            }
            4 -> { // World Finals
                val eastChamp = getWinner(gameId,
                    getWinner(gameId, getWinner(gameId, eastPlayoffs[0], eastPlayoffs[7], 4), getWinner(gameId, eastPlayoffs[3], eastPlayoffs[4], 4), 8),
                    getWinner(gameId, getWinner(gameId, eastPlayoffs[1], eastPlayoffs[6], 4), getWinner(gameId, eastPlayoffs[2], eastPlayoffs[5], 4), 8),
                    12
                )
                val westChamp = getWinner(gameId,
                    getWinner(gameId, getWinner(gameId, westPlayoffs[0], westPlayoffs[7], 4), getWinner(gameId, westPlayoffs[3], westPlayoffs[4], 4), 8),
                    getWinner(gameId, getWinner(gameId, westPlayoffs[1], westPlayoffs[6], 4), getWinner(gameId, westPlayoffs[2], westPlayoffs[5], 4), 8),
                    12
                )
                if (eastChamp != null && westChamp != null) {
                    createSeries(gameId, eastChamp, westChamp, startDay, matches, isWorldFinal = true)
                }
            }
        }
    }

    private suspend fun getWinner(gameId: Int, p1: PlayoffEntity?, p2: PlayoffEntity?, threshold: Int): PlayoffEntity? {
        if (p1 == null) return p2
        if (p2 == null) return p1

        return if (p1.seriesGamesWon >= threshold) p1 else p2
    }

    private fun createSeries(gameId: Int, p1: PlayoffEntity, p2: PlayoffEntity, startDay: Int, matches: MutableList<MatchEntity>, isWorldFinal: Boolean = false) {
        val higherSeed = if (p1.position <= p2.position && !isWorldFinal) p1 else p2
        val lowerSeed = if (higherSeed == p1) p2 else p1

        // Best of 7: 2-2-1-1-1 format (simplified in days)
        // Day 1: High at Home
        matches.add(MatchEntity(gameId = gameId, matchday = startDay, teamLocalId = higherSeed.teamId, teamVisitorId = lowerSeed.teamId))
        matches.add(MatchEntity(gameId = gameId, matchday = startDay + 2, teamLocalId = higherSeed.teamId, teamVisitorId = lowerSeed.teamId))

        // Day 2: Low at Home
        matches.add(MatchEntity(gameId = gameId, matchday = startDay + 4, teamLocalId = lowerSeed.teamId, teamVisitorId = higherSeed.teamId))
        matches.add(MatchEntity(gameId = gameId, matchday = startDay + 6, teamLocalId = lowerSeed.teamId, teamVisitorId = higherSeed.teamId))

        // Day 3: Alternating
        matches.add(MatchEntity(gameId = gameId, matchday = startDay + 8, teamLocalId = higherSeed.teamId, teamVisitorId = lowerSeed.teamId))
        matches.add(MatchEntity(gameId = gameId, matchday = startDay + 10, teamLocalId = lowerSeed.teamId, teamVisitorId = higherSeed.teamId))
        matches.add(MatchEntity(gameId = gameId, matchday = startDay + 12, teamLocalId = higherSeed.teamId, teamVisitorId = lowerSeed.teamId))
    }
}
