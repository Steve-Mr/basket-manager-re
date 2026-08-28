package top.maary.basketmanager.re.ui.screens

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
import top.maary.basketmanager.re.BasketManagerApplication
import top.maary.basketmanager.re.domain.engine.CpuTargetInquiryResult
import top.maary.basketmanager.re.domain.engine.CpuTradeBid
import top.maary.basketmanager.re.domain.engine.TradeEvaluationResult
import top.maary.basketmanager.re.domain.model.DraftPick
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Team
import top.maary.basketmanager.re.domain.model.TradeProposal
import top.maary.basketmanager.re.ui.components.RatingBadge
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.theme.RatingRed
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel
import kotlinx.coroutines.launch

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TradeScreen(
    viewModel: GameDashboardViewModel
) {
    val repository = remember { BasketManagerApplication.instance.gameRepository }
    val scope = rememberCoroutineScope()

    val game by viewModel.game.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()
    val userRoster by viewModel.userRoster.collectAsState()

    var selectedPartnerTeam by remember { mutableStateOf<Team?>(null) }
    var partnerRoster by remember { mutableStateOf<List<Player>>(emptyList()) }
    var userDraftPicks by remember { mutableStateOf<List<DraftPick>>(emptyList()) }
    var partnerDraftPicks by remember { mutableStateOf<List<DraftPick>>(emptyList()) }

    // Multi-Asset Selections
    val selectedUserPlayers = remember { mutableStateListOf<Long>() }
    val selectedPartnerPlayers = remember { mutableStateListOf<Long>() }
    val selectedUserDraftPicks = remember { mutableStateListOf<Long>() }
    val selectedPartnerDraftPicks = remember { mutableStateListOf<Long>() }

    // Async Inquiry / Shop States
    var cpuBids by remember { mutableStateOf<List<CpuTradeBid>?>(null) }
    var isSearchingShopOffers by remember { mutableStateOf(false) }

    var targetInquiryResult by remember { mutableStateOf<CpuTargetInquiryResult?>(null) }
    var isSearchingTargetDemand by remember { mutableStateOf(false) }

    var tradeResult by remember { mutableStateOf<TradeEvaluationResult?>(null) }
    var showResultDialog by remember { mutableStateOf(false) }

    fun refreshPicks() {
        val uTeam = userTeam ?: return
        scope.launch {
            userDraftPicks = repository.getTeamDraftPicks(uTeam.id)
            selectedPartnerTeam?.let {
                partnerDraftPicks = repository.getTeamDraftPicks(it.id)
            }
        }
    }

    LaunchedEffect(allTeams, userTeam) {
        if (selectedPartnerTeam == null && allTeams.isNotEmpty()) {
            selectedPartnerTeam = allTeams.firstOrNull { it.id != userTeam?.id }
        }
        userTeam?.let { refreshPicks() }
    }

    LaunchedEffect(selectedPartnerTeam) {
        val partner = selectedPartnerTeam
        if (partner != null) {
            partnerRoster = repository.getTeamPlayers(partner.id)
            partnerDraftPicks = repository.getTeamDraftPicks(partner.id)
            selectedPartnerPlayers.clear()
            selectedPartnerDraftPicks.clear()
            targetInquiryResult = null
        }
    }

    val userSelectedCount = selectedUserPlayers.size + selectedUserDraftPicks.size
    val partnerSelectedCount = selectedPartnerPlayers.size + selectedPartnerDraftPicks.size

    val userTradePlayers = userRoster.filter { selectedUserPlayers.contains(it.id) }
    val partnerTradePlayers = partnerRoster.filter { selectedPartnerPlayers.contains(it.id) }
    val userTradePicks = userDraftPicks.filter { selectedUserDraftPicks.contains(it.id) }
    val partnerTradePicks = partnerDraftPicks.filter { selectedPartnerDraftPicks.contains(it.id) }

    val userOutSalary = userTradePlayers.sumOf { it.salary }
    val partnerOutSalary = partnerTradePlayers.sumOf { it.salary }

    val userTeamObj = userTeam
    val partnerTeamObj = selectedPartnerTeam

    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp, vertical = 10.dp),
        verticalArrangement = Arrangement.spacedBy(10.dp)
    ) {
        // Header
        item {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    Text(
                        text = "Smart Trade Machine",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "Select assets to negotiate, shop league-wide, or inquire prices",
                        fontSize = 11.sp,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }

                if (userSelectedCount > 0 || partnerSelectedCount > 0) {
                    TextButton(
                        onClick = {
                            selectedUserPlayers.clear()
                            selectedUserDraftPicks.clear()
                            selectedPartnerPlayers.clear()
                            selectedPartnerDraftPicks.clear()
                            cpuBids = null
                            targetInquiryResult = null
                        }
                    ) {
                        Text("Reset All", fontSize = 12.sp)
                    }
                }
            }
        }

        // Partner Team Selector Bar
        item {
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f)),
                shape = RoundedCornerShape(8.dp)
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 12.dp, vertical = 8.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Trade Partner:",
                        style = MaterialTheme.typography.bodySmall,
                        fontWeight = FontWeight.Bold
                    )
                    var partnerExpanded by remember { mutableStateOf(false) }
                    Box {
                        OutlinedButton(
                            onClick = { partnerExpanded = true },
                            contentPadding = PaddingValues(horizontal = 12.dp, vertical = 4.dp),
                            shape = RoundedCornerShape(6.dp)
                        ) {
                            Text(partnerTeamObj?.name ?: "Select Team", fontWeight = FontWeight.Bold, fontSize = 13.sp)
                            Icon(Icons.Default.ArrowDropDown, contentDescription = null, modifier = Modifier.size(16.dp))
                        }
                        DropdownMenu(
                            expanded = partnerExpanded,
                            onDismissRequest = { partnerExpanded = false }
                        ) {
                            allTeams.filter { it.id != userTeamObj?.id }.forEach { team ->
                                DropdownMenuItem(
                                    text = { Text("${team.name} (${team.division.name.takeLast(2)})") },
                                    onClick = {
                                        selectedPartnerTeam = team
                                        partnerExpanded = false
                                    }
                                )
                            }
                        }
                    }
                }
            }
        }

        // SIDE-BY-SIDE ASSET SELECTION BOXES
        item {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                // USER TEAM ASSETS
                Card(
                    modifier = Modifier.weight(1f),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.3f)),
                    shape = RoundedCornerShape(8.dp)
                ) {
                    Column(modifier = Modifier.padding(10.dp)) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text(userTeamObj?.name ?: "My Team", fontWeight = FontWeight.Bold, fontSize = 13.sp, color = MaterialTheme.colorScheme.primary)
                            Text("$userSelectedCount sel", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                        }
                        Text("Out: $${userOutSalary / 1_000_000}M", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)

                        Spacer(modifier = Modifier.height(6.dp))

                        // Draft Picks
                        if (userDraftPicks.isNotEmpty()) {
                            Text("Draft Picks:", fontSize = 11.sp, fontWeight = FontWeight.SemiBold)
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .horizontalScroll(rememberScrollState()),
                                horizontalArrangement = Arrangement.spacedBy(4.dp)
                            ) {
                                userDraftPicks.forEach { dp ->
                                    val isSel = selectedUserDraftPicks.contains(dp.id)
                                    FilterChip(
                                        selected = isSel,
                                        onClick = {
                                            if (isSel) selectedUserDraftPicks.remove(dp.id) else selectedUserDraftPicks.add(dp.id)
                                            cpuBids = null
                                            targetInquiryResult = null
                                        },
                                        label = { Text("R${dp.round}", fontSize = 10.sp) }
                                    )
                                }
                            }
                        }

                        Spacer(modifier = Modifier.height(6.dp))

                        // Roster
                        Text("Roster:", fontSize = 11.sp, fontWeight = FontWeight.SemiBold)
                        userRoster.forEach { player ->
                            val isSel = selectedUserPlayers.contains(player.id)
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .clickable {
                                        if (isSel) selectedUserPlayers.remove(player.id) else selectedUserPlayers.add(player.id)
                                        cpuBids = null
                                        targetInquiryResult = null
                                    }
                                    .padding(vertical = 3.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Row(verticalAlignment = Alignment.CenterVertically, modifier = Modifier.weight(1f)) {
                                    Checkbox(
                                        checked = isSel,
                                        onCheckedChange = {
                                            if (isSel) selectedUserPlayers.remove(player.id) else selectedUserPlayers.add(player.id)
                                            cpuBids = null
                                            targetInquiryResult = null
                                        },
                                        modifier = Modifier.size(24.dp)
                                    )
                                    Spacer(modifier = Modifier.width(4.dp))
                                    Column {
                                        Text(player.shortName, fontSize = 11.sp, fontWeight = if (isSel) FontWeight.Bold else FontWeight.Normal)
                                        Text("${player.positionFirst.shortName} • $${player.salary / 1_000_000}M", fontSize = 9.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                                    }
                                }
                                RatingBadge(player.overallRating, size = 24)
                            }
                        }
                    }
                }

                // PARTNER TEAM ASSETS
                Card(
                    modifier = Modifier.weight(1f),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.3f)),
                    shape = RoundedCornerShape(8.dp)
                ) {
                    Column(modifier = Modifier.padding(10.dp)) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text(partnerTeamObj?.name ?: "Partner", fontWeight = FontWeight.Bold, fontSize = 13.sp, color = MaterialTheme.colorScheme.secondary)
                            Text("$partnerSelectedCount sel", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                        }
                        Text("Out: $${partnerOutSalary / 1_000_000}M", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)

                        Spacer(modifier = Modifier.height(6.dp))

                        // Partner Draft Picks
                        if (partnerDraftPicks.isNotEmpty()) {
                            Text("Draft Picks:", fontSize = 11.sp, fontWeight = FontWeight.SemiBold)
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .horizontalScroll(rememberScrollState()),
                                horizontalArrangement = Arrangement.spacedBy(4.dp)
                            ) {
                                partnerDraftPicks.forEach { dp ->
                                    val isSel = selectedPartnerDraftPicks.contains(dp.id)
                                    FilterChip(
                                        selected = isSel,
                                        onClick = {
                                            if (isSel) selectedPartnerDraftPicks.remove(dp.id) else selectedPartnerDraftPicks.add(dp.id)
                                            cpuBids = null
                                            targetInquiryResult = null
                                        },
                                        label = { Text("R${dp.round}", fontSize = 10.sp) }
                                    )
                                }
                            }
                        }

                        Spacer(modifier = Modifier.height(6.dp))

                        // Partner Roster
                        Text("Roster:", fontSize = 11.sp, fontWeight = FontWeight.SemiBold)
                        partnerRoster.forEach { player ->
                            val isSel = selectedPartnerPlayers.contains(player.id)
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .clickable {
                                        if (isSel) selectedPartnerPlayers.remove(player.id) else selectedPartnerPlayers.add(player.id)
                                        cpuBids = null
                                        targetInquiryResult = null
                                    }
                                    .padding(vertical = 3.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Row(verticalAlignment = Alignment.CenterVertically, modifier = Modifier.weight(1f)) {
                                    Checkbox(
                                        checked = isSel,
                                        onCheckedChange = {
                                            if (isSel) selectedPartnerPlayers.remove(player.id) else selectedPartnerPlayers.add(player.id)
                                            cpuBids = null
                                            targetInquiryResult = null
                                        },
                                        modifier = Modifier.size(24.dp)
                                    )
                                    Spacer(modifier = Modifier.width(4.dp))
                                    Column {
                                        Text(player.shortName, fontSize = 11.sp, fontWeight = if (isSel) FontWeight.Bold else FontWeight.Normal)
                                        Text("${player.positionFirst.shortName} • $${player.salary / 1_000_000}M", fontSize = 9.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                                    }
                                }
                                RatingBadge(player.overallRating, size = 24)
                            }
                        }
                    }
                }
            }
        }

        // DYNAMIC SMART ACTION BUTTON
        item {
            when {
                userSelectedCount > 0 && partnerSelectedCount > 0 -> {
                    // Scenario A: Both Sides Selected -> Standard Trade Machine
                    Button(
                        onClick = {
                            val uTeam = userTeamObj ?: return@Button
                            val pTeam = partnerTeamObj ?: return@Button
                            val proposal = TradeProposal(
                                teamAId = uTeam.id,
                                teamBId = pTeam.id,
                                teamAPlayerIds = selectedUserPlayers.toList(),
                                teamBPlayerIds = selectedPartnerPlayers.toList(),
                                teamADraftPickIds = selectedUserDraftPicks.toList(),
                                teamBDraftPickIds = selectedPartnerDraftPicks.toList()
                            )
                            scope.launch {
                                val result = repository.executeTrade(proposal)
                                tradeResult = result
                                showResultDialog = true
                                if (result.isAccepted) {
                                    selectedUserPlayers.clear()
                                    selectedPartnerPlayers.clear()
                                    selectedUserDraftPicks.clear()
                                    selectedPartnerDraftPicks.clear()
                                    refreshPicks()
                                    game?.let { viewModel.loadGame(it.id) }
                                }
                            }
                        },
                        modifier = Modifier.fillMaxWidth(),
                        shape = RoundedCornerShape(8.dp)
                    ) {
                        Text("🔄 Evaluate & Propose Trade (${userSelectedCount} for ${partnerSelectedCount})", fontWeight = FontWeight.Bold)
                    }
                }

                userSelectedCount > 0 && partnerSelectedCount == 0 -> {
                    // Scenario B: Only User Assets Selected -> Shop Assets Across League
                    Button(
                        onClick = {
                            val uTeam = userTeamObj ?: return@Button
                            isSearchingShopOffers = true
                            cpuBids = null
                            scope.launch {
                                val offers = repository.findShopTradeOffers(
                                    userTeamId = uTeam.id,
                                    offeredPlayerIds = selectedUserPlayers.toList(),
                                    offeredDraftPickIds = selectedUserDraftPicks.toList()
                                )
                                cpuBids = offers
                                isSearchingShopOffers = false
                            }
                        },
                        modifier = Modifier.fillMaxWidth(),
                        colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF00897B)),
                        shape = RoundedCornerShape(8.dp)
                    ) {
                        if (isSearchingShopOffers) {
                            CircularProgressIndicator(modifier = Modifier.size(18.dp), color = Color.White, strokeWidth = 2.dp)
                            Spacer(modifier = Modifier.width(8.dp))
                            Text("Searching All 29 Teams...")
                        } else {
                            Text("📢 Shop My Assets (Find All League Offers)", fontWeight = FontWeight.Bold)
                        }
                    }
                }

                userSelectedCount == 0 && partnerSelectedCount > 0 -> {
                    // Scenario C: Only Partner Assets Selected -> Ask Partner Demands
                    Button(
                        onClick = {
                            val uTeam = userTeamObj ?: return@Button
                            val pTeam = partnerTeamObj ?: return@Button
                            isSearchingTargetDemand = true
                            targetInquiryResult = null
                            scope.launch {
                                val result = repository.askTargetTradeDemand(
                                    userTeamId = uTeam.id,
                                    targetTeamId = pTeam.id,
                                    requestedPlayerIds = selectedPartnerPlayers.toList(),
                                    requestedDraftPickIds = selectedPartnerDraftPicks.toList()
                                )
                                targetInquiryResult = result
                                isSearchingTargetDemand = false
                            }
                        },
                        modifier = Modifier.fillMaxWidth(),
                        colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF6A1B9A)),
                        shape = RoundedCornerShape(8.dp)
                    ) {
                        if (isSearchingTargetDemand) {
                            CircularProgressIndicator(modifier = Modifier.size(18.dp), color = Color.White, strokeWidth = 2.dp)
                            Spacer(modifier = Modifier.width(8.dp))
                            Text("Inquiring Price...")
                        } else {
                            Text("🎯 Inquire What ${partnerTeamObj?.name ?: "They"} Want (Ask Counter-Offer)", fontWeight = FontWeight.Bold)
                        }
                    }
                }

                else -> {
                    // Scenario D: 0 Assets Selected -> Helpful Prompt
                    OutlinedButton(
                        onClick = {},
                        enabled = false,
                        modifier = Modifier.fillMaxWidth(),
                        shape = RoundedCornerShape(8.dp)
                    ) {
                        Text("Select Assets to Propose, Shop, or Inquire", fontSize = 12.sp)
                    }
                }
            }
        }

        // RESULTS SECTION 1: SHOP ASSET OFFERS
        if (cpuBids != null) {
            item {
                Text(
                    text = "Incoming League Offers (${cpuBids!!.size})",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
            }

            if (cpuBids!!.isEmpty()) {
                item {
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.3f))
                    ) {
                        Text(
                            text = "No teams are currently interested or able to match the salary for this package.",
                            modifier = Modifier.padding(16.dp),
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            } else {
                items(cpuBids!!) { bid ->
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f)),
                        shape = RoundedCornerShape(8.dp)
                    ) {
                        Column(modifier = Modifier.padding(12.dp)) {
                            Row(
                                modifier = Modifier.fillMaxWidth(),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Text(bid.partnerTeam.name, fontWeight = FontWeight.Bold, style = MaterialTheme.typography.titleSmall)
                                Text("${bid.offeredPlayers.size} Players, ${bid.offeredDraftPicks.size} Picks", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                            }

                            Spacer(modifier = Modifier.height(4.dp))

                            bid.offeredPlayers.forEach { p ->
                                Text("• ${p.name} (${p.positionFirst.shortName}, $${p.salary / 1_000_000}M) - OVR ${p.overallRating}", fontSize = 12.sp)
                            }
                            bid.offeredDraftPicks.forEach { dp ->
                                Text("• Round ${dp.round} Draft Pick", fontSize = 12.sp, color = RatingGreen)
                            }

                            Spacer(modifier = Modifier.height(6.dp))

                            Row(
                                modifier = Modifier.fillMaxWidth(),
                                horizontalArrangement = Arrangement.End,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                OutlinedButton(
                                    onClick = {
                                        selectedPartnerTeam = bid.partnerTeam
                                        selectedPartnerPlayers.clear()
                                        selectedPartnerDraftPicks.clear()
                                        bid.offeredPlayers.forEach { selectedPartnerPlayers.add(it.id) }
                                        bid.offeredDraftPicks.forEach { selectedPartnerDraftPicks.add(it.id) }
                                        cpuBids = null
                                    },
                                    contentPadding = PaddingValues(horizontal = 8.dp, vertical = 2.dp)
                                ) {
                                    Text("Load into Trade Machine", fontSize = 11.sp)
                                }

                                Spacer(modifier = Modifier.width(8.dp))

                                Button(
                                    onClick = {
                                        val uTeam = userTeamObj ?: return@Button
                                        val proposal = TradeProposal(
                                            teamAId = uTeam.id,
                                            teamBId = bid.partnerTeam.id,
                                            teamAPlayerIds = selectedUserPlayers.toList(),
                                            teamBPlayerIds = bid.offeredPlayers.map { it.id },
                                            teamADraftPickIds = selectedUserDraftPicks.toList(),
                                            teamBDraftPickIds = bid.offeredDraftPicks.map { it.id }
                                        )
                                        scope.launch {
                                            val result = repository.executeTrade(proposal)
                                            tradeResult = result
                                            showResultDialog = true
                                            if (result.isAccepted) {
                                                selectedUserPlayers.clear()
                                                selectedUserDraftPicks.clear()
                                                cpuBids = null
                                                refreshPicks()
                                                game?.let { viewModel.loadGame(it.id) }
                                            }
                                        }
                                    },
                                    contentPadding = PaddingValues(horizontal = 12.dp, vertical = 2.dp)
                                ) {
                                    Text("Accept Offer", fontSize = 11.sp)
                                }
                            }
                        }
                    }
                }
            }
        }

        // RESULTS SECTION 2: TARGET INQUIRY DEMAND
        if (targetInquiryResult != null) {
            val res = targetInquiryResult!!
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(containerColor = if (res.isPossible) MaterialTheme.colorScheme.surfaceVariant else MaterialTheme.colorScheme.errorContainer.copy(alpha = 0.2f)),
                    shape = RoundedCornerShape(8.dp)
                ) {
                    Column(modifier = Modifier.padding(14.dp)) {
                        Text(
                            text = if (res.isPossible) "Counter-Offer from ${res.targetTeam.name}" else "Inquiry Declined by ${res.targetTeam.name}",
                            fontWeight = FontWeight.Bold,
                            style = MaterialTheme.typography.titleMedium,
                            color = if (res.isPossible) MaterialTheme.colorScheme.onSurface else MaterialTheme.colorScheme.error
                        )
                        Text(res.message, fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)

                        if (res.isPossible) {
                            Spacer(modifier = Modifier.height(8.dp))
                            Text("Demanded from Your Roster:", fontWeight = FontWeight.SemiBold, fontSize = 12.sp)
                            res.demandedPlayers.forEach { p ->
                                Text("• ${p.name} (${p.positionFirst.shortName}, $${p.salary / 1_000_000}M) - OVR ${p.overallRating}", fontSize = 12.sp)
                            }
                            res.demandedDraftPicks.forEach { dp ->
                                Text("• Round ${dp.round} Draft Pick", fontSize = 12.sp, color = RatingGreen)
                            }

                            Spacer(modifier = Modifier.height(10.dp))

                            Row(
                                modifier = Modifier.fillMaxWidth(),
                                horizontalArrangement = Arrangement.End
                            ) {
                                OutlinedButton(
                                    onClick = {
                                        selectedUserPlayers.clear()
                                        selectedUserDraftPicks.clear()
                                        res.demandedPlayers.forEach { selectedUserPlayers.add(it.id) }
                                        res.demandedDraftPicks.forEach { selectedUserDraftPicks.add(it.id) }
                                        targetInquiryResult = null
                                    },
                                    contentPadding = PaddingValues(horizontal = 8.dp, vertical = 2.dp)
                                ) {
                                    Text("Load into Trade Machine", fontSize = 11.sp)
                                }

                                Spacer(modifier = Modifier.width(8.dp))

                                Button(
                                    onClick = {
                                        val uTeam = userTeamObj ?: return@Button
                                        val proposal = TradeProposal(
                                            teamAId = uTeam.id,
                                            teamBId = res.targetTeam.id,
                                            teamAPlayerIds = res.demandedPlayers.map { it.id },
                                            teamBPlayerIds = selectedPartnerPlayers.toList(),
                                            teamADraftPickIds = res.demandedDraftPicks.map { it.id },
                                            teamBDraftPickIds = selectedPartnerDraftPicks.toList()
                                        )
                                        scope.launch {
                                            val tradeRes = repository.executeTrade(proposal)
                                            tradeResult = tradeRes
                                            showResultDialog = true
                                            if (tradeRes.isAccepted) {
                                                selectedPartnerPlayers.clear()
                                                selectedPartnerDraftPicks.clear()
                                                targetInquiryResult = null
                                                refreshPicks()
                                                game?.let { viewModel.loadGame(it.id) }
                                            }
                                        }
                                    },
                                    contentPadding = PaddingValues(horizontal = 12.dp, vertical = 2.dp)
                                ) {
                                    Text("Accept Counter-Offer", fontSize = 11.sp)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Trade Evaluation Result Dialog
    if (showResultDialog && tradeResult != null) {
        val result = tradeResult!!
        AlertDialog(
            onDismissRequest = { showResultDialog = false },
            title = {
                Text(
                    text = if (result.isAccepted) "Trade Approved! 🎉" else "Trade Rejected ❌",
                    color = if (result.isAccepted) RatingGreen else RatingRed,
                    fontWeight = FontWeight.Bold
                )
            },
            text = {
                Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                    Text(result.reasonMessage, style = MaterialTheme.typography.bodyMedium)
                }
            },
            confirmButton = {
                Button(onClick = { showResultDialog = false }) {
                    Text("OK")
                }
            }
        )
    }
}
