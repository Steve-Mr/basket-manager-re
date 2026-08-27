package top.maary.basketmanager.re.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import top.maary.basketmanager.re.BasketManagerApplication
import top.maary.basketmanager.re.domain.model.*
import top.maary.basketmanager.re.domain.repository.GameRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import java.io.InputStream

data class PlayerSeasonStats(
    val player: Player,
    val gamesPlayed: Int,
    val ppg: Double,
    val rpg: Double,
    val apg: Double,
    val spg: Double,
    val bpg: Double,
    val avgPer: Double,
    val isPlayoffs: Boolean = false
)

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

    private val _playerPlayoffStatsList = MutableStateFlow<List<PlayerSeasonStats>>(emptyList())
    val playerPlayoffStatsList: StateFlow<List<PlayerSeasonStats>> = _playerPlayoffStatsList.asStateFlow()

    private val _playoffSeries = MutableStateFlow<List<PlayoffSeries>>(emptyList())
    val playoffSeries: StateFlow<List<PlayoffSeries>> = _playoffSeries.asStateFlow()

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
        _playoffSeries.value = repository.getPlayoffSeries(g.id)

        val players = repository.getPlayers(g.id)
        _allPlayers.value = players

        // 1. Regular Season Statistics (matchday <= 166)
        val regularMap = repository.getAllPlayerRegularStats(g.id)
        val regularList = players.map { p ->
            val pStats = regularMap[p.id] ?: emptyList()
            val gp = pStats.size
            val ppg = if (gp > 0) pStats.sumOf { it.points }.toDouble() / gp else 0.0
            val rpg = if (gp > 0) pStats.sumOf { it.rebounds }.toDouble() / gp else 0.0
            val apg = if (gp > 0) pStats.sumOf { it.passesOk }.toDouble() / gp else 0.0
            val spg = if (gp > 0) pStats.sumOf { it.steals }.toDouble() / gp else 0.0
            val bpg = if (gp > 0) pStats.sumOf { it.blocks }.toDouble() / gp else 0.0
            val avgPer = if (gp > 0) pStats.sumOf { it.per }.toDouble() / gp else 0.0
            PlayerSeasonStats(p, gp, ppg, rpg, apg, spg, bpg, avgPer, isPlayoffs = false)
        }
        _playerStatsList.value = regularList

        // 2. Playoff Statistics (matchday > 166)
        val playoffMap = repository.getAllPlayerPlayoffStats(g.id)
        val playoffList = players.map { p ->
            val pStats = playoffMap[p.id] ?: emptyList()
            val gp = pStats.size
            val ppg = if (gp > 0) pStats.sumOf { it.points }.toDouble() / gp else 0.0
            val rpg = if (gp > 0) pStats.sumOf { it.rebounds }.toDouble() / gp else 0.0
            val apg = if (gp > 0) pStats.sumOf { it.passesOk }.toDouble() / gp else 0.0
            val spg = if (gp > 0) pStats.sumOf { it.steals }.toDouble() / gp else 0.0
            val bpg = if (gp > 0) pStats.sumOf { it.blocks }.toDouble() / gp else 0.0
            val avgPer = if (gp > 0) pStats.sumOf { it.per }.toDouble() / gp else 0.0
            PlayerSeasonStats(p, gp, ppg, rpg, apg, spg, bpg, avgPer, isPlayoffs = true)
        }
        _playerPlayoffStatsList.value = playoffList
    }

    fun getPlayerSeasonStats(playerId: Long): PlayerSeasonStats? {
        return _playerStatsList.value.find { it.player.id == playerId }
    }

    fun getPlayerPlayoffStats(playerId: Long): PlayerSeasonStats? {
        return _playerPlayoffStatsList.value.find { it.player.id == playerId }
    }

    fun swapPlayerPositions(player: Player) {
        if (player.positionSecond == Position.NONE || player.positionSecond == player.positionFirst) return
        val updated = player.copy(
            positionFirst = player.positionSecond,
            positionSecond = player.positionFirst
        )
        viewModelScope.launch {
            repository.updatePlayer(updated)
            _game.value?.let { refreshGameData(it) }
        }
    }

    suspend fun getTeamRoster(teamId: Long): List<Player> {
        return repository.getTeamPlayers(teamId)
    }

    suspend fun getTeamSchedule(teamId: Long): List<Match> {
        val gId = _game.value?.id ?: return emptyList()
        return repository.getTeamMatches(gId, teamId)
    }

    suspend fun getTeamTactic(teamId: Long): Tactic? {
        return repository.getTactic(teamId)
    }

    fun toggleAutoLineup(enabled: Boolean) {
        val currentGame = _game.value ?: return
        val updated = currentGame.copy(autoLineupEnabled = enabled)
        _game.value = updated
        viewModelScope.launch {
            repository.updateGame(updated)
        }
    }

    fun getInjuredStartingPlayers(): List<Player> {
        val tactic = _userTactic.value ?: return emptyList()
        val rosterMap = _userRoster.value.associateBy { it.id }
        val startingIds = listOfNotNull(
            tactic.starterPgId,
            tactic.starterSgId,
            tactic.starterSfId,
            tactic.starterPfId,
            tactic.starterCId
        )
        return startingIds.mapNotNull { rosterMap[it] }.filter { it.stateInjury > 0 }
    }

    fun advanceDay(
        autoAdjustIfInjured: Boolean = false,
        onHaltOnInjury: (List<Player>) -> Unit = {}
    ) {
        val currentGame = _game.value ?: return
        val injuredStarters = getInjuredStartingPlayers()

        if (injuredStarters.isNotEmpty() && !autoAdjustIfInjured && !currentGame.autoLineupEnabled) {
            onHaltOnInjury(injuredStarters)
            return
        }

        viewModelScope.launch {
            _isSimulating.value = true
            if (autoAdjustIfInjured || currentGame.autoLineupEnabled) {
                optimizeUserLineup()
            }
            _simulationProgressText.value = "Simulating Day ${currentGame.currentMatchday}..."
            val updated = repository.advanceMatchday(currentGame.id)
            _game.value = updated
            refreshGameData(updated)
            _isSimulating.value = false
        }
    }

    fun autoSimulateToMatchday(
        targetDay: Int,
        autoLineup: Boolean = false,
        onFinished: (String) -> Unit = {}
    ) {
        val currentGame = _game.value ?: return
        viewModelScope.launch {
            _isSimulating.value = true
            if (autoLineup) {
                toggleAutoLineup(true)
                optimizeUserLineup()
            }
            var lastMsg = "Simulation Complete"
            val updated = repository.autoSimulateTo(currentGame.id, targetDay) { day, msg ->
                _simulationProgressText.value = msg
                lastMsg = msg
            }
            _game.value = updated
            refreshGameData(updated)
            _isSimulating.value = false
            onFinished(lastMsg)
        }
    }

    fun updateTactic(tactic: Tactic) {
        viewModelScope.launch {
            repository.updateTactic(tactic)
            _userTactic.value = tactic
        }
    }

    fun optimizeUserLineup() {
        val tactic = _userTactic.value ?: return
        val roster = _userRoster.value
        val optimized = top.maary.basketmanager.re.domain.engine.LineupOptimizer.optimizeLineup(roster, tactic)
        updateTactic(optimized)
    }

    fun signFreeAgent(playerId: Long, salary: Int, years: Int, onComplete: (Boolean) -> Unit) {
        val team = _userTeam.value ?: return
        viewModelScope.launch {
            val success = repository.signFreeAgent(playerId, team.id, salary, years)
            if (success) {
                _game.value?.let { refreshGameData(it) }
            }
            onComplete(success)
        }
    }

    fun extendContract(playerId: Long, years: Int, salary: Int, onComplete: (Boolean) -> Unit) {
        viewModelScope.launch {
            val success = repository.extendContract(playerId, years, salary)
            if (success) {
                _game.value?.let { refreshGameData(it) }
            }
            onComplete(success)
        }
    }

    fun selectDraftPick(prospectId: Long, pickId: Long, onComplete: (Boolean) -> Unit) {
        viewModelScope.launch {
            val success = repository.selectDraftPick(prospectId, pickId)
            if (success) {
                _game.value?.let { refreshGameData(it) }
            }
            onComplete(success)
        }
    }

    fun getDraftProspects(onLoaded: (List<Player>) -> Unit) {
        viewModelScope.launch {
            val gameId = _game.value?.id ?: return@launch
            val prospects = repository.getDraftProspects(gameId)
            onLoaded(prospects)
        }
    }

    fun executeCpuDraftPick(pickId: Long, onComplete: (Player?) -> Unit) {
        viewModelScope.launch {
            val gameId = _game.value?.id ?: return@launch
            val player = repository.executeCpuDraftPick(gameId, pickId)
            if (player != null) {
                _game.value?.let { refreshGameData(it) }
            }
            onComplete(player)
        }
    }

    fun simulateDraftUntilUser(onComplete: (List<Pair<DraftPick, Player>>) -> Unit) {
        viewModelScope.launch {
            val game = _game.value ?: return@launch
            val results = repository.simulateDraftUntilUser(game.id, game.userTeamId)
            refreshGameData(game)
            onComplete(results)
        }
    }

    suspend fun getMatchBoxScores(matchId: Long): List<MatchResult> {
        return repository.getMatchResults(matchId)
    }

    suspend fun getMatchesForDay(day: Int): List<Match> {
        val gId = _game.value?.id ?: return emptyList()
        return repository.getMatchesForDay(gId, day)
    }
}
