package re.manager.basket.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import re.manager.basket.data.dao.PlayerDao
import re.manager.basket.data.entity.PlayerEntity

class PlayerListViewModel(private val playerDao: PlayerDao) : ViewModel() {

    private val _players = MutableStateFlow<List<PlayerEntity>>(emptyList())
    val players: StateFlow<List<PlayerEntity>> = _players

    fun loadPlayers(teamId: Int) {
        viewModelScope.launch {
            _players.value = playerDao.getPlayersByTeam(teamId)
        }
    }
}
