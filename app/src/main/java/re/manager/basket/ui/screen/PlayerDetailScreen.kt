package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.MatchResultEntity

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlayerDetailScreen(
    player: PlayerEntity,
    stats: List<MatchResultEntity>,
    onBack: () -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(player.name) },
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
                Text("Basic Information", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
                Card(modifier = Modifier.fillMaxWidth()) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
                            Text("Age: ${player.age}")
                            Text("Exp: ${player.yearsExperience}y")
                        }
                        Text("Position: ${player.positionFirst} / ${player.positionSecond}")
                        Text("Potential: ${player.potential}")
                    }
                }
            }

            item {
                Text("Skills", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
                Card(modifier = Modifier.fillMaxWidth()) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        SkillRow("Physique", player.skillPhysique)
                        SkillRow("Shot Interior", player.skillShotInterior)
                        SkillRow("Shot Exterior", player.skillShotExterior)
                        SkillRow("Shot Free", player.skillShotFree)
                        SkillRow("Pass", player.skillPass)
                        SkillRow("Rebound", player.skillRebound)
                        SkillRow("Steal", player.skillSteal)
                        SkillRow("Block", player.skillBlock)
                    }
                }
            }

            item {
                Text("Season Statistics", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
                if (stats.isEmpty()) {
                    Text("No games played yet.", style = MaterialTheme.typography.bodyMedium)
                } else {
                    val games = stats.size
                    val avgPts = stats.sumOf { it.points }.toFloat() / games
                    val avgReb = stats.sumOf { it.rebounds }.toFloat() / games
                    val avgAst = stats.sumOf { it.assists }.toFloat() / games
                    val avgStl = stats.sumOf { it.steals }.toFloat() / games
                    val avgBlk = stats.sumOf { it.blocks }.toFloat() / games

                    Card(modifier = Modifier.fillMaxWidth()) {
                        Column(modifier = Modifier.padding(16.dp)) {
                            Text("Games Played: $games")
                            Text("PPG: %.1f".format(avgPts))
                            Text("RPG: %.1f".format(avgReb))
                            Text("APG: %.1f".format(avgAst))
                            Text("SPG: %.1f".format(avgStl))
                            Text("BPG: %.1f".format(avgBlk))
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun SkillRow(label: String, value: Int) {
    Row(
        modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(label)
        Text(value.toString(), fontWeight = FontWeight.Bold, color = if (value >= 80) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurface)
    }
}
