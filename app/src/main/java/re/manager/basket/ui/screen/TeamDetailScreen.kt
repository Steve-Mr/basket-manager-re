package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TeamEntity
import re.manager.basket.data.entity.LeagueEntity

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TeamDetailScreen(
    team: TeamEntity,
    league: LeagueEntity?,
    players: List<PlayerEntity>,
    onPlayerClick: (Int) -> Unit,
    onBack: () -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(team.fullName) },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            item {
                Text("Team Info", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
                Card(modifier = Modifier.fillMaxWidth()) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Text("Conference: ${team.conference}")
                        Text("Division: ${team.division}")
                        league?.let {
                            Text("Record: ${it.gamesWon}W - ${it.gamesLost}L", fontWeight = FontWeight.Bold)
                            Text("Points Scored: ${it.pointsScored}")
                            Text("Points Allowed: ${it.pointsAllowed}")
                        }
                    }
                }
            }

            item {
                Text("Roster", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
            }

            items(players) { player ->
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    onClick = { onPlayerClick(player.id) }
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth().padding(16.dp),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Column {
                            Text(player.name, fontWeight = FontWeight.Bold)
                            Text("${player.positionFirst} | Age: ${player.age}", style = MaterialTheme.typography.bodySmall)
                        }
                        Text("Avg: ${player.getAverageSkillAll().toInt()}", color = MaterialTheme.colorScheme.primary)
                    }
                }
            }
        }
    }
}
