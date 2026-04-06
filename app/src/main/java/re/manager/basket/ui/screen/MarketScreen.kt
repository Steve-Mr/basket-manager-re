package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.ui.viewmodel.MarketViewModel
import re.manager.basket.util.CurrencyUtils
import re.manager.basket.domain.model.Constants
import androidx.compose.runtime.remember
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue

@Composable
fun MarketScreen(
    gameId: Int,
    userTeamId: Int,
    marketViewModel: MarketViewModel,
    userPlayers: List<re.manager.basket.data.entity.PlayerEntity> = emptyList(),
    currentMatchday: Int = 1
) {
    var selectedTab by remember { mutableStateOf(0) } // 0: Free Agency, 1: Trade
    val freeAgents by marketViewModel.freeAgents.collectAsState()
    val teamSalary by marketViewModel.teamSalary.collectAsState()
    val salaryCap by marketViewModel.salaryCap.collectAsState()
    val signingResult by marketViewModel.signingResult.collectAsState()

    LaunchedEffect(gameId, userTeamId) {
        marketViewModel.loadMarketData(gameId, userTeamId)
    }

    Column(modifier = Modifier.fillMaxSize().padding(16.dp)) {
        TabRow(selectedTabIndex = selectedTab) {
            Tab(selected = selectedTab == 0, onClick = { selectedTab = 0 }) {
                Text("Free Agents", modifier = Modifier.padding(16.dp))
            }
            Tab(selected = selectedTab == 1, onClick = { selectedTab = 1 }) {
                Text("Trade", modifier = Modifier.padding(16.dp))
            }
        }

        Spacer(modifier = Modifier.height(8.dp))

        if (selectedTab == 1) {
            if (currentMatchday > 87 && currentMatchday < 226) {
                Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                    Text("Trade deadline has passed (Day 87).", style = MaterialTheme.typography.bodyLarge, color = MaterialTheme.colorScheme.error)
                }
            } else {
                TradeScreen(userTeamId = userTeamId, marketViewModel = marketViewModel, userPlayers = userPlayers)
            }
            return@Column
        }

        Text(text = "Free Agency Market", style = MaterialTheme.typography.headlineMedium)
        Spacer(modifier = Modifier.height(8.dp))

        val salaryText = "${CurrencyUtils.formatCurrency(teamSalary)} / ${CurrencyUtils.formatCurrency(salaryCap)}"
        Text(
            text = "Team Salary: $salaryText",
            style = MaterialTheme.typography.bodySmall,
            color = if (teamSalary > salaryCap) MaterialTheme.colorScheme.error else MaterialTheme.colorScheme.onSurface
        )
        LinearProgressIndicator(
            progress = { (teamSalary.toFloat() / salaryCap).coerceAtMost(1f) },
            modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp),
            color = if (teamSalary > salaryCap) MaterialTheme.colorScheme.error else MaterialTheme.colorScheme.primary
        )

        Spacer(modifier = Modifier.height(16.dp))

        if (signingResult != null) {
            AlertDialog(
                onDismissRequest = { marketViewModel.clearSigningResult() },
                title = { Text("Negotiation Result") },
                text = { Text(signingResult!!) },
                confirmButton = { Button(onClick = { marketViewModel.clearSigningResult() }) { Text("OK") } }
            )
        }

        LazyColumn(
            modifier = Modifier.fillMaxWidth().weight(1f),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(freeAgents) { player ->
                Card(modifier = Modifier.fillMaxWidth()) {
                    Row(
                        modifier = Modifier.padding(16.dp).fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column(modifier = Modifier.weight(1f)) {
                            Text(text = player.name, style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                            Text(text = "Age: ${player.age} - Pos: ${player.positionFirst}")
                            Text(text = "Avg Skill: ${String.format("%.1f", player.getAverageSkillAll())}", color = MaterialTheme.colorScheme.secondary)
                        }
                        Column(horizontalAlignment = Alignment.End) {
                            Text(text = CurrencyUtils.formatCurrency(player.salary), style = MaterialTheme.typography.titleSmall)
                            var showNegotiation by remember { mutableStateOf(false) }
                            if (showNegotiation) {
                                NegotiationDialog(
                                    player = player,
                                    currentCapSpace = salaryCap - teamSalary,
                                    onDismiss = { showNegotiation = false },
                                    onConfirm = { salary, years ->
                                        marketViewModel.signPlayer(player.copy(salary = salary, yearsContract = years), userTeamId)
                                        showNegotiation = false
                                    }
                                )
                            }
                            Button(
                                onClick = { showNegotiation = true },
                                enabled = (teamSalary + player.salary <= salaryCap)
                            ) {
                                Text("Sign")
                            }
                        }
                    }
                }
            }
        }
    }
}
