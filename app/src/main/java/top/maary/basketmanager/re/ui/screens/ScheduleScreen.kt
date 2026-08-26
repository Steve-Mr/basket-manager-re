package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.launch
import top.maary.basketmanager.re.domain.model.Match
import top.maary.basketmanager.re.domain.model.MatchResult
import top.maary.basketmanager.re.domain.model.Team
import top.maary.basketmanager.re.ui.components.MatchBoxScoreDialog
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ScheduleScreen(
    viewModel: GameDashboardViewModel
) {
    val game by viewModel.game.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()
    val scheduleMatches by viewModel.scheduleMatches.collectAsState()
    val scope = rememberCoroutineScope()

    var selectedFilterMode by remember { mutableStateOf("MATCHDAY") } // "MATCHDAY" or "MY_TEAM" or "ALL_TEAMS"
    var currentMatchdayFilter by remember(game) { mutableStateOf(game?.currentMatchday ?: 1) }
    var selectedTeamIdFilter by remember(game) { mutableStateOf(game?.userTeamId ?: 0L) }

    var selectedMatchForBoxScore by remember { mutableStateOf<Match?>(null) }
    var boxScoreResults by remember { mutableStateOf<List<MatchResult>>(emptyList()) }

    val teamMap = remember(allTeams) { allTeams.associateBy { it.id } }

    LaunchedEffect(selectedFilterMode, currentMatchdayFilter, selectedTeamIdFilter) {
        if (selectedFilterMode == "MATCHDAY") {
            viewModel.loadScheduleByMatchday(currentMatchdayFilter)
        } else {
            viewModel.loadScheduleByTeam(selectedTeamIdFilter)
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Text(
            text = "League Calendar & Results",
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = "View upcoming games, past results, and full box scores",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        Spacer(modifier = Modifier.height(12.dp))

        // Mode switch
        SingleChoiceSegmentedButtonRow(modifier = Modifier.fillMaxWidth()) {
            SegmentedButton(
                selected = selectedFilterMode == "MATCHDAY",
                onClick = { selectedFilterMode = "MATCHDAY" },
                shape = SegmentedButtonDefaults.itemShape(index = 0, count = 2)
            ) {
                Text("By Matchday (${currentMatchdayFilter})")
            }
            SegmentedButton(
                selected = selectedFilterMode == "MY_TEAM",
                onClick = {
                    selectedFilterMode = "MY_TEAM"
                    selectedTeamIdFilter = game?.userTeamId ?: 0L
                },
                shape = SegmentedButtonDefaults.itemShape(index = 1, count = 2)
            ) {
                Text("My Team Schedule")
            }
        }

        Spacer(modifier = Modifier.height(8.dp))

        if (selectedFilterMode == "MATCHDAY") {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .horizontalScroll(rememberScrollState()),
                horizontalArrangement = Arrangement.spacedBy(6.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text("Day:", fontSize = 12.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.onSurfaceVariant)
                (1..166).forEach { day ->
                    FilterChip(
                        selected = currentMatchdayFilter == day,
                        onClick = { currentMatchdayFilter = day },
                        label = { Text("D$day", fontSize = 11.sp) }
                    )
                }
            }
        } else {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .horizontalScroll(rememberScrollState()),
                horizontalArrangement = Arrangement.spacedBy(6.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text("Team:", fontSize = 12.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.onSurfaceVariant)
                allTeams.forEach { t ->
                    FilterChip(
                        selected = selectedTeamIdFilter == t.id,
                        onClick = { selectedTeamIdFilter = t.id },
                        label = { Text(t.name, fontSize = 11.sp) }
                    )
                }
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        if (scheduleMatches.isEmpty()) {
            Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                Text("No matches found for this selection.", color = MaterialTheme.colorScheme.onSurfaceVariant)
            }
        } else {
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(scheduleMatches) { match ->
                    val localTeam = teamMap[match.teamLocalId]
                    val visitorTeam = teamMap[match.teamVisitorId]

                    Card(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable(enabled = match.isPlayed) {
                                scope.launch {
                                    boxScoreResults = viewModel.getMatchBoxScores(match.id)
                                    selectedMatchForBoxScore = match
                                }
                            },
                        shape = RoundedCornerShape(12.dp),
                        colors = CardDefaults.cardColors(
                            containerColor = if (match.teamLocalId == game?.userTeamId || match.teamVisitorId == game?.userTeamId)
                                MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.4f)
                            else MaterialTheme.colorScheme.surfaceVariant
                        )
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
                                    text = "Matchday ${match.matchday}",
                                    fontSize = 11.sp,
                                    fontWeight = FontWeight.Bold,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                                Spacer(modifier = Modifier.height(4.dp))
                                Text(
                                    text = "${visitorTeam?.name ?: "VIS"} @ ${localTeam?.name ?: "LOC"}",
                                    style = MaterialTheme.typography.titleMedium,
                                    fontWeight = FontWeight.Bold
                                )
                            }

                            if (match.isPlayed) {
                                Column(horizontalAlignment = Alignment.End) {
                                    Text(
                                        text = "${match.visitorScore ?: 0} - ${match.localScore ?: 0}",
                                        style = MaterialTheme.typography.titleLarge,
                                        fontWeight = FontWeight.ExtraBold,
                                        color = MaterialTheme.colorScheme.primary
                                    )
                                    Text(
                                        text = "FINAL (Tap for Box Score)",
                                        fontSize = 10.sp,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                            } else {
                                Surface(
                                    shape = RoundedCornerShape(8.dp),
                                    color = MaterialTheme.colorScheme.surface
                                ) {
                                    Text(
                                        text = "UPCOMING",
                                        fontSize = 11.sp,
                                        fontWeight = FontWeight.Bold,
                                        modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
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

    selectedMatchForBoxScore?.let { match ->
        val local = teamMap[match.teamLocalId]
        val visitor = teamMap[match.teamVisitorId]
        if (local != null && visitor != null) {
            MatchBoxScoreDialog(
                match = match,
                localTeam = local,
                visitorTeam = visitor,
                boxScores = boxScoreResults,
                onDismiss = { selectedMatchForBoxScore = null }
            )
        }
    }
}
