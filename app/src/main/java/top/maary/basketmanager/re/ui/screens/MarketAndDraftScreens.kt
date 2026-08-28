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
import androidx.compose.material.icons.filled.Info
import androidx.compose.foundation.lazy.itemsIndexed
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
            stats = viewModel.getPlayerSeasonStats(player.id),
            playoffStats = viewModel.getPlayerPlayoffStats(player.id),
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}

@Composable
fun DraftScreen(
    viewModel: GameDashboardViewModel
) {
    val game by viewModel.game.collectAsState()
    val draftProspects by viewModel.draftProspects.collectAsState()
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }
    var selectedPositionFilter by remember { mutableStateOf<Position?>(null) }

    LaunchedEffect(game?.id) {
        viewModel.getDraftProspects { /* Loaded */ }
    }

    val filteredProspects = remember(draftProspects, selectedPositionFilter) {
        if (selectedPositionFilter == null) draftProspects
        else draftProspects.filter { it.positionFirst == selectedPositionFilter || it.positionSecond == selectedPositionFilter }
    }

    val currentSeason = game?.currentSeason ?: 1

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 14.dp, vertical = 8.dp)
    ) {
        // TOP SCOUTING HEADER
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
        ) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(14.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = "Rookie Class Scouting Board",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.ExtraBold
                    )
                    Text(
                        text = "Season $currentSeason Draft Class • Ceremony will take place on Offseason Day 230.",
                        fontSize = 11.sp,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }

                Surface(
                    shape = RoundedCornerShape(6.dp),
                    color = MaterialTheme.colorScheme.primaryContainer
                ) {
                    Text(
                        text = "SCOUTING (${draftProspects.size})",
                        fontSize = 10.sp,
                        fontWeight = FontWeight.ExtraBold,
                        color = MaterialTheme.colorScheme.onPrimaryContainer,
                        modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp)
                    )
                }
            }
        }

        Spacer(modifier = Modifier.height(8.dp))

        // Position Filter Chips
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .horizontalScroll(rememberScrollState()),
            horizontalArrangement = Arrangement.spacedBy(6.dp)
        ) {
            FilterChip(
                selected = selectedPositionFilter == null,
                onClick = { selectedPositionFilter = null },
                label = { Text("All (${draftProspects.size})", fontSize = 11.sp) }
            )
            Position.entries.filter { it != Position.NONE }.forEach { pos ->
                val count = draftProspects.count { it.positionFirst == pos || it.positionSecond == pos }
                FilterChip(
                    selected = selectedPositionFilter == pos,
                    onClick = { selectedPositionFilter = if (selectedPositionFilter == pos) null else pos },
                    label = { Text("${pos.shortName} ($count)", fontSize = 11.sp) }
                )
            }
        }

        Spacer(modifier = Modifier.height(6.dp))

        // Prospects List
        if (filteredProspects.isEmpty()) {
            Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                Text("No draft prospects matching filter.", color = MaterialTheme.colorScheme.onSurfaceVariant)
            }
        } else {
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                verticalArrangement = Arrangement.spacedBy(6.dp)
            ) {
                itemsIndexed(filteredProspects) { index, prospect ->
                    Card(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { selectedPlayerForDetail = prospect },
                        shape = RoundedCornerShape(8.dp),
                        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
                    ) {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(horizontal = 10.dp, vertical = 6.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(8.dp),
                                modifier = Modifier.weight(1f)
                            ) {
                                Surface(
                                    shape = RoundedCornerShape(4.dp),
                                    color = MaterialTheme.colorScheme.surfaceVariant,
                                    modifier = Modifier.width(32.dp)
                                ) {
                                    Text(
                                        text = "#${index + 1}",
                                        fontSize = 11.sp,
                                        fontWeight = FontWeight.Bold,
                                        textAlign = androidx.compose.ui.text.style.TextAlign.Center,
                                        modifier = Modifier.padding(vertical = 2.dp)
                                    )
                                }
                                RatingBadge(rating = prospect.overallRating, size = 28)
                                PositionBadge(position = prospect.positionFirst)
                                Column {
                                    Text(text = prospect.name, fontWeight = FontWeight.Bold, fontSize = 13.sp)
                                    Text(
                                        text = "Age ${prospect.age} • Potential ★${prospect.potential} • ${if (index < 14) "Lottery Projected" else if (index < 30) "1st Round" else "2nd Round"}",
                                        fontSize = 11.sp,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                            }

                            Icon(
                                Icons.Default.Info,
                                contentDescription = "Scout Player",
                                tint = MaterialTheme.colorScheme.primary.copy(alpha = 0.7f),
                                modifier = Modifier.size(20.dp)
                            )
                        }
                    }
                }
            }
        }
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
