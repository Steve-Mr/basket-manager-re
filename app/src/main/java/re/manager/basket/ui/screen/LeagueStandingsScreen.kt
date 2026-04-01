package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.LeagueEntity

@Composable
fun LeagueStandingsScreen(standings: List<LeagueEntity>) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(4.dp)
    ) {
        item {
            Row(modifier = Modifier.fillMaxWidth().padding(bottom = 8.dp)) {
                Text("#", Modifier.width(30.dp), fontWeight = FontWeight.Bold)
                Text("Team ID", Modifier.weight(1f), fontWeight = FontWeight.Bold)
                Text("W", Modifier.width(40.dp), fontWeight = FontWeight.Bold)
                Text("L", Modifier.width(40.dp), fontWeight = FontWeight.Bold)
            }
        }

        itemsIndexed(standings) { index, entry ->
            Card(modifier = Modifier.fillMaxWidth()) {
                Row(modifier = Modifier.padding(8.dp)) {
                    Text("${index + 1}", Modifier.width(30.dp))
                    Text("Team ${entry.teamId}", Modifier.weight(1f))
                    Text("${entry.gamesWon}", Modifier.width(40.dp))
                    Text("${entry.gamesLost}", Modifier.width(40.dp))
                }
            }
        }
    }
}
