package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.ui.components.ContractNegotiationDialog
import top.maary.basketmanager.re.ui.components.PlayerDetailBottomSheet
import top.maary.basketmanager.re.ui.components.PositionBadge
import top.maary.basketmanager.re.ui.components.RatingBadge
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.theme.RatingRed
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel
import java.text.NumberFormat
import java.util.Locale

@Composable
fun FinancesScreen(
    viewModel: GameDashboardViewModel
) {
    val userTeam by viewModel.userTeam.collectAsState()
    val roster by viewModel.userRoster.collectAsState()

    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }
    var playerToExtend by remember { mutableStateOf<Player?>(null) }
    var negotiationFeedback by remember { mutableStateOf<Pair<Boolean, String>?>(null) }

    val sortedRoster = remember(roster) { roster.sortedByDescending { it.salary } }
    val totalPayrollY1 = remember(roster) { roster.sumOf { if (it.yearsContract >= 1) it.salary else 0 } }
    val totalPayrollY2 = remember(roster) { roster.sumOf { if (it.yearsContract >= 2) it.salary else 0 } }
    val totalPayrollY3 = remember(roster) { roster.sumOf { if (it.yearsContract >= 3) it.salary else 0 } }
    val totalPayrollY4 = remember(roster) { roster.sumOf { if (it.yearsContract >= 4) it.salary else 0 } }

    val salaryCap = userTeam?.salaryCap ?: 70_000_000
    val capSpace = salaryCap - totalPayrollY1

    fun formatExactSalary(amount: Int): String {
        return "${NumberFormat.getNumberInstance(Locale.US).format(amount)} $"
    }

    fun formatCompactSalary(amount: Int): String {
        return if (amount == 0) "0 $"
        else if (amount >= 1_000_000) "$${String.format(Locale.US, "%.2f", amount / 1_000_000.0)}M"
        else "$${amount / 1_000}K"
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp, vertical = 10.dp)
    ) {
        // Hero Header Card (Team Name, Cap, Payroll, Cap Room)
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
        ) {
            Column(modifier = Modifier.padding(14.dp)) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column {
                        Text(
                            text = userTeam?.name ?: "TEAM",
                            style = MaterialTheme.typography.titleLarge,
                            fontWeight = FontWeight.Black
                        )
                        Text(
                            text = "${userTeam?.conference?.name ?: ""} • ${userTeam?.division?.name ?: ""}",
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }

                    Column(horizontalAlignment = Alignment.End) {
                        Row(horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                            Text("Salary Cap:", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                            Text(
                                text = formatExactSalary(salaryCap),
                                fontSize = 11.sp,
                                fontWeight = FontWeight.Bold,
                                color = Color(0xFF0288D1)
                            )
                        }
                        Row(horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                            Text("Total Payroll:", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                            Text(
                                text = formatExactSalary(totalPayrollY1),
                                fontSize = 11.sp,
                                fontWeight = FontWeight.Bold,
                                color = RatingGreen
                            )
                        }
                        Row(horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                            Text("Cap Space:", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                            Text(
                                text = formatExactSalary(capSpace),
                                fontSize = 11.sp,
                                fontWeight = FontWeight.ExtraBold,
                                color = if (capSpace >= 0) RatingGreen else RatingRed
                            )
                        }
                    }
                }

                Spacer(modifier = Modifier.height(10.dp))

                // Cap Space Progress Bar
                LinearProgressIndicator(
                    progress = { if (salaryCap > 0) (totalPayrollY1.toFloat() / salaryCap.toFloat()).coerceIn(0f, 1f) else 0f },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(8.dp),
                    color = if (capSpace >= 0) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.error,
                    trackColor = MaterialTheme.colorScheme.outlineVariant
                )
            }
        }

        Spacer(modifier = Modifier.height(12.dp))

        // Multi-Year Future Salary Ledger Table Header
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "Future Salary Obligations (4-Year Outlook)",
                style = MaterialTheme.typography.titleSmall,
                fontWeight = FontWeight.Bold
            )
            Text(
                text = "Tap row to Negotiate / View",
                fontSize = 11.sp,
                color = MaterialTheme.colorScheme.primary
            )
        }

        Spacer(modifier = Modifier.height(8.dp))

        // Multi-Year Scrollable Table
        Card(
            modifier = Modifier.fillMaxSize(),
            shape = RoundedCornerShape(10.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
        ) {
            Column(modifier = Modifier.fillMaxSize()) {
                val horizontalScrollState = rememberScrollState()

                // Table Header Bar (Cyan / Blue Accent Strip)
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .background(Color(0xFF0288D1))
                        .padding(horizontal = 8.dp, vertical = 6.dp)
                        .horizontalScroll(horizontalScrollState),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Player",
                        fontSize = 12.sp,
                        fontWeight = FontWeight.Bold,
                        color = Color.White,
                        modifier = Modifier.width(130.dp)
                    )
                    Text(
                        text = "Year 1 (Current)",
                        fontSize = 12.sp,
                        fontWeight = FontWeight.Bold,
                        color = Color.White,
                        textAlign = TextAlign.End,
                        modifier = Modifier.width(115.dp)
                    )
                    Text(
                        text = "Year 2 (Next)",
                        fontSize = 12.sp,
                        fontWeight = FontWeight.Bold,
                        color = Color.White,
                        textAlign = TextAlign.End,
                        modifier = Modifier.width(115.dp)
                    )
                    Text(
                        text = "Year 3 (Y+2)",
                        fontSize = 12.sp,
                        fontWeight = FontWeight.Bold,
                        color = Color.White,
                        textAlign = TextAlign.End,
                        modifier = Modifier.width(115.dp)
                    )
                    Text(
                        text = "Year 4 (Y+3)",
                        fontSize = 12.sp,
                        fontWeight = FontWeight.Bold,
                        color = Color.White,
                        textAlign = TextAlign.End,
                        modifier = Modifier.width(115.dp)
                    )
                }

                // Table Rows (Zebra Striped)
                LazyColumn(
                    modifier = Modifier
                        .weight(1f)
                        .fillMaxWidth()
                ) {
                    itemsIndexed(sortedRoster) { index, player ->
                        val isExpiring = player.yearsContract <= 1
                        val rowBg = if (index % 2 == 0) MaterialTheme.colorScheme.surface else MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f)

                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .background(rowBg)
                                .clickable {
                                    if (isExpiring) {
                                        playerToExtend = player
                                    } else {
                                        selectedPlayerForDetail = player
                                    }
                                }
                                .padding(horizontal = 8.dp, vertical = 6.dp)
                                .horizontalScroll(horizontalScrollState),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            // Player Column
                            Row(
                                modifier = Modifier.width(130.dp),
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(4.dp)
                            ) {
                                RatingBadge(rating = player.overallRating)
                                Column {
                                    Text(
                                        text = player.shortName,
                                        fontSize = 12.sp,
                                        fontWeight = FontWeight.Bold,
                                        maxLines = 1
                                    )
                                    Row(horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                                        Text(
                                            text = player.positionFirst.shortName,
                                            fontSize = 10.sp,
                                            color = MaterialTheme.colorScheme.primary,
                                            fontWeight = FontWeight.SemiBold
                                        )
                                        if (isExpiring) {
                                            Text(
                                                text = "• Expiring",
                                                fontSize = 10.sp,
                                                color = MaterialTheme.colorScheme.error,
                                                fontWeight = FontWeight.Bold
                                            )
                                        }
                                    }
                                }
                            }

                            // Year 1 Column
                            Text(
                                text = formatExactSalary(if (player.yearsContract >= 1) player.salary else 0),
                                fontSize = 11.sp,
                                fontWeight = FontWeight.SemiBold,
                                textAlign = TextAlign.End,
                                color = if (player.yearsContract >= 1) MaterialTheme.colorScheme.onSurface else MaterialTheme.colorScheme.outline,
                                modifier = Modifier.width(115.dp)
                            )

                            // Year 2 Column
                            Text(
                                text = formatExactSalary(if (player.yearsContract >= 2) player.salary else 0),
                                fontSize = 11.sp,
                                fontWeight = FontWeight.SemiBold,
                                textAlign = TextAlign.End,
                                color = if (player.yearsContract >= 2) MaterialTheme.colorScheme.onSurface else MaterialTheme.colorScheme.outline.copy(alpha = 0.5f),
                                modifier = Modifier.width(115.dp)
                            )

                            // Year 3 Column
                            Text(
                                text = formatExactSalary(if (player.yearsContract >= 3) player.salary else 0),
                                fontSize = 11.sp,
                                fontWeight = FontWeight.SemiBold,
                                textAlign = TextAlign.End,
                                color = if (player.yearsContract >= 3) MaterialTheme.colorScheme.onSurface else MaterialTheme.colorScheme.outline.copy(alpha = 0.5f),
                                modifier = Modifier.width(115.dp)
                            )

                            // Year 4 Column
                            Text(
                                text = formatExactSalary(if (player.yearsContract >= 4) player.salary else 0),
                                fontSize = 11.sp,
                                fontWeight = FontWeight.SemiBold,
                                textAlign = TextAlign.End,
                                color = if (player.yearsContract >= 4) MaterialTheme.colorScheme.onSurface else MaterialTheme.colorScheme.outline.copy(alpha = 0.5f),
                                modifier = Modifier.width(115.dp)
                            )
                        }
                    }
                }

                // Total Summary Footer Row (Green / Accent Bar like original BM15)
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .background(Color(0xFF2E7D32))
                        .padding(horizontal = 8.dp, vertical = 8.dp)
                        .horizontalScroll(horizontalScrollState),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Total Payroll",
                        fontSize = 12.sp,
                        fontWeight = FontWeight.ExtraBold,
                        color = Color.White,
                        modifier = Modifier.width(130.dp)
                    )
                    Text(
                        text = formatExactSalary(totalPayrollY1),
                        fontSize = 11.sp,
                        fontWeight = FontWeight.ExtraBold,
                        color = Color.White,
                        textAlign = TextAlign.End,
                        modifier = Modifier.width(115.dp)
                    )
                    Text(
                        text = formatExactSalary(totalPayrollY2),
                        fontSize = 11.sp,
                        fontWeight = FontWeight.ExtraBold,
                        color = Color.White,
                        textAlign = TextAlign.End,
                        modifier = Modifier.width(115.dp)
                    )
                    Text(
                        text = formatExactSalary(totalPayrollY3),
                        fontSize = 11.sp,
                        fontWeight = FontWeight.ExtraBold,
                        color = Color.White,
                        textAlign = TextAlign.End,
                        modifier = Modifier.width(115.dp)
                    )
                    Text(
                        text = formatExactSalary(totalPayrollY4),
                        fontSize = 11.sp,
                        fontWeight = FontWeight.ExtraBold,
                        color = Color.White,
                        textAlign = TextAlign.End,
                        modifier = Modifier.width(115.dp)
                    )
                }
            }
        }
    }

    // Contract Negotiation Dialog with Live Acceptance Meter & 5 Quick Presets
    playerToExtend?.let { player ->
        ContractNegotiationDialog(
            player = player,
            isHomeTeamRenewal = true,
            onDismiss = { playerToExtend = null },
            onConfirmOffer = { years: Int, salary: Int, accepted: Boolean, feedbackMsg: String ->
                if (accepted) {
                    val totalYears = player.yearsContract + years
                    viewModel.extendContract(player.id, totalYears, salary) {
                        playerToExtend = null
                        negotiationFeedback = Pair(true, feedbackMsg)
                    }
                } else {
                    playerToExtend = null
                    negotiationFeedback = Pair(false, feedbackMsg)
                }
            }
        )
    }

    // Negotiation Result Feedback Dialog
    negotiationFeedback?.let { (accepted, msg) ->
        AlertDialog(
            onDismissRequest = { negotiationFeedback = null },
            title = { Text(if (accepted) "Offer Accepted! ✅" else "Offer Rejected ❌") },
            text = { Text(msg) },
            confirmButton = {
                Button(onClick = { negotiationFeedback = null }) {
                    Text("OK")
                }
            }
        )
    }

    // Player Detail Modal
    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(
            player = player,
            stats = viewModel.getPlayerSeasonStats(player.id),
            playoffStats = viewModel.getPlayerPlayoffStats(player.id),
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}
