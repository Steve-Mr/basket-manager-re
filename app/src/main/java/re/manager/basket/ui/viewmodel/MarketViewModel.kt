package re.manager.basket.ui.viewmodel

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.PlayerEntity

class MarketViewModel(private val database: AppDatabase) : ViewModel() {

    private val _gameId = MutableStateFlow<Int?>(null)
    private val _userTeamId = MutableStateFlow<Int?>(null)

    @OptIn(ExperimentalCoroutinesApi::class)
    val freeAgents: StateFlow<List<PlayerEntity>> = _gameId.flatMapLatest { id ->
        if (id == null) flowOf(emptyList())
        else database.playerDao().getPlayersByTeamFlow(-1, id) // Assuming -1 or specific query for null teamId
            .map { list -> list.filter { it.teamId == null }.sortedByDescending { it.getAverageSkillAll() } }
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    @OptIn(ExperimentalCoroutinesApi::class)
    val teamSalary: StateFlow<Int> = combine(_gameId, _userTeamId) { gameId, teamId ->
        gameId to teamId
    }.flatMapLatest { (gameId, teamId) ->
        if (gameId == null || teamId == null) flowOf(0)
        else database.playerDao().getPlayersByTeamFlow(teamId, gameId).map { it.sumOf { p -> p.salary } }
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), 0)

    @OptIn(ExperimentalCoroutinesApi::class)
    val salaryCap: StateFlow<Int> = combine(_gameId, _userTeamId) { gameId, teamId ->
        gameId to teamId
    }.flatMapLatest { (gameId, teamId) ->
        if (gameId == null || teamId == null) flowOf(re.manager.basket.domain.model.Constants.SALARY_CAP_MED)
        else flow { emit(database.teamDao().getTeamById(teamId, gameId)?.salaryCap ?: re.manager.basket.domain.model.Constants.SALARY_CAP_MED) }
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), re.manager.basket.domain.model.Constants.SALARY_CAP_MED)

    fun loadMarketData(gameId: Int, userTeamId: Int) {
        Log.d("MarketViewModel", "Setting market load params for gameId: $gameId, userTeamId: $userTeamId")
        _gameId.value = gameId
        _userTeamId.value = userTeamId
    }

    private val _signingResult = MutableStateFlow<String?>(null)
    val signingResult: StateFlow<String?> = _signingResult.asStateFlow()

    fun signPlayer(player: PlayerEntity, teamId: Int) {
        viewModelScope.launch {
            // Logic based on NegotiationDialog's satisfaction check
            val expectedSalary = (player.getValue() * 100000).toInt().coerceAtLeast(500000)
            val satisfaction = (player.salary.toFloat() / expectedSalary.toFloat() * 100).toInt()

            if (satisfaction >= 80) {
                val updated = player.copy(teamId = teamId)
                database.playerDao().update(updated)
                _signingResult.value = "Success: ${player.name} has signed with your team!"
            } else {
                _signingResult.value = "Rejected: ${player.name} found the offer insufficient."
            }
        }
    }

    fun clearSigningResult() {
        _signingResult.value = null
    }
}
