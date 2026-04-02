package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TeamEntity
import re.manager.basket.util.CurrencyUtils

@Composable
fun TeamFinancesScreen(
    team: TeamEntity,
    players: List<PlayerEntity>
) {
    val totalSalary = players.sumOf { it.salary }
    val remainingCap = team.salaryCap - totalSalary

    LazyColumn(
        modifier = Modifier.fillMaxSize().padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        item {
            Text("Team Finances", style = MaterialTheme.typography.headlineMedium)
        }

        item {
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = if (remainingCap >= 0) MaterialTheme.colorScheme.primaryContainer
                                     else MaterialTheme.colorScheme.errorContainer
                )
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    FinanceRow("Salary Cap", CurrencyUtils.formatCurrency(team.salaryCap))
                    FinanceRow("Total Salaries", CurrencyUtils.formatCurrency(totalSalary))
                    Divider(modifier = Modifier.padding(vertical = 8.dp))
                    FinanceRow(
                        if (remainingCap >= 0) "Cap Space" else "Over Cap",
                        CurrencyUtils.formatCurrency(remainingCap),
                        isBold = true
                    )
                }
            }
        }

        item {
            Text("Player Salaries", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
        }

        items(players.sortedByDescending { it.salary }) { player ->
            Card(modifier = Modifier.fillMaxWidth()) {
                Row(
                    modifier = Modifier.fillMaxWidth().padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Column {
                        Text(player.name, fontWeight = FontWeight.Bold)
                        Text("Years: ${player.yearsContract}", style = MaterialTheme.typography.bodySmall)
                    }
                    Text(CurrencyUtils.formatCurrency(player.salary), color = MaterialTheme.colorScheme.primary)
                }
            }
        }
    }
}

@Composable
fun FinanceRow(label: String, value: String, isBold: Boolean = false) {
    Row(
        modifier = Modifier.fillMaxWidth().padding(vertical = 2.dp),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(label, fontWeight = if (isBold) FontWeight.Bold else FontWeight.Normal)
        Text(value, fontWeight = if (isBold) FontWeight.Bold else FontWeight.Normal)
    }
}
