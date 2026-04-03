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
import androidx.compose.foundation.background
import androidx.compose.ui.graphics.Color

@Composable
fun TeamFinancesScreen(
    team: TeamEntity,
    players: List<PlayerEntity>
) {
    val totalYear1 = players.sumOf { it.salary }
    val totalYear2 = players.filter { it.yearsContract > 1 }.sumOf { it.salary }
    val totalYear3 = players.filter { it.yearsContract > 2 }.sumOf { it.salary }
    val totalYear4 = players.filter { it.yearsContract > 3 }.sumOf { it.salary }

    LazyColumn(
        modifier = Modifier.fillMaxSize().padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        item {
            Text("Team Finances", style = MaterialTheme.typography.headlineMedium)
            Text("4-Year Salary Projection", style = MaterialTheme.typography.bodyMedium)
        }

        item {
            Card(modifier = Modifier.fillMaxWidth()) {
                Column(modifier = Modifier.padding(16.dp)) {
                    FinanceRow("Salary Cap", CurrencyUtils.formatCurrency(team.salaryCap), isBold = true)
                    HorizontalDivider(modifier = Modifier.padding(vertical = 8.dp))

                    ProjectionRow("Current (Y1)", totalYear1, team.salaryCap)
                    ProjectionRow("Next Year (Y2)", totalYear2, team.salaryCap)
                    ProjectionRow("Year 3 (Y3)", totalYear3, team.salaryCap)
                    ProjectionRow("Year 4 (Y4)", totalYear4, team.salaryCap)
                }
            }
        }

        item {
            Text("Player Contract Details", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
        }

        items(players.sortedByDescending { it.salary }) { player ->
            Card(modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp)) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
                        Text(player.name, fontWeight = FontWeight.Bold)
                        Text(CurrencyUtils.formatCurrency(player.salary), color = MaterialTheme.colorScheme.primary)
                    }
                    Spacer(modifier = Modifier.height(8.dp))
                    Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                        for (i in 1..4) {
                            val active = player.yearsContract >= i
                            Box(
                                modifier = Modifier
                                    .weight(1f)
                                    .height(24.dp)
                                    .background(
                                        color = if (active) MaterialTheme.colorScheme.primary
                                                else MaterialTheme.colorScheme.surfaceVariant,
                                        shape = androidx.compose.foundation.shape.RoundedCornerShape(4.dp)
                                    ),
                                contentAlignment = androidx.compose.ui.Alignment.Center
                            ) {
                                Text("Y$i", style = MaterialTheme.typography.labelSmall, color = if (active) Color.White else Color.Gray)
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun ProjectionRow(label: String, amount: Int, cap: Int) {
    val overCap = amount > cap
    Row(
        modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(label)
        Text(
            CurrencyUtils.formatCurrency(amount),
            color = if (overCap) MaterialTheme.colorScheme.error else MaterialTheme.colorScheme.onSurface,
            fontWeight = if (overCap) FontWeight.Bold else FontWeight.Normal
        )
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
