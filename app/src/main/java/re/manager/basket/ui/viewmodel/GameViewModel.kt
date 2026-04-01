package re.manager.basket.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import android.content.Context
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.GameEntity
import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.importer.RosterImporter
import re.manager.basket.domain.engine.SeasonManager

class GameViewModel(private val database: AppDatabase) : ViewModel() {

    private val _gameState = MutableStateFlow<GameEntity?>(null)
    val gameState: StateFlow<GameEntity?> = _gameState

    private val _recentMatches = MutableStateFlow<List<MatchEntity>>(emptyList())
    val recentMatches: StateFlow<List<MatchEntity>> = _recentMatches

    fun initializeAndLoadGame(context: Context) {
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                if (database.teamDao().getCount() == 0) {
                    val importer = RosterImporter(context, database)
                    importer.importFromAssets(gameId = 1)
                }
                val game = database.gameDao().getGameById(1)
                _gameState.value = game
                _recentMatches.value = database.matchDao().getRecentMatches(1)
            }
        }
    }

    fun loadGame() {
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                // Load game with id 1 from database
                val game = database.gameDao().getGameById(1)
                _gameState.value = game
                _recentMatches.value = database.matchDao().getRecentMatches(1)
            }
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

            // Persist the updated state
            database.gameDao().insert(updated)
            _gameState.value = updated
        }
    }
}
