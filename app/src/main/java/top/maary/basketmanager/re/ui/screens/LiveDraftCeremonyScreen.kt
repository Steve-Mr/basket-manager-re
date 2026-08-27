package top.maary.basketmanager.re.ui.screens

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
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
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.launch
import top.maary.basketmanager.re.domain.engine.DraftEngine
import top.maary.basketmanager.re.domain.model.DraftPick
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Position
import top.maary.basketmanager.re.ui.components.PlayerDetailBottomSheet
import top.maary.basketmanager.re.ui.components.PositionBadge
import top.maary.basketmanager.re.ui.components.RatingBadge
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

data class DraftedLogItem(
    val round: Int,
    val pick: Int,
    val teamName: String,
    val player: Player,
    val salary: Int,
    val years: Int
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LiveDraftCeremonyScreen(
    viewModel: GameDashboardViewModel
) {
    val game by viewModel.game.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()
    val draftPicks by viewModel.draftPicks.collectAsState()
    val scope = rememberCoroutineScope()

    var availableProspects by remember { mutableStateOf<List<Player>>(emptyList()) }
    var selectedProspectForDraft by remember { mutableStateOf<Player?>(null) }
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }
    var draftLog by remember { mutableStateOf<List<DraftedLogItem>>(emptyList()) }
    var isSimulatingDraft by remember { mutableStateOf(false) }

    var selectedTab by remember { mutableIntStateOf(0) } // 0: Big Board, 1: Draft Log, 2: Remaining Order
    var positionFilter by remember { mutableStateOf<Position?>(null) }
    var confirmDraftPlayer by remember { mutableStateOf<Player?>(null) }

    val teamMap = remember(allTeams) { allTeams.associateBy { it.id } }

    fun refreshProspects() {
        viewModel.getDraftProspects { list ->
            availableProspects = list
        }
    }

    LaunchedEffect(game?.id) {
        refreshProspects()
    }

    val currentPick = draftPicks.firstOrNull()
    val isUserOnTheClock = currentPick != null && currentPick.currentTeamId == userTeam?.id

    val filteredProspects = remember(availableProspects, positionFilter) {
        if (positionFilter == null) availableProspects
        else availableProspects.filter { it.positionFirst == positionFilter || it.positionSecond == positionFilter }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp, vertical = 10.dp)
    ) {
        // Top Header
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column {
                Text(
                    text = "Live Rookie Draft Ceremony",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.ExtraBold
                )
                Text(
                    text = "Season ${game?.currentSeason ?: 1} • 60 Total Picks (Round 1 & Round 2)",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Surface(
                shape = RoundedCornerShape(8.dp),
                color = if (draftPicks.isEmpty()) RatingGreen.copy(alpha = 0.2f) else Color(0xFFFFD700).copy(alpha = 0.2f)
            ) {
                Text(
                    text = if (draftPicks.isEmpty()) "DRAFT COMPLETED" else "LIVE ON THE CLOCK",
                    fontSize = 11.sp,
                    fontWeight = FontWeight.ExtraBold,
                    color = if (draftPicks.isEmpty()) RatingGreen else Color(0xFFB45309),
                    modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp)
                )
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        // On the Clock Hero Banner
        if (currentPick != null) {
            val pickingTeam = teamMap[currentPick.currentTeamId]
            val (rookieSalary, rookieYears) = DraftEngine.calculateRookieSalary(currentPick.round, currentPick.position ?: 1)

            Card(
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(12.dp),
                border = if (isUserOnTheClock) BorderStroke(2.dp, Color(0xFFFFD700)) else null,
                colors = CardDefaults.cardColors(
                    containerColor = if (isUserOnTheClock) MaterialTheme.colorScheme.primaryContainer
                    else MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(modifier = Modifier.padding(14.dp)) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column {
                            Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                                if (isUserOnTheClock) {
                                    Text("👑", fontSize = 16.sp)
                                    Text(
                                        text = "YOU ARE ON THE CLOCK!",
                                        fontWeight = FontWeight.ExtraBold,
                                        color = MaterialTheme.colorScheme.onPrimaryContainer,
                                        fontSize = 15.sp
                                    )
                                } else {
                                    Text(
                                        text = "ON THE CLOCK: ${pickingTeam?.name ?: "CPU Team"}",
                                        fontWeight = FontWeight.Bold,
                                        fontSize = 15.sp
                                    )
                                }
                            }
                            Text(
                                text = "Round ${currentPick.round} • Pick #${currentPick.position ?: 1} • Contract: $${rookieSalary / 1_000_000.0}M/yr ($rookieYears Years)",
                                fontSize = 12.sp,
                                color = if (isUserOnTheClock) MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.8f)
                                else MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }

                        if (isUserOnTheClock) {
                            Surface(
                                shape = RoundedCornerShape(6.dp),
                                color = MaterialTheme.colorScheme.primary
                            ) {
                                Text(
                                    text = "YOUR PICK",
                                    fontSize = 11.sp,
                                    fontWeight = FontWeight.Bold,
                                    color = Color.White,
                                    modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp)
                                )
                            }
                        }
                    }

                    Spacer(modifier = Modifier.height(10.dp))

                    // Action Buttons Row
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        if (isUserOnTheClock) {
                            Button(
                                onClick = {
                                    val target = selectedProspectForDraft ?: availableProspects.firstOrNull()
                                    if (target != null) confirmDraftPlayer = target
                                },
                                enabled = availableProspects.isNotEmpty() && !isSimulatingDraft,
                                shape = RoundedCornerShape(8.dp),
                                modifier = Modifier.weight(1f)
                            ) {
                                Icon(Icons.Default.HowToVote, contentDescription = null, modifier = Modifier.size(16.dp))
                                Spacer(modifier = Modifier.width(6.dp))
                                Text(
                                    text = if (selectedProspectForDraft != null) "Draft ${selectedProspectForDraft?.name}" else "Draft Selected",
                                    fontWeight = FontWeight.Bold,
                                    fontSize = 12.sp
                                )
                            }

                            OutlinedButton(
                                onClick = {
                                    val best = availableProspects.firstOrNull()
                                    if (best != null) confirmDraftPlayer = best
                                },
                                enabled = availableProspects.isNotEmpty() && !isSimulatingDraft,
                                shape = RoundedCornerShape(8.dp)
                            ) {
                                Text("Auto Best", fontSize = 12.sp)
                            }
                        } else {
                            Button(
                                onClick = {
                                    isSimulatingDraft = true
                                    viewModel.simulateDraftUntilUser { results ->
                                        isSimulatingDraft = false
                                        refreshProspects()
                                        val newLogs = results.map { (p, pl) ->
                                            val (sal, yr) = DraftEngine.calculateRookieSalary(p.round, p.position ?: 1)
                                            DraftedLogItem(
                                                round = p.round,
                                                pick = p.position ?: 1,
                                                teamName = teamMap[p.currentTeamId]?.name ?: "Team",
                                                player = pl,
                                                salary = sal,
                                                years = yr
                                            )
                                        }
                                        draftLog = draftLog + newLogs
                                    }
                                },
                                enabled = !isSimulatingDraft,
                                shape = RoundedCornerShape(8.dp),
                                modifier = Modifier.weight(1f)
                            ) {
                                Icon(Icons.Default.FastForward, contentDescription = null, modifier = Modifier.size(16.dp))
                                Spacer(modifier = Modifier.width(6.dp))
                                Text("Sim to My Pick ⚡", fontSize = 12.sp, fontWeight = FontWeight.Bold)
                            }

                            OutlinedButton(
                                onClick = {
                                    isSimulatingDraft = true
                                    viewModel.executeCpuDraftPick(currentPick.id) { pl ->
                                        isSimulatingDraft = false
                                        refreshProspects()
                                        if (pl != null) {
                                            val (sal, yr) = DraftEngine.calculateRookieSalary(currentPick.round, currentPick.position ?: 1)
                                            val item = DraftedLogItem(
                                                round = currentPick.round,
                                                pick = currentPick.position ?: 1,
                                                teamName = pickingTeam?.name ?: "Team",
                                                player = pl,
                                                salary = sal,
                                                years = yr
                                            )
                                            draftLog = draftLog + item
                                        }
                                    }
                                },
                                enabled = !isSimulatingDraft,
                                shape = RoundedCornerShape(8.dp)
                            ) {
                                Text("Next Pick >", fontSize = 12.sp)
                            }
                        }
                    }
                }
            }
        } else {
            Card(
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(12.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer)
            ) {
                Column(modifier = Modifier.padding(16.dp), horizontalAlignment = Alignment.CenterHorizontally) {
                    Icon(Icons.Default.EmojiEvents, contentDescription = null, tint = Color(0xFFFFD700), modifier = Modifier.size(40.dp))
                    Spacer(modifier = Modifier.height(6.dp))
                    Text("Draft Ceremony Concluded!", fontWeight = FontWeight.Bold, style = MaterialTheme.typography.titleMedium)
                    Text("All 60 draft picks have been signed. Remaining prospects entered Free Agency.", fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                }
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        // Tabs
        TabRow(selectedTabIndex = selectedTab) {
            Tab(selected = selectedTab == 0, onClick = { selectedTab = 0 }, text = { Text("Available Board (${availableProspects.size})") })
            Tab(selected = selectedTab == 1, onClick = { selectedTab = 1 }, text = { Text("Draft Log (${draftLog.size})") })
            Tab(selected = selectedTab == 2, onClick = { selectedTab = 2 }, text = { Text("Picks Left (${draftPicks.size})") })
        }

        Spacer(modifier = Modifier.height(8.dp))

        when (selectedTab) {
            0 -> {
                // Tab 0: Big Board
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .horizontalScroll(rememberScrollState()),
                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                ) {
                    FilterChip(
                        selected = positionFilter == null,
                        onClick = { positionFilter = null },
                        label = { Text("All (${availableProspects.size})") }
                    )
                    Position.entries.filter { it != Position.NONE }.forEach { pos ->
                        FilterChip(
                            selected = positionFilter == pos,
                            onClick = { positionFilter = if (positionFilter == pos) null else pos },
                            label = { Text(pos.shortName) }
                        )
                    }
                }

                Spacer(modifier = Modifier.height(6.dp))

                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    itemsIndexed(filteredProspects) { index, prospect ->
                        val isSelected = selectedProspectForDraft?.id == prospect.id

                        Card(
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable {
                                    selectedProspectForDraft = prospect
                                    selectedPlayerForDetail = prospect
                                },
                            shape = RoundedCornerShape(10.dp),
                            border = if (isSelected) BorderStroke(2.dp, MaterialTheme.colorScheme.primary) else null,
                            colors = CardDefaults.cardColors(
                                containerColor = if (isSelected) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.4f)
                                else MaterialTheme.colorScheme.surfaceVariant
                            )
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
                                    Surface(
                                        shape = RoundedCornerShape(6.dp),
                                        color = MaterialTheme.colorScheme.surface
                                    ) {
                                        Text(
                                            text = "#${index + 1}",
                                            fontSize = 11.sp,
                                            fontWeight = FontWeight.Bold,
                                            modifier = Modifier.padding(horizontal = 6.dp, vertical = 4.dp),
                                            color = MaterialTheme.colorScheme.onSurfaceVariant
                                        )
                                    }

                                    RatingBadge(rating = prospect.overallRating)

                                    Column {
                                        Text(prospect.name, fontWeight = FontWeight.Bold, fontSize = 14.sp)
                                        Row(horizontalArrangement = Arrangement.spacedBy(6.dp), verticalAlignment = Alignment.CenterVertically) {
                                            PositionBadge(position = prospect.positionFirst)
                                            Text("Age: ${prospect.age}", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                                            Text("POT: ★${prospect.potential}", fontSize = 11.sp, fontWeight = FontWeight.Bold, color = Color(0xFFD97706))
                                        }
                                    }
                                }

                                if (isUserOnTheClock) {
                                    Button(
                                        onClick = { confirmDraftPlayer = prospect },
                                        shape = RoundedCornerShape(8.dp)
                                    ) {
                                        Text("Select", fontSize = 12.sp)
                                    }
                                }
                            }
                        }
                    }
                }
            }

            1 -> {
                // Tab 1: Draft Log
                if (draftLog.isEmpty()) {
                    Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                        Text("No draft picks executed yet.", color = MaterialTheme.colorScheme.onSurfaceVariant)
                    }
                } else {
                    LazyColumn(
                        modifier = Modifier.fillMaxSize(),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        items(draftLog.reversed()) { log ->
                            Card(
                                modifier = Modifier.fillMaxWidth(),
                                shape = RoundedCornerShape(10.dp),
                                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
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
                                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                                    ) {
                                        Surface(
                                            shape = RoundedCornerShape(4.dp),
                                            color = MaterialTheme.colorScheme.primary
                                        ) {
                                            Text(
                                                text = "R${log.round} #${log.pick}",
                                                fontSize = 11.sp,
                                                fontWeight = FontWeight.Bold,
                                                color = Color.White,
                                                modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                                            )
                                        }
                                        Column {
                                            Text("${log.teamName} selected ${log.player.name}", fontWeight = FontWeight.Bold, fontSize = 13.sp)
                                            Text("${log.player.positionFirst.shortName} • Rating ${log.player.overallRating} • $${log.salary / 1_000_000.0}M/yr (${log.years}y)", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            2 -> {
                // Tab 2: Remaining Picks Order
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(draftPicks) { pick ->
                        val team = teamMap[pick.currentTeamId]
                        val isMyPick = pick.currentTeamId == userTeam?.id

                        Card(
                            modifier = Modifier.fillMaxWidth(),
                            shape = RoundedCornerShape(8.dp),
                            colors = CardDefaults.cardColors(
                                containerColor = if (isMyPick) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.5f)
                                else MaterialTheme.colorScheme.surfaceVariant
                            )
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(10.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Row(horizontalArrangement = Arrangement.spacedBy(8.dp), verticalAlignment = Alignment.CenterVertically) {
                                    Text("Round ${pick.round} • Pick #${pick.position ?: 1}", fontWeight = FontWeight.Bold, fontSize = 12.sp)
                                    Text("Team: ${team?.name ?: "Unknown"}", fontSize = 12.sp)
                                }

                                if (isMyPick) {
                                    Surface(
                                        shape = RoundedCornerShape(4.dp),
                                        color = MaterialTheme.colorScheme.primary
                                    ) {
                                        Text(
                                            text = "USER",
                                            fontSize = 10.sp,
                                            fontWeight = FontWeight.Bold,
                                            color = Color.White,
                                            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Confirm Draft Dialog
    confirmDraftPlayer?.let { player ->
        val currentP = currentPick
        val (rookieSalary, rookieYears) = if (currentP != null) {
            DraftEngine.calculateRookieSalary(currentP.round, currentP.position ?: 1)
        } else (500_000 to 2)

        AlertDialog(
            onDismissRequest = { confirmDraftPlayer = null },
            title = { Text("Draft ${player.name}?") },
            text = {
                Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                    Text("Are you sure you want to select ${player.name} with Round ${currentP?.round ?: 1} Pick #${currentP?.position ?: 1}?")
                    Spacer(modifier = Modifier.height(4.dp))
                    Text("• Position: ${player.positionFirst.shortName}")
                    Text("• Overall Rating: ${player.overallRating}")
                    Text("• Potential: ★${player.potential}")
                    Text("• Contract: $${rookieSalary / 1_000_000.0}M/yr for $rookieYears Years (Guaranteed)")
                }
            },
            confirmButton = {
                Button(
                    onClick = {
                        val p = confirmDraftPlayer ?: return@Button
                        val pick = currentP ?: return@Button
                        confirmDraftPlayer = null
                        viewModel.selectDraftPick(p.id, pick.id) { success ->
                            if (success) {
                                refreshProspects()
                                val item = DraftedLogItem(
                                    round = pick.round,
                                    pick = pick.position ?: 1,
                                    teamName = userTeam?.name ?: "User Team",
                                    player = p,
                                    salary = rookieSalary,
                                    years = rookieYears
                                )
                                draftLog = draftLog + item
                                selectedProspectForDraft = null
                            }
                        }
                    }
                ) {
                    Text("Confirm Pick")
                }
            },
            dismissButton = {
                TextButton(onClick = { confirmDraftPlayer = null }) {
                    Text("Cancel")
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
