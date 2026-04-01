package re.manager.basket.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import re.manager.basket.data.dao.PlayerDao

class PlayerListViewModel(private val playerDao: PlayerDao) : ViewModel() {

    private val _players = MutableStateFlow<List<PlayerUiState>>(emptyList())
    val players: StateFlow<List<PlayerUiState>> = _players.asStateFlow()

    fun loadPlayers(teamId: Int) {
        viewModelScope.launch {
            val entities = playerDao.getPlayersByTeam(teamId)
            _players.value = entities.map { it.toUiState() }
        }
    }
}
