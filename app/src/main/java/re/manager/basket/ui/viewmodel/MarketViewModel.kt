package re.manager.basket.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.PlayerEntity

class MarketViewModel(private val database: AppDatabase) : ViewModel() {

    private val _freeAgents = MutableStateFlow<List<PlayerEntity>>(emptyList())
    val freeAgents: StateFlow<List<PlayerEntity>> = _freeAgents.asStateFlow()

    private val _teamSalary = MutableStateFlow(0)
    val teamSalary: StateFlow<Int> = _teamSalary.asStateFlow()

    fun loadMarketData(gameId: Int, userTeamId: Int) {
        viewModelScope.launch {
            // Free Agents have teamId = null (as per RosterImporter)
            val players = database.playerDao().getPlayersByGame(gameId)
            _freeAgents.value = players.filter { it.teamId == null }.sortedByDescending { it.getAverageSkillAll() }

            val teamPlayers = database.playerDao().getPlayersByTeam(userTeamId)
            _teamSalary.value = teamPlayers.sumOf { it.salary }
        }
    }

    fun signPlayer(player: PlayerEntity, teamId: Int) {
        viewModelScope.launch {
            val updated = player.copy(teamId = teamId)
            database.playerDao().update(updated)
            loadMarketData(player.gameId, teamId)
        }
    }
}
