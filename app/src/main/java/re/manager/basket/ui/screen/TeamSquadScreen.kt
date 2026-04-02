package re.manager.basket.ui.screen

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.ui.viewmodel.PlayerListViewModel
import re.manager.basket.ui.viewmodel.PlayerUiState

@Composable
fun TeamSquadScreen(viewModel: PlayerListViewModel) {
    val players by viewModel.players.collectAsState()
    TeamSquadContent(players, onPlayerClick = { /* Navigate to player detail */ })
}

@Composable
fun TeamSquadContent(players: List<PlayerUiState>, onPlayerClick: (Int) -> Unit = {}) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        item {
            Text(
                text = "Team Squad",
                style = MaterialTheme.typography.headlineMedium,
                modifier = Modifier.padding(bottom = 16.dp)
            )
        }

        items(players) { player ->
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable { onPlayerClick(player.id) },
                elevation = CardDefaults.cardElevation(defaultElevation = 2.dp),
                colors = if (player.hasContract) CardDefaults.cardColors() else CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text(
                            text = player.name,
                            style = MaterialTheme.typography.titleLarge,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = if (player.isStarter) "Starter" else "List",
                            color = if (player.isStarter) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.secondary
                        )
                    }
                    Spacer(modifier = Modifier.height(8.dp))
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text(text = "Age: ${player.age}")
                        Text(text = "Avg: ${player.avgSkill} (${player.potential})")
                        Text(text = "Val: ${player.totalValue}")
                    }
                }
            }
        }
    }
}
