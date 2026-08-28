package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.EmojiEvents
import androidx.compose.material.icons.filled.Info
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.launch
import top.maary.basketmanager.re.domain.model.*
import top.maary.basketmanager.re.ui.components.MatchBoxScoreDialog
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@Composable
fun PlayoffsScreen(
    viewModel: GameDashboardViewModel
) {
    val game by viewModel.game.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()
    val standings by viewModel.standings.collectAsState()
    val playoffSeries by viewModel.playoffSeries.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()

    var selectedConferenceTab by remember { mutableStateOf(0) } // 0: East, 1: West, 2: Finals
    var selectedSeriesForHistory by remember { mutableStateOf<PlayoffSeries?>(null) }
    var selectedMatchForBoxScore by remember { mutableStateOf<Match?>(null) }

    val teamMap = remember(allTeams) { allTeams.associateBy { it.id } }
    val currentDay = game?.currentMatchday ?: 1
    val isPlayoffsStarted = currentDay > 166

    val eastSeries = remember(playoffSeries) { playoffSeries.filter { it.conference == Conference.EAST } }
    val westSeries = remember(playoffSeries) { playoffSeries.filter { it.conference == Conference.WEST } }
    val finalsSeries = remember(playoffSeries) { playoffSeries.find { it.round == 4 } }

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
                    text = "Playoffs Tournament Tree",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = if (isPlayoffsStarted) "Postseason Series • Best-of-7 Elimination"
                    else "Projected Playoff Picture (Regular Season Day $currentDay/166)",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Surface(
                shape = RoundedCornerShape(8.dp),
                color = if (isPlayoffsStarted) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surfaceVariant
            ) {
                Row(
                    modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    Icon(
                        Icons.Default.EmojiEvents,
                        contentDescription = null,
                        modifier = Modifier.size(16.dp),
                        tint = if (isPlayoffsStarted) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Text(
                        text = if (isPlayoffsStarted) "LIVE" else "PROJECTION",
                        fontWeight = FontWeight.ExtraBold,
                        fontSize = 11.sp
                    )
                }
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        TabRow(
            selectedTabIndex = selectedConferenceTab,
            modifier = Modifier.clip(RoundedCornerShape(8.dp))
        ) {
            Tab(selected = selectedConferenceTab == 0, onClick = { selectedConferenceTab = 0 }, text = { Text("East Bracket") })
            Tab(selected = selectedConferenceTab == 1, onClick = { selectedConferenceTab = 1 }, text = { Text("West Bracket") })
            Tab(selected = selectedConferenceTab == 2, onClick = { selectedConferenceTab = 2 }, text = { Text("The World Finals 🏆") })
        }

        Spacer(modifier = Modifier.height(12.dp))

        if (!isPlayoffsStarted && playoffSeries.isEmpty()) {
            // Projected Bracket based on current regular season standings
            ProjectedBracketView(
                conference = if (selectedConferenceTab == 0) Conference.EAST else Conference.WEST,
                standings = standings,
                teamMap = teamMap,
                userTeamId = userTeam?.id,
                isFinalsTab = selectedConferenceTab == 2
            )
        } else {
            // Live Playoff Bracket View
            when (selectedConferenceTab) {
                0 -> ConferenceBracketList(
                    seriesList = eastSeries,
                    teamMap = teamMap,
                    userTeamId = userTeam?.id,
                    onSeriesClick = { selectedSeriesForHistory = it }
                )
                1 -> ConferenceBracketList(
                    seriesList = westSeries,
                    teamMap = teamMap,
                    userTeamId = userTeam?.id,
                    onSeriesClick = { selectedSeriesForHistory = it }
                )
                2 -> NbaFinalsView(
                    finalsSeries = finalsSeries,
                    teamMap = teamMap,
                    userTeamId = userTeam?.id,
                    onSeriesClick = { selectedSeriesForHistory = it }
                )
            }
        }
    }

    selectedSeriesForHistory?.let { series ->
        PlayoffSeriesHistoryDialog(
            series = series,
            teamMap = teamMap,
            viewModel = viewModel,
            onSelectMatch = { match -> selectedMatchForBoxScore = match },
            onDismiss = { selectedSeriesForHistory = null }
        )
    }

    selectedMatchForBoxScore?.let { match ->
        var boxScores by remember { mutableStateOf<List<MatchResult>>(emptyList()) }
        val scope = rememberCoroutineScope()

        LaunchedEffect(match) {
            scope.launch {
                boxScores = viewModel.getMatchBoxScores(match.id)
            }
        }

        MatchBoxScoreDialog(
            match = match,
            boxScores = boxScores,
            localTeam = teamMap[match.teamLocalId],
            visitorTeam = teamMap[match.teamVisitorId],
            onDismiss = { selectedMatchForBoxScore = null }
        )
    }
}

@Composable
fun ConferenceBracketList(
    seriesList: List<PlayoffSeries>,
    teamMap: Map<Long, Team>,
    userTeamId: Long?,
    onSeriesClick: (PlayoffSeries) -> Unit
) {
    val round1 = seriesList.filter { it.round == 1 }
    val round2 = seriesList.filter { it.round == 2 }
    val round3 = seriesList.filter { it.round == 3 }

    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.spacedBy(14.dp)
    ) {
        if (round3.isNotEmpty()) {
            item {
                Text(
                    text = "Conference Finals (2 Teams)",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.ExtraBold,
                    color = MaterialTheme.colorScheme.primary
                )
            }
            items(round3) { series ->
                PlayoffSeriesCard(series = series, teamMap = teamMap, userTeamId = userTeamId, onClick = { onSeriesClick(series) })
            }
        }

        if (round2.isNotEmpty()) {
            item {
                Text(
                    text = "Conference Semifinals (4 Teams)",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.ExtraBold,
                    color = MaterialTheme.colorScheme.primary
                )
            }
            items(round2) { series ->
                PlayoffSeriesCard(series = series, teamMap = teamMap, userTeamId = userTeamId, onClick = { onSeriesClick(series) })
            }
        }

        item {
            Text(
                text = "First Round (8 Teams • 4 Series)",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.ExtraBold,
                color = MaterialTheme.colorScheme.primary
            )
        }
        items(round1) { series ->
            PlayoffSeriesCard(series = series, teamMap = teamMap, userTeamId = userTeamId, onClick = { onSeriesClick(series) })
        }
    }
}

