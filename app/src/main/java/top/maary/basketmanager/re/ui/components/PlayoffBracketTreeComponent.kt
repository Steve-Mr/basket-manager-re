package top.maary.basketmanager.re.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.EmojiEvents
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
import top.maary.basketmanager.re.domain.model.Conference
import top.maary.basketmanager.re.domain.model.Match
import top.maary.basketmanager.re.domain.model.PlayoffSeries
import top.maary.basketmanager.re.domain.model.StandingsItem
import top.maary.basketmanager.re.domain.model.Team
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@Composable
fun VerticalPlayoffBracketView(
    playoffSeries: List<PlayoffSeries>,
    standings: List<StandingsItem>,
    teamMap: Map<Long, Team>,
    userTeamId: Long?,
    isPlayoffsStarted: Boolean,
    onSeriesClick: (PlayoffSeries) -> Unit
) {
    // West Series
    val westR1 = remember(playoffSeries) { playoffSeries.filter { it.conference == Conference.WEST && it.round == 1 } }
    val westR2 = remember(playoffSeries) { playoffSeries.filter { it.conference == Conference.WEST && it.round == 2 } }
    val westR3 = remember(playoffSeries) { playoffSeries.find { it.conference == Conference.WEST && it.round == 3 } }

    // East Series
    val eastR1 = remember(playoffSeries) { playoffSeries.filter { it.conference == Conference.EAST && it.round == 1 } }
    val eastR2 = remember(playoffSeries) { playoffSeries.filter { it.conference == Conference.EAST && it.round == 2 } }
    val eastR3 = remember(playoffSeries) { playoffSeries.find { it.conference == Conference.EAST && it.round == 3 } }

    // Finals
    val finalsSeries = remember(playoffSeries) { playoffSeries.find { it.round == 4 } }

    // Standings Projections
    val westStandings = remember(standings) { standings.filter { it.conference == Conference.WEST }.sortedByDescending { it.gamesWon } }
    val eastStandings = remember(standings) { standings.filter { it.conference == Conference.EAST }.sortedByDescending { it.gamesWon } }

    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.spacedBy(14.dp),
        contentPadding = PaddingValues(bottom = 24.dp)
    ) {
        // 1. TOP HERO: THE WORLD FINALS & TROPHY
        item {
            Card(
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(14.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
            ) {
                Column(
                    modifier = Modifier.fillMaxWidth().padding(12.dp),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(6.dp)
                    ) {
                        Surface(
                            shape = CircleShape,
                            color = Color(0xFFFFD700),
                            modifier = Modifier.size(28.dp)
                        ) {
                            Box(contentAlignment = Alignment.Center) {
                                Icon(
                                    Icons.Default.EmojiEvents,
                                    contentDescription = null,
                                    tint = Color.Black,
                                    modifier = Modifier.size(18.dp)
                                )
                            }
                        }
                        Text(
                            text = "THE WORLD FINALS 🏆",
                            fontWeight = FontWeight.Black,
                            fontSize = 14.sp,
                            color = Color(0xFFFFB300)
                        )
                    }

                    Spacer(modifier = Modifier.height(8.dp))

                    if (isPlayoffsStarted && finalsSeries != null) {
                        BracketMatchupBox(
                            series = finalsSeries,
                            teamMap = teamMap,
                            userTeamId = userTeamId,
                            onClick = onSeriesClick
                        )

                        if (finalsSeries.winnerTeamId != null) {
                            val winner = teamMap[finalsSeries.winnerTeamId]
                            Spacer(modifier = Modifier.height(6.dp))
                            Surface(
                                shape = RoundedCornerShape(6.dp),
                                color = Color(0xFFFFD700)
                            ) {
                                Text(
                                    text = "👑 WORLD CHAMPION: ${winner?.name ?: "TBD"}",
                                    fontWeight = FontWeight.Black,
                                    fontSize = 11.sp,
                                    color = Color.Black,
                                    modifier = Modifier.padding(horizontal = 8.dp, vertical = 3.dp)
                                )
                            }
                        }
                    } else {
                        EmptyMatchupBox(title = "NBA World Finals (West Champion vs East Champion)")
                    }
                }
            }
        }

        // 2. CONFERENCE FINALS (West Finals vs East Finals)
        item {
            Column(modifier = Modifier.fillMaxWidth()) {
                Text(
                    text = "CONFERENCE FINALS (分区决赛)",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Black,
                    color = MaterialTheme.colorScheme.primary
                )
                Spacer(modifier = Modifier.height(6.dp))
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    // West Finals
                    Column(modifier = Modifier.weight(1f)) {
                        Text("WEST FINALS", fontSize = 10.sp, fontWeight = FontWeight.Bold, color = Color(0xFF1976D2))
                        Spacer(modifier = Modifier.height(4.dp))
                        if (isPlayoffsStarted && westR3 != null) {
                            BracketMatchupBox(westR3, teamMap, userTeamId, onSeriesClick)
                        } else {
                            EmptyMatchupBox(title = "West Finals (TBD)")
                        }
                    }
                    // East Finals
                    Column(modifier = Modifier.weight(1f)) {
                        Text("EAST FINALS", fontSize = 10.sp, fontWeight = FontWeight.Bold, color = Color(0xFFD32F2F))
                        Spacer(modifier = Modifier.height(4.dp))
                        if (isPlayoffsStarted && eastR3 != null) {
                            BracketMatchupBox(eastR3, teamMap, userTeamId, onSeriesClick)
                        } else {
                            EmptyMatchupBox(title = "East Finals (TBD)")
                        }
                    }
                }
            }
        }

        // 3. CONFERENCE SEMIFINALS (4 Matchups: 2 West, 2 East)
        item {
            Column(modifier = Modifier.fillMaxWidth()) {
                Text(
                    text = "CONFERENCE SEMIFINALS (分区半决赛)",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Black,
                    color = MaterialTheme.colorScheme.primary
                )
                Spacer(modifier = Modifier.height(6.dp))
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    // West Semis Column
                    Column(
                        modifier = Modifier.weight(1f),
                        verticalArrangement = Arrangement.spacedBy(6.dp)
                    ) {
                        Text("WEST SEMIS", fontSize = 10.sp, fontWeight = FontWeight.Bold, color = Color(0xFF1976D2))
                        if (isPlayoffsStarted && westR2.size >= 2) {
                            BracketMatchupBox(westR2[0], teamMap, userTeamId, onSeriesClick)
                            BracketMatchupBox(westR2[1], teamMap, userTeamId, onSeriesClick)
                        } else {
                            EmptyMatchupBox(title = "West Semis #1")
                            EmptyMatchupBox(title = "West Semis #2")
                        }
                    }
                    // East Semis Column
                    Column(
                        modifier = Modifier.weight(1f),
                        verticalArrangement = Arrangement.spacedBy(6.dp)
                    ) {
                        Text("EAST SEMIS", fontSize = 10.sp, fontWeight = FontWeight.Bold, color = Color(0xFFD32F2F))
                        if (isPlayoffsStarted && eastR2.size >= 2) {
                            BracketMatchupBox(eastR2[0], teamMap, userTeamId, onSeriesClick)
                            BracketMatchupBox(eastR2[1], teamMap, userTeamId, onSeriesClick)
                        } else {
                            EmptyMatchupBox(title = "East Semis #1")
                            EmptyMatchupBox(title = "East Semis #2")
                        }
                    }
                }
            }
        }

        // 4. FIRST ROUND (8 Matchups: 4 West on Left, 4 East on Right)
        item {
            Column(modifier = Modifier.fillMaxWidth()) {
                Text(
                    text = "FIRST ROUND (季后赛首轮 • 8组对决)",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Black,
                    color = MaterialTheme.colorScheme.primary
                )
                Spacer(modifier = Modifier.height(6.dp))
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    // West First Round Column (1v8, 4v5, 3v6, 2v7)
                    Column(
                        modifier = Modifier.weight(1f),
                        verticalArrangement = Arrangement.spacedBy(6.dp)
                    ) {
                        Text("WEST FIRST ROUND", fontSize = 10.sp, fontWeight = FontWeight.Bold, color = Color(0xFF1976D2))
                        if (isPlayoffsStarted && westR1.size >= 4) {
                            westR1.forEach { series ->
                                BracketMatchupBox(series, teamMap, userTeamId, onSeriesClick)
                            }
                        } else if (westStandings.size >= 8) {
                            ProjectedMatchupBox(westStandings[0], westStandings[7], 1, 8, userTeamId)
                            ProjectedMatchupBox(westStandings[3], westStandings[4], 4, 5, userTeamId)
                            ProjectedMatchupBox(westStandings[2], westStandings[5], 3, 6, userTeamId)
                            ProjectedMatchupBox(westStandings[1], westStandings[6], 2, 7, userTeamId)
                        }
                    }

                    // East First Round Column (1v8, 4v5, 3v6, 2v7)
                    Column(
                        modifier = Modifier.weight(1f),
                        verticalArrangement = Arrangement.spacedBy(6.dp)
                    ) {
                        Text("EAST FIRST ROUND", fontSize = 10.sp, fontWeight = FontWeight.Bold, color = Color(0xFFD32F2F))
                        if (isPlayoffsStarted && eastR1.size >= 4) {
                            eastR1.forEach { series ->
                                BracketMatchupBox(series, teamMap, userTeamId, onSeriesClick)
                            }
                        } else if (eastStandings.size >= 8) {
                            ProjectedMatchupBox(eastStandings[0], eastStandings[7], 1, 8, userTeamId)
                            ProjectedMatchupBox(eastStandings[3], eastStandings[4], 4, 5, userTeamId)
                            ProjectedMatchupBox(eastStandings[2], eastStandings[5], 3, 6, userTeamId)
                            ProjectedMatchupBox(eastStandings[1], eastStandings[6], 2, 7, userTeamId)
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun BracketMatchupBox(
    series: PlayoffSeries,
    teamMap: Map<Long, Team>,
    userTeamId: Long?,
    onClick: (PlayoffSeries) -> Unit
) {
    val team1 = teamMap[series.team1Id]
    val team2 = teamMap[series.team2Id]
    val isUser = series.team1Id == userTeamId || series.team2Id == userTeamId

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(8.dp))
            .clickable { onClick(series) }
            .then(
                if (isUser) Modifier.border(1.5.dp, MaterialTheme.colorScheme.primary, RoundedCornerShape(8.dp))
                else Modifier
            ),
        shape = RoundedCornerShape(8.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
    ) {
        Column {
            // Team 1 Row
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .background(if (series.winnerTeamId == series.team1Id) RatingGreen.copy(alpha = 0.2f) else Color.Transparent)
                    .padding(horizontal = 6.dp, vertical = 5.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(4.dp),
                    modifier = Modifier.weight(1f)
                ) {
                    Text("${series.seed1}", fontSize = 10.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.outline)
                    Text(
                        text = team1?.name ?: "TBD",
                        fontSize = 11.sp,
                        fontWeight = if (series.winnerTeamId == series.team1Id) FontWeight.Black else FontWeight.Medium,
                        color = if (series.team1Id == userTeamId) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurface,
                        maxLines = 1
                    )
                }
                Text(
                    text = "${series.team1Wins}",
                    fontSize = 12.sp,
                    fontWeight = FontWeight.ExtraBold,
                    color = if (series.winnerTeamId == series.team1Id) RatingGreen else MaterialTheme.colorScheme.onSurface
                )
            }

            HorizontalDivider(thickness = 0.5.dp, color = MaterialTheme.colorScheme.outlineVariant)

            // Team 2 Row
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .background(if (series.winnerTeamId == series.team2Id) RatingGreen.copy(alpha = 0.2f) else Color.Transparent)
                    .padding(horizontal = 6.dp, vertical = 5.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(4.dp),
                    modifier = Modifier.weight(1f)
                ) {
                    Text("${series.seed2}", fontSize = 10.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.outline)
                    Text(
                        text = team2?.name ?: "TBD",
                        fontSize = 11.sp,
                        fontWeight = if (series.winnerTeamId == series.team2Id) FontWeight.Black else FontWeight.Medium,
                        color = if (series.team2Id == userTeamId) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurface,
                        maxLines = 1
                    )
                }
                Text(
                    text = "${series.team2Wins}",
                    fontSize = 12.sp,
                    fontWeight = FontWeight.ExtraBold,
                    color = if (series.winnerTeamId == series.team2Id) RatingGreen else MaterialTheme.colorScheme.onSurface
                )
            }
        }
    }
}

@Composable
fun ProjectedMatchupBox(
    t1: StandingsItem,
    t2: StandingsItem,
    seed1: Int,
    seed2: Int,
    userTeamId: Long?
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(8.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.7f))
    ) {
        Column {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 6.dp, vertical = 4.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(horizontalArrangement = Arrangement.spacedBy(4.dp), modifier = Modifier.weight(1f)) {
                    Text("$seed1", fontSize = 10.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.outline)
                    Text(
                        text = t1.teamName,
                        fontSize = 11.sp,
                        fontWeight = FontWeight.Bold,
                        color = if (t1.teamId == userTeamId) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurface,
                        maxLines = 1
                    )
                }
                Text("${t1.gamesWon}W", fontSize = 10.sp, color = MaterialTheme.colorScheme.outline)
            }

            HorizontalDivider(thickness = 0.5.dp, color = MaterialTheme.colorScheme.outlineVariant)

            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 6.dp, vertical = 4.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(horizontalArrangement = Arrangement.spacedBy(4.dp), modifier = Modifier.weight(1f)) {
                    Text("$seed2", fontSize = 10.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.outline)
                    Text(
                        text = t2.teamName,
                        fontSize = 11.sp,
                        fontWeight = FontWeight.Bold,
                        color = if (t2.teamId == userTeamId) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurface,
                        maxLines = 1
                    )
                }
                Text("${t2.gamesWon}W", fontSize = 10.sp, color = MaterialTheme.colorScheme.outline)
            }
        }
    }
}

@Composable
fun EmptyMatchupBox(title: String) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(8.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.3f))
    ) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .padding(vertical = 12.dp),
            contentAlignment = Alignment.Center
        ) {
            Text(
                text = title,
                fontSize = 10.sp,
                color = MaterialTheme.colorScheme.outline,
                fontWeight = FontWeight.Medium
            )
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
