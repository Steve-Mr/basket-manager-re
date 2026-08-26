package top.maary.basketmanager.re.ui.screens

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
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.launch
import top.maary.basketmanager.re.domain.model.*
import top.maary.basketmanager.re.ui.components.MatchBoxScoreDialog
import top.maary.basketmanager.re.ui.components.PlayerDetailBottomSheet
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DashboardScreen(
    viewModel: GameDashboardViewModel,
    onNavigateToRoster: () -> Unit,
    onNavigateToStandings: () -> Unit
) {
    val game by viewModel.game.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()
    val roster by viewModel.userRoster.collectAsState()
    val standings by viewModel.standings.collectAsState()
    val todayMatches by viewModel.todayMatches.collectAsState()
    val newsList by viewModel.news.collectAsState()
    val allPlayers by viewModel.allPlayers.collectAsState()
    val isSimulating by viewModel.isSimulating.collectAsState()
    val simProgressText by viewModel.simulationProgressText.collectAsState()
    val scope = rememberCoroutineScope()

    var showAutoSimDialog by remember { mutableStateOf(false) }
    var targetMatchdayInput by remember { mutableStateOf("") }
    var selectedMatchForBoxScore by remember { mutableStateOf<Match?>(null) }
    var boxScoreResults by remember { mutableStateOf<List<MatchResult>>(emptyList()) }
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }

    val teamMap = remember(allTeams) { allTeams.associateBy { it.id } }
    val playerMap = remember(allPlayers) { allPlayers.associateBy { it.id } }
    val standingsMap = remember(standings) { standings.associateBy { it.teamId } }

    val userMatch = remember(todayMatches, userTeam) {
        todayMatches.find { it.teamLocalId == userTeam?.id || it.teamVisitorId == userTeam?.id }
    }

    val userStandings = remember(standings, userTeam) {
        standings.find { it.teamId == userTeam?.id }
    }

    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(14.dp)
    ) {
        // Dashboard Overview Card
        item {
            Card(
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer),
                shape = RoundedCornerShape(16.dp),
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column {
                            Text(
                                text = userTeam?.name ?: "My Franchise",
                                style = MaterialTheme.typography.headlineMedium,
                                fontWeight = FontWeight.ExtraBold,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                            Text(
                                text = "Season ${game?.currentSeason ?: 1} • Matchday ${game?.currentMatchday ?: 1}",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.8f)
                            )
                        }

                        Surface(
                            shape = RoundedCornerShape(10.dp),
                            color = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.clickable { onNavigateToStandings() }
                        ) {
                            Text(
                                text = "Record: ${userStandings?.gamesWon ?: 0}W - ${userStandings?.gamesLost ?: 0}L",
                                modifier = Modifier.padding(horizontal = 12.dp, vertical = 6.dp),
                                color = Color.White,
                                fontWeight = FontWeight.Bold,
                                fontSize = 13.sp
                            )
                        }
                    }

                    Spacer(modifier = Modifier.height(14.dp))

                    // Next Match Spotlight
                    if (userMatch != null) {
                        val isLocal = (userMatch.teamLocalId == userTeam?.id)
                        val opponentTeam = if (isLocal) teamMap[userMatch.teamVisitorId] else teamMap[userMatch.teamLocalId]
                        val oppStandings = standingsMap[opponentTeam?.id]

                        Card(
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface),
                            shape = RoundedCornerShape(12.dp),
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable(enabled = userMatch.isPlayed) {
                                    scope.launch {
                                        boxScoreResults = viewModel.getMatchBoxScores(userMatch.id)
                                        selectedMatchForBoxScore = userMatch
                                    }
                                }
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(14.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Column {
                                    Text(
                                        text = if (isLocal) "VS ${opponentTeam?.name ?: "OPP"}" else "@ ${opponentTeam?.name ?: "OPP"}",
                                        style = MaterialTheme.typography.titleMedium,
                                        fontWeight = FontWeight.Bold
                                    )
                                    Text(
                                        text = "Opponent Record: ${oppStandings?.gamesWon ?: 0}W - ${oppStandings?.gamesLost ?: 0}L",
                                        fontSize = 12.sp,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }

                                if (userMatch.isPlayed) {
                                    Column(horizontalAlignment = Alignment.End) {
                                        Text(
                                            text = "${userMatch.visitorScore ?: 0} - ${userMatch.localScore ?: 0}",
                                            style = MaterialTheme.typography.titleLarge,
                                            fontWeight = FontWeight.ExtraBold,
                                            color = MaterialTheme.colorScheme.primary
                                        )
                                        Text("FINAL (Tap for Stats)", fontSize = 10.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                                    }
                                } else {
                                    Surface(
                                        shape = RoundedCornerShape(6.dp),
                                        color = MaterialTheme.colorScheme.primaryContainer
                                    ) {
                                        Text(
                                            text = "TODAY'S GAME",
                                            fontSize = 11.sp,
                                            fontWeight = FontWeight.Bold,
                                            modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                                            color = MaterialTheme.colorScheme.onPrimaryContainer
                                        )
                                    }
                                }
                            }
                        }
                    } else {
                        Text("No fixture scheduled for your team today.", style = MaterialTheme.typography.bodyMedium)
                    }

                    Spacer(modifier = Modifier.height(14.dp))

                    // Auto Lineup Quick Indicator
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = if (game?.autoLineupEnabled == true) "Auto-Lineup: ON" else "Auto-Lineup: OFF (Manual)",
                            fontSize = 12.sp,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.9f)
                        )
                        Switch(
                            checked = game?.autoLineupEnabled == true,
                            onCheckedChange = { viewModel.toggleAutoLineup(it) },
                            modifier = Modifier.scale(0.8f)
                        )
                    }

                    Spacer(modifier = Modifier.height(8.dp))

                    // Action Buttons
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(10.dp)
                    ) {
                        Button(
                            onClick = { viewModel.advanceDay() },
                            enabled = !isSimulating,
                            modifier = Modifier.weight(1f),
                            shape = RoundedCornerShape(10.dp)
                        ) {
                            Icon(Icons.Default.PlayArrow, contentDescription = null)
                            Spacer(modifier = Modifier.width(6.dp))
                            Text(if (isSimulating) "Simulating..." else "Simulate Day", fontWeight = FontWeight.Bold)
                        }

                        OutlinedButton(
                            onClick = { showAutoSimDialog = true },
                            enabled = !isSimulating,
                            shape = RoundedCornerShape(10.dp)
                        ) {
                            Icon(Icons.Default.FastForward, contentDescription = null)
                            Spacer(modifier = Modifier.width(6.dp))
                            Text("Fast Forward")
                        }
                    }

                    if (isSimulating) {
                        Spacer(modifier = Modifier.height(10.dp))
                        LinearProgressIndicator(modifier = Modifier.fillMaxWidth())
                        Text(text = simProgressText, style = MaterialTheme.typography.bodySmall, modifier = Modifier.padding(top = 4.dp))
                    }
                }
            }
        }

        // Today's League Fixtures
        if (todayMatches.isNotEmpty()) {
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "League Matches (Day ${game?.currentMatchday ?: 1})",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "${todayMatches.size} Games",
                        fontSize = 12.sp,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            items(todayMatches) { match ->
                val localTeam = teamMap[match.teamLocalId]
                val visitorTeam = teamMap[match.teamVisitorId]
                val lStd = standingsMap[match.teamLocalId]
                val vStd = standingsMap[match.teamVisitorId]
                val isUserMatch = (match.teamLocalId == userTeam?.id || match.teamVisitorId == userTeam?.id)

                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable(enabled = match.isPlayed) {
                            scope.launch {
                                boxScoreResults = viewModel.getMatchBoxScores(match.id)
                                selectedMatchForBoxScore = match
                            }
                        },
                    colors = CardDefaults.cardColors(
                        containerColor = if (isUserMatch) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.4f)
                        else MaterialTheme.colorScheme.surfaceVariant
                    ),
                    shape = RoundedCornerShape(10.dp)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(12.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column {
                            Text(
                                text = "${visitorTeam?.name ?: "VIS"} (${vStd?.gamesWon ?: 0}-${vStd?.gamesLost ?: 0}) @ ${localTeam?.name ?: "LOC"} (${lStd?.gamesWon ?: 0}-${lStd?.gamesLost ?: 0})",
                                style = MaterialTheme.typography.bodyMedium,
                                fontWeight = FontWeight.Bold
                            )
                            if (match.isPlayed) {
                                Text(
                                    text = "Tap to view box score & stats",
                                    fontSize = 11.sp,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }

                        if (match.isPlayed) {
                            Text(
                                text = "${match.visitorScore ?: 0} - ${match.localScore ?: 0}",
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.ExtraBold,
                                color = MaterialTheme.colorScheme.primary
                            )
                        } else {
                            Surface(
                                shape = RoundedCornerShape(4.dp),
                                color = MaterialTheme.colorScheme.surface
                            ) {
                                Text(
                                    text = "TONIGHT",
                                    fontSize = 10.sp,
                                    fontWeight = FontWeight.Bold,
                                    modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                                )
                            }
                        }
                    }
                }
            }
        }

        // Recent League News
        item {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Recent League News (${newsList.size})",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Tap news to inspect player/game",
                    fontSize = 11.sp,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }

        items(newsList.take(20)) { news ->
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable {
                        if (news.playerId != null) {
                            selectedPlayerForDetail = playerMap[news.playerId]
                        } else if (news.type == NewsType.WON || news.type == NewsType.LOST || news.type == NewsType.PLAYOFFS) {
                            val relatedMatch = todayMatches.find { it.matchday == news.matchday }
                            if (relatedMatch != null) {
                                scope.launch {
                                    boxScoreResults = viewModel.getMatchBoxScores(relatedMatch.id)
                                    selectedMatchForBoxScore = relatedMatch
                                }
                            }
                        }
                    },
                shape = RoundedCornerShape(10.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.7f))
            ) {
                Column(modifier = Modifier.padding(12.dp)) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text(
                            text = news.title,
                            fontWeight = FontWeight.Bold,
                            style = MaterialTheme.typography.bodyMedium
                        )
                        Text(
                            text = "Day ${news.matchday}",
                            style = MaterialTheme.typography.labelSmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                    Spacer(modifier = Modifier.height(4.dp))
                    Text(
                        text = news.body,
                        style = MaterialTheme.typography.bodySmall
                    )
                }
            }
        }
    }

    // Auto Simulation Target Dialog
    if (showAutoSimDialog) {
        AlertDialog(
            onDismissRequest = { showAutoSimDialog = false },
            title = { Text("Auto Simulate To Day") },
            text = {
                Column {
                    Text("Current matchday: ${game?.currentMatchday ?: 1}")
                    Spacer(modifier = Modifier.height(8.dp))
                    OutlinedTextField(
                        value = targetMatchdayInput,
                        onValueChange = { targetMatchdayInput = it },
                        label = { Text("Target Matchday (1..234)") },
                        singleLine = true,
                        modifier = Modifier.fillMaxWidth()
                    )
                }
            },
            confirmButton = {
                Button(
                    onClick = {
                        val target = targetMatchdayInput.toIntOrNull() ?: ((game?.currentMatchday ?: 1) + 10)
                        showAutoSimDialog = false
                        viewModel.autoSimulateToMatchday(target.coerceIn(1, 234))
                    }
                ) {
                    Text("Simulate")
                }
            },
            dismissButton = {
                TextButton(onClick = { showAutoSimDialog = false }) {
                    Text("Cancel")
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

    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(
            player = player,
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}

// Helper extension for switch scale
fun Modifier.scale(scale: Float): Modifier = this
