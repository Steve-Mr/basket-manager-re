package top.maary.basketmanager.re.ui.screens

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
import top.maary.basketmanager.re.BasketManagerApplication
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
    val repository = remember { BasketManagerApplication.instance.gameRepository }
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

    var viewMode by remember { mutableIntStateOf(0) } // 0: Available Board, 1: Draft Log
    var positionFilter by remember { mutableStateOf<Position?>(null) }
    var confirmDraftPlayer by remember { mutableStateOf<Player?>(null) }

    val teamMap = remember(allTeams) { allTeams.associateBy { it.id } }

    fun refreshProspects() {
        viewModel.getDraftProspects { list ->
            availableProspects = list
        }
    }

    fun loadDraftHistory() {
        val g = game ?: return
        scope.launch {
            val news = repository.getNews(g.id).filter { it.title.startsWith("Draft Pick:") }
            val players = repository.getPlayers(g.id).associateBy { it.id }
            val history = news.mapNotNull { n ->
                val pl = n.playerId?.let { players[it] } ?: return@mapNotNull null
                val t = n.team1Id?.let { teamMap[it] }
                DraftedLogItem(
                    round = if (n.body.contains("Round 1")) 1 else 2,
                    pick = Regex("#([0-9]+)").find(n.body)?.groupValues?.get(1)?.toIntOrNull() ?: 1,
                    teamName = t?.name ?: "Team",
                    player = pl,
                    salary = pl.salary,
                    years = pl.yearsContract
                )
            }
            if (history.isNotEmpty()) {
                draftLog = history
            }
        }
    }

    LaunchedEffect(game?.id) {
        viewModel.ensureDraftReady {
            refreshProspects()
            loadDraftHistory()
        }
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
            .padding(horizontal = 12.dp, vertical = 6.dp)
    ) {
        // COMPACT ON-THE-CLOCK DRAFT CONTROLLER HEADER
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(10.dp),
            border = if (isUserOnTheClock) BorderStroke(1.5.dp, Color(0xFFFFD700)) else null,
            colors = CardDefaults.cardColors(
                containerColor = if (isUserOnTheClock) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.8f)
                else MaterialTheme.colorScheme.surfaceVariant
            )
        ) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 12.dp, vertical = 8.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                if (currentPick != null) {
                    val pickingTeam = teamMap[currentPick.currentTeamId]
                    val (rookieSalary, rookieYears) = DraftEngine.calculateRookieSalary(currentPick.round, currentPick.position ?: 1)

                    Column(modifier = Modifier.weight(1f)) {
                        Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                            Text(
                                text = "Pick #${currentPick.position ?: 1} (R${currentPick.round})",
                                fontWeight = FontWeight.ExtraBold,
                                fontSize = 13.sp,
                                color = if (isUserOnTheClock) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurface
                            )
                            if (isUserOnTheClock) {
                                Surface(shape = RoundedCornerShape(4.dp), color = MaterialTheme.colorScheme.primary) {
                                    Text("YOUR TURN", fontSize = 9.sp, fontWeight = FontWeight.Bold, color = Color.White, modifier = Modifier.padding(horizontal = 4.dp, vertical = 1.dp))
                                }
                            } else {
                                Text("• ${pickingTeam?.name ?: "CPU"}", fontWeight = FontWeight.Bold, fontSize = 13.sp)
                            }
                        }
                        Text(
                            text = "$${rookieSalary / 1_000_000.0}M/yr (${rookieYears}y) • ${draftPicks.size} picks left",
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }

                    // Action buttons
                    Row(horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                        if (isUserOnTheClock) {
                            Button(
                                onClick = {
                                    val target = selectedProspectForDraft ?: availableProspects.firstOrNull()
                                    if (target != null) confirmDraftPlayer = target
                                },
                                enabled = availableProspects.isNotEmpty() && !isSimulatingDraft,
                                contentPadding = PaddingValues(horizontal = 10.dp, vertical = 4.dp),
                                shape = RoundedCornerShape(6.dp)
                            ) {
                                Text(
                                    text = if (selectedProspectForDraft != null) "Draft ${selectedProspectForDraft?.shortName}" else "Draft Selected",
                                    fontSize = 11.sp,
                                    fontWeight = FontWeight.Bold
                                )
                            }

                            OutlinedButton(
                                onClick = {
                                    val best = availableProspects.firstOrNull()
                                    if (best != null) confirmDraftPlayer = best
                                },
                                enabled = availableProspects.isNotEmpty() && !isSimulatingDraft,
                                contentPadding = PaddingValues(horizontal = 8.dp, vertical = 4.dp),
                                shape = RoundedCornerShape(6.dp)
                            ) {
                                Text("Auto Best", fontSize = 11.sp)
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
                                contentPadding = PaddingValues(horizontal = 10.dp, vertical = 4.dp),
                                shape = RoundedCornerShape(6.dp)
                            ) {
                                if (isSimulatingDraft) {
                                    CircularProgressIndicator(modifier = Modifier.size(14.dp), color = Color.White, strokeWidth = 2.dp)
                                } else {
                                    Text("Sim to My Pick ⚡", fontSize = 11.sp, fontWeight = FontWeight.Bold)
                                }
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
                                contentPadding = PaddingValues(horizontal = 8.dp, vertical = 4.dp),
                                shape = RoundedCornerShape(6.dp)
                            ) {
                                Text("Next Pick >", fontSize = 11.sp)
                            }
                        }
                    }
                } else {
                    Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                        Icon(Icons.Default.EmojiEvents, contentDescription = null, tint = Color(0xFFFFD700), modifier = Modifier.size(24.dp))
                        Column {
                            Text("Draft Concluded 🎉", fontWeight = FontWeight.Bold, fontSize = 13.sp)
                            Text("All 60 draft picks completed. Remaining prospects entered Free Agency.", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                        }
                    }
                }
            }
        }

        Spacer(modifier = Modifier.height(6.dp))

        // TOOLBAR: POSITION FILTER CHIPS & VIEW TOGGLE
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row(
                modifier = Modifier
                    .weight(1f)
                    .horizontalScroll(rememberScrollState()),
                horizontalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                FilterChip(
                    selected = viewMode == 0 && positionFilter == null,
                    onClick = { viewMode = 0; positionFilter = null },
                    label = { Text("Board (${availableProspects.size})", fontSize = 11.sp) }
                )
                Position.entries.filter { it != Position.NONE }.forEach { pos ->
                    FilterChip(
                        selected = viewMode == 0 && positionFilter == pos,
                        onClick = { viewMode = 0; positionFilter = if (positionFilter == pos) null else pos },
                        label = { Text(pos.shortName, fontSize = 11.sp) }
                    )
                }
            }

            Spacer(modifier = Modifier.width(6.dp))

            FilterChip(
                selected = viewMode == 1,
                onClick = { viewMode = if (viewMode == 1) 0 else 1 },
                label = { Text("Log (${draftLog.size})", fontSize = 11.sp, fontWeight = FontWeight.SemiBold) },
                leadingIcon = { Icon(Icons.Default.History, contentDescription = null, modifier = Modifier.size(14.dp)) }
            )
        }

        Spacer(modifier = Modifier.height(4.dp))

        // MAIN CONTENT AREA (Takes remaining full screen)
        if (viewMode == 0) {
            // MODE 0: AVAILABLE PROSPECTS LIST
            if (filteredProspects.isEmpty()) {
                Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                    Text(
                        text = if (draftPicks.isEmpty()) "No available prospects remaining." else "Loading prospects...",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(4.dp),
                    contentPadding = PaddingValues(bottom = 16.dp)
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
                            shape = RoundedCornerShape(8.dp),
                            border = if (isSelected) BorderStroke(1.5.dp, MaterialTheme.colorScheme.primary) else null,
                            colors = CardDefaults.cardColors(
                                containerColor = if (isSelected) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.35f)
                                else MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f)
                            )
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
                                    Text(
                                        text = "#${index + 1}",
                                        fontSize = 11.sp,
                                        fontWeight = FontWeight.Bold,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                                        modifier = Modifier.width(28.dp)
                                    )

                                    RatingBadge(rating = prospect.overallRating, size = 26)

                                    PositionBadge(position = prospect.positionFirst)

                                    Column {
                                        Text(prospect.name, fontWeight = FontWeight.Bold, fontSize = 13.sp)
                                        Text(
                                            text = "Age ${prospect.age} • Pot: ${prospect.potential}/10 • Att: ${prospect.attackRating} Def: ${prospect.defenseRating}",
                                            fontSize = 10.sp,
                                            color = MaterialTheme.colorScheme.onSurfaceVariant
                                        )
                                    }
                                }

                                if (isUserOnTheClock) {
                                    IconButton(
                                        onClick = { confirmDraftPlayer = prospect },
                                        modifier = Modifier.size(32.dp)
                                    ) {
                                        Icon(
                                            Icons.Default.AddCircle,
                                            contentDescription = "Draft Player",
                                            tint = MaterialTheme.colorScheme.primary,
                                            modifier = Modifier.size(22.dp)
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            // MODE 1: DRAFT HISTORY LOG
            if (draftLog.isEmpty()) {
                Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                    Text(
                        text = "No picks have been made yet.",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(4.dp),
                    contentPadding = PaddingValues(bottom = 16.dp)
                ) {
                    items(draftLog) { item ->
                        Card(
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable { selectedPlayerForDetail = item.player },
                            shape = RoundedCornerShape(8.dp),
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.4f))
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
                                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                                ) {
                                    Surface(
                                        shape = RoundedCornerShape(4.dp),
                                        color = MaterialTheme.colorScheme.primaryContainer
                                    ) {
                                        Text(
                                            text = "R${item.round} #${item.pick}",
                                            fontSize = 10.sp,
                                            fontWeight = FontWeight.Bold,
                                            color = MaterialTheme.colorScheme.onPrimaryContainer,
                                            modifier = Modifier.padding(horizontal = 4.dp, vertical = 2.dp)
                                        )
                                    }

                                    RatingBadge(rating = item.player.overallRating, size = 24)

                                    Column {
                                        Text(
                                            text = "${item.player.name} (${item.player.positionFirst.shortName})",
                                            fontWeight = FontWeight.Bold,
                                            fontSize = 12.sp
                                        )
                                        Text(
                                            text = "Drafted by ${item.teamName} • $${item.salary / 1_000_000.0}M (${item.years}y)",
                                            fontSize = 10.sp,
                                            color = MaterialTheme.colorScheme.onSurfaceVariant
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

    // Confirm Draft Selection Dialog
    if (confirmDraftPlayer != null && currentPick != null) {
        val target = confirmDraftPlayer!!
        val (rookieSalary, rookieYears) = DraftEngine.calculateRookieSalary(currentPick.round, currentPick.position ?: 1)

        AlertDialog(
            onDismissRequest = { confirmDraftPlayer = null },
            title = {
                Text(
                    text = "Confirm Draft Pick",
                    fontWeight = FontWeight.Bold
                )
            },
            text = {
                Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                    Text("Select ${target.name} with Round ${currentPick.round}, Pick #${currentPick.position}?")
                    Text(
                        text = "• Position: " + target.positionFirst.name + "\n• Rating: " + target.overallRating + " (Potential: " + target.potential + "/10)\n• Contract: $" + (rookieSalary / 1_000_000.0) + "M/yr for " + rookieYears + " seasons",
                        fontSize = 12.sp,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            },
            confirmButton = {
                Button(
                    onClick = {
                        viewModel.selectDraftPick(target.id, currentPick.id) { success ->
                            confirmDraftPlayer = null
                            if (success) {
                                refreshProspects()
                                val draftedItem = DraftedLogItem(
                                    round = currentPick.round,
                                    pick = currentPick.position ?: 1,
                                    teamName = userTeam?.name ?: "My Team",
                                    player = target,
                                    salary = rookieSalary,
                                    years = rookieYears
                                )
                                draftLog = draftLog + draftedItem
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

    // Player Detail Sheet
    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(
            player = player,
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}
