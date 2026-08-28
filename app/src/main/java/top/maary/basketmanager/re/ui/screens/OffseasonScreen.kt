package top.maary.basketmanager.re.ui.screens

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
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
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.launch
import top.maary.basketmanager.re.domain.engine.ContractEngine
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Position
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
    val allTeams by viewModel.allTeams.collectAsState()
    val roster by viewModel.userRoster.collectAsState()
    val allPlayers by viewModel.allPlayers.collectAsState()

    val currentDay = game?.currentMatchday ?: 226
    val currentSeason = game?.currentSeason ?: 1

    val currentPhaseIndex = when {
        currentDay <= 226 -> 0 // Retirements
        currentDay in 227..229 -> 1 // Renewals
        currentDay == 230 -> 2 // Draft
        currentDay in 231..233 -> 3 // Free Agency
        else -> 4 // Kickoff
    }

    var selectedTab by remember(currentPhaseIndex) { mutableIntStateOf(currentPhaseIndex) }

    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }
    var negotiatingPlayer by remember { mutableStateOf<Player?>(null) }
    var negotiationFeedback by remember { mutableStateOf<Pair<Boolean, String>?>(null) }
    var showConfirmDepartDialog by remember { mutableStateOf(false) }
    var isAdvancingPhase by remember { mutableStateOf(false) }

    val expiringPlayers = remember(roster) {
        roster.filter { it.yearsContract == 0 }
    }

    val extensionEligible = remember(roster) {
        roster.filter { it.yearsContract == 1 }
    }

    val contractedRoster = remember(roster) {
        roster.filter { it.yearsContract > 0 }
    }

    val totalPayroll = remember(contractedRoster) { contractedRoster.sumOf { it.salary } }
    val capSpace = (userTeam?.salaryCap ?: 70_000_000) - totalPayroll

    fun formatMoney(amount: Int): String {
        return if (amount >= 1_000_000) "$${String.format("%.2f", amount / 1_000_000.0)}M" else "$${amount / 1_000}K"
    }

    // Veteran Retirements across the league
    val retiredPlayers = remember(allPlayers) {
        allPlayers.filter { it.age >= 36 && it.overallRating <= 72 }
    }

    val teamMap = remember(allTeams) { allTeams.associateBy { it.id } }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp, vertical = 8.dp)
    ) {
        // TOP HEADER CARD
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer)
        ) {
            Column(modifier = Modifier.padding(12.dp)) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column {
                        Text(
                            text = "Offseason Front Office",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.ExtraBold,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        Text(
                            text = "Season $currentSeason Offseason • Phase ${currentPhaseIndex + 1}/5 (Day $currentDay)",
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.8f)
                        )
                    }

                    Row(horizontalArrangement = Arrangement.spacedBy(6.dp), verticalAlignment = Alignment.CenterVertically) {
                        Surface(
                            shape = RoundedCornerShape(6.dp),
                            color = MaterialTheme.colorScheme.primary
                        ) {
                            Text(
                                text = "Cap Space: ${formatMoney(capSpace)}",
                                fontSize = 11.sp,
                                fontWeight = FontWeight.Bold,
                                color = Color.White,
                                modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp)
                            )
                        }
                    }
                }
            }
        }

        Spacer(modifier = Modifier.height(8.dp))

        // PHASE NAVIGATION STEPPER TABS
        ScrollableTabRow(
            selectedTabIndex = selectedTab,
            edgePadding = 0.dp
        ) {
            // Tab 0: Retirements
            Tab(
                selected = selectedTab == 0,
                onClick = { selectedTab = 0 },
                text = {
                    Text(
                        if (currentDay > 226) "✓ 1. Retirements" else "1. Retirements",
                        fontWeight = if (selectedTab == 0) FontWeight.Bold else FontWeight.Normal
                    )
                }
            )

            // Tab 1: Renewals
            val tab1Title = when {
                currentDay > 229 -> "✓ 2. Renewals"
                currentDay in 227..229 -> "2. Renewals (${expiringPlayers.size})"
                else -> "🔒 2. Renewals"
            }
            Tab(
                selected = selectedTab == 1,
                onClick = { if (currentPhaseIndex >= 1) selectedTab = 1 },
                enabled = currentPhaseIndex >= 1,
                text = {
                    Text(
                        tab1Title,
                        color = if (currentPhaseIndex < 1) MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.5f) else Color.Unspecified,
                        fontWeight = if (selectedTab == 1) FontWeight.Bold else FontWeight.Normal
                    )
                }
            )

            // Tab 2: Draft
            val tab2Title = when {
                currentDay > 230 -> "✓ 3. Draft"
                currentDay == 230 -> "3. Rookie Draft"
                else -> "🔒 3. Draft"
            }
            Tab(
                selected = selectedTab == 2,
                onClick = { if (currentPhaseIndex >= 2) selectedTab = 2 },
                enabled = currentPhaseIndex >= 2,
                text = {
                    Text(
                        tab2Title,
                        color = if (currentPhaseIndex < 2) MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.5f) else Color.Unspecified,
                        fontWeight = if (selectedTab == 2) FontWeight.Bold else FontWeight.Normal
                    )
                }
            )

            // Tab 3: Free Agency
            val tab3Title = when {
                currentDay > 233 -> "✓ 4. Free Agency"
                currentDay in 231..233 -> "4. Free Agency"
                else -> "🔒 4. Free Agency"
            }
            Tab(
                selected = selectedTab == 3,
                onClick = { if (currentPhaseIndex >= 3) selectedTab = 3 },
                enabled = currentPhaseIndex >= 3,
                text = {
                    Text(
                        tab3Title,
                        color = if (currentPhaseIndex < 3) MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.5f) else Color.Unspecified,
                        fontWeight = if (selectedTab == 3) FontWeight.Bold else FontWeight.Normal
                    )
                }
            )

            // Tab 4: Kickoff
            val tab4Title = if (currentPhaseIndex >= 4) "5. Season ${currentSeason + 1}" else "🔒 5. Season ${currentSeason + 1}"
            Tab(
                selected = selectedTab == 4,
                onClick = { if (currentPhaseIndex >= 4) selectedTab = 4 },
                enabled = currentPhaseIndex >= 4,
                text = {
                    Text(
                        tab4Title,
                        color = if (currentPhaseIndex < 4) MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.5f) else Color.Unspecified,
                        fontWeight = if (selectedTab == 4) FontWeight.Bold else FontWeight.Normal
                    )
                }
            )
        }

        Spacer(modifier = Modifier.height(8.dp))

        // PHASE CONTENT
        when (selectedTab) {
            0 -> {
                // PHASE 0: RETIREMENTS
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    item {
                        Card(
                            modifier = Modifier.fillMaxWidth(),
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f))
                        ) {
                            Column(modifier = Modifier.padding(12.dp)) {
                                Text("Veteran Retirements (Season $currentSeason)", fontWeight = FontWeight.Bold, fontSize = 14.sp)
                                Text(
                                    text = if (currentDay > 226) "Phase Finished • Retired veterans have been archived from active rosters."
                                    else "The following veterans have announced their retirement from professional basketball.",
                                    fontSize = 12.sp,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }
                    }

                    if (retiredPlayers.isEmpty()) {
                        item {
                            Card(modifier = Modifier.fillMaxWidth()) {
                                Text("No veteran players announced retirement this season.", modifier = Modifier.padding(16.dp), fontSize = 13.sp)
                            }
                        }
                    } else {
                        items(retiredPlayers) { player ->
                            Card(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .clickable { selectedPlayerForDetail = player },
                                shape = RoundedCornerShape(8.dp)
                            ) {
                                Row(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(10.dp),
                                    horizontalArrangement = Arrangement.SpaceBetween,
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                                        RatingBadge(rating = player.overallRating)
                                        Column {
                                            Text(text = player.name, fontWeight = FontWeight.Bold, fontSize = 13.sp)
                                            Text(
                                                text = "${player.positionFirst.shortName} • Age ${player.age} • ${teamMap[player.teamId]?.name ?: "Free Agent"}",
                                                fontSize = 11.sp,
                                                color = MaterialTheme.colorScheme.onSurfaceVariant
                                            )
                                        }
                                    }
                                    Surface(shape = RoundedCornerShape(4.dp), color = MaterialTheme.colorScheme.surfaceVariant) {
                                        Text("Retired 🎖️", fontSize = 11.sp, modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp))
                                    }
                                }
                            }
                        }
                    }

                    if (currentDay <= 226) {
                        item {
                            Spacer(modifier = Modifier.height(10.dp))
                            Button(
                                onClick = {
                                    isAdvancingPhase = true
                                    viewModel.autoSimulateToMatchday(227) {
                                        isAdvancingPhase = false
                                        selectedTab = 1
                                    }
                                },
                                enabled = !isAdvancingPhase,
                                shape = RoundedCornerShape(8.dp),
                                modifier = Modifier.fillMaxWidth().height(48.dp)
                            ) {
                                if (isAdvancingPhase) {
                                    CircularProgressIndicator(modifier = Modifier.size(16.dp), color = Color.White, strokeWidth = 2.dp)
                                } else {
                                    Text("Finalize Retirements & Begin Contract Negotiations >", fontWeight = FontWeight.Bold)
                                }
                            }
                        }
                    }
                }
            }

            1 -> {
                // PHASE 1: CONTRACT RENEWALS & EXTENSIONS
                val isPhaseClosed = currentDay > 229

                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    if (isPhaseClosed) {
                        item {
                            Card(
                                modifier = Modifier.fillMaxWidth(),
                                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.tertiaryContainer)
                            ) {
                                Row(
                                    modifier = Modifier.padding(12.dp),
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                                ) {
                                    Icon(Icons.Default.CheckCircle, contentDescription = null, tint = RatingGreen)
                                    Column {
                                        Text("Contract Phase Closed", fontWeight = FontWeight.Bold, fontSize = 13.sp)
                                        Text(
                                            "All unrenewed players have already departed into the Free Agency pool. Active contracted roster is locked.",
                                            fontSize = 11.sp,
                                            color = MaterialTheme.colorScheme.onTertiaryContainer
                                        )
                                    }
                                }
                            }
                        }
                    }

                    // SECTION A: EXPIRING CONTRACTS (0 Years)
                    item {
                        Card(
                            modifier = Modifier.fillMaxWidth(),
                            colors = CardDefaults.cardColors(containerColor = if (expiringPlayers.isNotEmpty() && !isPhaseClosed) Color(0xFFEF4444).copy(alpha = 0.12f) else MaterialTheme.colorScheme.surfaceVariant)
                        ) {
                            Column(modifier = Modifier.padding(12.dp)) {
                                Row(
                                    modifier = Modifier.fillMaxWidth(),
                                    horizontalArrangement = Arrangement.SpaceBetween,
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Text(
                                        text = "🔴 Expiring Contracts (0 Years Remaining: ${expiringPlayers.size})",
                                        fontWeight = FontWeight.ExtraBold,
                                        fontSize = 13.sp,
                                        color = if (expiringPlayers.isNotEmpty() && !isPhaseClosed) Color(0xFFDC2626) else MaterialTheme.colorScheme.onSurface
                                    )
                                }
                                Text(
                                    text = if (isPhaseClosed) "Contracts have expired and unrenewed players departed."
                                    else "Must renew now before Draft! Unrenewed players will depart as Free Agents upon proceeding to Draft.",
                                    fontSize = 11.sp,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }
                    }

                    if (expiringPlayers.isEmpty()) {
                        item {
                            Card(modifier = Modifier.fillMaxWidth()) {
                                Text("No expiring 0-year contracts on your roster.", modifier = Modifier.padding(12.dp), fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                            }
                        }
                    } else {
                        items(expiringPlayers) { player ->
                            OffseasonPlayerContractRow(
                                player = player,
                                isExtension = false,
                                readOnly = isPhaseClosed,
                                onNegotiate = { negotiatingPlayer = player },
                                onDetail = { selectedPlayerForDetail = player }
                            )
                        }
                    }

                    // SECTION B: EXTENSION ELIGIBLE CONTRACTS (1 Year)
                    item {
                        Spacer(modifier = Modifier.height(4.dp))
                        Card(
                            modifier = Modifier.fillMaxWidth(),
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.6f))
                        ) {
                            Column(modifier = Modifier.padding(12.dp)) {
                                Text(
                                    text = "🟢 Early Extension Eligible (1 Year Contract: ${extensionEligible.size})",
                                    fontWeight = FontWeight.Bold,
                                    fontSize = 13.sp
                                )
                                Text(
                                    text = "Lock in core players with early extensions before their contracts expire next season.",
                                    fontSize = 11.sp,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }
                    }

                    if (extensionEligible.isEmpty()) {
                        item {
                            Card(modifier = Modifier.fillMaxWidth()) {
                                Text("No 1-year contract players eligible for extension.", modifier = Modifier.padding(12.dp), fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                            }
                        }
                    } else {
                        items(extensionEligible) { player ->
                            OffseasonPlayerContractRow(
                                player = player,
                                isExtension = true,
                                readOnly = isPhaseClosed,
                                onNegotiate = { negotiatingPlayer = player },
                                onDetail = { selectedPlayerForDetail = player }
                            )
                        }
                    }

                    if (!isPhaseClosed) {
                        item {
                            Spacer(modifier = Modifier.height(10.dp))
                            Button(
                                onClick = {
                                    if (expiringPlayers.isNotEmpty()) {
                                        showConfirmDepartDialog = true
                                    } else {
                                        isAdvancingPhase = true
                                        viewModel.finalizeContractPhaseAndProceedToDraft {
                                            isAdvancingPhase = false
                                            selectedTab = 2
                                        }
                                    }
                                },
                                enabled = !isAdvancingPhase,
                                shape = RoundedCornerShape(8.dp),
                                modifier = Modifier.fillMaxWidth().height(48.dp)
                            ) {
                                if (isAdvancingPhase) {
                                    CircularProgressIndicator(modifier = Modifier.size(16.dp), color = Color.White, strokeWidth = 2.dp)
                                } else {
                                    Text("Finalize Contracts & Proceed to Draft >", fontWeight = FontWeight.Bold)
                                }
                            }
                        }
                    }
                }
            }

            2 -> {
                // PHASE 2: ROOKIE DRAFT
                Column(modifier = Modifier.fillMaxSize()) {
                    Box(modifier = Modifier.weight(1f)) {
                        LiveDraftCeremonyScreen(viewModel = viewModel)
                    }

                    if (currentDay == 230) {
                        Button(
                            onClick = {
                                isAdvancingPhase = true
                                viewModel.autoSimulateToMatchday(231) {
                                    isAdvancingPhase = false
                                    selectedTab = 3
                                }
                            },
                            enabled = !isAdvancingPhase,
                            shape = RoundedCornerShape(8.dp),
                            modifier = Modifier.fillMaxWidth().padding(top = 4.dp).height(46.dp)
                        ) {
                            if (isAdvancingPhase) {
                                CircularProgressIndicator(modifier = Modifier.size(16.dp), color = Color.White, strokeWidth = 2.dp)
                            } else {
                                Text("Finalize Draft & Open Free Agency >", fontWeight = FontWeight.Bold)
                            }
                        }
                    }
                }
            }

            3 -> {
                // PHASE 3: FREE AGENCY
                Column(modifier = Modifier.fillMaxSize()) {
                    Box(modifier = Modifier.weight(1f)) {
                        FreeAgencyScreen(viewModel = viewModel)
                    }

                    if (currentDay in 231..233) {
                        Button(
                            onClick = {
                                isAdvancingPhase = true
                                viewModel.autoSimulateToMatchday(234) {
                                    isAdvancingPhase = false
                                    selectedTab = 4
                                }
                            },
                            enabled = !isAdvancingPhase,
                            shape = RoundedCornerShape(8.dp),
                            modifier = Modifier.fillMaxWidth().padding(top = 4.dp).height(46.dp)
                        ) {
                            if (isAdvancingPhase) {
                                CircularProgressIndicator(modifier = Modifier.size(16.dp), color = Color.White, strokeWidth = 2.dp)
                            } else {
                                Text("Finalize Free Agency & Prepare for Season ${currentSeason + 1} >", fontWeight = FontWeight.Bold)
                            }
                        }
                    }
                }
            }

            4 -> {
                // PHASE 4: START NEXT SEASON
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

                    Spacer(modifier = Modifier.height(20.dp))

                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                    ) {
                        Column(modifier = Modifier.padding(14.dp), verticalArrangement = Arrangement.spacedBy(6.dp)) {
                            Text("Franchise Ready Check:", fontWeight = FontWeight.Bold, fontSize = 13.sp)
                            Text("• Active Roster: ${contractedRoster.size} Players signed", fontSize = 12.sp)
                            Text("• Total Guaranteed Payroll: ${formatMoney(totalPayroll)}", fontSize = 12.sp)
                            Text("• Remaining Cap Room: ${formatMoney(capSpace)}", fontSize = 12.sp)
                        }
                    }

                    Spacer(modifier = Modifier.height(24.dp))

                    Button(
                        onClick = {
                            isAdvancingPhase = true
                            viewModel.autoSimulateToMatchday(234) {
                                isAdvancingPhase = false
                                onNavigateToNewSeason()
                            }
                        },
                        enabled = !isAdvancingPhase,
                        shape = RoundedCornerShape(12.dp),
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(52.dp)
                    ) {
                        if (isAdvancingPhase) {
                            CircularProgressIndicator(modifier = Modifier.size(20.dp), color = Color.White, strokeWidth = 2.dp)
                        } else {
                            Icon(Icons.Default.PlayArrow, contentDescription = null)
                            Spacer(modifier = Modifier.width(8.dp))
                            Text("Tip-Off Season ${currentSeason + 1}!", fontSize = 15.sp, fontWeight = FontWeight.Bold)
                        }
                    }
                }
            }
        }
    }

    // Departure Warning Dialog
    if (showConfirmDepartDialog) {
        AlertDialog(
            onDismissRequest = { showConfirmDepartDialog = false },
            title = { Text("Confirm Contract Phase Finalization") },
            text = {
                Text(
                    "You have " + expiringPlayers.size + " unrenewed player(s) on your roster.\n\nIf you proceed to the Draft now, these players will immediately depart from your team and become Free Agents. Are you sure you want to proceed?"
                )
            },
            confirmButton = {
                Button(
                    onClick = {
                        showConfirmDepartDialog = false
                        isAdvancingPhase = true
                        viewModel.finalizeContractPhaseAndProceedToDraft {
                            isAdvancingPhase = false
                            selectedTab = 2
                        }
                    }
                ) {
                    Text("Proceed to Draft")
                }
            },
            dismissButton = {
                TextButton(onClick = { showConfirmDepartDialog = false }) {
                    Text("Review Contracts")
                }
            }
        )
    }

    // Interactive Contract Negotiation Dialog
    negotiatingPlayer?.let { player ->
        val isExt = player.yearsContract > 0
        ContractNegotiationDialog(
            player = player,
            isHomeTeamRenewal = true,
            capAvailable = capSpace,
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
    readOnly: Boolean = false,
    onNegotiate: () -> Unit,
    onDetail: () -> Unit
) {
    val (marketSalary, openMarketSalary) = remember(player.id) {
        ContractEngine.calculateMarketDemandSalary(player, isHomeTeamRenewal = true)
    }

    fun formatMoney(amount: Int): String {
        return if (amount >= 1_000_000) "$${String.format("%.2f", amount / 1_000_000.0)}M" else "$${amount / 1_000}K"
    }

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onDetail),
        shape = RoundedCornerShape(8.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f))
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
                RatingBadge(rating = player.overallRating, size = 26)
                PositionBadge(position = player.positionFirst)
                Column {
                    Text(text = player.name, fontWeight = FontWeight.Bold, fontSize = 13.sp)
                    Text(
                        text = "Age ${player.age} • Pot ★${player.potential} • Demands ~${formatMoney(marketSalary)}/yr",
                        fontSize = 11.sp,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            if (!readOnly) {
                Button(
                    onClick = onNegotiate,
                    contentPadding = PaddingValues(horizontal = 10.dp, vertical = 4.dp),
                    shape = RoundedCornerShape(6.dp)
                ) {
                    Text(
                        text = if (isExtension) "Extend" else "Renew",
                        fontSize = 11.sp,
                        fontWeight = FontWeight.Bold
                    )
                }
            } else {
                Surface(
                    shape = RoundedCornerShape(4.dp),
                    color = MaterialTheme.colorScheme.surfaceVariant
                ) {
                    Text(
                        text = if (player.yearsContract > 0) "${player.yearsContract}y left" else "Departed",
                        fontSize = 11.sp,
                        color = if (player.yearsContract > 0) RatingGreen else RatingRed,
                        modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                    )
                }
            }
        }
    }
}
