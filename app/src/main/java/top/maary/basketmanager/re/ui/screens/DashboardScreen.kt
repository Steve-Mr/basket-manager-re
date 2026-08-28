package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.shape.CircleShape

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.automirrored.filled.*
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
import top.maary.basketmanager.re.domain.engine.PlayoffsEngine
import top.maary.basketmanager.re.ui.components.MatchBoxScoreDialog
import top.maary.basketmanager.re.ui.components.PlayerDetailBottomSheet
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.theme.RatingRed
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

private data class NewsM3Theme(
    val borderColor: Color,
    val containerColor: Color,
    val accentColor: Color,
    val badgeBgColor: Color,
    val iconVector: androidx.compose.ui.graphics.vector.ImageVector,
    val categoryLabel: String
)

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
    val playoffSeries by viewModel.playoffSeries.collectAsState()
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

                    // Next Match Spotlight Card (Regular Season & Playoffs)
                    val currentDay = game?.currentMatchday ?: 1
                    val isPlayoffs = currentDay in 167..225

                    val userActivePlayoffSeries = remember(playoffSeries, userTeam) {
                        playoffSeries.find { it.winnerTeamId == null && (it.team1Id == userTeam?.id || it.team2Id == userTeam?.id) }
                    }
                    val userEliminatedSeries = remember(playoffSeries, userTeam) {
                        playoffSeries.find { it.winnerTeamId != null && it.winnerTeamId != userTeam?.id && (it.team1Id == userTeam?.id || it.team2Id == userTeam?.id) }
                    }

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
                    } else if (isPlayoffs && userActivePlayoffSeries != null) {
                        val isTeam1 = (userActivePlayoffSeries.team1Id == userTeam?.id)
                        val opponentId = if (isTeam1) userActivePlayoffSeries.team2Id else userActivePlayoffSeries.team1Id
                        val opponentTeam = teamMap[opponentId]
                        val oppStandings = standingsMap[opponentTeam?.id]
                        val userWins = if (isTeam1) userActivePlayoffSeries.team1Wins else userActivePlayoffSeries.team2Wins
                        val oppWins = if (isTeam1) userActivePlayoffSeries.team2Wins else userActivePlayoffSeries.team1Wins
                        val gamesPlayed = userActivePlayoffSeries.team1Wins + userActivePlayoffSeries.team2Wins
                        val nextGameNumber = gamesPlayed + 1

                        val (nextHomeId, _) = PlayoffsEngine.determinePlayoffHomeTeam(userActivePlayoffSeries, gamesPlayed)
                        val isUserHomeNext = (nextHomeId == userTeam?.id)

                        val roundName = when (userActivePlayoffSeries.round) {
                            1 -> "First Round"
                            2 -> "Conference Semifinals"
                            3 -> "Conference Finals"
                            else -> "World Championship Finals"
                        }

                        val roundGameDays = when (userActivePlayoffSeries.round) {
                            1 -> setOf(168, 170, 172, 174, 176, 178, 180)
                            2 -> setOf(183, 185, 187, 189, 191, 193, 195)
                            3 -> setOf(198, 200, 202, 204, 206, 208, 210)
                            else -> setOf(213, 215, 217, 219, 221, 223, 225)
                        }

                        val isGameToday = currentDay in roundGameDays
                        val nextGameDay = roundGameDays.filter { it >= currentDay }.minOrNull() ?: (currentDay + 1)

                        Card(
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface),
                            shape = RoundedCornerShape(12.dp),
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable {
                                    if (opponentTeam != null) {
                                        onNavigateToTeamDetail(opponentTeam.id)
                                    }
                                }
                        ) {
                            Column(modifier = Modifier.padding(14.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                                Row(
                                    modifier = Modifier.fillMaxWidth(),
                                    horizontalArrangement = Arrangement.SpaceBetween,
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                                        Text("🏆", fontSize = 14.sp)
                                        Text(
                                            text = "$roundName • Game $nextGameNumber (Best of 7)",
                                            fontSize = 12.sp,
                                            fontWeight = FontWeight.Bold,
                                            color = MaterialTheme.colorScheme.primary
                                        )
                                    }
                                    Surface(
                                        shape = RoundedCornerShape(4.dp),
                                        color = when {
                                            userWins > oppWins -> RatingGreen.copy(alpha = 0.18f)
                                            userWins < oppWins -> RatingRed.copy(alpha = 0.18f)
                                            else -> Color(0xFFD97706).copy(alpha = 0.18f)
                                        }
                                    ) {
                                        Text(
                                            text = when {
                                                userWins > oppWins -> "Leading $userWins - $oppWins"
                                                userWins < oppWins -> "Trailing $userWins - $oppWins"
                                                else -> "Tied $userWins - $oppWins"
                                            },
                                            fontSize = 11.sp,
                                            fontWeight = FontWeight.ExtraBold,
                                            color = when {
                                                userWins > oppWins -> RatingGreen
                                                userWins < oppWins -> RatingRed
                                                else -> Color(0xFFD97706)
                                            },
                                            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                                        )
                                    }
                                }

                                Row(
                                    modifier = Modifier.fillMaxWidth(),
                                    horizontalArrangement = Arrangement.SpaceBetween,
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Column {
                                        Text(
                                            text = if (isUserHomeNext) "VS ${opponentTeam?.name ?: "Opponent"}" else "@ ${opponentTeam?.name ?: "Opponent"}",
                                            style = MaterialTheme.typography.titleMedium,
                                            fontWeight = FontWeight.ExtraBold
                                        )
                                        Text(
                                            text = "${if (isUserHomeNext) "Home Court 🏟️" else "Away Game ✈️"} • ${oppStandings?.gamesWon ?: 0}W - ${oppStandings?.gamesLost ?: 0}L Reg • Tap for Team Info",
                                            fontSize = 11.sp,
                                            color = MaterialTheme.colorScheme.onSurfaceVariant
                                        )
                                    }

                                    Surface(
                                        shape = RoundedCornerShape(6.dp),
                                        color = if (isGameToday) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surfaceVariant
                                    ) {
                                        Text(
                                            text = if (isGameToday) "⚔️ GAME TODAY" else "✈️ TRAVEL/REST (Day $nextGameDay)",
                                            fontSize = 10.sp,
                                            fontWeight = FontWeight.Bold,
                                            modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                                            color = if (isGameToday) MaterialTheme.colorScheme.onPrimaryContainer else MaterialTheme.colorScheme.onSurfaceVariant
                                        )
                                    }
                                }
                            }
                        }
                    } else if (isPlayoffs && userEliminatedSeries != null) {
                        Card(
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface),
                            shape = RoundedCornerShape(12.dp),
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Column(modifier = Modifier.padding(14.dp)) {
                                Text("Postseason Concluded for Your Team", fontWeight = FontWeight.Bold, fontSize = 13.sp)
                                Text(
                                    text = "Eliminated in Playoffs (${userEliminatedSeries.team1Wins}-${userEliminatedSeries.team2Wins}) • Advance simulation to proceed through league playoffs.",
                                    fontSize = 11.sp,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
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

        // News Feed with Material Design 3 Expressive Tonal Cards & Modern Vector Icons
        items(newsList) { news ->
            val isWin = news.type == NewsType.WON || (news.type == NewsType.PLAYOFFS && news.title.contains("Victory"))
            val isLoss = news.type == NewsType.LOST || (news.type == NewsType.PLAYOFFS && news.title.contains("Defeat"))
            val isImprove = news.type == NewsType.IMPROVE || news.title.contains("Improved")
            val isDecline = news.type == NewsType.DECLINE || news.title.contains("Declined")
            val isInj = news.type == NewsType.INJURED
            val isRecovery = news.type == NewsType.RECOVERY
            val isPlayoff = news.type == NewsType.PLAYOFFS && !news.title.contains("Victory") && !news.title.contains("Defeat")
            val isAward = news.type == NewsType.TROPHY || news.type == NewsType.MVP || news.title.contains("MVP") || news.title.contains("ROY") || news.title.contains("Award") || news.title.contains("Triple Double") || news.title.contains("Explosion") || news.title.contains("Awesome")
            val isTrade = news.type == NewsType.TRADE

            val theme = when {
                isImprove -> NewsM3Theme(
                    borderColor = Color(0xFF00C853).copy(alpha = 0.35f),
                    containerColor = Color(0xFF00C853).copy(alpha = 0.05f),
                    accentColor = Color(0xFF00C853),
                    badgeBgColor = Color(0xFF00C853).copy(alpha = 0.16f),
                    iconVector = Icons.AutoMirrored.Filled.TrendingUp,
                    categoryLabel = "PROGRESSION"
                )
                isDecline -> NewsM3Theme(
                    borderColor = Color(0xFFE53935).copy(alpha = 0.30f),
                    containerColor = Color(0xFFE53935).copy(alpha = 0.04f),
                    accentColor = Color(0xFFE53935),
                    badgeBgColor = Color(0xFFE53935).copy(alpha = 0.14f),
                    iconVector = Icons.AutoMirrored.Filled.TrendingDown,
                    categoryLabel = "REGRESSION"
                )
                isWin -> NewsM3Theme(
                    borderColor = RatingGreen.copy(alpha = 0.35f),
                    containerColor = RatingGreen.copy(alpha = 0.05f),
                    accentColor = RatingGreen,
                    badgeBgColor = RatingGreen.copy(alpha = 0.16f),
                    iconVector = Icons.Default.SportsBasketball,
                    categoryLabel = "VICTORY"
                )
                isLoss -> NewsM3Theme(
                    borderColor = RatingRed.copy(alpha = 0.30f),
                    containerColor = RatingRed.copy(alpha = 0.04f),
                    accentColor = RatingRed,
                    badgeBgColor = RatingRed.copy(alpha = 0.14f),
                    iconVector = Icons.Default.SportsBasketball,
                    categoryLabel = "DEFEAT"
                )
                isInj -> NewsM3Theme(
                    borderColor = MaterialTheme.colorScheme.error.copy(alpha = 0.40f),
                    containerColor = MaterialTheme.colorScheme.errorContainer.copy(alpha = 0.16f),
                    accentColor = MaterialTheme.colorScheme.error,
                    badgeBgColor = MaterialTheme.colorScheme.errorContainer.copy(alpha = 0.50f),
                    iconVector = Icons.Default.MedicalServices,
                    categoryLabel = "INJURY REPORT"
                )
                isRecovery -> NewsM3Theme(
                    borderColor = Color(0xFF00B0FF).copy(alpha = 0.35f),
                    containerColor = Color(0xFF00B0FF).copy(alpha = 0.05f),
                    accentColor = Color(0xFF00B0FF),
                    badgeBgColor = Color(0xFF00B0FF).copy(alpha = 0.16f),
                    iconVector = Icons.Default.Healing,
                    categoryLabel = "MEDICAL CLEARANCE"
                )
                isAward -> NewsM3Theme(
                    borderColor = Color(0xFFFFA000).copy(alpha = 0.40f),
                    containerColor = Color(0xFFFFA000).copy(alpha = 0.05f),
                    accentColor = Color(0xFFFFA000),
                    badgeBgColor = Color(0xFFFFA000).copy(alpha = 0.18f),
                    iconVector = Icons.Default.WorkspacePremium,
                    categoryLabel = "LEAGUE MILESTONE"
                )
                isPlayoff -> NewsM3Theme(
                    borderColor = Color(0xFFFFD700).copy(alpha = 0.45f),
                    containerColor = Color(0xFFFFD700).copy(alpha = 0.06f),
                    accentColor = Color(0xFFFFD700),
                    badgeBgColor = Color(0xFFFFD700).copy(alpha = 0.20f),
                    iconVector = Icons.Default.MilitaryTech,
                    categoryLabel = "POSTSEASON"
                )
                isTrade -> NewsM3Theme(
                    borderColor = Color(0xFF7C4DFF).copy(alpha = 0.35f),
                    containerColor = Color(0xFF7C4DFF).copy(alpha = 0.05f),
                    accentColor = Color(0xFF7C4DFF),
                    badgeBgColor = Color(0xFF7C4DFF).copy(alpha = 0.16f),
                    iconVector = Icons.Default.SwapHoriz,
                    categoryLabel = "TRANSACTION"
                )
                else -> NewsM3Theme(
                    borderColor = MaterialTheme.colorScheme.outlineVariant.copy(alpha = 0.6f),
                    containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.30f),
                    accentColor = MaterialTheme.colorScheme.primary,
                    badgeBgColor = MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.40f),
                    iconVector = Icons.Default.Campaign,
                    categoryLabel = "LEAGUE UPDATE"
                )
            }

            OutlinedCard(
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
                shape = RoundedCornerShape(16.dp),
                border = BorderStroke(1.dp, theme.borderColor),
                colors = CardDefaults.outlinedCardColors(containerColor = theme.containerColor)
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(14.dp),
                    horizontalArrangement = Arrangement.spacedBy(14.dp),
                    verticalAlignment = Alignment.Top
                ) {
                    // M3 Expressive Vector Icon Badge (Left Column)
                    Box(
                        modifier = Modifier
                            .size(46.dp)
                            .clip(RoundedCornerShape(14.dp))
                            .background(theme.badgeBgColor)
                            .border(1.dp, theme.accentColor.copy(alpha = 0.25f), RoundedCornerShape(14.dp)),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = theme.iconVector,
                            contentDescription = null,
                            tint = theme.accentColor,
                            modifier = Modifier.size(24.dp)
                        )
                    }

                    // Content (Right Column)
                    Column(
                        modifier = Modifier.weight(1f),
                        verticalArrangement = Arrangement.spacedBy(4.dp)
                    ) {
                        // Header Row: Category Pill Chip & Matchday
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Surface(
                                shape = RoundedCornerShape(6.dp),
                                color = theme.badgeBgColor
                            ) {
                                Text(
                                    text = theme.categoryLabel,
                                    style = MaterialTheme.typography.labelSmall,
                                    fontWeight = FontWeight.Bold,
                                    fontSize = 10.sp,
                                    color = theme.accentColor,
                                    modifier = Modifier.padding(horizontal = 7.dp, vertical = 2.dp),
                                    letterSpacing = 0.5.sp
                                )
                            }
                            Text(
                                text = "Day ${news.matchday}",
                                style = MaterialTheme.typography.labelSmall,
                                fontWeight = FontWeight.SemiBold,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }

                        val rawLines = news.body.replace("\\n", "\n").lines().filter { it.isNotBlank() }
                        val isMatchNews = (news.type == NewsType.WON || news.type == NewsType.LOST || news.type == NewsType.PLAYOFFS) &&
                            (rawLines.any { it.contains(" @ ") || it.contains(" vs ") } || news.title.contains(" @ ") || news.title.contains(" vs "))

                        if (isMatchNews) {
                            // Extract match score line (e.g. "75 DEN @ 122 OKC") to serve directly as the primary headline
                            val matchScore = rawLines.firstOrNull { it.contains(" @ ") || it.contains(" vs ") }
                                ?: news.title.substringAfter(": ").ifBlank { news.title }

                            Text(
                                text = matchScore,
                                fontWeight = FontWeight.Bold,
                                style = MaterialTheme.typography.titleMedium,
                                fontSize = 15.sp,
                                color = MaterialTheme.colorScheme.onSurface
                            )

                            // Render MVP and leader stats cleanly without redundant score banners
                            val remainingLines = rawLines.filter { it != matchScore }
                            remainingLines.forEach { line ->
                                if (line.startsWith("MVP:")) {
                                    Row(
                                        verticalAlignment = Alignment.CenterVertically,
                                        horizontalArrangement = Arrangement.spacedBy(4.dp),
                                        modifier = Modifier.padding(top = 1.dp, bottom = 1.dp)
                                    ) {
                                        Icon(
                                            Icons.Default.Star,
                                            contentDescription = null,
                                            tint = Color(0xFFFFA000),
                                            modifier = Modifier.size(13.dp)
                                        )
                                        Text(
                                            text = line,
                                            fontWeight = FontWeight.SemiBold,
                                            fontSize = 12.sp,
                                            color = MaterialTheme.colorScheme.primary
                                        )
                                    }
                                } else {
                                    Text(
                                        text = line,
                                        style = MaterialTheme.typography.bodySmall,
                                        fontSize = 12.sp,
                                        lineHeight = 16.sp,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                            }
                        } else {
                            // Non-match news: Standard Title & Body
                            Text(
                                text = news.title,
                                fontWeight = FontWeight.Bold,
                                style = MaterialTheme.typography.titleSmall,
                                color = MaterialTheme.colorScheme.onSurface
                            )

                            rawLines.forEach { line ->
                                if (line.startsWith("1.") || line.startsWith("2.") || line.startsWith("3.")) {
                                    Text(
                                        text = line,
                                        fontWeight = FontWeight.SemiBold,
                                        fontSize = 12.sp,
                                        color = MaterialTheme.colorScheme.primary
                                    )
                                } else {
                                    Text(
                                        text = line,
                                        style = MaterialTheme.typography.bodySmall,
                                        fontSize = 12.sp,
                                        lineHeight = 16.sp,
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
            playoffStats = viewModel.getPlayerPlayoffStats(player.id),
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}
