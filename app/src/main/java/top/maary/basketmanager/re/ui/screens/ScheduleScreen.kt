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
import kotlinx.coroutines.launch
import top.maary.basketmanager.re.domain.model.*
import top.maary.basketmanager.re.ui.components.MatchBoxScoreDialog
import top.maary.basketmanager.re.ui.components.PlayoffSeriesHistoryDialog
import top.maary.basketmanager.re.ui.components.VerticalPlayoffBracketView
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ScheduleScreen(
    viewModel: GameDashboardViewModel
) {
    val game by viewModel.game.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()
    val standings by viewModel.standings.collectAsState()
    val playoffSeries by viewModel.playoffSeries.collectAsState()
    val scope = rememberCoroutineScope()

    val currentDay = game?.currentMatchday ?: 1
    val isPostseason = currentDay > 166

    // Primary View Tabs: 0: Calendar Matches, 1: Playoff Bracket Tree
    var selectedViewTab by remember(isPostseason) { mutableIntStateOf(if (isPostseason) 1 else 0) }

    var selectedFilterTeamId by remember { mutableStateOf<Long?>(userTeam?.id) }
    var selectedMatchday by remember { mutableIntStateOf(currentDay.coerceIn(1, 225)) }
    var filterMode by remember { mutableIntStateOf(1) } // 0: By Team, 1: By Matchday Stepper
    var showQuickJumpDialog by remember { mutableStateOf(false) }

    var scheduleList by remember { mutableStateOf<List<Match>>(emptyList()) }
    var selectedMatchForBoxScore by remember { mutableStateOf<Match?>(null) }
    var boxScoreResults by remember { mutableStateOf<List<MatchResult>>(emptyList()) }
    var selectedSeriesForHistory by remember { mutableStateOf<PlayoffSeries?>(null) }

    var targetSimDayToConfirm by remember { mutableStateOf<Int?>(null) }
    var autoAdjustCheckbox by remember { mutableStateOf(false) }
    var simulationHaltNotice by remember { mutableStateOf<String?>(null) }

    val teamMap = remember(allTeams) { allTeams.associateBy { it.id } }

    LaunchedEffect(game?.id, selectedFilterTeamId, selectedMatchday, filterMode, selectedViewTab) {
        val gId = game?.id ?: return@LaunchedEffect
        if (selectedViewTab == 0) {
            if (filterMode == 0) {
                val tId = selectedFilterTeamId ?: userTeam?.id ?: 1L
                val allMatches = viewModel.getTeamSchedule(tId)
                scheduleList = allMatches
            } else {
                scheduleList = viewModel.getMatchesForDay(selectedMatchday)
            }
        }
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
                    text = "Schedule",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Season ${game?.currentSeason ?: 1} • Day $currentDay / 234 (${if (isPostseason) "Playoffs Active 🏆" else "Regular Season"})",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Surface(
                shape = RoundedCornerShape(8.dp),
                color = if (isPostseason) MaterialTheme.colorScheme.tertiaryContainer else MaterialTheme.colorScheme.primaryContainer
            ) {
                Row(
                    modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    Icon(
                        if (isPostseason) Icons.Default.EmojiEvents else Icons.Default.CalendarMonth,
                        contentDescription = null,
                        modifier = Modifier.size(16.dp),
                        tint = if (isPostseason) MaterialTheme.colorScheme.onTertiaryContainer else MaterialTheme.colorScheme.onPrimaryContainer
                    )
                    Text(
                        text = if (isPostseason) "Playoffs Active 🏆" else "Regular Season",
                        fontWeight = FontWeight.ExtraBold,
                        fontSize = 11.sp,
                        color = if (isPostseason) MaterialTheme.colorScheme.onTertiaryContainer else MaterialTheme.colorScheme.onPrimaryContainer
                    )
                }
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        // Two Clean View Tabs (Calendar, Vertical Playoff Bracket Tree)
        TabRow(
            selectedTabIndex = selectedViewTab,
            modifier = Modifier.fillMaxWidth()
        ) {
            Tab(
                selected = selectedViewTab == 0,
                onClick = { selectedViewTab = 0 },
                text = { Text("🗓️ Match Calendar", fontSize = 13.sp, fontWeight = FontWeight.Bold) }
            )
            Tab(
                selected = selectedViewTab == 1,
                onClick = { selectedViewTab = 1 },
                text = { Text("🌲 Playoff Bracket 🏆", fontSize = 13.sp, fontWeight = FontWeight.Bold) }
            )
        }

        Spacer(modifier = Modifier.height(10.dp))

        when (selectedViewTab) {
            0 -> {
                // 🗓️ SCHEDULE CALENDAR VIEW (With Modern Stepper & 1..225 Matchday Support)
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                        FilterChip(
                            selected = filterMode == 1,
                            onClick = { filterMode = 1 },
                            label = { Text("By Matchday") }
                        )
                        FilterChip(
                            selected = filterMode == 0,
                            onClick = { filterMode = 0 },
                            label = { Text("By Team") }
                        )
                    }

                    if (filterMode == 1) {
                        TextButton(
                            onClick = { selectedMatchday = currentDay.coerceIn(1, 225) },
                            contentPadding = PaddingValues(horizontal = 8.dp, vertical = 2.dp)
                        ) {
                            Text("📍 Jump to Today", fontSize = 11.sp)
                        }
                    }
                }

                Spacer(modifier = Modifier.height(6.dp))

                if (filterMode == 1) {
                    // Modern Stepper Card (Replacing the 166-chip horizontal list)
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        shape = RoundedCornerShape(10.dp),
                        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                    ) {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(horizontal = 8.dp, vertical = 6.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            IconButton(
                                onClick = { if (selectedMatchday > 1) selectedMatchday-- },
                                enabled = selectedMatchday > 1
                            ) {
                                Icon(Icons.Default.ChevronLeft, contentDescription = "Previous Day")
                            }

                            Column(
                                horizontalAlignment = Alignment.CenterHorizontally,
                                modifier = Modifier.clickable { showQuickJumpDialog = true }
                            ) {
                                val dayDesc = when {
                                    selectedMatchday <= 166 -> "Regular Season • Week ${((selectedMatchday - 1) / 7) + 1}"
                                    selectedMatchday <= 184 -> "Playoffs Round 1 (首轮系列赛)"
                                    selectedMatchday <= 199 -> "Conference Semifinals (分区半决赛)"
                                    selectedMatchday <= 214 -> "Conference Finals (分区决赛)"
                                    else -> "The World Finals (NBA 总决赛)"
                                }
                                val isToday = selectedMatchday == currentDay

                                Row(
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                                ) {
                                    Text(
                                        text = "Day $selectedMatchday / 225",
                                        fontWeight = FontWeight.ExtraBold,
                                        fontSize = 15.sp,
                                        color = if (isToday) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurface
                                    )
                                    if (isToday) {
                                        Surface(
                                            shape = RoundedCornerShape(4.dp),
                                            color = MaterialTheme.colorScheme.primary
                                        ) {
                                            Text(
                                                text = "TODAY",
                                                fontSize = 9.sp,
                                                fontWeight = FontWeight.Black,
                                                color = Color.White,
                                                modifier = Modifier.padding(horizontal = 4.dp, vertical = 1.dp)
                                            )
                                        }
                                    }
                                    Icon(Icons.Default.ArrowDropDown, contentDescription = null, modifier = Modifier.size(16.dp))
                                }
                                Text(
                                    text = dayDesc,
                                    fontSize = 11.sp,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }

                            IconButton(
                                onClick = { if (selectedMatchday < 225) selectedMatchday++ },
                                enabled = selectedMatchday < 225
                            ) {
                                Icon(Icons.Default.ChevronRight, contentDescription = "Next Day")
                            }
                        }
                    }
                } else {
                    // Team Filter Bar
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .horizontalScroll(rememberScrollState()),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        FilterChip(
                            selected = selectedFilterTeamId == userTeam?.id,
                            onClick = { selectedFilterTeamId = userTeam?.id },
                            label = { Text("My Team (${userTeam?.name ?: "User"})") }
                        )
                        allTeams.filter { it.id != userTeam?.id }.forEach { team ->
                            FilterChip(
                                selected = selectedFilterTeamId == team.id,
                                onClick = { selectedFilterTeamId = team.id },
                                label = { Text(team.name) }
                            )
                        }
                    }
                }

                Spacer(modifier = Modifier.height(8.dp))

                // Matches List
                if (scheduleList.isEmpty()) {
                    Card(
                        modifier = Modifier.fillMaxWidth().padding(top = 16.dp),
                        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                    ) {
                        Box(modifier = Modifier.fillMaxWidth().padding(24.dp), contentAlignment = Alignment.Center) {
                            Text(
                                text = if (selectedMatchday > currentDay) "Upcoming Matchday (Day $selectedMatchday)"
                                else "No matches scheduled for this selection.",
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                } else {
                    LazyColumn(
                        modifier = Modifier.fillMaxSize(),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        items(scheduleList) { match ->
                            val local = teamMap[match.teamLocalId]
                            val visitor = teamMap[match.teamVisitorId]
                            val isPlayed = match.isPlayed
                            val isUserMatch = match.teamLocalId == userTeam?.id || match.teamVisitorId == userTeam?.id

                            Card(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .clickable(enabled = isPlayed) {
                                        if (isPlayed) {
                                            selectedMatchForBoxScore = match
                                            scope.launch {
                                                boxScoreResults = viewModel.getMatchBoxScores(match.id)
                                            }
                                        }
                                    },
                                shape = RoundedCornerShape(10.dp),
                                colors = CardDefaults.cardColors(
                                    containerColor = if (isUserMatch) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.4f)
                                    else MaterialTheme.colorScheme.surfaceVariant
                                )
                            ) {
                                Row(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(12.dp),
                                    horizontalArrangement = Arrangement.SpaceBetween,
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Column(modifier = Modifier.weight(1f)) {
                                        Text(
                                            text = "Day ${match.matchday} • ${match.name ?: "Match"}",
                                            fontSize = 11.sp,
                                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                                            fontWeight = FontWeight.Medium
                                        )
                                        Spacer(modifier = Modifier.height(4.dp))
                                        Text(
                                            text = "${local?.name ?: "Home"} vs ${visitor?.name ?: "Away"}",
                                            fontWeight = if (isUserMatch) FontWeight.ExtraBold else FontWeight.Bold,
                                            fontSize = 14.sp
                                        )
                                    }

                                    if (isPlayed) {
                                        Row(
                                            verticalAlignment = Alignment.CenterVertically,
                                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                                        ) {
                                            Text(
                                                text = "${match.localScore} - ${match.visitorScore}",
                                                fontWeight = FontWeight.Black,
                                                fontSize = 16.sp,
                                                color = MaterialTheme.colorScheme.primary
                                            )
                                            Text("BoxScore ➔", fontSize = 10.sp, color = MaterialTheme.colorScheme.primary)
                                        }
                                    } else {
                                        if (match.matchday > currentDay) {
                                            Button(
                                                onClick = { targetSimDayToConfirm = match.matchday },
                                                shape = RoundedCornerShape(6.dp),
                                                contentPadding = PaddingValues(horizontal = 10.dp, vertical = 4.dp)
                                            ) {
                                                Text("Sim to Day ${match.matchday}", fontSize = 11.sp)
                                            }
                                        } else {
                                            Text("Scheduled", fontSize = 12.sp, color = MaterialTheme.colorScheme.outline)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            1 -> {
                // 🌲 VERTICAL PLAYOFF BRACKET VIEW (One-Page Vertical Flow)
                VerticalPlayoffBracketView(
                    playoffSeries = playoffSeries,
                    standings = standings,
                    teamMap = teamMap,
                    userTeamId = userTeam?.id,
                    isPlayoffsStarted = isPostseason,
                    onSeriesClick = { selectedSeriesForHistory = it }
                )
            }
        }
    }

    // Quick Jump Dialog (Stage Shortcuts & Day Jump)
    if (showQuickJumpDialog) {
        AlertDialog(
            onDismissRequest = { showQuickJumpDialog = false },
            title = { Text("Jump to Matchday / Stage", fontWeight = FontWeight.Bold) },
            text = {
                Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                    Text("Quick Stage Shortcuts:", fontSize = 12.sp, fontWeight = FontWeight.Bold)

                    listOf(
                        "Day 1: Season Opener (常规赛揭幕)" to 1,
                        "Day 45: Early Season (常规赛第7周)" to 45,
                        "Day 82: Midseason Mark (常规赛半程)" to 82,
                        "Day 166: Regular Season Finale (收官战)" to 166,
                        "Day 167: Playoffs Round 1 (季后赛首轮)" to 167,
                        "Day 182: Conf Semifinals (分区半决赛)" to 182,
                        "Day 197: Conf Finals (分区决赛)" to 197,
                        "Day 212: The World Finals (NBA 总决赛)" to 212
                    ).forEach { (label, day) ->
                        OutlinedButton(
                            onClick = {
                                selectedMatchday = day
                                showQuickJumpDialog = false
                            },
                            modifier = Modifier.fillMaxWidth(),
                            shape = RoundedCornerShape(8.dp)
                        ) {
                            Text(label, fontSize = 11.sp)
                        }
                    }
                }
            },
            confirmButton = {
                TextButton(onClick = { showQuickJumpDialog = false }) {
                    Text("Close")
                }
            }
        )
    }

    // Box Score Modal
    selectedMatchForBoxScore?.let { match ->
        MatchBoxScoreDialog(
            match = match,
            boxScores = boxScoreResults,
            localTeam = teamMap[match.teamLocalId],
            visitorTeam = teamMap[match.teamVisitorId],
            onDismiss = { selectedMatchForBoxScore = null }
        )
    }

    // Playoff Series Detail Dialog
    selectedSeriesForHistory?.let { series ->
        PlayoffSeriesHistoryDialog(
            series = series,
            teamMap = teamMap,
            viewModel = viewModel,
            onSelectMatch = { match ->
                selectedMatchForBoxScore = match
                scope.launch {
                    boxScoreResults = viewModel.getMatchBoxScores(match.id)
                }
            },
            onDismiss = { selectedSeriesForHistory = null }
        )
    }

    // Fast-Forward Sim Confirmation Dialog
    targetSimDayToConfirm?.let { targetDay ->
        AlertDialog(
            onDismissRequest = { targetSimDayToConfirm = null },
            title = { Text("Simulate to Day $targetDay?") },
            text = {
                Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                    Text("The game will fast-forward matchdays up to Day $targetDay.")
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Checkbox(
                            checked = autoAdjustCheckbox,
                            onCheckedChange = { autoAdjustCheckbox = it }
                        )
                        Text("Auto-adjust lineup if injuries occur", fontSize = 12.sp)
                    }
                }
            },
            confirmButton = {
                Button(
                    onClick = {
                        val target = targetSimDayToConfirm ?: return@Button
                        targetSimDayToConfirm = null
                        viewModel.autoSimulateToMatchday(
                            targetDay = target,
                            autoLineup = autoAdjustCheckbox,
                            onFinished = { reason -> simulationHaltNotice = reason }
                        )
                    }
                ) {
                    Text("Start Simulation")
                }
            },
            dismissButton = {
                TextButton(onClick = { targetSimDayToConfirm = null }) {
                    Text("Cancel")
                }
            }
        )
    }

    // Sim Halt Notice
    simulationHaltNotice?.let { notice ->
        AlertDialog(
            onDismissRequest = { simulationHaltNotice = null },
            title = { Text("Simulation Complete") },
            text = { Text(notice) },
            confirmButton = {
                Button(onClick = { simulationHaltNotice = null }) {
                    Text("OK")
                }
            }
        )
    }
}
