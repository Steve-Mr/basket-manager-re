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

    fun loadPlayers(teamId: Int, gameId: Int = 1) {
        Log.d("PlayerListViewModel", "Loading players for teamId: $teamId, gameId: $gameId")
        viewModelScope.launch {
            val entities = database.playerDao().getPlayersByTeam(teamId)
            Log.d("PlayerListViewModel", "Found ${entities.size} players in DB")
            val tactic = database.tacticDao().getTacticForTeam(teamId, gameId)

            val starters = tactic?.let {
                setOf(it.titPG, it.titSG, it.titSF, it.titPF, it.titC)
            } ?: emptySet()

            _players.value = entities.map {
                it.toUiState(isStarter = starters.contains(it.id))
            }
        }
    }
}
