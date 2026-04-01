package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.PlayerEntity

@Composable
fun MarketScreen(freeAgents: List<PlayerEntity>, onSign: (PlayerEntity) -> Unit) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        item {
            Text("Free Agents", style = MaterialTheme.typography.headlineSmall)
        }

        items(freeAgents) { player ->
            Card(modifier = Modifier.fillMaxWidth()) {
                Row(modifier = Modifier.padding(16.dp), horizontalArrangement = Arrangement.SpaceBetween) {
                    Column {
                        Text(player.name, style = MaterialTheme.typography.titleMedium)
                        Text("Value: ${player.getMarketValue().toInt()}")
                    }
                    Button(onClick = { onSign(player) }) {
                        Text("Sign")
                    }
                }
            }
        }
    }
}
