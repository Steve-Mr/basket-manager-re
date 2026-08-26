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

    fun createNewGame(name: String, userTeamName: String, rosterStream: InputStream, onCreated: (GameSession) -> Unit) {
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

enum class LineupSlot {
    STARTER_PG, STARTER_SG, STARTER_SF, STARTER_PF, STARTER_C,
    RESERVE_PG, RESERVE_SG, RESERVE_SF, RESERVE_PF, RESERVE_C
}

data class PlayerSeasonStats(
    val player: Player,
    val gamesPlayed: Int,
    val ppg: Double,
    val rpg: Double,
    val apg: Double,
    val spg: Double,
    val bpg: Double,
    val avgPer: Double
)

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

    private val _scheduleMatches = MutableStateFlow<List<Match>>(emptyList())
    val scheduleMatches: StateFlow<List<Match>> = _scheduleMatches.asStateFlow()

    private val _news = MutableStateFlow<List<NewsItem>>(emptyList())
    val news: StateFlow<List<NewsItem>> = _news.asStateFlow()

    private val _allPlayers = MutableStateFlow<List<Player>>(emptyList())
    val allPlayers: StateFlow<List<Player>> = _allPlayers.asStateFlow()

    private val _playerStatsList = MutableStateFlow<List<PlayerSeasonStats>>(emptyList())
    val playerStatsList: StateFlow<List<PlayerSeasonStats>> = _playerStatsList.asStateFlow()

    private val _freeAgents = MutableStateFlow<List<Player>>(emptyList())
    val freeAgents: StateFlow<List<Player>> = _freeAgents.asStateFlow()

    private val _draftPicks = MutableStateFlow<List<DraftPick>>(emptyList())
    val draftPicks: StateFlow<List<DraftPick>> = _draftPicks.asStateFlow()

    private val _draftProspects = MutableStateFlow<List<Player>>(emptyList())
    val draftProspects: StateFlow<List<Player>> = _draftProspects.asStateFlow()

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

    suspend fun refreshGameData(g: GameSession) {
        _userRoster.value = repository.getTeamPlayers(g.userTeamId)
        _userTactic.value = repository.getTactic(g.userTeamId)
        _standings.value = repository.getStandings(g.id)
        _todayMatches.value = repository.getMatchesForDay(g.id, g.currentMatchday)
        _scheduleMatches.value = repository.getMatchesForDay(g.id, g.currentMatchday)
        _news.value = repository.getNews(g.id)
        _freeAgents.value = repository.getFreeAgents(g.id)
        _draftPicks.value = repository.getDraftPicks(g.id)
        _draftProspects.value = repository.getDraftProspects(g.id)

        val players = repository.getPlayers(g.id)
        _allPlayers.value = players

        val statsMap = repository.getAllPlayerStats(g.id)
        val statsList = players.map { p ->
            val pStats = statsMap[p.id] ?: emptyList()
            val gp = pStats.size
            val ppg = if (gp > 0) pStats.sumOf { it.points }.toDouble() / gp else 0.0
            val rpg = if (gp > 0) pStats.sumOf { it.rebounds }.toDouble() / gp else 0.0
            val apg = if (gp > 0) pStats.sumOf { it.passesOk }.toDouble() / gp else 0.0
            val spg = if (gp > 0) pStats.sumOf { it.steals }.toDouble() / gp else 0.0
            val bpg = if (gp > 0) pStats.sumOf { it.blocks }.toDouble() / gp else 0.0
            val avgPer = if (gp > 0) pStats.sumOf { it.per }.toDouble() / gp else 0.0
            PlayerSeasonStats(p, gp, ppg, rpg, apg, spg, bpg, avgPer)
        }
        _playerStatsList.value = statsList
    }

    fun toggleAutoLineup(enabled: Boolean) {
        val currentGame = _game.value ?: return
        val updated = currentGame.copy(autoLineupEnabled = enabled)
        _game.value = updated
        viewModelScope.launch {
            repository.updateGame(updated)
        }
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
            val updated = repository.autoSimulateTo(currentGame.id, targetDay) { _, msg ->
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

    fun updateLineupSlot(slot: LineupSlot, playerId: Long) {
        val current = _userTactic.value ?: return
        val updated = when (slot) {
            LineupSlot.STARTER_PG -> current.copy(starterPgId = playerId)
            LineupSlot.STARTER_SG -> current.copy(starterSgId = playerId)
            LineupSlot.STARTER_SF -> current.copy(starterSfId = playerId)
            LineupSlot.STARTER_PF -> current.copy(starterPfId = playerId)
            LineupSlot.STARTER_C -> current.copy(starterCId = playerId)
            LineupSlot.RESERVE_PG -> current.copy(reservePgId = playerId)
            LineupSlot.RESERVE_SG -> current.copy(reserveSgId = playerId)
            LineupSlot.RESERVE_SF -> current.copy(reserveSfId = playerId)
            LineupSlot.RESERVE_PF -> current.copy(reservePfId = playerId)
            LineupSlot.RESERVE_C -> current.copy(reserveCId = playerId)
        }
        _userTactic.value = updated
        viewModelScope.launch {
            repository.updateTactic(updated)
        }
    }

    fun updateStarPlayer(starIndex: Int, playerId: Long?) {
        val current = _userTactic.value ?: return
        val updated = when (starIndex) {
            1 -> current.copy(starOnePlayerId = playerId)
            2 -> current.copy(starTwoPlayerId = playerId)
            3 -> current.copy(starThreePlayerId = playerId)
            else -> current
        }
        _userTactic.value = updated
        viewModelScope.launch {
            repository.updateTactic(updated)
        }
    }

    fun updateTactic(tactic: Tactic) {
        _userTactic.value = tactic
        viewModelScope.launch {
            repository.updateTactic(tactic)
        }
    }

    fun loadScheduleByMatchday(day: Int) {
        val gId = _game.value?.id ?: return
        viewModelScope.launch {
            _scheduleMatches.value = repository.getMatchesForDay(gId, day)
        }
    }

    fun loadScheduleByTeam(teamId: Long) {
        val gId = _game.value?.id ?: return
        viewModelScope.launch {
            _scheduleMatches.value = repository.getTeamMatches(gId, teamId)
        }
    }

    suspend fun getMatchBoxScores(matchId: Long): List<MatchResult> {
        return repository.getMatchResults(matchId)
    }

    fun executeTrade(proposal: TradeProposal, onResult: (TradeEvaluationResult) -> Unit) {
        viewModelScope.launch {
            val result = repository.executeTrade(proposal)
            _game.value?.let { refreshGameData(it) }
            onResult(result)
        }
    }

    fun signFreeAgent(playerId: Long, salary: Int, years: Int, onComplete: (Boolean) -> Unit) {
        val uTeamId = _userTeam.value?.id ?: return
        viewModelScope.launch {
            val success = repository.signFreeAgent(playerId, uTeamId, salary, years)
            _game.value?.let { refreshGameData(it) }
            onComplete(success)
        }
    }

    fun selectDraftPick(prospectId: Long, pickId: Long, onComplete: (Boolean) -> Unit) {
        viewModelScope.launch {
            val success = repository.selectDraftPick(prospectId, pickId)
            _game.value?.let { refreshGameData(it) }
            onComplete(success)
        }
    }
}
