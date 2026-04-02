package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.entity.TeamEntity

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CalendarScreen(
    matches: List<MatchEntity>,
    teams: List<TeamEntity>,
    currentMatchday: Int,
    onBack: () -> Unit = {}
) {
    val teamsMap = teams.associateBy { it.id }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Season Calendar") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { padding ->
    LazyColumn(
        modifier = Modifier.fillMaxSize().padding(padding).padding(horizontal = 16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {

        val matchesByDay = matches.groupBy { it.matchday }
        val sortedDays = matchesByDay.keys.sorted()

        items(sortedDays) { day ->
            val dayMatches = matchesByDay[day] ?: emptyList()
            val isToday = day == currentMatchday
            val isPast = day < currentMatchday

            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = if (isToday) MaterialTheme.colorScheme.secondaryContainer
                                     else if (isPast) MaterialTheme.colorScheme.surfaceVariant
                                     else MaterialTheme.colorScheme.surface
                )
            ) {
                Column(modifier = Modifier.padding(12.dp)) {
                    Text(
                        "Matchday $day",
                        style = MaterialTheme.typography.titleSmall,
                        fontWeight = FontWeight.Bold,
                        color = if (isToday) MaterialTheme.colorScheme.primary else Color.Unspecified
                    )
                    Spacer(modifier = Modifier.height(4.dp))
                    dayMatches.forEach { match ->
                        val localTeam = teamsMap[match.teamLocalId]
                        val visitorTeam = teamsMap[match.teamVisitorId]
                        val isPlayed = match.localQ1 + match.visitorQ1 > 0

                        Row(
                            modifier = Modifier.fillMaxWidth().padding(vertical = 2.dp),
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text("${localTeam?.name ?: "???"} vs ${visitorTeam?.name ?: "???"}", style = MaterialTheme.typography.bodySmall)
                            if (isPlayed) {
                                val localTotal = match.localQ1 + match.localQ2 + match.localQ3 + match.localQ4
                                val visitorTotal = match.visitorQ1 + match.visitorQ2 + match.visitorQ3 + match.visitorQ4
                                Text("$localTotal - $visitorTotal", style = MaterialTheme.typography.bodySmall, fontWeight = FontWeight.Bold)
                            } else {
                                Text("Upcoming", style = MaterialTheme.typography.bodySmall, color = Color.Gray)
                            }
                        }
                    }
                }
            }
        }
    }
    }
}
