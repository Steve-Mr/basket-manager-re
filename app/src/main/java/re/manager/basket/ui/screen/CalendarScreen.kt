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
    userTeamId: Int?,
    onMatchClick: (MatchEntity) -> Unit = {},
    onBack: () -> Unit = {}
) {
    val teamsMap = teams.associateBy { it.id }
    val matchesByDay = remember(matches) { matches.groupBy { it.matchday } }
    val sortedDays = remember(matchesByDay) { matchesByDay.keys.sorted() }

    var selectedDay by remember { mutableIntStateOf(currentMatchday.coerceIn(1, 234)) }
    val listState = rememberLazyListState()

    // Scroll to current day initially
    LaunchedEffect(Unit) {
        val index = sortedDays.indexOf(currentMatchday).coerceAtLeast(0)
        listState.scrollToItem(index)
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
            // Left Column: Days
            LazyColumn(
                state = listState,
                modifier = Modifier.width(80.dp).fillMaxHeight().background(MaterialTheme.colorScheme.surfaceVariant),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                items(sortedDays) { day ->
                    val isSelected = day == selectedDay
                    val hasUserMatch = matchesByDay[day]?.any { (it as MatchEntity).teamLocalId == userTeamId || it.teamVisitorId == userTeamId } ?: false

                    Box(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { selectedDay = day }
                            .background(if (isSelected) MaterialTheme.colorScheme.primaryContainer else Color.Transparent)
                            .padding(vertical = 12.dp),
                        contentAlignment = Alignment.Center
                    ) {
                        Column(horizontalAlignment = Alignment.CenterHorizontally) {
                            Text(
                                text = "D$day",
                                style = MaterialTheme.typography.bodyMedium,
                                fontWeight = if (isSelected) FontWeight.Bold else FontWeight.Normal,
                                color = if (hasUserMatch) MaterialTheme.colorScheme.primary else Color.Unspecified
                            )
                            if (hasUserMatch) {
                                Box(modifier = Modifier.size(4.dp).background(MaterialTheme.colorScheme.primary, shape = androidx.compose.foundation.shape.CircleShape))
                            }
                        }
                    }
                }
            }

            // Right Column: Matches
            Column(modifier = Modifier.weight(1f).fillMaxHeight().padding(16.dp)) {
                Text("Matchday $selectedDay", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
                Spacer(modifier = Modifier.height(16.dp))

                val dayMatches = matchesByDay[selectedDay] ?: emptyList()
                LazyColumn(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                    items(dayMatches) { matchItem ->
                        val match = matchItem as MatchEntity
                        val localTeam = teamsMap[match.teamLocalId]
                        val visitorTeam = teamsMap[match.teamVisitorId]
                        val isUserMatch = match.teamLocalId == userTeamId || match.teamVisitorId == userTeamId
                        val isPlayed = match.localQ1 + match.visitorQ1 > 0

                        Card(
                            modifier = Modifier.fillMaxWidth(),
                            onClick = { onMatchClick(match) },
                            colors = if (isUserMatch) CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer)
                                     else CardDefaults.cardColors()
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
