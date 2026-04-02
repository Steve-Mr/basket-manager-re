package re.manager.basket.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import android.content.Context
import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.GameEntity
import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.entity.TeamEntity
import re.manager.basket.data.importer.RosterImporter
import re.manager.basket.domain.engine.SeasonManager

class GameViewModel(private val database: AppDatabase) : ViewModel() {

    private val _gameState = MutableStateFlow<GameEntity?>(null)
    val gameState: StateFlow<GameEntity?> = _gameState

    private val _allGames = MutableStateFlow<List<GameEntity>>(emptyList())
    val allGames: StateFlow<List<GameEntity>> = _allGames

    private val _availableTeams = MutableStateFlow<List<re.manager.basket.data.entity.TeamEntity>>(emptyList())
    val availableTeams: StateFlow<List<re.manager.basket.data.entity.TeamEntity>> = _availableTeams

    private val _recentMatches = MutableStateFlow<List<MatchEntity>>(emptyList())
    val recentMatches: StateFlow<List<MatchEntity>> = _recentMatches

    private val _nextMatch = MutableStateFlow<Pair<MatchEntity, TeamEntity>?>(null)
    val nextMatch: StateFlow<Pair<MatchEntity, TeamEntity>?> = _nextMatch

    private val _news = MutableStateFlow<List<re.manager.basket.data.entity.NewsEntity>>(emptyList())
    val news: StateFlow<List<re.manager.basket.data.entity.NewsEntity>> = _news

    private val _isSimulating = MutableStateFlow(false)
    val isSimulating: StateFlow<Boolean> = _isSimulating

    private val _simProgress = MutableStateFlow(0f)
    val simProgress: StateFlow<Float> = _simProgress

