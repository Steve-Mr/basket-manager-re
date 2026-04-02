package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TeamEntity

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TeamPreviewScreen(
    team: TeamEntity,
    players: List<PlayerEntity>,
    onConfirm: () -> Unit,
    onBack: () -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("${team.fullName} Roster") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        },
        bottomBar = {
            BottomAppBar {
                Button(
                    onClick = onConfirm,
                    modifier = Modifier.fillMaxWidth().padding(16.dp)
                ) {
                    Text("Select this Team")
                }
            }
        }
    ) { innerPadding ->
        Column(modifier = Modifier.padding(innerPadding).fillMaxSize()) {
            Text(
                text = "Previewing Team: ${team.fullName}",
                modifier = Modifier.padding(16.dp),
                style = MaterialTheme.typography.titleMedium
            )

            LazyColumn(
                modifier = Modifier.fillMaxWidth().weight(1f),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(players) { player ->
                    Card(modifier = Modifier.fillMaxWidth()) {
                        Row(
                            modifier = Modifier.padding(12.dp).fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Column {
                                Text(text = player.name, fontWeight = FontWeight.Bold)
                                Text(text = "Pos: ${player.positionFirst}", style = MaterialTheme.typography.bodySmall)
                            }
                            Text(text = "Skill: ${String.format("%.1f", player.getAverageSkillAll())}")
                        }
                    }
                }
            }
        }
    }
}
