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
            Text("Star Players (Max 3)", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
            Text("Star players receive more minutes and scoring priority.", style = MaterialTheme.typography.bodySmall)
        }

        items(players.size) { index ->
            val player = players[index]
            val isStar1 = tactic.star1 == player.id
            val isStar2 = tactic.star2 == player.id
            val isStar3 = tactic.star3 == player.id
            val isAnyStar = isStar1 || isStar2 || isStar3

            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = if (isAnyStar) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surface
                )
            ) {
                Row(
                    modifier = Modifier.fillMaxWidth().padding(12.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(player.name, fontWeight = if (isAnyStar) FontWeight.Bold else FontWeight.Normal)
                    Row {
                        StarToggle(isStar1, "Star 1") { if (it) onUpdate(tactic.copy(star1 = player.id)) else onUpdate(tactic.copy(star1 = null)) }
                        StarToggle(isStar2, "Star 2") { if (it) onUpdate(tactic.copy(star2 = player.id)) else onUpdate(tactic.copy(star2 = null)) }
                        StarToggle(isStar3, "Star 3") { if (it) onUpdate(tactic.copy(star3 = player.id)) else onUpdate(tactic.copy(star3 = null)) }
                    }
                }
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
fun StarToggle(active: Boolean, label: String, onToggle: (Boolean) -> Unit) {
    IconButton(onClick = { onToggle(!active) }) {
        Icon(
            imageVector = if (active) Icons.Filled.Star else Icons.Outlined.Star,
            contentDescription = label,
            tint = if (active) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}
