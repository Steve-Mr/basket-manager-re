package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.CalendarMonth
import androidx.compose.material.icons.filled.EmojiEvents
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.launch
import top.maary.basketmanager.re.domain.model.Match
import top.maary.basketmanager.re.domain.model.MatchResult
import top.maary.basketmanager.re.domain.model.PlayoffSeries
import top.maary.basketmanager.re.ui.components.MatchBoxScoreDialog
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@Composable
fun ScheduleScreen(
    viewModel: GameDashboardViewModel
) {
    val game by viewModel.game.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()
    val playoffSeries by viewModel.playoffSeries.collectAsState()
    val scope = rememberCoroutineScope()

    val currentDay = game?.currentMatchday ?: 1
    val isPostseason = currentDay > 166

    var scheduleStageTab by remember(isPostseason) { mutableIntStateOf(if (isPostseason) 1 else 0) } // 0: Regular Season, 1: Playoffs

    var selectedFilterTeamId by remember { mutableStateOf<Long?>(userTeam?.id) }
    var selectedMatchday by remember { mutableIntStateOf(currentDay.coerceIn(1, 166)) }
    var filterMode by remember { mutableIntStateOf(0) } // 0: By Team, 1: By Matchday

    var scheduleList by remember { mutableStateOf<List<Match>>(emptyList()) }
    var playoffMatches by remember { mutableStateOf<List<Match>>(emptyList()) }
    var selectedMatchForBoxScore by remember { mutableStateOf<Match?>(null) }
    var boxScoreResults by remember { mutableStateOf<List<MatchResult>>(emptyList()) }

    var targetSimDayToConfirm by remember { mutableStateOf<Int?>(null) }
    var autoAdjustCheckbox by remember { mutableStateOf(false) }
    var simulationHaltNotice by remember { mutableStateOf<String?>(null) }

    val teamMap = remember(allTeams) { allTeams.associateBy { it.id } }

    LaunchedEffect(game?.id, selectedFilterTeamId, selectedMatchday, filterMode, scheduleStageTab) {
        val gId = game?.id ?: return@LaunchedEffect
        if (scheduleStageTab == 0) {
            if (filterMode == 0) {
                val tId = selectedFilterTeamId ?: userTeam?.id ?: 1L
                val allMatches = viewModel.getTeamSchedule(tId)
                scheduleList = allMatches.filter { it.matchday <= 166 }
            } else {
                scheduleList = viewModel.getMatchesForDay(selectedMatchday)
            }
        } else {
            // Load all playoff matches (Days 167..225)
            val allPlayed = mutableListOf<Match>()
            for (day in 167..currentDay.coerceAtMost(225)) {
                allPlayed.addAll(viewModel.getMatchesForDay(day))
            }
            playoffMatches = allPlayed
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp, vertical = 10.dp)
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column {
                Text(
                    text = "Season Schedule",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Season ${game?.currentSeason ?: 1} • Day $currentDay / 234",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Surface(
                shape = RoundedCornerShape(8.dp),
                color = if (isPostseason) MaterialTheme.colorScheme.tertiaryContainer else MaterialTheme.colorScheme.primaryContainer
            ) {
                Text(
                    text = if (isPostseason) "Playoffs Stage" else "Regular Season",
                    fontWeight = FontWeight.ExtraBold,
                    fontSize = 11.sp,
                    modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                    color = if (isPostseason) MaterialTheme.colorScheme.onTertiaryContainer else MaterialTheme.colorScheme.onPrimaryContainer
                )
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        // Segmented Stage Switcher: Regular Season vs Playoffs
        SingleChoiceSegmentedButtonRow(
            modifier = Modifier.fillMaxWidth()
        ) {
            SegmentedButton(
                selected = scheduleStageTab == 0,
                onClick = { scheduleStageTab = 0 },
                shape = SegmentedButtonDefaults.itemShape(index = 0, count = 2),
                icon = { Icon(Icons.Default.CalendarMonth, contentDescription = null, modifier = Modifier.size(16.dp)) }
            ) {
                Text("Regular Season (82G)", fontWeight = FontWeight.Bold, fontSize = 12.sp)
            }
            SegmentedButton(
                selected = scheduleStageTab == 1,
                onClick = { scheduleStageTab = 1 },
                shape = SegmentedButtonDefaults.itemShape(index = 1, count = 2),
                icon = { Icon(Icons.Default.EmojiEvents, contentDescription = null, modifier = Modifier.size(16.dp)) }
            ) {
                Text("Playoffs Series", fontWeight = FontWeight.Bold, fontSize = 12.sp)
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        if (scheduleStageTab == 0) {
            // Regular Season Controls
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                FilterChip(
                    selected = filterMode == 0,
                    onClick = { filterMode = 0 },
                    label = { Text("By Team") }
                )
                FilterChip(
                    selected = filterMode == 1,
                    onClick = { filterMode = 1 },
                    label = { Text("By Day (1..166)") }
                )
            }

            Spacer(modifier = Modifier.height(6.dp))

            if (filterMode == 0) {
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
            } else {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .horizontalScroll(rememberScrollState()),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    val current = (game?.currentMatchday ?: 1).coerceAtMost(166)
                    (1..166).forEach { day ->
                        FilterChip(
                            selected = selectedMatchday == day,
                            onClick = { selectedMatchday = day },
                            label = { Text(if (day == current) "Day $day (Today)" else "Day $day") }
                        )
                    }
                }
            }

            Spacer(modifier = Modifier.height(8.dp))

            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(scheduleList) { match ->
                    val local = teamMap[match.teamLocalId]
                    val visitor = teamMap[match.teamVisitorId]
                    val isMyTeam = (match.teamLocalId == userTeam?.id || match.teamVisitorId == userTeam?.id)
                    val isFuture = match.matchday > (game?.currentMatchday ?: 1)

                    Card(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable {
                                if (match.isPlayed) {
                                    scope.launch {
                                        boxScoreResults = viewModel.getMatchBoxScores(match.id)
                                        selectedMatchForBoxScore = match
                                    }
                                } else if (isFuture) {
                                    targetSimDayToConfirm = match.matchday
                                }
                            },
                        shape = RoundedCornerShape(10.dp),
                        colors = CardDefaults.cardColors(
                            containerColor = if (isMyTeam) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.45f)
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
                            Column {
                                Row(
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                                ) {
                                    Surface(
                                        shape = RoundedCornerShape(4.dp),
                                        color = MaterialTheme.colorScheme.primary
                                    ) {
                                        Text(
                                            text = "Day ${match.matchday}",
                                            fontSize = 11.sp,
                                            fontWeight = FontWeight.Bold,
                                            color = Color.White,
                                            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                                        )
                                    }
                                    Text(
                                        text = "${visitor?.name ?: "VIS"} @ ${local?.name ?: "LOC"}",
                                        fontWeight = FontWeight.Bold,
                                        fontSize = 14.sp
                                    )
                                }
                                if (match.isPlayed) {
                                    Text(
                                        text = "Tap to inspect full box score",
                                        fontSize = 11.sp,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                } else {
                                    Text(
                                        text = "Tap to fast forward simulate to Day ${match.matchday}",
                                        fontSize = 11.sp,
                                        color = MaterialTheme.colorScheme.primary
                                    )
                                }
                            }

                            if (match.isPlayed) {
                                Text(
                                    text = "${match.visitorScore} - ${match.localScore}",
                                    fontWeight = FontWeight.ExtraBold,
                                    fontSize = 15.sp,
                                    color = MaterialTheme.colorScheme.primary
                                )
                            } else {
                                Surface(
                                    shape = RoundedCornerShape(6.dp),
                                    color = MaterialTheme.colorScheme.surface
                                ) {
                                    Text(
                                        text = "SIM >",
                                        fontSize = 11.sp,
                                        fontWeight = FontWeight.Bold,
                                        modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                                        color = MaterialTheme.colorScheme.primary
                                    )
                                }
                            }
                        }
                    }
                }
            }
        } else {
            // Playoffs Schedule View
            if (playoffSeries.isEmpty()) {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    Column(horizontalAlignment = Alignment.CenterHorizontally) {
                        Text("Playoffs have not started yet.", fontWeight = FontWeight.Bold)
                        Spacer(modifier = Modifier.height(4.dp))
                        Text("Simulate to Day 167 to begin the Postseason Tournament.", fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    }
                }
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    item {
                        Text(
                            text = "Playoff Series Matches Played (${playoffMatches.size} Games)",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.primary
                        )
                    }

                    if (playoffMatches.isEmpty()) {
                        item {
                            Card(
                                modifier = Modifier.fillMaxWidth(),
                                shape = RoundedCornerShape(10.dp),
                                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                            ) {
                                Box(modifier = Modifier.fillMaxWidth().padding(16.dp), contentAlignment = Alignment.Center) {
                                    Text("Postseason series bracket generated. Advance days to play playoff matches.")
                                }
                            }
                        }
                    }

                    items(playoffMatches.reversed()) { match ->
                        val local = teamMap[match.teamLocalId]
                        val visitor = teamMap[match.teamVisitorId]
                        val isMyTeam = (match.teamLocalId == userTeam?.id || match.teamVisitorId == userTeam?.id)

                        Card(
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable {
                                    scope.launch {
                                        boxScoreResults = viewModel.getMatchBoxScores(match.id)
                                        selectedMatchForBoxScore = match
                                    }
                                },
                            shape = RoundedCornerShape(10.dp),
                            colors = CardDefaults.cardColors(
                                containerColor = if (isMyTeam) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.55f)
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
                                Column {
                                    Row(
                                        verticalAlignment = Alignment.CenterVertically,
                                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                                    ) {
                                        Surface(
                                            shape = RoundedCornerShape(4.dp),
                                            color = Color(0xFFD97706)
                                        ) {
                                            Text(
                                                text = "Day ${match.matchday}",
                                                fontSize = 11.sp,
                                                fontWeight = FontWeight.Bold,
                                                color = Color.White,
                                                modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                                            )
                                        }
                                        Text(
                                            text = "${visitor?.name ?: "VIS"} @ ${local?.name ?: "LOC"}",
                                            fontWeight = FontWeight.Bold,
                                            fontSize = 14.sp
                                        )
                                    }
                                    Text(
                                        text = "Playoff Game • Tap to inspect full box score",
                                        fontSize = 11.sp,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }

                                Text(
                                    text = "${match.visitorScore ?: 0} - ${match.localScore ?: 0}",
                                    fontWeight = FontWeight.ExtraBold,
                                    fontSize = 16.sp,
                                    color = MaterialTheme.colorScheme.primary
                                )
                            }
                        }
                    }
                }
            }
        }
    }

    // Fast Forward Confirmation Dialog
    targetSimDayToConfirm?.let { targetDay ->
        AlertDialog(
            onDismissRequest = { targetSimDayToConfirm = null },
            title = { Text("Simulate to Day $targetDay") },
            text = {
                Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                    Text("Do you want to fast forward simulation from Day ${game?.currentMatchday ?: 1} up to Day $targetDay?")
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Checkbox(
                            checked = autoAdjustCheckbox,
                            onCheckedChange = { autoAdjustCheckbox = it }
                        )
                        Text("Auto-adjust lineup if players are injured", fontSize = 12.sp)
                    }
                }
            },
            confirmButton = {
                Button(
                    onClick = {
                        targetSimDayToConfirm = null
                        viewModel.autoSimulateToMatchday(targetDay, autoLineup = autoAdjustCheckbox) { msg ->
                            if (msg.startsWith("PAUSED:")) simulationHaltNotice = msg
                        }
                    }
                ) {
                    Text("Simulate")
                }
            },
            dismissButton = {
                TextButton(onClick = { targetSimDayToConfirm = null }) {
                    Text("Cancel")
                }
            }
        )
    }

    simulationHaltNotice?.let { notice ->
        AlertDialog(
            onDismissRequest = { simulationHaltNotice = null },
            title = { Text("Simulation Paused") },
            text = { Text(notice) },
            confirmButton = {
                Button(onClick = { simulationHaltNotice = null }) {
                    Text("OK")
                }
            }
        )
    }

    selectedMatchForBoxScore?.let { match ->
        val local = teamMap[match.teamLocalId]
        val visitor = teamMap[match.teamVisitorId]
        MatchBoxScoreDialog(
            match = match,
            localTeam = local,
            visitorTeam = visitor,
            boxScores = boxScoreResults,
            onDismiss = { selectedMatchForBoxScore = null }
        )
    }
}
