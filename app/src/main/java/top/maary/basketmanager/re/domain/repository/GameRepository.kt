package top.maary.basketmanager.re.domain.repository

import top.maary.basketmanager.re.domain.engine.TradeEvaluationResult
import top.maary.basketmanager.re.domain.model.*
import java.io.InputStream

interface GameRepository {
    // Sessions
    suspend fun getAllGames(): List<GameSession>
    suspend fun getGame(gameId: Long): GameSession?
    suspend fun createNewGame(name: String, userTeamName: String, rosterStream: InputStream): GameSession
    suspend fun deleteGame(gameId: Long)
    suspend fun updateGame(game: GameSession)

    // Teams
    suspend fun getTeams(gameId: Long): List<Team>
    suspend fun getTeam(teamId: Long): Team?
    suspend fun updateTeam(team: Team)

    // Players
    suspend fun getPlayers(gameId: Long): List<Player>
    suspend fun getTeamPlayers(teamId: Long): List<Player>
    suspend fun getFreeAgents(gameId: Long): List<Player>
    suspend fun getPlayer(playerId: Long): Player?
    suspend fun updatePlayer(player: Player)
    suspend fun updatePlayers(players: List<Player>)

    // Tactics
    suspend fun getTactic(teamId: Long): Tactic?
    suspend fun updateTactic(tactic: Tactic)
    suspend fun autoOptimizeLineup(teamId: Long): Tactic

    // Matches & Results
    suspend fun getMatchesForDay(gameId: Long, matchday: Int): List<Match>
    suspend fun getTeamMatches(gameId: Long, teamId: Long): List<Match>
    suspend fun getMatch(matchId: Long): Match?
    suspend fun getMatchResults(matchId: Long): List<MatchResult>
    suspend fun getPlayerCareerStats(gameId: Long, playerId: Long): List<MatchResult>
    suspend fun getAllPlayerStats(gameId: Long): Map<Long, List<MatchResult>>
    suspend fun getAllPlayerRegularStats(gameId: Long): Map<Long, List<MatchResult>>
    suspend fun getAllPlayerPlayoffStats(gameId: Long): Map<Long, List<MatchResult>>

    // Standings & Playoffs
    suspend fun getStandings(gameId: Long): List<StandingsItem>
    suspend fun getPlayoffSeries(gameId: Long): List<PlayoffSeries>

    // News
    suspend fun getNews(gameId: Long): List<NewsItem>
    suspend fun addNews(newsItem: NewsItem)

    // Draft & Trade
    suspend fun getDraftPicks(gameId: Long): List<DraftPick>
    suspend fun getDraftProspects(gameId: Long): List<Player>
    suspend fun executeTrade(proposal: TradeProposal): TradeEvaluationResult
    suspend fun signFreeAgent(playerId: Long, teamId: Long, salary: Int, years: Int): Boolean
    suspend fun selectDraftPick(prospectId: Long, pickId: Long): Boolean

    // Simulation Loop
    suspend fun advanceMatchday(gameId: Long): GameSession
    suspend fun autoSimulateTo(gameId: Long, targetMatchday: Int, onProgress: (Int, String) -> Unit): GameSession
}
