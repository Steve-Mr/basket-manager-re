package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.entity.MatchResultEntity

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.ui.graphics.Color
import re.manager.basket.data.entity.TeamEntity

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MatchDetailScreen(
    match: MatchEntity,
    localTeam: TeamEntity?,
    visitorTeam: TeamEntity?,
    playerStats: List<MatchResultEntity>,
    onBack: () -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Match Result") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp)
        ) {
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                ) {
                    Column(horizontalAlignment = androidx.compose.ui.Alignment.CenterHorizontally, modifier = Modifier.weight(1f)) {
                        Text(localTeam?.name ?: "???", style = MaterialTheme.typography.headlineSmall, fontWeight = FontWeight.Bold)
                        Text("HOME")
                    }

                    val localTotal = match.localQ1 + match.localQ2 + match.localQ3 + match.localQ4
                    val visitorTotal = match.visitorQ1 + match.visitorQ2 + match.visitorQ3 + match.visitorQ4
                    Text(
                        text = "$localTotal - $visitorTotal",
                        style = MaterialTheme.typography.displaySmall,
                        fontWeight = FontWeight.ExtraBold,
                        modifier = Modifier.padding(horizontal = 16.dp)
                    )

                    Column(horizontalAlignment = androidx.compose.ui.Alignment.CenterHorizontally, modifier = Modifier.weight(1f)) {
                        Text(visitorTeam?.name ?: "???", style = MaterialTheme.typography.headlineSmall, fontWeight = FontWeight.Bold)
                        Text("AWAY")
                    }
                }

                Spacer(modifier = Modifier.height(24.dp))

                Card(modifier = Modifier.fillMaxWidth()) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Text("Score by Quarter", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                        Spacer(modifier = Modifier.height(8.dp))
                        QuarterRow("Team", "Q1", "Q2", "Q3", "Q4", isHeader = true)
                        QuarterRow(localTeam?.name ?: "Home", match.localQ1.toString(), match.localQ2.toString(), match.localQ3.toString(), match.localQ4.toString())
                        QuarterRow(visitorTeam?.name ?: "Away", match.visitorQ1.toString(), match.visitorQ2.toString(), match.visitorQ3.toString(), match.visitorQ4.toString())
                    }
                }

                Spacer(modifier = Modifier.height(24.dp))
                Text("Box Score", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.ExtraBold)
                Spacer(modifier = Modifier.height(8.dp))
            }

            items(playerStats.sortedByDescending { it.points }) { stat ->
                Card(modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp)) {
                    Column(modifier = Modifier.padding(12.dp)) {
                        Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
                            Text(stat.name, fontWeight = FontWeight.Bold)
                            Text("${stat.minutesPlayed} MIN", style = MaterialTheme.typography.bodySmall)
                        }
                        Spacer(modifier = Modifier.height(4.dp))
                        Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                            StatTag("PTS", stat.points.toString())
                            StatTag("REB", stat.rebounds.toString())
                            StatTag("AST", stat.assists.toString())
                            StatTag("STL", stat.steals.toString())
                            StatTag("BLK", stat.blocks.toString())
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun QuarterRow(name: String, q1: String, q2: String, q3: String, q4: String, isHeader: Boolean = false) {
    Row(modifier = Modifier.fillMaxWidth().padding(vertical = 2.dp)) {
        Text(name, modifier = Modifier.weight(2f), fontWeight = if (isHeader) FontWeight.Bold else FontWeight.Normal)
        Text(q1, modifier = Modifier.weight(1f), textAlign = androidx.compose.ui.text.style.TextAlign.Center)
        Text(q2, modifier = Modifier.weight(1f), textAlign = androidx.compose.ui.text.style.TextAlign.Center)
        Text(q3, modifier = Modifier.weight(1f), textAlign = androidx.compose.ui.text.style.TextAlign.Center)
        Text(q4, modifier = Modifier.weight(1f), textAlign = androidx.compose.ui.text.style.TextAlign.Center)
    }
}

@Composable
fun StatTag(label: String, value: String) {
    Row {
        Text("$label: ", style = MaterialTheme.typography.labelSmall, color = Color.Gray)
        Text(value, style = MaterialTheme.typography.labelSmall, fontWeight = FontWeight.Bold)
    }
}
