package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.PersonAdd
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import top.maary.basketmanager.re.domain.engine.ContractEngine
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Position
import top.maary.basketmanager.re.ui.components.ContractNegotiationDialog
import top.maary.basketmanager.re.ui.components.PlayerDetailBottomSheet
import top.maary.basketmanager.re.ui.components.PositionBadge
import top.maary.basketmanager.re.ui.components.RatingBadge
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun FreeAgencyScreen(
    viewModel: GameDashboardViewModel
) {
    val freeAgents by viewModel.freeAgents.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()
    val roster by viewModel.userRoster.collectAsState()

    var positionFilter by remember { mutableStateOf<Position?>(null) }
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }
    var negotiatingPlayer by remember { mutableStateOf<Player?>(null) }
    var negotiationFeedback by remember { mutableStateOf<Pair<Boolean, String>?>(null) }

    val filteredList = remember(freeAgents, positionFilter) {
        if (positionFilter == null) freeAgents
        else freeAgents.filter { it.positionFirst == positionFilter || it.positionSecond == positionFilter }
    }

    val totalSalary = remember(roster) { roster.filter { it.yearsContract > 0 }.sumOf { it.salary } }
    val capRemaining = (userTeam?.salaryCap ?: 70_000_000) - totalSalary

    fun formatMoney(amount: Int): String {
        return if (amount >= 1_000_000) "$${String.format("%.2f", amount / 1_000_000.0)}M" else "$${amount / 1_000}K"
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp, vertical = 10.dp)
    ) {
        Text(
            text = "Free Agency Market",
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = "Sign available free agents to complete your roster. Cap Room: ${formatMoney(capRemaining)} (Min Exception: < $1.0M)",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        Spacer(modifier = Modifier.height(12.dp))

        // Position Filter Chips
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .horizontalScroll(rememberScrollState()),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            FilterChip(
                selected = positionFilter == null,
                onClick = { positionFilter = null },
                label = { Text("All (${freeAgents.size})") }
            )
            listOf(Position.POINT_GUARD, Position.SHOOTING_GUARD, Position.SMALL_FORWARD, Position.POWER_FORWARD, Position.CENTER).forEach { pos ->
                FilterChip(
                    selected = positionFilter == pos,
                    onClick = { positionFilter = if (positionFilter == pos) null else pos },
                    label = { Text(pos.shortName) }
                )
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        if (filteredList.isEmpty()) {
            Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                Text(
                    text = "No free agents available.",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        } else {
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                verticalArrangement = Arrangement.spacedBy(8.dp),
                contentPadding = PaddingValues(bottom = 16.dp)
            ) {
                items(filteredList) { player ->
                    val (_, marketDemand) = remember(player.id) {
                        ContractEngine.calculateMarketDemandSalary(player, isHomeTeamRenewal = false)
                    }

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
                                .padding(12.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(10.dp),
                                modifier = Modifier.weight(1f)
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
                                            text = "Age: ${player.age} • Demands: ${formatMoney(marketDemand)}/yr",
                                            fontSize = 11.sp,
                                            color = MaterialTheme.colorScheme.onSurfaceVariant
                                        )
                                    }
                                }
                            }

                            Button(
                                onClick = { negotiatingPlayer = player },
                                shape = RoundedCornerShape(8.dp),
                                contentPadding = PaddingValues(horizontal = 10.dp, vertical = 6.dp)
                            ) {
                                Icon(Icons.Default.PersonAdd, contentDescription = null, modifier = Modifier.size(16.dp))
                                Spacer(modifier = Modifier.width(4.dp))
                                Text("Sign", fontSize = 12.sp)
                            }
                        }
                    }
                }
            }
        }
    }

    // Dynamic Negotiation Modal Dialog (Interactive Offer Tiers & Slider)
    negotiatingPlayer?.let { player ->
        ContractNegotiationDialog(
            player = player,
            isHomeTeamRenewal = false,
            capAvailable = capRemaining,
            onDismiss = { negotiatingPlayer = null },
            onConfirmOffer = { years: Int, salary: Int, accepted: Boolean, feedbackMsg: String ->
                negotiatingPlayer = null
                if (accepted) {
                    val isMinContract = salary < 1_000_000
                    if (salary > capRemaining && !isMinContract) {
                        negotiationFeedback = Pair(
                            false,
                            "${player.name} accepted your offer, but the contract could not be finalized because your team is over the salary cap (${formatMoney(capRemaining)} available) and the salary exceeds the $1.0M Minimum Contract Exception."
                        )
                    } else {
                        viewModel.signFreeAgent(player.id, salary, years) { success ->
                            if (success) {
                                negotiationFeedback = Pair(
                                    true,
                                    "Successfully signed Free Agent ${player.name} to a $years-year, ${formatMoney(salary)}/yr contract!"
                                )
                            } else {
                                negotiationFeedback = Pair(
                                    false,
                                    "Signing failed: Roster size exceeds maximum limit of 20 players."
                                )
                            }
                        }
                    }
                } else {
                    negotiationFeedback = Pair(false, feedbackMsg)
                }
            }
        )
    }

    // Feedback Notice Dialog
    negotiationFeedback?.let { (accepted, msg) ->
        AlertDialog(
            onDismissRequest = { negotiationFeedback = null },
            title = { Text(if (accepted) "Signing Successful! ✅" else "Negotiation Failed ❌") },
            text = { Text(msg) },
            confirmButton = {
                Button(onClick = { negotiationFeedback = null }) {
                    Text("OK")
                }
            }
        )
    }

    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(
            player = player,
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}

@Composable
fun DraftScreen(
    viewModel: GameDashboardViewModel
) {
    LiveDraftCeremonyScreen(viewModel = viewModel)
}
