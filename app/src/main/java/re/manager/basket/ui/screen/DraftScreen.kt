package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import re.manager.basket.ui.viewmodel.PlayerUiState

@Composable
fun DraftScreen(rookies: List<PlayerUiState>, onPick: (PlayerUiState) -> Unit) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        item {
            Text("NBA Draft 2025", style = MaterialTheme.typography.headlineMedium)
            Text("Select your future star", style = MaterialTheme.typography.bodyMedium)
            Spacer(modifier = Modifier.height(16.dp))
        }

        items(rookies) { player ->
            Card(modifier = Modifier.fillMaxWidth()) {
                Row(modifier = Modifier.padding(16.dp), horizontalArrangement = Arrangement.SpaceBetween) {
                    Column {
                        Text(player.name, style = MaterialTheme.typography.titleMedium)
                        Text("Potential: ${player.originalEntity.potential}/10")
                        Text("Avg Skill: ${player.avgSkill}")
                    }
                    Button(onClick = { onPick(player) }) {
                        Text("Pick")
                    }
                }
            }
        }
    }
}
