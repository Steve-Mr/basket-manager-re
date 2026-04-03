package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.TacticEntity

import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Star
import androidx.compose.material.icons.outlined.Star
import androidx.compose.ui.Alignment
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import re.manager.basket.data.entity.PlayerEntity

@Composable
fun TacticScreen(
    players: List<PlayerEntity>,
    tactic: TacticEntity,
    onUpdate: (TacticEntity) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize().padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        item {
            Text("Team Strategy", style = MaterialTheme.typography.headlineMedium)
            Text("Adjust team preferences and focus on key players.", style = MaterialTheme.typography.bodyMedium)
        }

        item {
            StrategySlider(
                label = "Interior Shot Preference",
                value = tactic.shotIntPercent,
                range = 0f..100f,
                onValueChange = { onUpdate(tactic.copy(shotIntPercent = it)) }
            )
        }

        item {
            StrategySlider(
                label = "Triple Shot Preference",
                value = tactic.shotTriplePercent,
                range = 0f..100f,
                onValueChange = { onUpdate(tactic.copy(shotTriplePercent = it)) }
            )
        }

        item {
            StrategySlider(
                label = "Bench Importance",
                value = tactic.benchImportance,
                range = 1f..5f,
                onValueChange = { onUpdate(tactic.copy(benchImportance = it)) },
                description = "1: Mostly starters, 5: Heavy rotation"
            )
        }

        item {
            StrategySlider(
                label = "Game Type",
                value = tactic.gameType,
                range = -5f..5f,
                onValueChange = { onUpdate(tactic.copy(gameType = it)) },
                description = "-5: Defensive focus, +5: Offensive focus"
            )
        }

        item {
            Text("Star Players", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
            Text("Assigned stars receive significant priority in rotation and scoring.", style = MaterialTheme.typography.bodySmall)
        }

        item {
            Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                StarSlot("Star 1", tactic.star1, players, Modifier.weight(1f)) { onUpdate(tactic.copy(star1 = it)) }
                StarSlot("Star 2", tactic.star2, players, Modifier.weight(1f)) { onUpdate(tactic.copy(star2 = it)) }
                StarSlot("Star 3", tactic.star3, players, Modifier.weight(1f)) { onUpdate(tactic.copy(star3 = it)) }
            }
        }
    }
}

@Composable
fun StrategySlider(
    label: String,
    value: Int,
    range: ClosedFloatingPointRange<Float>,
    onValueChange: (Int) -> Unit,
    description: String? = null
) {
    Column {
        Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
            Text(label, fontWeight = FontWeight.Bold)
            Text(value.toString())
        }
        description?.let { Text(it, style = MaterialTheme.typography.bodySmall) }
        Slider(
            value = value.toFloat(),
            onValueChange = { onValueChange(it.toInt()) },
            valueRange = range
        )
    }
}

@Composable
fun StarSlot(
    label: String,
    playerId: Int?,
    players: List<PlayerEntity>,
    modifier: Modifier = Modifier,
    onSelect: (Int?) -> Unit
) {
    var showDialog by remember { mutableStateOf(false) }
    val player = players.find { it.id == playerId }

    if (showDialog) {
        AlertDialog(
            onDismissRequest = { showDialog = false },
            title = { Text("Select $label") },
            text = {
                LazyColumn(modifier = Modifier.heightIn(max = 400.dp)) {
                    item {
                        DropdownMenuItem(
                            text = { Text("None", color = Color.Gray) },
                            onClick = { onSelect(null); showDialog = false }
                        )
                    }
                    items(players.size) { index ->
                        val p = players[index]
                        DropdownMenuItem(
                            text = { Text("${p.name} (Avg: ${p.getAverageSkillAll().toInt()})") },
                            onClick = { onSelect(p.id); showDialog = false }
                        )
                    }
                }
            },
            confirmButton = { TextButton(onClick = { showDialog = false }) { Text("Close") } }
        )
    }

    OutlinedCard(
        onClick = { showDialog = true },
        modifier = modifier.height(100.dp),
        colors = if (player != null) CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer) else CardDefaults.cardColors()
    ) {
        Column(
            modifier = Modifier.fillMaxSize().padding(8.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Icon(Icons.Filled.Star, contentDescription = null, tint = if (player != null) MaterialTheme.colorScheme.primary else Color.LightGray)
            Text(label, style = MaterialTheme.typography.labelSmall)
            Text(
                player?.name ?: "Empty",
                style = MaterialTheme.typography.bodySmall,
                fontWeight = FontWeight.Bold,
                textAlign = androidx.compose.ui.text.style.TextAlign.Center,
                maxLines = 1
            )
        }
    }
}
