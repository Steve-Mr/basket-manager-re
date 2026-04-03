package re.manager.basket.ui.screen

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.entity.TeamEntity

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CalendarScreen(
    matches: List<MatchEntity>,
    teams: List<TeamEntity>,
    currentMatchday: Int,
    selectedDayInitial: Int,
    userTeamId: Int?,
    onDayClick: (Int) -> Unit = {},
    onMatchClick: (MatchEntity) -> Unit = {},
    onBack: () -> Unit = {}
) {
    val teamsMap = teams.associateBy { it.id }
    val matchesByDay = remember(matches) { matches.groupBy { it.matchday } }

    // Show all 234 days regardless of whether they have matches
    val sortedDays = (1..234).toList()

    val listState = rememberLazyListState()

    // Scroll to the selected day initially
    LaunchedEffect(selectedDayInitial) {
        val index = sortedDays.indexOf(selectedDayInitial).coerceAtLeast(0)
        listState.animateScrollToItem(index)
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Season Calendar") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { padding ->
        Row(modifier = Modifier.fillMaxSize().padding(padding)) {
            // Left Column: Days (Increased width to show more detail)
            LazyColumn(
                state = listState,
                modifier = Modifier.width(100.dp).fillMaxHeight().background(MaterialTheme.colorScheme.surfaceVariant),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                items(sortedDays) { day ->
                    val isSelected = day == selectedDayInitial
                    val userMatch = matchesByDay[day]?.find { it.teamLocalId == userTeamId || it.teamVisitorId == userTeamId }
                    val opponent = userMatch?.let { if (it.teamLocalId == userTeamId) teamsMap[it.teamVisitorId] else teamsMap[it.teamLocalId] }
                    val isHome = userMatch?.teamLocalId == userTeamId

                    val isPlayed = userMatch != null && userMatch.localQ1 + userMatch.visitorQ1 > 0
                    val isWin = if (isPlayed) {
                        val localTotal = userMatch!!.localQ1 + userMatch.localQ2 + userMatch.localQ3 + userMatch.localQ4
                        val visitorTotal = userMatch.visitorQ1 + userMatch.visitorQ2 + userMatch.visitorQ3 + userMatch.visitorQ4
                        (isHome && localTotal > visitorTotal) || (!isHome && visitorTotal > localTotal)
                    } else false

                    val phase = when {
                        day > 233 -> "End"
                        day == 233 -> "FA"
                        day > 230 -> "Draft"
                        day > 225 -> "Renw"
                        day > 212 -> "Final"
                        day > 198 -> "Conf F"
                        day > 182 -> "Semi"
                        day > 166 -> "R1"
                        else -> ""
                    }

                    Box(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { onDayClick(day) }
                            .background(
                                when {
                                    isSelected -> MaterialTheme.colorScheme.primaryContainer
                                    isPlayed && isWin -> Color(0xFFE8F5E9)
                                    isPlayed && !isWin -> Color(0xFFFFEBEE)
                                    else -> Color.Transparent
                                }
                            )
                            .padding(vertical = 8.dp, horizontal = 4.dp),
                        contentAlignment = Alignment.Center
                    ) {
                        Column(horizontalAlignment = Alignment.CenterHorizontally) {
                            Text(
                                text = "D$day",
                                style = MaterialTheme.typography.labelSmall,
                                color = if (isSelected) MaterialTheme.colorScheme.primary else Color.Gray
                            )
                            if (userMatch != null) {
                                Text(
                                    text = (if (isHome) "vs " else "@ ") + (opponent?.name ?: "???"),
                                    style = MaterialTheme.typography.labelMedium,
                                    fontWeight = FontWeight.Bold,
                                    color = when {
                                        isPlayed && isWin -> Color(0xFF2E7D32)
                                        isPlayed && !isWin -> Color(0xFFC62828)
                                        else -> MaterialTheme.colorScheme.onSurfaceVariant
                                    }
                                )
                            }
                            if (phase.isNotEmpty()) {
                                Text(
                                    text = phase,
                                    style = MaterialTheme.typography.labelSmall,
                                    fontWeight = FontWeight.ExtraBold,
                                    color = MaterialTheme.colorScheme.secondary
                                )
                            }
                        }
                    }
                }
            }

            // Right Column: Matches
            Column(modifier = Modifier.weight(1f).fillMaxHeight().padding(16.dp)) {
                Text("Matchday $selectedDayInitial", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
                Spacer(modifier = Modifier.height(16.dp))

                val dayMatches = matchesByDay[selectedDayInitial] ?: emptyList()
                LazyColumn(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                    items(dayMatches) { matchItem ->
                        val match = matchItem as MatchEntity
                        val localTeam = teamsMap[match.teamLocalId]
                        val visitorTeam = teamsMap[match.teamVisitorId]
                        val isUserMatch = match.teamLocalId == userTeamId || match.teamVisitorId == userTeamId
                        val isPlayed = match.localQ1 + match.visitorQ1 > 0

                        val localTotal = match.localQ1 + match.localQ2 + match.localQ3 + match.localQ4
                        val visitorTotal = match.visitorQ1 + match.visitorQ2 + match.visitorQ3 + match.visitorQ4
                        val isUserWin = isUserMatch && isPlayed && (
                            (match.teamLocalId == userTeamId && localTotal > visitorTotal) ||
                            (match.teamVisitorId == userTeamId && visitorTotal > localTotal)
                        )
                        val isUserLoss = isUserMatch && isPlayed && !isUserWin

                        Card(
                            modifier = Modifier.fillMaxWidth(),
                            onClick = { onMatchClick(match) },
                            colors = CardDefaults.cardColors(
                                containerColor = when {
                                    isUserWin -> Color(0xFFE8F5E9)
                                    isUserLoss -> Color(0xFFFFEBEE)
                                    isUserMatch -> MaterialTheme.colorScheme.primaryContainer
                                    else -> MaterialTheme.colorScheme.surface
                                }
                            )
                        ) {
                            Row(
                                modifier = Modifier.padding(16.dp).fillMaxWidth(),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Column(horizontalAlignment = Alignment.CenterHorizontally, modifier = Modifier.weight(1f)) {
                                    Text(localTeam?.name ?: "???", fontWeight = FontWeight.Bold)
                                    Text("HOME", style = MaterialTheme.typography.labelSmall)
                                }

                                Column(horizontalAlignment = Alignment.CenterHorizontally, modifier = Modifier.width(80.dp)) {
                                    if (isPlayed) {
                                        Text(
                                            "${match.localQ1+match.localQ2+match.localQ3+match.localQ4} - ${match.visitorQ1+match.visitorQ2+match.visitorQ3+match.visitorQ4}",
                                            style = MaterialTheme.typography.titleMedium,
                                            fontWeight = FontWeight.ExtraBold
                                        )
                                    } else {
                                        Text("VS", style = MaterialTheme.typography.titleMedium, color = Color.Gray)
                                    }
                                }

                                Column(horizontalAlignment = Alignment.CenterHorizontally, modifier = Modifier.weight(1f)) {
                                    Text(visitorTeam?.name ?: "???", fontWeight = FontWeight.Bold)
                                    Text("AWAY", style = MaterialTheme.typography.labelSmall)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
