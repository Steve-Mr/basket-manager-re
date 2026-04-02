package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
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
    fun getSortedPlayersFor(pos: Position): List<PlayerEntity> {
        return players.sortedWith(compareByDescending<PlayerEntity> {
            it.positionFirst == pos
        }.thenByDescending {
            it.positionSecond == pos
        }.thenByDescending {
            it.getAverageSkillAll()
        })
    }

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

        item { PositionSelector("Point Guard (PG)", tactic.titPG, getSortedPlayersFor(Position.PG)) { onTacticUpdate(tactic.copy(titPG = it)) } }
        item { PositionSelector("Shooting Guard (SG)", tactic.titSG, getSortedPlayersFor(Position.SG)) { onTacticUpdate(tactic.copy(titSG = it)) } }
        item { PositionSelector("Small Forward (SF)", tactic.titSF, getSortedPlayersFor(Position.SF)) { onTacticUpdate(tactic.copy(titSF = it)) } }
        item { PositionSelector("Power Forward (PF)", tactic.titPF, getSortedPlayersFor(Position.PF)) { onTacticUpdate(tactic.copy(titPF = it)) } }
        item { PositionSelector("Center (C)", tactic.titC, getSortedPlayersFor(Position.C)) { onTacticUpdate(tactic.copy(titC = it)) } }

        item {
            Text("Reserves", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
        }

        item { PositionSelector("PG Reserve", tactic.resPG, getSortedPlayersFor(Position.PG)) { onTacticUpdate(tactic.copy(resPG = it)) } }
        item { PositionSelector("SG Reserve", tactic.resSG, getSortedPlayersFor(Position.SG)) { onTacticUpdate(tactic.copy(resSG = it)) } }
        item { PositionSelector("SF Reserve", tactic.resSF, getSortedPlayersFor(Position.SF)) { onTacticUpdate(tactic.copy(resSF = it)) } }
        item { PositionSelector("PF Reserve", tactic.resPF, getSortedPlayersFor(Position.PF)) { onTacticUpdate(tactic.copy(resPF = it)) } }
        item { PositionSelector("C Reserve", tactic.resC, getSortedPlayersFor(Position.C)) { onTacticUpdate(tactic.copy(resC = it)) } }
    }
}

@Composable
fun PositionSelector(
    label: String,
    selectedPlayerId: Int,
    players: List<PlayerEntity>,
    onSelect: (Int) -> Unit
) {
    var expanded by remember { mutableStateOf(false) }
    val selectedPlayer = players.find { it.id == selectedPlayerId }

    Column(modifier = Modifier.fillMaxWidth()) {
        Text(label, style = MaterialTheme.typography.labelMedium)
        Box {
            OutlinedButton(
                onClick = { expanded = true },
                modifier = Modifier.fillMaxWidth(),
                shape = MaterialTheme.shapes.small
            ) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(selectedPlayer?.let { "${it.name} (Avg: ${it.getAverageSkillAll().toInt()})" } ?: "Select Player")
                    Icon(Icons.Default.ArrowDropDown, contentDescription = null)
                }
            }
            DropdownMenu(
                expanded = expanded,
                onDismissRequest = { expanded = false },
                modifier = Modifier.fillMaxWidth(0.9f)
            ) {
                players.forEach { player ->
                    DropdownMenuItem(
                        text = {
                            Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
                                Text(player.name)
                                Text("Avg: ${player.getAverageSkillAll().toInt()}", style = MaterialTheme.typography.bodySmall)
                            }
                        },
                        onClick = {
                            onSelect(player.id)
                            expanded = false
                        }
                    )
                }
            }
        }
    }
}
