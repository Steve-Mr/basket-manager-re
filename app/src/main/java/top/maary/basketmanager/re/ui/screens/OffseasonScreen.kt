package top.maary.basketmanager.re.ui.screens

import top.maary.basketmanager.re.domain.engine.ContractEngine

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun OffseasonScreen(
    viewModel: GameDashboardViewModel,
    onNavigateToNewSeason: () -> Unit
) {
    val game by viewModel.game.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()
    val roster by viewModel.userRoster.collectAsState()
    val freeAgents by viewModel.freeAgents.collectAsState()
    val draftPicks by viewModel.draftPicks.collectAsState()

    val currentDay = game?.currentMatchday ?: 226
    val currentSeason = game?.currentSeason ?: 1

    var selectedTab by remember {
        mutableIntStateOf(
            when {
                currentDay <= 226 -> 0 // Retirements
                currentDay in 227..229 -> 1 // Renewals
                currentDay == 230 -> 2 // Draft
                currentDay in 231..233 -> 3 // Free Agency
                else -> 4 // Next Season Kickoff
            }
        )
    }

    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }
    var negotiatingPlayer by remember { mutableStateOf<Player?>(null) }
    var offerYears by remember { mutableIntStateOf(2) }
    var offerSalarySlider by remember { mutableFloatStateOf(10f) } // in millions
    var negotiationFeedback by remember { mutableStateOf<Pair<Boolean, String>?>(null) }

    val expiringPlayers = remember(roster) {
        roster.filter { it.yearsContract <= 1 }
    }

    val totalPayroll = remember(roster) { roster.sumOf { it.salary } }
    val capSpace = (userTeam?.salaryCap ?: 70_000_000) - totalPayroll

    fun formatMoney(amount: Int): String {
        return if (amount >= 1_000_000) "$${amount / 1_000_000}M" else "$${amount / 1_000}K"
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp, vertical = 10.dp)
    ) {
        // Top Header
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer)
        ) {
            Column(modifier = Modifier.padding(14.dp)) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column {
                        Text(
                            text = "Offseason Front Office",
                            style = MaterialTheme.typography.titleLarge,
                            fontWeight = FontWeight.ExtraBold,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        Text(
                            text = "Season $currentSeason Offseason • Matchday $currentDay / 234",
                            fontSize = 12.sp,
                            color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.8f)
                        )
                    }
                    Surface(
                        shape = RoundedCornerShape(6.dp),
                        color = MaterialTheme.colorScheme.primary
                    ) {
                        Text(
                            text = "Cap Room: ${formatMoney(capSpace)}",
                            fontSize = 11.sp,
                            fontWeight = FontWeight.Bold,
                            color = Color.White,
                            modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp)
                        )
                    }
                }
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        // Phase Navigation Tabs
        ScrollableTabRow(
            selectedTabIndex = selectedTab,
            edgePadding = 0.dp
        ) {
            Tab(selected = selectedTab == 0, onClick = { selectedTab = 0 }, text = { Text("1. Retirements") })
            Tab(selected = selectedTab == 1, onClick = { selectedTab = 1 }, text = { Text("2. Renewals (${expiringPlayers.size})") })
            Tab(selected = selectedTab == 2, onClick = { selectedTab = 2 }, text = { Text("3. Rookie Draft") })
            Tab(selected = selectedTab == 3, onClick = { selectedTab = 3 }, text = { Text("4. Free Agency") })
            Tab(selected = selectedTab == 4, onClick = { selectedTab = 4 }, text = { Text("5. Start Season ${currentSeason + 1}") })
        }

        Spacer(modifier = Modifier.height(10.dp))

        when (selectedTab) {
            0 -> {
                // Tab 0: Retirements
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    item {
                        Text(
                            text = "Veteran Retirements",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.primary
                        )
                        Text(
                            text = "Veterans aged 34+ have evaluated their physical form and hung up their jerseys.",
                            fontSize = 12.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                    }

                    item {
                        Card(
                            modifier = Modifier.fillMaxWidth(),
                            shape = RoundedCornerShape(10.dp),
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                        ) {
                            Column(modifier = Modifier.padding(14.dp)) {
                                Text("Retirement Phase Status: Completed", fontWeight = FontWeight.Bold)
                                Text("All retired veteran contracts have been cleared from league payroll books.", fontSize = 12.sp)
                                Spacer(modifier = Modifier.height(10.dp))
                                Button(
                                    onClick = { selectedTab = 1 },
                                    modifier = Modifier.fillMaxWidth()
                                ) {
                                    Text("Proceed to Contract Negotiations >")
                                }
                            }
                        }
                    }
                }
            }

            1 -> {
                // Tab 1: Contract Renewals & Extensions (Two Groups: Expiring 0-yr vs Extension-eligible 1-yr)
                val extensionEligible = remember(roster) { roster.filter { it.yearsContract == 1 } }

                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(12.dp),
                    contentPadding = PaddingValues(bottom = 16.dp)
                ) {
                    item {
                        Text(
                            text = "Contract Renewals & Extensions",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.primary
                        )
                        Text(
                            text = "Expiring (0-yr) players will enter Free Agency on Day 231 if not renewed. 1-yr players can be extended early.",
                            fontSize = 12.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }

                    // Section 1: Expiring Contracts (0 Years Left - Critical)
                    item {
                        Card(
                            modifier = Modifier.fillMaxWidth(),
                            shape = RoundedCornerShape(12.dp),
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.errorContainer.copy(alpha = 0.25f))
                        ) {
                            Column(modifier = Modifier.fillMaxWidth().padding(12.dp)) {
                                Row(
                                    modifier = Modifier.fillMaxWidth(),
                                    horizontalArrangement = Arrangement.SpaceBetween,
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Text(
                                        text = "🔴 到期球员 (0年合同 • 必须在此阶段续约)",
                                        fontWeight = FontWeight.Black,
                                        fontSize = 13.sp,
                                        color = MaterialTheme.colorScheme.error
                                    )
                                    Surface(shape = RoundedCornerShape(4.dp), color = MaterialTheme.colorScheme.errorContainer) {
                                        Text("${expiringPlayers.size} Players", fontSize = 10.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.onErrorContainer, modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp))
                                    }
                                }
                                Text(
                                    text = "⚠️ 若未在 Day 230 前完成续约，该球员将在 Day 231 自动进入自由球员市场！",
                                    fontSize = 11.sp,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                                    modifier = Modifier.padding(vertical = 4.dp)
                                )

                                Spacer(modifier = Modifier.height(4.dp))

                                if (expiringPlayers.isEmpty()) {
                                    Text(
                                        text = "🎉 当前无到期球员，所有球员下赛季均有合同保障！",
                                        fontSize = 12.sp,
                                        fontWeight = FontWeight.SemiBold,
                                        color = RatingGreen,
                                        modifier = Modifier.padding(vertical = 8.dp)
                                    )
                                } else {
                                    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                                        expiringPlayers.forEach { player ->
                                            OffseasonPlayerContractRow(
                                                player = player,
                                                isExtension = false,
                                                onNegotiate = { negotiatingPlayer = player },
                                                onDetail = { selectedPlayerForDetail = player }
                                            )
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // Section 2: Extension Eligible (1 Year Left - Optional Lock-in)
                    item {
                        Card(
                            modifier = Modifier.fillMaxWidth(),
                            shape = RoundedCornerShape(12.dp),
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.25f))
                        ) {
                            Column(modifier = Modifier.fillMaxWidth().padding(12.dp)) {
                                Row(
                                    modifier = Modifier.fillMaxWidth(),
                                    horizontalArrangement = Arrangement.SpaceBetween,
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Text(
                                        text = "🟢 可提前续约球员 (1年合同 • 可选提前锁定)",
                                        fontWeight = FontWeight.Black,
                                        fontSize = 13.sp,
                                        color = MaterialTheme.colorScheme.primary
                                    )
                                    Surface(shape = RoundedCornerShape(4.dp), color = MaterialTheme.colorScheme.primaryContainer) {
                                        Text("${extensionEligible.size} Players", fontSize = 10.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.onPrimaryContainer, modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp))
                                    }
                                }
                                Text(
                                    text = "✨ 可提前追加 1~4 年新合同（年限累加），锁定未来核心，避免下赛季休赛期进入自由市场。",
                                    fontSize = 11.sp,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                                    modifier = Modifier.padding(vertical = 4.dp)
                                )

                                Spacer(modifier = Modifier.height(4.dp))

                                if (extensionEligible.isEmpty()) {
                                    Text(
                                        text = "暂无可提前续约球员（无剩余 1 年合同的球员）。",
                                        fontSize = 12.sp,
                                        color = MaterialTheme.colorScheme.outline,
                                        modifier = Modifier.padding(vertical = 8.dp)
                                    )
                                } else {
                                    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                                        extensionEligible.forEach { player ->
                                            OffseasonPlayerContractRow(
                                                player = player,
                                                isExtension = true,
                                                onNegotiate = { negotiatingPlayer = player },
                                                onDetail = { selectedPlayerForDetail = player }
                                            )
                                        }
                                    }
                                }
                            }
                        }
                    }

                    item {
                        Spacer(modifier = Modifier.height(6.dp))
                        Button(
                            onClick = { selectedTab = 2 },
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Text("Finalize Contract Phase & Proceed to Draft >")
                        }
                    }
                }
            }

            2 -> {
                // Tab 2: Live Draft Ceremony
                LiveDraftCeremonyScreen(viewModel = viewModel)
            }

            3 -> {
                // Tab 3: Free Agency
                FreeAgencyScreen(viewModel = viewModel)
            }

            4 -> {
                // Tab 4: Start Next Season
                Column(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(16.dp),
                    verticalArrangement = Arrangement.Center,
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Icon(
                        Icons.Default.Celebration,
                        contentDescription = null,
                        tint = Color(0xFFFFD700),
                        modifier = Modifier.size(64.dp)
                    )
                    Spacer(modifier = Modifier.height(12.dp))
                    Text(
                        text = "Season ${currentSeason + 1} Kickoff",
                        style = MaterialTheme.typography.headlineMedium,
                        fontWeight = FontWeight.ExtraBold
                    )
                    Spacer(modifier = Modifier.height(6.dp))
                    Text(
                        text = "Rosters, Draft, and Financial books are finalized.\nReady to generate new 82-game fixtures and begin the next regular season campaign!",
                        fontSize = 13.sp,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        textAlign = androidx.compose.ui.text.style.TextAlign.Center
                    )

                    Spacer(modifier = Modifier.height(24.dp))

                    Button(
                        onClick = {
                            viewModel.autoSimulateToMatchday(234) {
                                onNavigateToNewSeason()
                            }
                        },
                        shape = RoundedCornerShape(12.dp),
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(52.dp)
                    ) {
                        Icon(Icons.Default.PlayArrow, contentDescription = null)
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("🚀 Start Season ${currentSeason + 1}", fontSize = 16.sp, fontWeight = FontWeight.Bold)
                    }
                }
            }
        }
    }

    // Negotiation Dialog with Live Acceptance Meter & 5 Quick Presets
    negotiatingPlayer?.let { player ->
        ContractNegotiationDialog(
            player = player,
            onDismiss = { negotiatingPlayer = null },
            onConfirmOffer = { years: Int, salary: Int, accepted: Boolean, feedbackMsg: String ->
                if (accepted) {
                    viewModel.extendContract(player.id, years, salary) {
                        negotiatingPlayer = null
                        negotiationFeedback = Pair(true, feedbackMsg)
                    }
                } else {
                    negotiatingPlayer = null
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
fun OffseasonPlayerContractRow(
    player: Player,
    isExtension: Boolean,
    onNegotiate: () -> Unit,
    onDetail: () -> Unit
) {
    val loyaltyDesc = when (player.loyalty) {
        1 -> "★1: Not interested in staying"
        2 -> "★2: Wants to test free agency"
        3 -> "★3: Undecided about renewal"
        4 -> "★4: Willing to stay on good terms"
        else -> "★5: Highly loyal to franchise"
    }

    fun formatSalaryText(a: Int) = if (a >= 1_000_000) "$${String.format("%.2f", a / 1_000_000.0)}M" else "$${a / 1_000}K"

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onDetail),
        shape = RoundedCornerShape(8.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(10.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(10.dp)
            ) {
                RatingBadge(rating = player.overallRating, size = 30)
                Column {
                    Text(player.name, fontWeight = FontWeight.Bold, fontSize = 13.sp)
                    Row(horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                        PositionBadge(position = player.positionFirst)
                        Text(
                            text = "Age: ${player.age} • ${if (isExtension) "1 Yr Left" else "0 Yrs (Expired)"} • ${formatSalaryText(player.salary)}/yr",
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                    Text(
                        text = loyaltyDesc,
                        fontSize = 10.sp,
                        fontWeight = FontWeight.Bold,
                        color = if (player.loyalty >= 4) RatingGreen else if (player.loyalty <= 2) RatingRed else MaterialTheme.colorScheme.primary
                    )
                }
            }

            Button(
                onClick = onNegotiate,
                shape = RoundedCornerShape(8.dp),
                contentPadding = PaddingValues(horizontal = 12.dp, vertical = 6.dp)
            ) {
                Text(if (isExtension) "提前续约" else "续约谈判", fontSize = 12.sp)
            }
        }
    }
}