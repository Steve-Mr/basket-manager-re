package re.manager.basket.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.GameEntity
import re.manager.basket.domain.engine.SeasonManager
import re.manager.basket.domain.engine.StateEvolver

class GameViewModel(private val database: AppDatabase) : ViewModel() {

    private val _gameState = MutableStateFlow<GameEntity?>(null)
    val gameState: StateFlow<GameEntity?> = _gameState

    private val evolver = StateEvolver()

    fun loadGame() {
        viewModelScope.launch {
            // In a real app, we'd load the current game from DB
            // For now, use a placeholder
            _gameState.value = GameEntity(id = 1, currentMatchday = 1, currentSeason = 2025, name = "My Save")
        }
    }

    fun nextDay() {
        val current = _gameState.value ?: return
        viewModelScope.launch {
            val seasonManager = SeasonManager(current)
            val nextDay = seasonManager.getNextMatchday()

            // Logic for match simulation and state evolution would be triggered here

            val updated = current.copy(currentMatchday = nextDay)
            // database.gameDao().update(updated)
            _gameState.value = updated
        }
    }
}