    fun loadAllGames() {
        Log.d("GameViewModel", "Loading all save games")
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val games = database.gameDao().getAllGames()
                Log.d("GameViewModel", "Found ${games.size} saves")
                _allGames.value = games
            }
        }
    }

    fun createNewGame(context: Context, name: String) {
        Log.d("GameViewModel", "Creating new game: $name")
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val newGame = GameEntity(
                    currentMatchday = 1,
                    currentSeason = 2025,
                    name = name
                )
                val gameId = database.gameDao().insertAndReturnId(newGame).toInt()
                val importer = RosterImporter(context, database)
                importer.importFromAssets(gameId)

                val createdGame = database.gameDao().getGameById(gameId)
                _gameState.value = createdGame
                _availableTeams.value = database.teamDao().getTeamsByGame(gameId)
            }
        }
    }

    fun selectTeam(teamId: Int) {
        val current = _gameState.value ?: return
        Log.d("GameViewModel", "Selecting teamId: $teamId for gameId: ${current.id}")
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val updated = current.copy(userTeamId = teamId)
                database.gameDao().insert(updated)
                _gameState.value = updated
                Log.d("GameViewModel", "userTeamId updated in DB")
            }
        }
    }

    fun loadGame(gameId: Int) {
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val game = database.gameDao().getGameById(gameId)
                _gameState.value = game
                _recentMatches.value = database.matchDao().getRecentMatches(gameId)
                _news.value = database.newsDao().getNewsByGame(gameId)
                updateNextMatch(game)
            }
        }
    }

    private suspend fun updateNextMatch(game: GameEntity?) {
        val userTeamId = game?.userTeamId ?: return
        val match = database.matchDao().getNextMatchForTeam(game.id, userTeamId, game.currentMatchday)
        if (match != null) {
            val opponentId = if (match.teamLocalId == userTeamId) match.teamVisitorId else match.teamLocalId
            val opponent = database.teamDao().getTeamsByGame(game.id).find { it.id == opponentId }
            if (opponent != null) {
                _nextMatch.value = match to opponent
            }
        } else {
            _nextMatch.value = null
        }
    }

    fun nextDay() {
        val current = _gameState.value ?: return
        Log.d("GameViewModel", "Triggering nextDay for day: ${current.currentMatchday}")
        viewModelScope.launch {
            _isSimulating.value = true
            _simProgress.value = 0f
            withContext(Dispatchers.IO) {
                // 1. Get all matches for this matchday
                val matches = database.matchDao().getMatchesByDay(current.id, current.currentMatchday)
                Log.d("GameViewModel", "Found ${matches.size} matches to simulate")

                matches.forEachIndexed { index, match ->
                    val localPlayers = database.playerDao().getPlayersByTeam(match.teamLocalId)
                    val visitorPlayers = database.playerDao().getPlayersByTeam(match.teamVisitorId)
                    val localTactic = database.tacticDao().getTacticForTeam(match.teamLocalId, current.id)!!
                    val visitorTactic = database.tacticDao().getTacticForTeam(match.teamVisitorId, current.id)!!

                    val simulator = re.manager.basket.domain.engine.MatchSimulator(
                        match, localPlayers, visitorPlayers, localTactic, visitorTactic
                    )
                    val result = simulator.simulate()

                    // Save match result and player stats
                    database.matchDao().update(result.match)
                    database.matchResultDao().insertAll(result.playerResults)

                    // Generate news
                    generateMatchNews(result)

                    // Update League Standings
                    updateLeagueStandings(result)

                    _simProgress.value = (index + 1).toFloat() / matches.size
                }

                // 2. Evolve states (Daily recovery)
                val allPlayers = database.playerDao().getPlayersByGame(current.id)
                val evolvedPlayers = re.manager.basket.domain.engine.StateEvolver().evolveAllPlayersDaily(allPlayers)
                database.playerDao().insertAll(evolvedPlayers)

                // 3. Move to next day
                val seasonManager = SeasonManager(current)
                val nextDay = seasonManager.getNextMatchday()
                val updated = current.copy(currentMatchday = nextDay)

                database.gameDao().insert(updated)
                _gameState.value = updated
                _recentMatches.value = database.matchDao().getRecentMatches(current.id)
                _news.value = database.newsDao().getNewsByGame(current.id)
                updateNextMatch(updated)
                _isSimulating.value = false
            }
        }
    }

    private suspend fun updateLeagueStandings(result: re.manager.basket.domain.engine.MatchFullResult) {
        val match = result.match
        val localWin = match.localQ1 + match.localQ2 + match.localQ3 + match.localQ4 >
                       match.visitorQ1 + match.visitorQ2 + match.visitorQ3 + match.visitorQ4

        updateTeamStanding(match.teamLocalId, match.gameId, localWin, result.match.getTotalLocal(), result.match.getTotalVisitor())
        updateTeamStanding(match.teamVisitorId, match.gameId, !localWin, result.match.getTotalVisitor(), result.match.getTotalLocal())
    }

    private suspend fun updateTeamStanding(teamId: Int, gameId: Int, won: Boolean, scored: Int, allowed: Int) {
        val standing = database.leagueDao().getLeagueForTeam(teamId, gameId) ?: return
        val updated = standing.copy(
            gamesWon = standing.gamesWon + (if (won) 1 else 0),
            gamesLost = standing.gamesLost + (if (won) 0 else 1),
            pointsScored = standing.pointsScored + scored,
            pointsAllowed = standing.pointsAllowed + allowed
        )
        database.leagueDao().insert(updated)
    }

    private suspend fun generateMatchNews(result: re.manager.basket.domain.engine.MatchFullResult) {
        val match = result.match
        val localScore = match.getTotalLocal()
        val visitorScore = match.getTotalVisitor()
        val winnerId = if (localScore > visitorScore) match.teamLocalId else match.teamVisitorId

        val teams = database.teamDao().getTeamsByGame(match.gameId)
        val localTeam = teams.find { it.id == match.teamLocalId }
        val visitorTeam = teams.find { it.id == match.teamVisitorId }
        val winnerTeam = if (localScore > visitorScore) localTeam else visitorTeam

        val mvp = result.playerResults.maxByOrNull { it.points + it.rebounds + it.assists }

        val title = "${winnerTeam?.name} wins against ${if (winnerId == match.teamLocalId) visitorTeam?.name else localTeam?.name}"
        val body = "${localTeam?.name} $localScore - $visitorScore ${visitorTeam?.name}. " +
                   (mvp?.let { "MVP: ${it.name} with ${it.points} pts, ${it.rebounds} reb." } ?: "")

        database.newsDao().insert(
            re.manager.basket.data.entity.NewsEntity(
                gameId = match.gameId,
                matchday = match.matchday,
                title = title,
                body = body,
                type = "MATCH"
            )
        )
    }

    private fun MatchEntity.getTotalLocal() = localQ1 + localQ2 + localQ3 + localQ4
    private fun MatchEntity.getTotalVisitor() = visitorQ1 + visitorQ2 + visitorQ3 + visitorQ4
}