@Composable
fun NbaFinalsView(
    finalsSeries: PlayoffSeries?,
    teamMap: Map<Long, Team>,
    userTeamId: Long?,
    onSeriesClick: (PlayoffSeries) -> Unit
) {
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Surface(
            shape = CircleShape,
            color = Color(0xFFFFD700),
            modifier = Modifier.size(72.dp)
        ) {
            Box(contentAlignment = Alignment.Center) {
                Icon(
                    Icons.Default.EmojiEvents,
                    contentDescription = null,
                    tint = Color.Black,
                    modifier = Modifier.size(44.dp)
                )
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        Text(
            text = "THE WORLD FINALS",
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Black,
            color = Color(0xFFFFD700)
        )
        Text(
            text = "World Championship Series • Best of 7",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        Spacer(modifier = Modifier.height(16.dp))

        if (finalsSeries != null) {
            PlayoffSeriesCard(
                series = finalsSeries,
                teamMap = teamMap,
                userTeamId = userTeamId,
                onClick = { onSeriesClick(finalsSeries) }
            )

            if (finalsSeries.winnerTeamId != null) {
                val winner = teamMap[finalsSeries.winnerTeamId]
                Spacer(modifier = Modifier.height(16.dp))
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(12.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer)
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "👑 WORLD CHAMPIONS",
                            fontWeight = FontWeight.Black,
                            fontSize = 13.sp,
                            color = MaterialTheme.colorScheme.primary
                        )
                        Text(
                            text = winner?.name ?: "Champion",
                            style = MaterialTheme.typography.titleLarge,
                            fontWeight = FontWeight.ExtraBold
                        )
                    }
                }
            }
        } else {
            Card(
                modifier = Modifier.fillMaxWidth().padding(top = 16.dp),
                shape = RoundedCornerShape(12.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
            ) {
                Box(
                    modifier = Modifier.fillMaxWidth().padding(32.dp),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        text = "World Finals matchup will be determined after the Eastern & Western Conference Finals conclude.",
                        textAlign = TextAlign.Center,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
}

@Composable
fun PlayoffSeriesCard(
    series: PlayoffSeries,
    teamMap: Map<Long, Team>,
    userTeamId: Long?,
    onClick: () -> Unit
) {
    val team1 = teamMap[series.team1Id]
    val team2 = teamMap[series.team2Id]
    val isUserSeries = series.team1Id == userTeamId || series.team2Id == userTeamId
    val isFinished = series.winnerTeamId != null

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(12.dp),
        colors = CardDefaults.cardColors(
            containerColor = if (isUserSeries) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.5f)
            else MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(modifier = Modifier.padding(12.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = if (isFinished) "Series Final" else "In Progress (${series.team1Wins + series.team2Wins} GP)",
                    fontSize = 11.sp,
                    fontWeight = FontWeight.Bold,
                    color = if (isFinished) RatingGreen else MaterialTheme.colorScheme.primary
                )
                Text(
                    text = "Tap to view games ➔",
                    fontSize = 11.sp,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Spacer(modifier = Modifier.height(8.dp))

            // Team 1 Row
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Text("(${series.seed1})", fontWeight = FontWeight.Bold, fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    Text(
                        text = team1?.name ?: "TBD",
                        fontWeight = if (series.winnerTeamId == series.team1Id) FontWeight.ExtraBold else FontWeight.Medium,
                        fontSize = 15.sp,
                        color = if (series.team1Id == userTeamId) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurface
                    )
                    if (series.winnerTeamId == series.team1Id) {
                        Text("✓", color = RatingGreen, fontWeight = FontWeight.Black)
                    }
                }

                Surface(
                    shape = RoundedCornerShape(6.dp),
                    color = if (series.winnerTeamId == series.team1Id) RatingGreen else MaterialTheme.colorScheme.surface
                ) {
                    Text(
                        text = "${series.team1Wins}",
                        fontWeight = FontWeight.Black,
                        fontSize = 16.sp,
                        color = if (series.winnerTeamId == series.team1Id) Color.White else MaterialTheme.colorScheme.onSurface,
                        modifier = Modifier.padding(horizontal = 10.dp, vertical = 2.dp)
                    )
                }
            }

            Spacer(modifier = Modifier.height(6.dp))

            // Team 2 Row
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Text("(${series.seed2})", fontWeight = FontWeight.Bold, fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    Text(
                        text = team2?.name ?: "TBD",
                        fontWeight = if (series.winnerTeamId == series.team2Id) FontWeight.ExtraBold else FontWeight.Medium,
                        fontSize = 15.sp,
                        color = if (series.team2Id == userTeamId) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurface
                    )
                    if (series.winnerTeamId == series.team2Id) {
                        Text("✓", color = RatingGreen, fontWeight = FontWeight.Black)
                    }
                }

                Surface(
                    shape = RoundedCornerShape(6.dp),
                    color = if (series.winnerTeamId == series.team2Id) RatingGreen else MaterialTheme.colorScheme.surface
                ) {
                    Text(
                        text = "${series.team2Wins}",
                        fontWeight = FontWeight.Black,
                        fontSize = 16.sp,
                        color = if (series.winnerTeamId == series.team2Id) Color.White else MaterialTheme.colorScheme.onSurface,
                        modifier = Modifier.padding(horizontal = 10.dp, vertical = 2.dp)
                    )
                }
            }
        }
    }
}

@Composable
fun ProjectedBracketView(
    conference: Conference,
    standings: List<StandingsItem>,
    teamMap: Map<Long, Team>,
    userTeamId: Long?,
    isFinalsTab: Boolean
) {
    if (isFinalsTab) {
        Box(
            modifier = Modifier.fillMaxSize().padding(32.dp),
            contentAlignment = Alignment.Center
        ) {
            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Icon(Icons.Default.EmojiEvents, contentDescription = null, modifier = Modifier.size(56.dp), tint = Color(0xFFFFD700))
                Spacer(modifier = Modifier.height(10.dp))
                Text(
                    text = "World Finals is contested after Conference Finals",
                    fontWeight = FontWeight.Bold,
                    textAlign = TextAlign.Center
                )
                Text(
                    text = "Simulate through Day 166 to lock in real playoff seeds!",
                    fontSize = 12.sp,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    textAlign = TextAlign.Center
                )
            }
        }
        return
    }

    val confStandings = standings.filter { it.conference == conference }.sortedByDescending { it.gamesWon }

    if (confStandings.size < 8) {
        Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
            Text("Calculating standings...", color = MaterialTheme.colorScheme.onSurfaceVariant)
        }
        return
    }

    val matchups = listOf(
        0 to 7, // 1v8
        3 to 4, // 4v5
        1 to 6, // 2v7
        2 to 5  // 3v6
    )

    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.spacedBy(10.dp)
    ) {
        item {
            Text(
                text = "${conference.name} Conference • Projected Round 1",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.ExtraBold,
                color = MaterialTheme.colorScheme.primary
            )
        }

        items(matchups) { (s1Idx, s2Idx) ->
            val t1 = confStandings[s1Idx]
            val t2 = confStandings[s2Idx]

            Card(
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(10.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
            ) {
                Column(modifier = Modifier.padding(12.dp)) {
                    Text(
                        text = "Matchup #${s1Idx + 1} vs #${s2Idx + 1}",
                        fontSize = 11.sp,
                        fontWeight = FontWeight.Bold,
                        color = MaterialTheme.colorScheme.primary
                    )
                    Spacer(modifier = Modifier.height(6.dp))
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text("(#${s1Idx + 1}) ${t1.teamName}", fontWeight = FontWeight.Bold)
                        Text("${t1.gamesWon}-${t1.gamesLost}", fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    }
                    Spacer(modifier = Modifier.height(4.dp))
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text("(#${s2Idx + 1}) ${t2.teamName}", fontWeight = FontWeight.Bold)
                        Text("${t2.gamesWon}-${t2.gamesLost}", fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    }
                }
            }
        }
    }
}

