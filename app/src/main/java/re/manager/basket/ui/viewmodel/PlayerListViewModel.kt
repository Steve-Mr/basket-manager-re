package re.manager.basket.ui.viewmodel

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import re.manager.basket.data.AppDatabase

class PlayerListViewModel(private val database: AppDatabase) : ViewModel() {

    private val _players = MutableStateFlow<List<PlayerUiState>>(emptyList())
    val players: StateFlow<List<PlayerUiState>> = _players.asStateFlow()

    fun loadPlayers(teamId: Int, gameId: Int = 1, filterPosition: re.manager.basket.domain.model.Position = re.manager.basket.domain.model.Position.NONE) {
        Log.d("PlayerListViewModel", "Loading players for teamId: $teamId, gameId: $gameId, filter: $filterPosition")
        viewModelScope.launch {
            val allGamePlayers = database.playerDao().getPlayersByGame(gameId)
            val teamPlayers = allGamePlayers.filter { it.teamId == teamId }

            val tactic = database.tacticDao().getTacticForTeam(teamId, gameId)
            val starters = tactic?.let {
                setOf(it.titPG, it.titSG, it.titSF, it.titPF, it.titC)
            } ?: emptySet()

            val sortedPlayers = if (filterPosition != re.manager.basket.domain.model.Position.NONE) {
                teamPlayers.sortedWith(compareByDescending<re.manager.basket.data.entity.PlayerEntity> {
                    it.positionFirst == filterPosition
                }.thenByDescending {
                    it.positionSecond == filterPosition
                }.thenByDescending {
                    it.getAverageSkillAll()
                })
            } else {
                teamPlayers.sortedByDescending { it.getAverageSkillAll() }
            }

            _players.value = sortedPlayers.map {
                it.toUiState(isStarter = starters.contains(it.id))
            }
        }
    }
}
