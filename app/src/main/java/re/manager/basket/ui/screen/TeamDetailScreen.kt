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
    tactic: re.manager.basket.data.entity.TacticEntity? = null,
    onPlayerClick: (Int) -> Unit,
    onStatsClick: () -> Unit = {},
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
                Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween, verticalAlignment = androidx.compose.ui.Alignment.CenterVertically) {
                    Text("Team Info", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
                    Button(onClick = onStatsClick) {
                        Text("Season Stats")
                    }
                }
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

            val grouped = if (tactic == null) mapOf("Roster" to players) else {
                val map = mutableMapOf<String, List<PlayerEntity>>()
                map["Point Guard (PG)"] = players.filter { it.id == tactic.titPG || it.id == tactic.resPG }
                map["Shooting Guard (SG)"] = players.filter { it.id == tactic.titSG || it.id == tactic.resSG }
                map["Small Forward (SF)"] = players.filter { it.id == tactic.titSF || it.id == tactic.resSF }
                map["Power Forward (PF)"] = players.filter { it.id == tactic.titPF || it.id == tactic.resPF }
                map["Center (C)"] = players.filter { it.id == tactic.titC || it.id == tactic.resC }
                val assigned = setOf(tactic.titPG, tactic.titSG, tactic.titSF, tactic.titPF, tactic.titC, tactic.resPG, tactic.resSG, tactic.resSF, tactic.resPF, tactic.resC)
                val remains = players.filter { it.id !in assigned }
                if (remains.isNotEmpty()) map["Others"] = remains
                map
            }

            grouped.forEach { (groupName, groupList) ->
                item {
                    Text(groupName, style = MaterialTheme.typography.titleMedium, color = MaterialTheme.colorScheme.primary)
                }
                items(groupList) { player ->
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        onClick = { onPlayerClick(player.id) }
                    ) {
                        Row(
                            modifier = Modifier.fillMaxWidth().padding(16.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                        ) {
                            Column {
                                Text(player.name, fontWeight = FontWeight.Bold)
                                val role = when (player.id) {
                                    tactic?.titPG, tactic?.titSG, tactic?.titSF, tactic?.titPF, tactic?.titC -> "Starter"
                                    tactic?.resPG, tactic?.resSG, tactic?.resSF, tactic?.resPF, tactic?.resC -> "Reserve"
                                    else -> player.positionFirst.toString()
                                }
                                Text("$role | Age: ${player.age}", style = MaterialTheme.typography.bodySmall)
                            }
                            Text("Avg: ${player.getAverageSkillAll().toInt()}", color = MaterialTheme.colorScheme.primary)
                        }
                    }
                }
            }
        }
    }
}
