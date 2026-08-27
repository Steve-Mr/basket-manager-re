package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.BorderStroke
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
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.theme.RatingRed
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DashboardScreen(
    viewModel: GameDashboardViewModel,
    onNavigateToRoster: () -> Unit,
    onNavigateToStandings: () -> Unit,
    onNavigateToTeamDetail: (Long) -> Unit,
    onNavigateToOffseason: () -> Unit = {}
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
    var autoAdjustCheckbox by remember { mutableStateOf(false) }
    var targetMatchdayInput by remember { mutableStateOf("") }
    var selectedMatchForBoxScore by remember { mutableStateOf<Match?>(null) }
    var boxScoreResults by remember { mutableStateOf<List<MatchResult>>(emptyList()) }
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }
    var injuredStartersAlert by remember { mutableStateOf<List<Player>?>(null) }
    var simulationHaltNotice by remember { mutableStateOf<String?>(null) }

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
            .padding(horizontal = 16.dp, vertical = 10.dp),
        verticalArrangement = Arrangement.spacedBy(14.dp)
    ) {
        // Offseason Banner (if Day 226..234)
        if ((game?.currentMatchday ?: 1) in 226..234) {
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(14.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.tertiaryContainer)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(14.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column {
                            Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                                Text("🏆", fontSize = 18.sp)
                                Text(
                                    text = "OFFSEASON IN PROGRESS",
                                    fontWeight = FontWeight.ExtraBold,
                                    color = MaterialTheme.colorScheme.onTertiaryContainer
                                )
                            }
                            Text(
                                text = when (game?.currentMatchday ?: 226) {
                                    226 -> "Phase 1: Veteran Retirements"
                                    in 227..229 -> "Phase 2: Contract Negotiations"
                                    230 -> "Phase 3: Rookie Draft Day"
                                    in 231..233 -> "Phase 4: Free Agency Market"
                                    else -> "Phase 5: Ready for Next Season"
                                },
                                fontSize = 12.sp,
                                color = MaterialTheme.colorScheme.onTertiaryContainer.copy(alpha = 0.85f)
                            )
                        }

                        Button(
                            onClick = onNavigateToOffseason,
                            shape = RoundedCornerShape(8.dp)
                        ) {
                            Text("Enter Hub >", fontSize = 12.sp)
                        }
                    }
                }
            }
        }

        // Main Dashboard Card
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
                                text = "${userStandings?.gamesWon ?: 0}W - ${userStandings?.gamesLost ?: 0}L",
                                modifier = Modifier.padding(horizontal = 12.dp, vertical = 6.dp),
                                color = Color.White,
                                fontWeight = FontWeight.Bold,
                                fontSize = 14.sp
                            )
                        }
                    }

                    Spacer(modifier = Modifier.height(14.dp))

                    // Next Match Spotlight Card
                    if (userMatch != null) {
                        val isLocal = (userMatch.teamLocalId == userTeam?.id)
                        val opponentTeam = if (isLocal) teamMap[userMatch.teamVisitorId] else teamMap[userMatch.teamLocalId]
                        val oppStandings = standingsMap[opponentTeam?.id]

                        Card(
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface),
                            shape = RoundedCornerShape(12.dp),
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable {
                                    if (userMatch.isPlayed) {
                                        scope.launch {
                                            boxScoreResults = viewModel.getMatchBoxScores(userMatch.id)
                                            selectedMatchForBoxScore = userMatch
                                        }
                                    } else if (opponentTeam != null) {
                                        onNavigateToTeamDetail(opponentTeam.id)
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
                                        text = if (isLocal) "VS ${opponentTeam?.name ?: "Opponent"}" else "@ ${opponentTeam?.name ?: "Opponent"}",
                                        style = MaterialTheme.typography.titleMedium,
                                        fontWeight = FontWeight.Bold
                                    )
                                    Text(
                                        text = "${oppStandings?.gamesWon ?: 0}W - ${oppStandings?.gamesLost ?: 0}L • Tap for Team Info",
                                        fontSize = 12.sp,
                                        color = MaterialTheme.colorScheme.primary
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

                    // Auto Lineup Toggle
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
                            onCheckedChange = { viewModel.toggleAutoLineup(it) }
                        )
                    }

                    Spacer(modifier = Modifier.height(10.dp))

                    // Simulation Action Buttons
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(10.dp)
                    ) {
                        Button(
                            onClick = {
                                viewModel.advanceDay(
                                    onHaltOnInjury = { injuredList ->
                                        injuredStartersAlert = injuredList
                                    }
                                )
                            },
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

        // Recent League News Header
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
                    text = "Tap for Box Scores & Player Profiles",
                    fontSize = 11.sp,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }

        // News Feed with Visual Color Coding
        items(newsList.take(30)) { news ->
            val isWin = news.type == NewsType.WON || (news.type == NewsType.PLAYOFFS && news.title.contains("Victory"))
            val isLoss = news.type == NewsType.LOST || (news.type == NewsType.PLAYOFFS && news.title.contains("Defeat"))
            val isInj = news.type == NewsType.INJURED
            val isPlayoff = news.type == NewsType.PLAYOFFS && !news.title.contains("Victory") && !news.title.contains("Defeat")

            val borderColor = when {
                isWin -> RatingGreen
                isLoss -> RatingRed
                isInj -> MaterialTheme.colorScheme.error
                isPlayoff -> Color(0xFFFFD700)
                else -> MaterialTheme.colorScheme.outlineVariant
            }

            val bgColor = when {
                isWin -> RatingGreen.copy(alpha = 0.08f)
                isLoss -> RatingRed.copy(alpha = 0.08f)
                isInj -> MaterialTheme.colorScheme.errorContainer.copy(alpha = 0.2f)
                else -> MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f)
            }

            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable {
                        if (news.type == NewsType.WON || news.type == NewsType.LOST || news.type == NewsType.PLAYOFFS) {
                            scope.launch {
                                val dayMatches = viewModel.getMatchesForDay(news.matchday)
                                val match = dayMatches.find { it.teamLocalId == userTeam?.id || it.teamVisitorId == userTeam?.id }
                                if (match != null) {
                                    boxScoreResults = viewModel.getMatchBoxScores(match.id)
                                    selectedMatchForBoxScore = match
                                }
                            }
                        } else if (news.playerId != null) {
                            selectedPlayerForDetail = playerMap[news.playerId]
                        }
                    },
                shape = RoundedCornerShape(10.dp),
                border = BorderStroke(1.dp, borderColor),
                colors = CardDefaults.cardColors(containerColor = bgColor)
            ) {
                Column(modifier = Modifier.padding(12.dp)) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text(
                            text = news.title,
                            fontWeight = FontWeight.Bold,
                            style = MaterialTheme.typography.bodyMedium,
                            color = when {
                                isWin -> RatingGreen
                                isLoss -> RatingRed
                                else -> MaterialTheme.colorScheme.onSurface
                            }
                        )
                        Text(
                            text = "Day ${news.matchday}",
                            style = MaterialTheme.typography.labelSmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                    Spacer(modifier = Modifier.height(4.dp))
                    Text(
                        text = news.body.replace("\\n", "\n"),
                        style = MaterialTheme.typography.bodySmall,
                        lineHeight = 16.sp
                    )
                }
            }
        }
    }

    // Fast Forward Dialog (Simulate 1 Week / 1 Month / Day 166 / Custom)
    if (showAutoSimDialog) {
        val currentDay = game?.currentMatchday ?: 1
        AlertDialog(
            onDismissRequest = { showAutoSimDialog = false },
            title = { Text("Fast Forward Simulation") },
            text = {
                Column(verticalArrangement = Arrangement.spacedBy(10.dp)) {
                    Text("Current Matchday: $currentDay / 166")
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Button(
                            onClick = {
                                showAutoSimDialog = false
                                viewModel.autoSimulateToMatchday((currentDay + 7).coerceAtMost(166))
                            },
                            modifier = Modifier.weight(1f),
                            shape = RoundedCornerShape(8.dp)
                        ) {
                            Text("+1 Week (7d)")
                        }

                        Button(
                            onClick = {
                                showAutoSimDialog = false
                                viewModel.autoSimulateToMatchday((currentDay + 30).coerceAtMost(166))
                            },
                            modifier = Modifier.weight(1f),
                            shape = RoundedCornerShape(8.dp)
                        ) {
                            Text("+1 Month (30d)")
                        }
                    }

                    Button(
                        onClick = {
                            showAutoSimDialog = false
                            viewModel.autoSimulateToMatchday(166)
                        },
                        modifier = Modifier.fillMaxWidth(),
                        shape = RoundedCornerShape(8.dp)
                    ) {
                        Text("Simulate to End of Regular Season (Day 166)")
                    }

                    HorizontalDivider()

                    OutlinedTextField(
                        value = targetMatchdayInput,
                        onValueChange = { targetMatchdayInput = it },
                        label = { Text("Or Enter Target Matchday (1..234)") },
                        singleLine = true,
                        modifier = Modifier.fillMaxWidth()
                    )
                }
            },
            confirmButton = {
                Button(
                    onClick = {
                        val target = targetMatchdayInput.toIntOrNull() ?: (currentDay + 1)
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
        MatchBoxScoreDialog(
            match = match,
            localTeam = teamMap[match.teamLocalId],
            visitorTeam = teamMap[match.teamVisitorId],
            boxScores = boxScoreResults,
            onDismiss = { selectedMatchForBoxScore = null }
        )
    }

    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(
            player = player,
            stats = viewModel.getPlayerSeasonStats(player.id),
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}
