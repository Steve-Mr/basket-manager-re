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

@Composable
fun MarketScreen(
    gameId: Int,
    userTeamId: Int,
    marketViewModel: MarketViewModel
) {
    val freeAgents by marketViewModel.freeAgents.collectAsState()
    val teamSalary by marketViewModel.teamSalary.collectAsState()
    val salaryCap = Constants.SALARY_CAP_MED // Centralized default

    LaunchedEffect(gameId, userTeamId) {
        marketViewModel.loadMarketData(gameId, userTeamId)
    }

    Column(modifier = Modifier.fillMaxSize().padding(16.dp)) {
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
                            Button(
                                onClick = { marketViewModel.signPlayer(player, userTeamId) },
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
