package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import re.manager.basket.ui.viewmodel.GameViewModel

@Composable
fun DashboardScreen(viewModel: GameViewModel) {
    val gameState by viewModel.gameState.collectAsState()
    DashboardContent(gameState)
}

@Composable
fun DashboardContent(gameState: re.manager.basket.data.entity.GameEntity?) {
    Column(
        modifier = Modifier.fillMaxSize().padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        gameState?.let { game ->
            Text(text = "Season: ${game.currentSeason}", style = MaterialTheme.typography.headlineMedium)
            Text(text = "Matchday: ${game.currentMatchday}", style = MaterialTheme.typography.titleLarge)

            Spacer(modifier = Modifier.height(32.dp))

            Card(modifier = Modifier.fillMaxWidth()) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text(text = "Next Event", style = MaterialTheme.typography.titleMedium)
                    Text(text = "Match against BOS", style = MaterialTheme.typography.bodyLarge)
                }
            }
        } ?: run {
            CircularProgressIndicator()
            Text("Loading Game Data...")
        }
    }
}