@Composable
fun PlayoffSeriesHistoryDialog(
    series: PlayoffSeries,
    teamMap: Map<Long, Team>,
    viewModel: GameDashboardViewModel,
    onSelectMatch: (Match) -> Unit,
    onDismiss: () -> Unit
) {
    val team1 = teamMap[series.team1Id]
    val team2 = teamMap[series.team2Id]
    var matches by remember { mutableStateOf<List<Match>>(emptyList()) }
    val scope = rememberCoroutineScope()

    LaunchedEffect(series) {
        scope.launch {
            val allMatches = viewModel.getTeamSchedule(series.team1Id)
            matches = allMatches.filter {
                it.matchday > 166 &&
                ((it.teamLocalId == series.team1Id && it.teamVisitorId == series.team2Id) ||
                 (it.teamLocalId == series.team2Id && it.teamVisitorId == series.team1Id))
            }
        }
    }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Column {
                Text(
                    text = "${team1?.name} vs ${team2?.name}",
                    fontWeight = FontWeight.ExtraBold,
                    fontSize = 18.sp
                )
                Text(
                    text = "Series Score: ${series.team1Wins} - ${series.team2Wins}",
                    fontSize = 12.sp,
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.Bold
                )
            }
        },
        text = {
            Column(modifier = Modifier.fillMaxWidth()) {
                if (matches.isEmpty()) {
                    Box(modifier = Modifier.fillMaxWidth().padding(16.dp), contentAlignment = Alignment.Center) {
                        Text("No games played in this series yet.", color = MaterialTheme.colorScheme.onSurfaceVariant)
                    }
                } else {
                    LazyColumn(
                        modifier = Modifier.fillMaxWidth().heightIn(max = 300.dp),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        items(matches) { match ->
                            val local = teamMap[match.teamLocalId]
                            val visitor = teamMap[match.teamVisitorId]
                            val isTeam1Won = (match.localScore ?: 0) > (match.visitorScore ?: 0)

                            Card(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .clickable { onSelectMatch(match) },
                                shape = RoundedCornerShape(8.dp),
                                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
                            ) {
                                Row(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(10.dp),
                                    horizontalArrangement = Arrangement.SpaceBetween,
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Column {
                                        Text("Day ${match.matchday}", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                                        Text("${local?.name} vs ${visitor?.name}", fontWeight = FontWeight.Bold, fontSize = 13.sp)
                                    }
                                    Text(
                                        text = "${match.localScore} - ${match.visitorScore}",
                                        fontWeight = FontWeight.ExtraBold,
                                        fontSize = 15.sp,
                                        color = MaterialTheme.colorScheme.primary
                                    )
                                }
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        }
    )
}
