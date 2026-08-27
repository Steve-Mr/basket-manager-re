package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.FastForward
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
import top.maary.basketmanager.re.ui.components.MatchBoxScoreDialog
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.theme.RatingRed
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ScheduleScreen(
    viewModel: GameDashboardViewModel
) {
    val game by viewModel.game.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()
    val scope = rememberCoroutineScope()

    var selectedFilterTeamId by remember { mutableStateOf<Long?>(userTeam?.id) }
    var selectedMatchday by remember { mutableStateOf(game?.currentMatchday ?: 1) }
    var filterMode by remember { mutableStateOf(0) } // 0: My Team / Specific Team, 1: By Matchday (All 30 teams)

    var scheduleList by remember { mutableStateOf<List<Match>>(emptyList()) }
    var selectedMatchForBoxScore by remember { mutableStateOf<Match?>(null) }
    var boxScoreResults by remember { mutableStateOf<List<MatchResult>>(emptyList()) }

    var targetSimDayToConfirm by remember { mutableStateOf<Int?>(null) }
    var autoAdjustCheckbox by remember { mutableStateOf(false) }
    var simulationHaltNotice by remember { mutableStateOf<String?>(null) }

    val teamMap = remember(allTeams) { allTeams.associateBy { it.id } }

    LaunchedEffect(game?.id, selectedFilterTeamId, selectedMatchday, filterMode) {
        val gId = game?.id ?: return@LaunchedEffect
        if (filterMode == 0) {
            val tId = selectedFilterTeamId ?: userTeam?.id ?: 1L
            scheduleList = viewModel.getTeamSchedule(tId)
        } else {
            scheduleList = viewModel.getMatchesForDay(selectedMatchday)
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column {
                Text(
                    text = "NBA Season Schedule",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Current: Day ${game?.currentMatchday ?: 1} / 166 (Tap future day to Sim)",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        // Mode Selector: Team Schedule vs Matchday Schedule
        SingleChoiceSegmentedButtonRow(modifier = Modifier.fillMaxWidth()) {
            SegmentedButton(
                selected = filterMode == 0,
                onClick = { filterMode = 0 },
                shape = SegmentedButtonDefaults.itemShape(index = 0, count = 2)
            ) {
                Text("By Team (82 Games)")
            }
            SegmentedButton(
                selected = filterMode == 1,
                onClick = { filterMode = 1 },
                shape = SegmentedButtonDefaults.itemShape(index = 1, count = 2)
            ) {
                Text("By Matchday (All Games)")
            }
        }

        Spacer(modifier = Modifier.height(8.dp))

        if (filterMode == 0) {
            // Team Selector Chips
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .horizontalScroll(rememberScrollState()),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                allTeams.forEach { team ->
                    FilterChip(
                        selected = (selectedFilterTeamId ?: userTeam?.id) == team.id,
                        onClick = { selectedFilterTeamId = team.id },
                        label = { Text(team.name) }
                    )
                }
            }
        } else {
            // Matchday Selector Chips (1..166)
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .horizontalScroll(rememberScrollState()),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                val current = game?.currentMatchday ?: 1
                (1..166).forEach { day ->
                    FilterChip(
                        selected = selectedMatchday == day,
                        onClick = { selectedMatchday = day },
                        label = { Text(if (day == current) "Day $day (Today)" else "Day $day") }
                    )
                }
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

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
