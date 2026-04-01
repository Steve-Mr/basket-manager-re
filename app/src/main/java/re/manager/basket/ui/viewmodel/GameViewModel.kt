package re.manager.basket.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.GameEntity
import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.domain.engine.MatchSimulator
import re.manager.basket.domain.engine.SeasonManager
import re.manager.basket.domain.engine.StateEvolver

class GameViewModel(private val database: AppDatabase) : ViewModel() {

    private val _gameState = MutableStateFlow<GameEntity?>(null)
    val gameState: StateFlow<GameEntity?> = _gameState

    private val _recentMatches = MutableStateFlow<List<MatchEntity>>(emptyList())
    val recentMatches: StateFlow<List<MatchEntity>> = _recentMatches

    fun loadGame() {
        viewModelScope.launch {
            // Placeholder: Load game with id 1
            _gameState.value = GameEntity(id = 1, currentMatchday = 1, currentSeason = 2025, name = "My Save")
            _recentMatches.value = database.matchDao().getRecentMatches(1)
        }
    }

    fun nextDay() {
        val current = _gameState.value ?: return
        viewModelScope.launch {
            val seasonManager = SeasonManager(current)

            // 1. Simulate Match if any
            // (Placeholder for actual matching logic)

            // 2. Evolve states
            // (Placeholder for evolving all players)

            val nextDay = seasonManager.getNextMatchday()
            val updated = current.copy(currentMatchday = nextDay)
            _gameState.value = updated
        }
    }
}
