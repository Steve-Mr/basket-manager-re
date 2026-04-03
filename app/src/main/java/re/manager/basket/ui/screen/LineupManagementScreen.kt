package re.manager.basket.ui.screen

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TacticEntity
import re.manager.basket.domain.model.Position

@Composable
fun LineupManagementScreen(
    players: List<PlayerEntity>,
    tactic: TacticEntity,
    onTacticUpdate: (TacticEntity) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize().padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        item {
            Text("Lineup Management", style = MaterialTheme.typography.headlineMedium)
            Text("Assign players to starters and reserves for each position.", style = MaterialTheme.typography.bodyMedium)
        }

        item {
            Text("Starters", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
        }

        item { PositionSelector("Point Guard (PG)", tactic.titPG, players, tactic, Position.PG) { onTacticUpdate(tactic.copy(titPG = it)) } }
        item { PositionSelector("Shooting Guard (SG)", tactic.titSG, players, tactic, Position.SG) { onTacticUpdate(tactic.copy(titSG = it)) } }
        item { PositionSelector("Small Forward (SF)", tactic.titSF, players, tactic, Position.SF) { onTacticUpdate(tactic.copy(titSF = it)) } }
        item { PositionSelector("Power Forward (PF)", tactic.titPF, players, tactic, Position.PF) { onTacticUpdate(tactic.copy(titPF = it)) } }
        item { PositionSelector("Center (C)", tactic.titC, players, tactic, Position.C) { onTacticUpdate(tactic.copy(titC = it)) } }

        item {
            Text("Reserves", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
        }

        item { PositionSelector("PG Reserve", tactic.resPG, players, tactic, Position.PG) { onTacticUpdate(tactic.copy(resPG = it)) } }
        item { PositionSelector("SG Reserve", tactic.resSG, players, tactic, Position.SG) { onTacticUpdate(tactic.copy(resSG = it)) } }
        item { PositionSelector("SF Reserve", tactic.resSF, players, tactic, Position.SF) { onTacticUpdate(tactic.copy(resSF = it)) } }
        item { PositionSelector("PF Reserve", tactic.resPF, players, tactic, Position.PF) { onTacticUpdate(tactic.copy(resPF = it)) } }
        item { PositionSelector("C Reserve", tactic.resC, players, tactic, Position.C) { onTacticUpdate(tactic.copy(resC = it)) } }
    }
}

@Composable
fun PositionSelector(
    label: String,
    selectedPlayerId: Int,
    players: List<PlayerEntity>,
    tactic: TacticEntity,
    targetPosition: Position,
    onSelect: (Int) -> Unit
) {
    var showDialog by remember { mutableStateOf(false) }
    val selectedPlayer = players.find { it.id == selectedPlayerId }

    val occupiedIds = remember(tactic) {
        setOf(
            tactic.titPG, tactic.titSG, tactic.titSF, tactic.titPF, tactic.titC,
            tactic.resPG, tactic.resSG, tactic.resSF, tactic.resPF, tactic.resC
        )
    }

    if (showDialog) {
        PlayerSelectionDialog(
            title = "Assign $label",
            players = players,
            occupiedIds = occupiedIds,
            targetPosition = targetPosition,
            onDismiss = { showDialog = false },
            onSelect = { onSelect(it); showDialog = false }
        )
    }

    Column(modifier = Modifier.fillMaxWidth()) {
        Text(label, style = MaterialTheme.typography.labelMedium)
        OutlinedCard(
            onClick = { showDialog = true },
            modifier = Modifier.fillMaxWidth()
        ) {
            Row(
                modifier = Modifier.padding(12.dp).fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(selectedPlayer?.let { "${it.name} (Avg: ${it.getAverageSkillAll().toInt()})" } ?: "Empty",
                     style = if (selectedPlayer == null) MaterialTheme.typography.bodyMedium.copy(color = Color.Gray) else MaterialTheme.typography.bodyMedium)
                Icon(Icons.Default.ArrowDropDown, contentDescription = null)
            }
        }
    }
}

@Composable
fun PlayerSelectionDialog(
    title: String,
    players: List<PlayerEntity>,
    occupiedIds: Set<Int>,
    targetPosition: Position,
    onDismiss: () -> Unit,
    onSelect: (Int) -> Unit
) {
    val grouped = remember(players, targetPosition) {
        val primary = players.filter { it.positionFirst == targetPosition }
        val secondary = players.filter { it.positionSecond == targetPosition }
        val others = players.filter { it.positionFirst != targetPosition && it.positionSecond != targetPosition }
        listOf(
            "Priority Match" to primary.sortedByDescending { it.getAverageSkillAll() },
            "Secondary Match" to secondary.sortedByDescending { it.getAverageSkillAll() },
            "Others" to others.sortedByDescending { it.getAverageSkillAll() }
        ).filter { it.second.isNotEmpty() }
    }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text(title) },
        text = {
            LazyColumn(modifier = Modifier.heightIn(max = 450.dp)) {
                grouped.forEach { (header, list) ->
                    item {
                        Text(header, style = MaterialTheme.typography.labelLarge, color = MaterialTheme.colorScheme.primary, modifier = Modifier.padding(vertical = 8.dp))
                    }
                    items(list) { player ->
                        val isOccupied = occupiedIds.contains(player.id)
                        DropdownMenuItem(
                            modifier = Modifier.background(if (isOccupied) Color.LightGray.copy(alpha = 0.1f) else Color.Transparent),
                            text = {
                                Column {
                                    Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
                                        Text(
                                            text = player.name,
                                            fontWeight = FontWeight.Bold,
                                            color = if (isOccupied) Color.Gray else Color.Unspecified
                                        )
                                        if (isOccupied) Text("(Occupied)", color = Color(0xFFD32F2F), style = MaterialTheme.typography.labelSmall)
                                    }
                                    Text(
                                        text = "Rating: ${player.getAverageSkillAll().toInt()} | Age: ${player.age} | Form: ${player.stateForm} | Energy: ${player.stateEnergy}",
                                        style = MaterialTheme.typography.bodySmall,
                                        color = if (isOccupied) Color.Gray else Color.Unspecified
                                    )
                                }
                            },
                            onClick = { onSelect(player.id) }
                        )
                    }
                }
            }
        },
        confirmButton = { TextButton(onClick = onDismiss) { Text("Cancel") } }
    )
}
