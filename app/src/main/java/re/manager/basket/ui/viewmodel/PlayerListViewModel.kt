package re.manager.basket.ui.viewmodel

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.*
import re.manager.basket.data.AppDatabase

class PlayerListViewModel(private val database: AppDatabase) : ViewModel() {

    private val _teamId = MutableStateFlow<Int?>(null)
    private val _gameId = MutableStateFlow<Int?>(null)
    private val _filterPosition = MutableStateFlow(re.manager.basket.domain.model.Position.NONE)

    @OptIn(ExperimentalCoroutinesApi::class)
    val players: StateFlow<List<PlayerUiState>> = combine(_teamId, _gameId, _filterPosition) { teamId, gameId, filter ->
        Triple(teamId, gameId, filter)
    }.flatMapLatest { (teamId, gameId, filter) ->
        if (teamId == null || gameId == null) flowOf(emptyList())
        else {
            combine(
                database.playerDao().getPlayersByTeamFlow(teamId, gameId),
                database.tacticDao().getTacticForTeamFlow(teamId, gameId)
            ) { teamPlayers, tactic ->
                val starters = tactic?.let {
                    setOf(it.titPG, it.titSG, it.titSF, it.titPF, it.titC)
                } ?: emptySet()

                val sortedPlayers = if (filter != re.manager.basket.domain.model.Position.NONE) {
                    teamPlayers.sortedWith(compareByDescending<re.manager.basket.data.entity.PlayerEntity> {
                        it.positionFirst == filter
                    }.thenByDescending {
                        it.positionSecond == filter
                    }.thenByDescending {
                        it.getAverageSkillAll()
                    })
                } else {
                    teamPlayers.sortedByDescending { it.getAverageSkillAll() }
                }

                sortedPlayers.map {
                    it.toUiState(isStarter = starters.contains(it.id))
                }
            }
        }
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    fun loadPlayers(teamId: Int, gameId: Int?, filterPosition: re.manager.basket.domain.model.Position = re.manager.basket.domain.model.Position.NONE) {
        Log.d("PlayerListViewModel", "Setting load params for teamId: $teamId, gameId: $gameId, filter: $filterPosition")
        _teamId.value = teamId
        _gameId.value = gameId
        _filterPosition.value = filterPosition
    }
}
