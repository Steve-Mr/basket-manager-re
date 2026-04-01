package re.manager.basket.ui.screen

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

@Composable
fun TeamSquadScreen(viewModel: PlayerListViewModel) {
    val players by viewModel.players.collectAsState()

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
                modifier = Modifier.fillMaxWidth(),
                elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
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
                            text = "Pos: ${player.positionFirst}",
                            style = MaterialTheme.typography.bodyLarge
                        )
                    }
                    Spacer(modifier = Modifier.height(8.dp))
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text(text = "Age: ${player.age}")
                        Text(text = "Avg: ${player.getAverageSkillAll().toInt()}")
                        Text(text = "Val: ${player.getValue().toInt()}")
                    }
                    Spacer(modifier = Modifier.height(4.dp))
                    LinearProgressIndicator(
                        progress = player.stateEnergy / 100f,
                        modifier = Modifier.fillMaxWidth(),
                        color = if (player.stateEnergy < 40) MaterialTheme.colorScheme.error else MaterialTheme.colorScheme.primary
                    )
                }
            }
        }
    }
}
