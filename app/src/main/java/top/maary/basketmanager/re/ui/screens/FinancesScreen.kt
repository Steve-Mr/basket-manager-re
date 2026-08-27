package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.ui.components.PlayerDetailBottomSheet
import top.maary.basketmanager.re.ui.components.PositionBadge
import top.maary.basketmanager.re.ui.components.RatingBadge
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@Composable
fun FinancesScreen(
    viewModel: GameDashboardViewModel
) {
    val userTeam by viewModel.userTeam.collectAsState()
    val roster by viewModel.userRoster.collectAsState()

    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }
    var playerToExtend by remember { mutableStateOf<Player?>(null) }
    var extensionYears by remember { mutableIntStateOf(2) }

    val totalPayroll = remember(roster) { roster.sumOf { it.salary } }
    val salaryCap = userTeam?.salaryCap ?: 70_000_000
    val capSpace = salaryCap - totalPayroll

    fun formatMoney(amount: Int): String {
        return if (amount >= 1_000_000 || amount <= -1_000_000) {
            "$${amount / 1_000_000}M"
        } else {
            "$${amount / 1_000}K"
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp, vertical = 10.dp)
    ) {
        Text(
            text = "Franchise Finances",
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = "Payroll management, luxury tax threshold, and contract books",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        Spacer(modifier = Modifier.height(16.dp))

        // Financial Overview Cards
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Card(
                modifier = Modifier.weight(1f),
                shape = RoundedCornerShape(12.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
            ) {
                Column(modifier = Modifier.padding(12.dp)) {
                    Text("Total Payroll", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    Text(
                        text = formatMoney(totalPayroll),
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.ExtraBold,
                        color = MaterialTheme.colorScheme.primary
                    )
                }
            }

            Card(
                modifier = Modifier.weight(1f),
                shape = RoundedCornerShape(12.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
            ) {
                Column(modifier = Modifier.padding(12.dp)) {
                    Text("Salary Cap", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    Text(
                        text = formatMoney(salaryCap),
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.ExtraBold
                    )
                }
            }

            Card(
                modifier = Modifier.weight(1f),
                shape = RoundedCornerShape(12.dp),
                colors = CardDefaults.cardColors(
                    containerColor = if (capSpace >= 0) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.errorContainer
                )
            ) {
                Column(modifier = Modifier.padding(12.dp)) {
                    Text("Cap Room", fontSize = 11.sp)
                    Text(
                        text = formatMoney(capSpace),
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.ExtraBold
                    )
                }
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        // Salary Cap Progress
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Text("Cap Space Utilization", fontWeight = FontWeight.Bold, fontSize = 13.sp)
                    val pct = if (salaryCap > 0) (totalPayroll.toFloat() / salaryCap.toFloat()) * 100 else 0f
                    Text("${pct.toInt()}%", fontWeight = FontWeight.Bold, fontSize = 13.sp)
                }
                Spacer(modifier = Modifier.height(8.dp))
                LinearProgressIndicator(
                    progress = { (totalPayroll.toFloat() / salaryCap.toFloat()).coerceIn(0f, 1f) },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(10.dp),
                    color = if (capSpace >= 0) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.error
                )
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        Text(
            text = "Player Contracts (Sorted by Salary)",
            style = MaterialTheme.typography.titleMedium,
            fontWeight = FontWeight.Bold
        )

        Spacer(modifier = Modifier.height(8.dp))

        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(roster.sortedByDescending { it.salary }) { player ->
                val isExpiring = player.yearsContract <= 1

                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { selectedPlayerForDetail = player },
                    shape = RoundedCornerShape(10.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 12.dp, vertical = 8.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(10.dp)
                        ) {
                            RatingBadge(rating = player.overallRating)
                            Column {
                                Text(text = player.name, fontWeight = FontWeight.Bold)
                                Row(
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                                ) {
                                    PositionBadge(position = player.positionFirst)
                                    Text(
                                        text = "${player.yearsContract} yr(s) left",
                                        fontSize = 11.sp,
                                        color = if (isExpiring) MaterialTheme.colorScheme.error else MaterialTheme.colorScheme.onSurfaceVariant,
                                        fontWeight = if (isExpiring) FontWeight.Bold else FontWeight.Normal
                                    )
                                }
                            }
                        }

                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Text(
                                text = "${formatMoney(player.salary)}/yr",
                                fontWeight = FontWeight.ExtraBold,
                                color = MaterialTheme.colorScheme.primary
                            )

                            if (isExpiring) {
                                Button(
                                    onClick = {
                                        playerToExtend = player
                                        extensionYears = 2
                                    },
                                    shape = RoundedCornerShape(6.dp),
                                    contentPadding = PaddingValues(horizontal = 8.dp, vertical = 4.dp)
                                ) {
                                    Text("Extend", fontSize = 11.sp)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Contract Extension Dialog
    playerToExtend?.let { player ->
        val extensionSalary = ((player.salary * 1.05).toInt()).coerceAtLeast(1_000_000)

        AlertDialog(
            onDismissRequest = { playerToExtend = null },
            title = { Text("Extend Contract: ${player.name}") },
            text = {
                Column(verticalArrangement = Arrangement.spacedBy(10.dp)) {
                    Text("Current Contract: ${player.yearsContract} year(s) left @ ${formatMoney(player.salary)}/yr")
                    Text("Offered Extension: ${formatMoney(extensionSalary)} / year", fontWeight = FontWeight.Bold)

                    Text("Contract Duration:", fontSize = 12.sp)
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        (1..3).forEach { y ->
                            FilterChip(
                                selected = extensionYears == y,
                                onClick = { extensionYears = y },
                                label = { Text("$y Years") }
                            )
                        }
                    }
                }
            },
            confirmButton = {
                Button(
                    onClick = {
                        val totalYears = player.yearsContract + extensionYears
                        viewModel.extendContract(player.id, totalYears, extensionSalary) {
                            playerToExtend = null
                        }
                    }
                ) {
                    Text("Confirm Extension")
                }
            },
            dismissButton = {
                TextButton(onClick = { playerToExtend = null }) {
                    Text("Cancel")
                }
            }
        )
    }

    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(
            player = player,
            stats = viewModel.getPlayerSeasonStats(player.id),
            playoffStats = viewModel.getPlayerPlayoffStats(player.id),
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}
