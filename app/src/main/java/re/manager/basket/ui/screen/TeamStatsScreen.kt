package re.manager.basket.ui.screen

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.MatchResultEntity
import re.manager.basket.data.entity.TeamEntity

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TeamStatsScreen(
    team: TeamEntity,
    players: List<PlayerEntity>,
    allStats: List<MatchResultEntity>,
    onBack: () -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("${team.name} Season Stats") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier.fillMaxSize().padding(padding)
        ) {
            item {
                Row(
                    modifier = Modifier.fillMaxWidth().background(MaterialTheme.colorScheme.secondaryContainer).padding(12.dp)
                ) {
                    Text("Player", modifier = Modifier.weight(2f), fontWeight = FontWeight.Bold)
                    Text("GP", modifier = Modifier.weight(1f), fontWeight = FontWeight.Bold)
                    Text("PPG", modifier = Modifier.weight(1f), fontWeight = FontWeight.Bold)
                    Text("RPG", modifier = Modifier.weight(1f), fontWeight = FontWeight.Bold)
                    Text("APG", modifier = Modifier.weight(1f), fontWeight = FontWeight.Bold)
                }
            }

            val playersWithStats = players.map { player ->
                val pStats = allStats.filter { it.playerId == player.id }
                player to pStats
            }.sortedByDescending { it.second.sumOf { s -> s.points }.toFloat() / it.second.size.coerceAtLeast(1) }

            items(playersWithStats) { (player, stats) ->
                val gp = stats.size
                val ppg = if (gp > 0) stats.sumOf { it.points }.toFloat() / gp else 0f
                val rpg = if (gp > 0) stats.sumOf { it.rebounds }.toFloat() / gp else 0f
                val apg = if (gp > 0) stats.sumOf { it.assists }.toFloat() / gp else 0f

                Row(
                    modifier = Modifier.fillMaxWidth().padding(12.dp),
                    verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                ) {
                    Text(player.name, modifier = Modifier.weight(2f), style = MaterialTheme.typography.bodySmall, fontWeight = FontWeight.Bold)
                    Text("$gp", modifier = Modifier.weight(1f), style = MaterialTheme.typography.bodySmall)
                    Text("%.1f".format(ppg), modifier = Modifier.weight(1f), style = MaterialTheme.typography.bodySmall)
                    Text("%.1f".format(rpg), modifier = Modifier.weight(1f), style = MaterialTheme.typography.bodySmall)
                    Text("%.1f".format(apg), modifier = Modifier.weight(1f), style = MaterialTheme.typography.bodySmall)
                }
                HorizontalDivider(modifier = Modifier.padding(horizontal = 12.dp), thickness = 0.5.dp, color = Color.LightGray)
            }
        }
    }
}
