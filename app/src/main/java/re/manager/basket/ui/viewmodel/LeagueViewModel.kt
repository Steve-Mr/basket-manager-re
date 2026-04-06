package re.manager.basket.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.*
import re.manager.basket.data.AppDatabase
import re.manager.basket.domain.model.Position

class LeagueViewModel(private val database: AppDatabase) : ViewModel() {

    private val _gameId = MutableStateFlow<Int?>(null)
    private val _filterPosition = MutableStateFlow(Position.NONE)

    @OptIn(ExperimentalCoroutinesApi::class)
    val awards: StateFlow<List<re.manager.basket.data.entity.AwardEntity>> = _gameId.flatMapLatest { id ->
        if (id == null) flowOf(emptyList())
        else database.awardDao().getAllAwards(id)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    @OptIn(ExperimentalCoroutinesApi::class)
    val standings: StateFlow<List<Pair<re.manager.basket.data.entity.TeamEntity, re.manager.basket.data.entity.LeagueEntity>>> = _gameId.flatMapLatest { gameId ->
        if (gameId == null) flowOf(emptyList())
        else {
            combine(
                database.leagueDao().getStandingsFlow(gameId),
                database.teamDao().getTeamsByGameFlow(gameId)
            ) { stats, teams ->
                val teamMap = teams.associateBy { it.id }
                stats.mapNotNull { teamMap[it.teamId]?.let { team -> team to it } }
            }
        }
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    @OptIn(ExperimentalCoroutinesApi::class)
    val top100Players: StateFlow<List<PlayerUiState>> = combine(_gameId, _filterPosition) { gameId, filter ->
        gameId to filter
    }.flatMapLatest { (gameId, filter) ->
        if (gameId == null) flowOf(emptyList())
        else {
            database.playerDao().getAllPlayersFlow(gameId).map { allPlayers ->
                val filtered = if (filter != Position.NONE) {
                    allPlayers.filter { it.positionFirst == filter || it.positionSecond == filter }
                } else {
                    allPlayers
                }
                filtered.sortedByDescending { it.getAverageSkillAll() }
                    .take(100)
                    .map { it.toUiState() }
            }
        }
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    @OptIn(ExperimentalCoroutinesApi::class)
    val rookies: StateFlow<List<PlayerUiState>> = combine(_gameId, _filterPosition) { gameId, filter ->
        gameId to filter
    }.flatMapLatest { (gameId, filter) ->
        if (gameId == null) flowOf(emptyList())
        else {
            database.playerDao().getRookiesFlow(gameId).map { rookies ->
                val filtered = if (filter != Position.NONE) {
                    rookies.filter { it.positionFirst == filter || it.positionSecond == filter }
                } else {
                    rookies
                }
                filtered.sortedByDescending { it.getAverageSkillAll() }
                    .map { it.toUiState() }
            }
        }
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    fun load(gameId: Int) {
        _gameId.value = gameId
    }

    fun loadStandings(gameId: Int) {
        _gameId.value = gameId
    }

    fun setFilterPosition(position: Position) {
        _filterPosition.value = position
    }
}
