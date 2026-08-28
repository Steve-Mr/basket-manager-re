package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.Star
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
import top.maary.basketmanager.re.ui.components.PlayerDetailBottomSheet
import top.maary.basketmanager.re.ui.components.PositionBadge
import top.maary.basketmanager.re.ui.components.RatingBadge
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.theme.RatingRed
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TeamDetailScreen(
    teamId: Long,
    viewModel: GameDashboardViewModel,
    onBack: () -> Unit
) {
    val allTeams by viewModel.allTeams.collectAsState()
    val standings by viewModel.standings.collectAsState()
    val scope = rememberCoroutineScope()

    val team = remember(allTeams, teamId) { allTeams.find { it.id == teamId } }
    val teamMap = remember(allTeams) { allTeams.associateBy { it.id } }
    val teamStandings = remember(standings, teamId) { standings.find { it.teamId == teamId } }

    var roster by remember { mutableStateOf<List<Player>>(emptyList()) }
    var schedule by remember { mutableStateOf<List<Match>>(emptyList()) }
    var tactic by remember { mutableStateOf<Tactic?>(null) }
    var selectedTab by remember { mutableStateOf(0) } // 0: Roster, 1: Lineup, 2: Schedule

    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }
    var selectedMatchForBoxScore by remember { mutableStateOf<Match?>(null) }
    var boxScoreResults by remember { mutableStateOf<List<MatchResult>>(emptyList()) }

    LaunchedEffect(teamId) {
        roster = viewModel.getTeamRoster(teamId)
        schedule = viewModel.getTeamSchedule(teamId)
        tactic = viewModel.getTeamTactic(teamId)
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Column {
                        Text(
                            text = team?.name ?: "Team Details",
                            fontWeight = FontWeight.Bold,
                            style = MaterialTheme.typography.titleLarge
                        )
                        Text(
                            text = "${team?.conference?.name ?: ""} Conference • ${team?.division?.displayName ?: ""}",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(horizontal = 16.dp)
        ) {
            // Team Banner Card
            Card(
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer),
                shape = RoundedCornerShape(14.dp),
                modifier = Modifier.fillMaxWidth()
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column {
                        Text(
                            text = "${teamStandings?.gamesWon ?: 0}W - ${teamStandings?.gamesLost ?: 0}L",
                            fontSize = 24.sp,
                            fontWeight = FontWeight.ExtraBold,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        Text(
                            text = "PTS Diff: ${((teamStandings?.pointsScored ?: 0) - (teamStandings?.pointsAllowed ?: 0))}",
                            fontSize = 12.sp,
                            color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.8f)
                        )
                    }

                    Column(horizontalAlignment = Alignment.End) {
                        val avgRating = if (roster.isNotEmpty()) roster.map { it.overallRating }.average().toInt() else 75
                        Surface(
                            shape = RoundedCornerShape(8.dp),
                            color = MaterialTheme.colorScheme.primary
                        ) {
                            Text(
                                text = "Avg Rating: $avgRating",
                                fontWeight = FontWeight.Bold,
                                color = Color.White,
                                modifier = Modifier.padding(horizontal = 10.dp, vertical = 6.dp),
                                fontSize = 12.sp
                            )
                        }
                        Spacer(modifier = Modifier.height(4.dp))
                        Text(
                            text = "${roster.size} Players on Roster",
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.8f)
                        )
                    }
                }
            }

            Spacer(modifier = Modifier.height(10.dp))

            // Sub Navigation Tabs
            TabRow(selectedTabIndex = selectedTab) {
                Tab(
                    selected = selectedTab == 0,
                    onClick = { selectedTab = 0 },
                    text = { Text("Roster (${roster.size})") }
                )
                Tab(
                    selected = selectedTab == 1,
                    onClick = { selectedTab = 1 },
                    text = { Text("Starting 5") }
                )
                Tab(
                    selected = selectedTab == 2,
                    onClick = { selectedTab = 2 },
                    text = { Text("Stats") }
                )
                Tab(
                    selected = selectedTab == 3,
                    onClick = { selectedTab = 3 },
                    text = { Text("Schedule (${schedule.size})") }
                )
            }

            Spacer(modifier = Modifier.height(10.dp))

            when (selectedTab) {
                2 -> {
                    // Team Statistics Tab
                    TeamStatsScreen(viewModel = viewModel, targetTeamId = teamId)
                }
                0 -> {
                    // Squad Roster List
                    LazyColumn(
                        modifier = Modifier.fillMaxSize(),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        items(roster.sortedByDescending { it.overallRating }) { player ->
                            Card(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .clickable { selectedPlayerForDetail = player },
                                shape = RoundedCornerShape(10.dp),
                                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                            ) {
                                Row(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(12.dp),
                                    horizontalArrangement = Arrangement.SpaceBetween,
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Row(
                                        verticalAlignment = Alignment.CenterVertically,
                                        horizontalArrangement = Arrangement.spacedBy(10.dp)
                                    ) {
                                        RatingBadge(rating = player.overallRating)
                                        Column {
                                            Text(player.name, fontWeight = FontWeight.Bold, fontSize = 14.sp)
                                            Row(
                                                verticalAlignment = Alignment.CenterVertically,
                                                horizontalArrangement = Arrangement.spacedBy(6.dp)
                                            ) {
                                                PositionBadge(position = player.positionFirst)
                                                if (player.positionSecond != Position.NONE) {
                                                    PositionBadge(position = player.positionSecond)
                                                }
                                                Text(
                                                    text = "Age: ${player.age} • Pot: ★${player.potential}",
                                                    fontSize = 11.sp,
                                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                                )
                                            }
                                        }
                                    }

                                    if (player.stateInjury > 0) {
                                        Surface(
                                            shape = RoundedCornerShape(4.dp),
                                            color = MaterialTheme.colorScheme.errorContainer
                                        ) {
                                            Text(
                                                text = "INJ (${player.stateInjury}d)",
                                                fontSize = 11.sp,
                                                fontWeight = FontWeight.Bold,
                                                color = MaterialTheme.colorScheme.onErrorContainer,
                                                modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                                            )
                                        }
                                    } else {
                                        Surface(
                                            shape = RoundedCornerShape(4.dp),
                                            color = MaterialTheme.colorScheme.surface
                                        ) {
                                            Text(
                                                text = "Form: ${player.stateForm}%",
                                                fontSize = 11.sp,
                                                modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                                            )
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                1 -> {
                    // Starting 5 and Bench Breakdown
                    val playerMap = remember(roster) { roster.associateBy { it.id } }
                    val star1 = playerMap[tactic?.starOnePlayerId]
                    val star2 = playerMap[tactic?.starTwoPlayerId]
                    val star3 = playerMap[tactic?.starThreePlayerId]

                    LazyColumn(
                        modifier = Modifier.fillMaxSize(),
                        verticalArrangement = Arrangement.spacedBy(10.dp)
                    ) {
                        item {
                            Text("Starting Five", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                        }

                        val starterList = listOf(
                            "PG" to playerMap[tactic?.starterPgId],
                            "SG" to playerMap[tactic?.starterSgId],
                            "SF" to playerMap[tactic?.starterSfId],
                            "PF" to playerMap[tactic?.starterPfId],
                            "C" to playerMap[tactic?.starterCId]
                        )

                        items(starterList) { (pos, p) ->
                            Card(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .clickable(enabled = p != null) { selectedPlayerForDetail = p },
                                shape = RoundedCornerShape(10.dp),
                                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                            ) {
                                Row(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(12.dp),
                                    horizontalArrangement = Arrangement.SpaceBetween,
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Row(
                                        verticalAlignment = Alignment.CenterVertically,
                                        horizontalArrangement = Arrangement.spacedBy(10.dp)
                                    ) {
                                        PositionBadge(position = pos)
                                        if (p != null) {
                                            RatingBadge(rating = p.overallRating)
                                            Column {
                                                Text(p.name, fontWeight = FontWeight.Bold, fontSize = 14.sp)
                                                Text("Age: ${p.age} • Form: ${p.stateForm}%", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                                            }
                                        } else {
                                            Text("Unassigned", color = MaterialTheme.colorScheme.onSurfaceVariant)
                                        }
                                    }

                                    if (p != null && (p.id == star1?.id || p.id == star2?.id || p.id == star3?.id)) {
                                        Icon(Icons.Default.Star, contentDescription = null, tint = Color(0xFFFFD700))
                                    }
                                }
                            }
                        }

                        item {
                            Spacer(modifier = Modifier.height(6.dp))
                            Text("Bench Rotation (6th Men)", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                        }

                        val reserveList = listOf(
                            "PG (6th)" to playerMap[tactic?.reservePgId],
                            "SG (6th)" to playerMap[tactic?.reserveSgId],
                            "SF (6th)" to playerMap[tactic?.reserveSfId],
                            "PF (6th)" to playerMap[tactic?.reservePfId],
                            "C (6th)" to playerMap[tactic?.reserveCId]
                        )

                        items(reserveList) { (pos, p) ->
                            Card(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .clickable(enabled = p != null) { selectedPlayerForDetail = p },
                                shape = RoundedCornerShape(10.dp),
                                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.7f))
                            ) {
                                Row(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(12.dp),
                                    horizontalArrangement = Arrangement.SpaceBetween,
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Row(
                                        verticalAlignment = Alignment.CenterVertically,
                                        horizontalArrangement = Arrangement.spacedBy(10.dp)
                                    ) {
                                        PositionBadge(position = pos)
                                        if (p != null) {
                                            RatingBadge(rating = p.overallRating)
                                            Text(p.name, fontWeight = FontWeight.Bold, fontSize = 14.sp)
                                        } else {
                                            Text("Unassigned", color = MaterialTheme.colorScheme.onSurfaceVariant)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                3 -> {
                    // Team 82-Game Schedule & Results
                    LazyColumn(
                        modifier = Modifier.fillMaxSize(),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        items(schedule) { match ->
                            val isHome = (match.teamLocalId == teamId)
                            val opponent = if (isHome) teamMap[match.teamVisitorId] else teamMap[match.teamLocalId]
                            val matchText = if (isHome) "VS ${opponent?.name ?: "OPP"}" else "@ ${opponent?.name ?: "OPP"}"

                            val won = if (!match.isPlayed) null
                            else if (isHome) (match.localScore ?: 0) > (match.visitorScore ?: 0)
                            else (match.visitorScore ?: 0) > (match.localScore ?: 0)

                            Card(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .clickable(enabled = match.isPlayed) {
                                        scope.launch {
                                            boxScoreResults = viewModel.getMatchBoxScores(match.id)
                                            selectedMatchForBoxScore = match
                                        }
                                    },
                                shape = RoundedCornerShape(10.dp),
                                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                            ) {
                                Row(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(12.dp),
                                    horizontalArrangement = Arrangement.SpaceBetween,
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Row(
                                        verticalAlignment = Alignment.CenterVertically,
                                        horizontalArrangement = Arrangement.spacedBy(10.dp)
                                    ) {
                                        Text(
                                            text = "Day ${match.matchday}",
                                            fontWeight = FontWeight.Bold,
                                            fontSize = 12.sp,
                                            color = MaterialTheme.colorScheme.primary
                                        )
                                        Text(
                                            text = matchText,
                                            fontWeight = FontWeight.Bold,
                                            fontSize = 14.sp
                                        )
                                    }

                                    if (match.isPlayed) {
                                        Row(
                                            verticalAlignment = Alignment.CenterVertically,
                                            horizontalArrangement = Arrangement.spacedBy(6.dp)
                                        ) {
                                            Text(
                                                text = if (won == true) "W" else "L",
                                                fontWeight = FontWeight.ExtraBold,
                                                color = if (won == true) RatingGreen else RatingRed,
                                                fontSize = 13.sp
                                            )
                                            Text(
                                                text = "${match.visitorScore} - ${match.localScore}",
                                                fontWeight = FontWeight.Bold,
                                                fontSize = 13.sp
                                            )
                                        }
                                    } else {
                                        Text("Upcoming", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(
            player = player,
            stats = viewModel.getPlayerSeasonStats(player.id), playoffStats = viewModel.getPlayerPlayoffStats(player.id),
            onDismiss = { selectedPlayerForDetail = null }
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
}
