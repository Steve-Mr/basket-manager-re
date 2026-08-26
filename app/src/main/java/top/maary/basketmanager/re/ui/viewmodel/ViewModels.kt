package top.maary.basketmanager.re.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import top.maary.basketmanager.re.BasketManagerApplication
import top.maary.basketmanager.re.domain.engine.TradeEvaluationResult
import top.maary.basketmanager.re.domain.model.*
import top.maary.basketmanager.re.domain.repository.GameRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import java.io.InputStream

class MainViewModel(
    private val repository: GameRepository = BasketManagerApplication.instance.gameRepository
) : ViewModel() {

    private val _savedGames = MutableStateFlow<List<GameSession>>(emptyList())
    val savedGames: StateFlow<List<GameSession>> = _savedGames.asStateFlow()

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    init {
        loadSavedGames()
    }

    fun loadSavedGames() {
        viewModelScope.launch {
            _savedGames.value = repository.getAllGames()
        }
    }

    fun createGame(name: String, userTeamName: String, rosterStream: InputStream, onCreated: (GameSession) -> Unit) {
        viewModelScope.launch {
            _isLoading.value = true
            val game = repository.createNewGame(name, userTeamName, rosterStream)
            loadSavedGames()
            _isLoading.value = false
            onCreated(game)
        }
    }

    fun deleteGame(gameId: Long) {
        viewModelScope.launch {
            repository.deleteGame(gameId)
            loadSavedGames()
        }
    }
}

class GameDashboardViewModel(
    private val repository: GameRepository = BasketManagerApplication.instance.gameRepository
) : ViewModel() {

    private val _game = MutableStateFlow<GameSession?>(null)
    val game: StateFlow<GameSession?> = _game.asStateFlow()

    private val _userTeam = MutableStateFlow<Team?>(null)
    val userTeam: StateFlow<Team?> = _userTeam.asStateFlow()

    private val _allTeams = MutableStateFlow<List<Team>>(emptyList())
    val allTeams: StateFlow<List<Team>> = _allTeams.asStateFlow()

    private val _userRoster = MutableStateFlow<List<Player>>(emptyList())
    val userRoster: StateFlow<List<Player>> = _userRoster.asStateFlow()

    private val _userTactic = MutableStateFlow<Tactic?>(null)
    val userTactic: StateFlow<Tactic?> = _userTactic.asStateFlow()

    private val _standings = MutableStateFlow<List<StandingsItem>>(emptyList())
    val standings: StateFlow<List<StandingsItem>> = _standings.asStateFlow()

    private val _todayMatches = MutableStateFlow<List<Match>>(emptyList())
    val todayMatches: StateFlow<List<Match>> = _todayMatches.asStateFlow()

    private val _news = MutableStateFlow<List<NewsItem>>(emptyList())
    val news: StateFlow<List<NewsItem>> = _news.asStateFlow()

    private val _isSimulating = MutableStateFlow(false)
    val isSimulating: StateFlow<Boolean> = _isSimulating.asStateFlow()

    private val _simulationProgressText = MutableStateFlow("")
    val simulationProgressText: StateFlow<String> = _simulationProgressText.asStateFlow()

    fun loadGame(gameId: Long) {
        viewModelScope.launch {
            val g = repository.getGame(gameId) ?: return@launch
            _game.value = g

            val teams = repository.getTeams(gameId)
            _allTeams.value = teams
            _userTeam.value = teams.find { it.id == g.userTeamId }

            refreshGameData(g)
        }
    }

    private suspend fun refreshGameData(g: GameSession) {
        _userRoster.value = repository.getTeamPlayers(g.userTeamId)
        _userTactic.value = repository.getTactic(g.userTeamId)
        _standings.value = repository.getStandings(g.id)
        _todayMatches.value = repository.getMatchesForDay(g.id, g.currentMatchday)
        _news.value = repository.getNews(g.id)
    }

    fun advanceDay() {
        val currentGame = _game.value ?: return
        viewModelScope.launch {
            _isSimulating.value = true
            _simulationProgressText.value = "Simulating Matchday ${currentGame.currentMatchday}..."
            val updated = repository.advanceMatchday(currentGame.id)
            _game.value = updated
            refreshGameData(updated)
            _isSimulating.value = false
        }
    }

    fun autoSimulateToMatchday(targetDay: Int) {
        val currentGame = _game.value ?: return
        viewModelScope.launch {
            _isSimulating.value = true
            val updated = repository.autoSimulateTo(currentGame.id, targetDay) { day, msg ->
                _simulationProgressText.value = msg
            }
            _game.value = updated
            refreshGameData(updated)
            _isSimulating.value = false
        }
    }

    fun autoOptimizeLineup() {
        val teamId = _userTeam.value?.id ?: return
        viewModelScope.launch {
            val optimized = repository.autoOptimizeLineup(teamId)
            _userTactic.value = optimized
        }
    }

    fun updateTactic(tactic: Tactic) {
        viewModelScope.launch {
            repository.updateTactic(tactic)
            _userTactic.value = tactic
        }
    }
}
