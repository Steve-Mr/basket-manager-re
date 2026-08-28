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

    val userTeam by viewModel.userTeam.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()
    val userRoster by viewModel.userRoster.collectAsState()

    var activeTab by remember { mutableIntStateOf(0) } // 0: Trade Machine, 1: Shop Assets, 2: Target Inquiry

    var selectedPartnerTeam by remember { mutableStateOf<Team?>(null) }
    var partnerRoster by remember { mutableStateOf<List<Player>>(emptyList()) }
    var userDraftPicks by remember { mutableStateOf<List<DraftPick>>(emptyList()) }
    var partnerDraftPicks by remember { mutableStateOf<List<DraftPick>>(emptyList()) }

    // Trade Machine Multi-Asset Selections
    val selectedUserPlayers = remember { mutableStateListOf<Long>() }
    val selectedPartnerPlayers = remember { mutableStateListOf<Long>() }
    val selectedUserDraftPicks = remember { mutableStateListOf<Long>() }
    val selectedPartnerDraftPicks = remember { mutableStateListOf<Long>() }

    // Shop Assets State
    val shopSelectedPlayers = remember { mutableStateListOf<Long>() }
    val shopSelectedPicks = remember { mutableStateListOf<Long>() }
    var cpuBids by remember { mutableStateOf<List<CpuTradeBid>?>(null) }
    var isSearchingShopOffers by remember { mutableStateOf(false) }

    // Target Inquiry State
    val targetInquirySelectedPlayers = remember { mutableStateListOf<Long>() }
    val targetInquirySelectedPicks = remember { mutableStateListOf<Long>() }
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
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp, vertical = 10.dp)
    ) {
        // Top Tabs: Trade Machine, Shop Assets, Target Inquiry
        TabRow(selectedTabIndex = activeTab) {
            Tab(
                selected = activeTab == 0,
                onClick = { activeTab = 0 },
                text = { Text("🔄 Trade Machine") }
            )
            Tab(
                selected = activeTab == 1,
                onClick = { activeTab = 1 },
                text = { Text("📢 Shop Assets (全联盟询价)") }
            )
            Tab(
                selected = activeTab == 2,
                onClick = { activeTab = 2 },
                text = { Text("🎯 Target Inquiry (索要报价)") }
            )
        }

        Spacer(modifier = Modifier.height(10.dp))

        when (activeTab) {
            0 -> {
                // =========================================================================
                // TAB 0: MEGA TRADE MACHINE (Multi-Asset 3+ Players & Draft Picks)
                // =========================================================================
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column {
                        Text(
                            text = "Mega Trade Machine",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Multi-player (3+ assets) & draft picks allowed",
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }

                    Button(
                        onClick = {
                            val uTeam = userTeam ?: return@Button
                            val pTeam = selectedPartnerTeam ?: return@Button
                            val proposal = TradeProposal(
                                teamAId = uTeam.id,
                                teamBId = pTeam.id,
                                teamAPlayerIds = selectedUserPlayers.toList(),
                                teamBPlayerIds = selectedPartnerPlayers.toList(),
                                teamADraftPickIds = selectedUserDraftPicks.toList(),
                                teamBDraftPickIds = selectedPartnerDraftPicks.toList()
                            )
                            scope.launch {
                                val res = repository.executeTrade(proposal)
                                tradeResult = res
                                showResultDialog = true
                                if (res.isAccepted) {
                                    selectedUserPlayers.clear()
                                    selectedPartnerPlayers.clear()
                                    selectedUserDraftPicks.clear()
                                    selectedPartnerDraftPicks.clear()
                                    viewModel.loadGame(uTeam.gameId)
                                    refreshPicks()
                                }
                            }
                        },
                        enabled = (selectedUserPlayers.isNotEmpty() || selectedUserDraftPicks.isNotEmpty()) &&
                                (selectedPartnerPlayers.isNotEmpty() || selectedPartnerDraftPicks.isNotEmpty()),
                        shape = RoundedCornerShape(8.dp)
                    ) {
                        Icon(Icons.Default.SwapHoriz, contentDescription = null, modifier = Modifier.size(16.dp))
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Propose Trade", fontSize = 12.sp)
                    }
                }

                Spacer(modifier = Modifier.height(8.dp))

                // Partner Team Selector Dropdown
                var teamDropdownExpanded by remember { mutableStateOf(false) }
                Box(modifier = Modifier.fillMaxWidth()) {
                    OutlinedButton(
                        onClick = { teamDropdownExpanded = true },
                        modifier = Modifier.fillMaxWidth(),
                        shape = RoundedCornerShape(8.dp)
                    ) {
                        Text("Trading Partner: ${selectedPartnerTeam?.name ?: "Select Team"}")
                    }
                    DropdownMenu(
                        expanded = teamDropdownExpanded,
                        onDismissRequest = { teamDropdownExpanded = false }
                    ) {
                        allTeams.filter { it.id != userTeam?.id }.forEach { team ->
                            DropdownMenuItem(
                                text = { Text("${team.name} (Cap: $${(team.salaryCap / 1_000_000)}M)") },
                                onClick = {
                                    selectedPartnerTeam = team
                                    teamDropdownExpanded = false
                                }
                            )
                        }
                    }
                }

                Spacer(modifier = Modifier.height(8.dp))

                // Dual Columns: Left (User Assets), Right (Partner Assets)
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .weight(1f),
                    horizontalArrangement = Arrangement.spacedBy(10.dp)
                ) {
                    // Left: My Team Assets
                    Card(
                        modifier = Modifier
                            .weight(1f)
                            .fillMaxHeight(),
                        shape = RoundedCornerShape(12.dp),
                        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                    ) {
                        Column(modifier = Modifier.padding(8.dp)) {
                            Text(
                                text = "${userTeam?.name ?: "My Team"} (${selectedUserPlayers.size + selectedUserDraftPicks.size} selected)",
                                fontWeight = FontWeight.Bold,
                                style = MaterialTheme.typography.titleSmall,
                                color = MaterialTheme.colorScheme.primary
                            )

                            // Draft Picks for User
                            if (userDraftPicks.isNotEmpty()) {
                                Spacer(modifier = Modifier.height(4.dp))
                                Row(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .horizontalScroll(rememberScrollState()),
                                    horizontalArrangement = Arrangement.spacedBy(4.dp)
                                ) {
                                    userDraftPicks.forEach { pick ->
                                        val isPickSel = selectedUserDraftPicks.contains(pick.id)
                                        FilterChip(
                                            selected = isPickSel,
                                            onClick = {
                                                if (isPickSel) selectedUserDraftPicks.remove(pick.id)
                                                else selectedUserDraftPicks.add(pick.id)
                                            },
                                            label = { Text("Pick R${pick.round}", fontSize = 10.sp) }
                                        )
                                    }
                                }
                            }

                            Spacer(modifier = Modifier.height(4.dp))

                            LazyColumn(modifier = Modifier.fillMaxSize()) {
                                items(userRoster) { player ->
                                    val isSelected = selectedUserPlayers.contains(player.id)
                                    Card(
                                        modifier = Modifier
                                            .fillMaxWidth()
                                            .padding(vertical = 3.dp)
                                            .clickable {
                                                if (isSelected) selectedUserPlayers.remove(player.id)
                                                else selectedUserPlayers.add(player.id)
                                            },
                                        shape = RoundedCornerShape(8.dp),
                                        colors = CardDefaults.cardColors(
                                            containerColor = if (isSelected) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surface
                                        )
                                    ) {
                                        Row(
                                            modifier = Modifier.padding(6.dp),
                                            verticalAlignment = Alignment.CenterVertically,
                                            horizontalArrangement = Arrangement.SpaceBetween
                                        ) {
                                            Column(modifier = Modifier.weight(1f)) {
                                                Text(player.shortName, fontWeight = FontWeight.Bold, fontSize = 12.sp)
                                                Text("$${player.salary / 1_000_000.0}M • ${player.positionFirst.shortName}", fontSize = 10.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                                            }
                                            RatingBadge(rating = player.overallRating, size = 24)
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // Right: Partner Team Assets
                    Card(
                        modifier = Modifier
                            .weight(1f)
                            .fillMaxHeight(),
                        shape = RoundedCornerShape(12.dp),
                        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                    ) {
                        Column(modifier = Modifier.padding(8.dp)) {
                            Text(
                                text = "${selectedPartnerTeam?.name ?: "Opponent"} (${selectedPartnerPlayers.size + selectedPartnerDraftPicks.size} selected)",
                                fontWeight = FontWeight.Bold,
                                style = MaterialTheme.typography.titleSmall,
                                color = MaterialTheme.colorScheme.secondary
                            )

                            // Draft Picks for Partner
                            if (partnerDraftPicks.isNotEmpty()) {
                                Spacer(modifier = Modifier.height(4.dp))
                                Row(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .horizontalScroll(rememberScrollState()),
                                    horizontalArrangement = Arrangement.spacedBy(4.dp)
                                ) {
                                    partnerDraftPicks.forEach { pick ->
                                        val isPickSel = selectedPartnerDraftPicks.contains(pick.id)
                                        FilterChip(
                                            selected = isPickSel,
                                            onClick = {
                                                if (isPickSel) selectedPartnerDraftPicks.remove(pick.id)
                                                else selectedPartnerDraftPicks.add(pick.id)
                                            },
                                            label = { Text("Pick R${pick.round}", fontSize = 10.sp) }
                                        )
                                    }
                                }
                            }

                            Spacer(modifier = Modifier.height(4.dp))

                            LazyColumn(modifier = Modifier.fillMaxSize()) {
                                items(partnerRoster) { player ->
                                    val isSelected = selectedPartnerPlayers.contains(player.id)
                                    Card(
                                        modifier = Modifier
                                            .fillMaxWidth()
                                            .padding(vertical = 3.dp)
                                            .clickable {
                                                if (isSelected) selectedPartnerPlayers.remove(player.id)
                                                else selectedPartnerPlayers.add(player.id)
                                            },
                                        shape = RoundedCornerShape(8.dp),
                                        colors = CardDefaults.cardColors(
                                            containerColor = if (isSelected) MaterialTheme.colorScheme.secondaryContainer else MaterialTheme.colorScheme.surface
                                        )
                                    ) {
                                        Row(
                                            modifier = Modifier.padding(6.dp),
                                            verticalAlignment = Alignment.CenterVertically,
                                            horizontalArrangement = Arrangement.SpaceBetween
                                        ) {
                                            Column(modifier = Modifier.weight(1f)) {
                                                Text(player.shortName, fontWeight = FontWeight.Bold, fontSize = 12.sp)
                                                Text("$${player.salary / 1_000_000.0}M • ${player.positionFirst.shortName}", fontSize = 10.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                                            }
                                            RatingBadge(rating = player.overallRating, size = 24)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            1 -> {
                // =========================================================================
                // TAB 1: SHOP MY ASSETS (全联盟询价 / 兜售资产竞价)
                // =========================================================================
                Text(
                    text = "📢 Shop My Assets (全联盟竞价)",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.primary
                )
                Text(
                    text = "Select player(s) or pick(s) from your team to shop. The AI will evaluate all 29 teams and present competitive trade offers.",
                    fontSize = 11.sp,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )

                Spacer(modifier = Modifier.height(8.dp))

                // Selector for My Assets to shop
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(10.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                ) {
                    Column(modifier = Modifier.padding(10.dp)) {
                        Text(
                            text = "Selected Assets to Shop (${shopSelectedPlayers.size} Players, ${shopSelectedPicks.size} Picks):",
                            fontWeight = FontWeight.Bold,
                            fontSize = 12.sp
                        )

                        Spacer(modifier = Modifier.height(6.dp))

                        // Draft picks chips
                        if (userDraftPicks.isNotEmpty()) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .horizontalScroll(rememberScrollState()),
                                horizontalArrangement = Arrangement.spacedBy(4.dp)
                            ) {
                                userDraftPicks.forEach { pick ->
                                    val isSel = shopSelectedPicks.contains(pick.id)
                                    FilterChip(
                                        selected = isSel,
                                        onClick = {
                                            if (isSel) shopSelectedPicks.remove(pick.id) else shopSelectedPicks.add(pick.id)
                                        },
                                        label = { Text("Pick R${pick.round}", fontSize = 10.sp) }
                                    )
                                }
                            }
                            Spacer(modifier = Modifier.height(6.dp))
                        }

                        // Players horizontal selector
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .horizontalScroll(rememberScrollState()),
                            horizontalArrangement = Arrangement.spacedBy(6.dp)
                        ) {
                            userRoster.forEach { p ->
                                val isSel = shopSelectedPlayers.contains(p.id)
                                FilterChip(
                                    selected = isSel,
                                    onClick = {
                                        if (isSel) shopSelectedPlayers.remove(p.id) else shopSelectedPlayers.add(p.id)
                                    },
                                    label = { Text("${p.shortName} (${p.overallRating.toInt()})", fontSize = 11.sp) }
                                )
                            }
                        }

                        Spacer(modifier = Modifier.height(8.dp))

                        Button(
                            onClick = {
                                val uTeam = userTeam ?: return@Button
                                isSearchingShopOffers = true
                                scope.launch {
                                    cpuBids = repository.findShopTradeOffers(uTeam.id, shopSelectedPlayers.toList(), shopSelectedPicks.toList())
                                    isSearchingShopOffers = false
                                }
                            },
                            enabled = shopSelectedPlayers.isNotEmpty() || shopSelectedPicks.isNotEmpty(),
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Icon(Icons.Default.Search, contentDescription = null, modifier = Modifier.size(16.dp))
                            Spacer(modifier = Modifier.width(6.dp))
                            Text("Find All League Trade Offers (全联盟询价)")
                        }
                    }
                }

                Spacer(modifier = Modifier.height(10.dp))

                // List of CPU Bids
                if (isSearchingShopOffers) {
                    Box(modifier = Modifier.fillMaxWidth().padding(24.dp), contentAlignment = Alignment.Center) {
                        CircularProgressIndicator()
                    }
                } else if (cpuBids != null) {
                    val bids = cpuBids!!
                    if (bids.isEmpty()) {
                        Card(modifier = Modifier.fillMaxWidth()) {
                            Text(
                                text = "No teams are currently able to match this trade package (due to salary cap or roster space).",
                                modifier = Modifier.padding(16.dp),
                                fontSize = 12.sp,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    } else {
                        Text("Received ${bids.size} Trade Offers from League:", fontWeight = FontWeight.Bold, fontSize = 13.sp)
                        Spacer(modifier = Modifier.height(6.dp))
                        LazyColumn(
                            modifier = Modifier.fillMaxSize(),
                            verticalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            items(bids) { bid ->
                                Card(
                                    modifier = Modifier.fillMaxWidth(),
                                    shape = RoundedCornerShape(10.dp),
                                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                                ) {
                                    Column(modifier = Modifier.padding(12.dp)) {
                                        Row(
                                            modifier = Modifier.fillMaxWidth(),
                                            horizontalArrangement = Arrangement.SpaceBetween,
                                            verticalAlignment = Alignment.CenterVertically
                                        ) {
                                            Text(
                                                text = bid.partnerTeam.name,
                                                fontWeight = FontWeight.Bold,
                                                fontSize = 14.sp,
                                                color = MaterialTheme.colorScheme.primary
                                            )
                                            Text(
                                                text = "Cap Impact: ${if (bid.salaryNetChange >= 0) "+$" else "-$"}${kotlin.math.abs(bid.salaryNetChange) / 1_000_000.0}M",
                                                fontSize = 11.sp,
                                                fontWeight = FontWeight.SemiBold,
                                                color = if (bid.salaryNetChange <= 0) RatingGreen else RatingRed
                                            )
                                        }

                                        Spacer(modifier = Modifier.height(4.dp))
                                        Text(text = bid.summaryNote, fontSize = 12.sp)

                                        Spacer(modifier = Modifier.height(8.dp))

                                        Row(
                                            modifier = Modifier.fillMaxWidth(),
                                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                                        ) {
                                            Button(
                                                onClick = {
                                                    val uTeam = userTeam ?: return@Button
                                                    val proposal = TradeProposal(
                                                        teamAId = uTeam.id,
                                                        teamBId = bid.partnerTeam.id,
                                                        teamAPlayerIds = shopSelectedPlayers.toList(),
                                                        teamBPlayerIds = bid.offeredPlayers.map { it.id },
                                                        teamADraftPickIds = shopSelectedPicks.toList(),
                                                        teamBDraftPickIds = bid.offeredDraftPicks.map { it.id }
                                                    )
                                                    scope.launch {
                                                        val res = repository.executeTrade(proposal)
                                                        tradeResult = res
                                                        showResultDialog = true
                                                        if (res.isAccepted) {
                                                            shopSelectedPlayers.clear()
                                                            shopSelectedPicks.clear()
                                                            cpuBids = null
                                                            viewModel.loadGame(uTeam.gameId)
                                                            refreshPicks()
                                                        }
                                                    }
                                                },
                                                modifier = Modifier.weight(1f),
                                                shape = RoundedCornerShape(8.dp)
                                            ) {
                                                Text("Accept Trade", fontSize = 12.sp)
                                            }

                                            OutlinedButton(
                                                onClick = {
                                                    // Load into Trade Machine tab
                                                    selectedPartnerTeam = bid.partnerTeam
                                                    selectedUserPlayers.clear()
                                                    selectedUserPlayers.addAll(shopSelectedPlayers)
                                                    selectedUserDraftPicks.clear()
                                                    selectedUserDraftPicks.addAll(shopSelectedPicks)

                                                    selectedPartnerPlayers.clear()
                                                    selectedPartnerPlayers.addAll(bid.offeredPlayers.map { it.id })
                                                    selectedPartnerDraftPicks.clear()
                                                    selectedPartnerDraftPicks.addAll(bid.offeredDraftPicks.map { it.id })

                                                    activeTab = 0
                                                },
                                                modifier = Modifier.weight(1f),
                                                shape = RoundedCornerShape(8.dp)
                                            ) {
                                                Text("Modify in Machine", fontSize = 12.sp)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            2 -> {
                // =========================================================================
                // TAB 2: TARGET ASSET INQUIRY (索要对方报价)
                // =========================================================================
                Text(
                    text = "🎯 Target Inquiry (索要对方资产要价)",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.primary
                )
                Text(
                    text = "Pick the target team and the specific player(s)/pick(s) you desire. The target team will formulate their requested return package.",
                    fontSize = 11.sp,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )

                Spacer(modifier = Modifier.height(8.dp))

                // Target Partner Team Dropdown
                var partnerDropdownExp by remember { mutableStateOf(false) }
                Box(modifier = Modifier.fillMaxWidth()) {
                    OutlinedButton(
                        onClick = { partnerDropdownExp = true },
                        modifier = Modifier.fillMaxWidth(),
                        shape = RoundedCornerShape(8.dp)
                    ) {
                        Text("Target Team: ${selectedPartnerTeam?.name ?: "Select Team"}")
                    }
                    DropdownMenu(
                        expanded = partnerDropdownExp,
                        onDismissRequest = { partnerDropdownExp = false }
                    ) {
                        allTeams.filter { it.id != userTeam?.id }.forEach { team ->
                            DropdownMenuItem(
                                text = { Text(team.name) },
                                onClick = {
                                    selectedPartnerTeam = team
                                    targetInquirySelectedPlayers.clear()
                                    targetInquirySelectedPicks.clear()
                                    targetInquiryResult = null
                                    partnerDropdownExp = false
                                }
                            )
                        }
                    }
                }

                Spacer(modifier = Modifier.height(8.dp))

                // Select Desired Assets from Partner
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(10.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                ) {
                    Column(modifier = Modifier.padding(10.dp)) {
                        Text(
                            text = "Select Desired Asset(s) from ${selectedPartnerTeam?.name ?: "Target"}:",
                            fontWeight = FontWeight.Bold,
                            fontSize = 12.sp
                        )

                        // Picks selector
                        if (partnerDraftPicks.isNotEmpty()) {
                            Spacer(modifier = Modifier.height(4.dp))
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .horizontalScroll(rememberScrollState()),
                                horizontalArrangement = Arrangement.spacedBy(4.dp)
                            ) {
                                partnerDraftPicks.forEach { pick ->
                                    val isSel = targetInquirySelectedPicks.contains(pick.id)
                                    FilterChip(
                                        selected = isSel,
                                        onClick = {
                                            if (isSel) targetInquirySelectedPicks.remove(pick.id)
                                            else targetInquirySelectedPicks.add(pick.id)
                                        },
                                        label = { Text("Pick R${pick.round}", fontSize = 10.sp) }
                                    )
                                }
                            }
                        }

                        Spacer(modifier = Modifier.height(4.dp))

                        // Players horizontal selector
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .horizontalScroll(rememberScrollState()),
                            horizontalArrangement = Arrangement.spacedBy(6.dp)
                        ) {
                            partnerRoster.forEach { p ->
                                val isSel = targetInquirySelectedPlayers.contains(p.id)
                                FilterChip(
                                    selected = isSel,
                                    onClick = {
                                        if (isSel) targetInquirySelectedPlayers.remove(p.id)
                                        else targetInquirySelectedPlayers.add(p.id)
                                    },
                                    label = { Text("${p.shortName} (${p.overallRating.toInt()})", fontSize = 11.sp) }
                                )
                            }
                        }

                        Spacer(modifier = Modifier.height(8.dp))

                        Button(
                            onClick = {
                                val uTeam = userTeam ?: return@Button
                                val pTeam = selectedPartnerTeam ?: return@Button
                                isSearchingTargetDemand = true
                                scope.launch {
                                    targetInquiryResult = repository.askTargetTradeDemand(
                                        userTeamId = uTeam.id,
                                        targetTeamId = pTeam.id,
                                        requestedPlayerIds = targetInquirySelectedPlayers.toList(),
                                        requestedDraftPickIds = targetInquirySelectedPicks.toList()
                                    )
                                    isSearchingTargetDemand = false
                                }
                            },
                            enabled = targetInquirySelectedPlayers.isNotEmpty() || targetInquirySelectedPicks.isNotEmpty(),
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Icon(Icons.Default.HelpOutline, contentDescription = null, modifier = Modifier.size(16.dp))
                            Spacer(modifier = Modifier.width(6.dp))
                            Text("Ask What They Want (索要报价)")
                        }
                    }
                }

                Spacer(modifier = Modifier.height(10.dp))

                // Target Inquiry Result Card
                if (isSearchingTargetDemand) {
                    Box(modifier = Modifier.fillMaxWidth().padding(24.dp), contentAlignment = Alignment.Center) {
                        CircularProgressIndicator()
                    }
                } else if (targetInquiryResult != null) {
                    val res = targetInquiryResult!!
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        shape = RoundedCornerShape(10.dp),
                        colors = CardDefaults.cardColors(
                            containerColor = if (res.isPossible) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.5f)
                            else MaterialTheme.colorScheme.errorContainer.copy(alpha = 0.5f)
                        )
                    ) {
                        Column(modifier = Modifier.padding(14.dp)) {
                            Text(
                                text = if (res.isPossible) "Counter Proposal Received! ✅" else "Trade Not Feasible ❌",
                                fontWeight = FontWeight.Bold,
                                fontSize = 14.sp,
                                color = if (res.isPossible) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.error
                            )
                            Spacer(modifier = Modifier.height(6.dp))
                            Text(text = res.message, fontSize = 12.sp)

                            if (res.isPossible) {
                                Spacer(modifier = Modifier.height(10.dp))
                                Row(
                                    modifier = Modifier.fillMaxWidth(),
                                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                                ) {
                                    Button(
                                        onClick = {
                                            val uTeam = userTeam ?: return@Button
                                            val pTeam = selectedPartnerTeam ?: return@Button
                                            val proposal = TradeProposal(
                                                teamAId = uTeam.id,
                                                teamBId = pTeam.id,
                                                teamAPlayerIds = res.demandedPlayers.map { it.id },
                                                teamBPlayerIds = targetInquirySelectedPlayers.toList(),
                                                teamADraftPickIds = res.demandedDraftPicks.map { it.id },
                                                teamBDraftPickIds = targetInquirySelectedPicks.toList()
                                            )
                                            scope.launch {
                                                val tradeRes = repository.executeTrade(proposal)
                                                tradeResult = tradeRes
                                                showResultDialog = true
                                                if (tradeRes.isAccepted) {
                                                    targetInquirySelectedPlayers.clear()
                                                    targetInquirySelectedPicks.clear()
                                                    targetInquiryResult = null
                                                    viewModel.loadGame(uTeam.gameId)
                                                    refreshPicks()
                                                }
                                            }
                                        },
                                        modifier = Modifier.weight(1f),
                                        shape = RoundedCornerShape(8.dp)
                                    ) {
                                        Text("Accept Proposal", fontSize = 12.sp)
                                    }

                                    OutlinedButton(
                                        onClick = {
                                            // Load into Trade Machine tab
                                            selectedPartnerTeam = res.targetTeam
                                            selectedUserPlayers.clear()
                                            selectedUserPlayers.addAll(res.demandedPlayers.map { it.id })
                                            selectedUserDraftPicks.clear()
                                            selectedUserDraftPicks.addAll(res.demandedDraftPicks.map { it.id })

                                            selectedPartnerPlayers.clear()
                                            selectedPartnerPlayers.addAll(targetInquirySelectedPlayers)
                                            selectedPartnerDraftPicks.clear()
                                            selectedPartnerDraftPicks.addAll(targetInquirySelectedPicks)

                                            activeTab = 0
                                        },
                                        modifier = Modifier.weight(1f),
                                        shape = RoundedCornerShape(8.dp)
                                    ) {
                                        Text("Modify in Machine", fontSize = 12.sp)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    if (showResultDialog && tradeResult != null) {
        AlertDialog(
            onDismissRequest = { showResultDialog = false },
            title = { Text(if (tradeResult!!.isAccepted) "Trade Accepted! 🎉" else "Trade Rejected ❌") },
            text = { Text(tradeResult!!.reasonMessage) },
            confirmButton = {
                Button(onClick = { showResultDialog = false }) {
                    Text("OK")
                }
            }
        )
    }
}
