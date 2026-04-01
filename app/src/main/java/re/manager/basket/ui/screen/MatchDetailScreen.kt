package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.entity.MatchResultEntity

@Composable
fun MatchDetailScreen(match: MatchEntity, playerStats: List<MatchResultEntity>) {
    LazyColumn(modifier = Modifier.fillMaxSize().padding(16.dp)) {
        item {
            Text("Match Summary", style = MaterialTheme.typography.headlineMedium)
            Spacer(modifier = Modifier.height(16.dp))

            Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
                Text("Team ${match.teamLocalId}", style = MaterialTheme.typography.titleLarge)
                Text("${match.localQ1} - ${match.visitorQ1}", style = MaterialTheme.typography.headlineSmall)
                Text("Team ${match.teamVisitorId}", style = MaterialTheme.typography.titleLarge)
            }

            HorizontalDivider(modifier = Modifier.padding(vertical = 16.dp))
            Text("Player Statistics", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
            Spacer(modifier = Modifier.height(8.dp))
        }

        items(playerStats) { stat ->
            Row(modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp), horizontalArrangement = Arrangement.SpaceBetween) {
                Text("Player ${stat.playerId}", Modifier.weight(1f))
                Text("Pts: ${stat.shotsIntOk * 2}", Modifier.width(60.dp))
                Text("Reb: ${stat.rebounds}", Modifier.width(60.dp))
            }
        }
    }
}
