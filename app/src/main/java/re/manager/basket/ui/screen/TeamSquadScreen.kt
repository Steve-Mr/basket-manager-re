package re.manager.basket.ui.screen

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.runtime.remember
import androidx.compose.ui.graphics.Color
import re.manager.basket.BasketApplication
import re.manager.basket.ui.viewmodel.PlayerListViewModel
import re.manager.basket.ui.viewmodel.PlayerUiState

@Composable
fun TeamSquadScreen(viewModel: PlayerListViewModel) {
    val players by viewModel.players.collectAsState()
    TeamSquadContent(players, onPlayerClick = { /* Navigate to player detail */ })
}

@Composable
fun TeamSquadContent(
    players: List<PlayerUiState>,
    tactic: re.manager.basket.data.entity.TacticEntity? = null,
    onPlayerClick: (Int) -> Unit = {}
) {
    val groupedPlayers = remember(players, tactic) {
        if (tactic == null) {
            listOf("All Players" to players)
        } else {
            val starterIds = listOf(tactic.titPG, tactic.titSG, tactic.titSF, tactic.titPF, tactic.titC)
            val reserveIds = listOf(tactic.resPG, tactic.resSG, tactic.resSF, tactic.resPF, tactic.resC)

            val starters = starterIds.mapNotNull { id -> players.find { it.id == id } }
            val reserves = reserveIds.mapNotNull { id -> players.find { it.id == id } }

            val assignedIds = (starterIds + reserveIds).toSet()
            val inactive = players.filter { it.id !in assignedIds }

            listOf(
                "Starters (1-5)" to starters,
                "Reserves (1-5)" to reserves,
                "Inactive" to inactive
            ).filter { it.second.isNotEmpty() }
        }
    }

    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        item {
            Text(
                text = "Team Squad",
                style = MaterialTheme.typography.headlineMedium,
                modifier = Modifier.padding(bottom = 16.dp)
            )
        }

        groupedPlayers.forEach { (groupName, groupList) ->
            item {
                Text(
                    text = groupName,
                    style = MaterialTheme.typography.titleMedium,
                    color = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.padding(vertical = 8.dp)
                )
            }
            items(groupList) { player ->
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { onPlayerClick(player.id) },
                    elevation = CardDefaults.cardElevation(defaultElevation = 2.dp),
                    colors = if (player.hasContract) CardDefaults.cardColors() else CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                ) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text(
                                text = player.name,
                                style = MaterialTheme.typography.titleLarge,
                                fontWeight = FontWeight.Bold
                            )
                            val roleText = when {
                                tactic?.titPG == player.id || tactic?.titSG == player.id || tactic?.titSF == player.id || tactic?.titPF == player.id || tactic?.titC == player.id -> "Starter"
                                tactic?.resPG == player.id || tactic?.resSG == player.id || tactic?.resSF == player.id || tactic?.resPF == player.id || tactic?.resC == player.id -> "Reserve"
                                else -> "List"
                            }
                            Text(
                                text = roleText,
                                color = when(roleText) {
                                    "Starter" -> MaterialTheme.colorScheme.primary
                                    "Reserve" -> Color(0xFF4CAF50)
                                    else -> MaterialTheme.colorScheme.secondary
                                },
                                fontWeight = FontWeight.Bold
                            )
                        }
                        Spacer(modifier = Modifier.height(8.dp))
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                        ) {
                            Text(text = "Age: ${player.age}")
                            Row(verticalAlignment = androidx.compose.ui.Alignment.CenterVertically) {
                                Text(text = "Avg: ${player.avgSkill} ")
                                val context = androidx.compose.ui.platform.LocalContext.current
                                val resId = context.resources.getIdentifier(player.starIcon, "drawable", context.packageName)
                                if (resId != 0) {
                                    Icon(
                                        painter = painterResource(id = resId),
                                        contentDescription = null,
                                        modifier = Modifier.size(16.dp),
                                        tint = androidx.compose.ui.graphics.Color.Unspecified
                                    )
                                }
                            }
                        }
                        Spacer(modifier = Modifier.height(4.dp))
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(16.dp)
                        ) {
                            Text(text = "Form: ${player.form}", style = MaterialTheme.typography.bodySmall)
                            Text(text = "Energy: ${player.energy}", style = MaterialTheme.typography.bodySmall)
                        }
                    }
                }
            }
        }
    }
}
