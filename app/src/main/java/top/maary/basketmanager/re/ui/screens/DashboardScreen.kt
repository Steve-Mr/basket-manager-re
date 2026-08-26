package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.FastForward
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import top.maary.basketmanager.re.domain.model.Match
import top.maary.basketmanager.re.domain.model.NewsItem
import top.maary.basketmanager.re.domain.model.NewsType
import top.maary.basketmanager.re.ui.components.MatchBoxScoreDialog
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@Composable
fun DashboardScreen(
    viewModel: GameDashboardViewModel,
    onNavigateToRoster: () -> Unit,
    onNavigateToStandings: () -> Unit
) {
    val game by viewModel.game.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()
    val todayMatches by viewModel.todayMatches.collectAsState()
    val newsList by viewModel.news.collectAsState()
    val isSimulating by viewModel.isSimulating.collectAsState()
    val simProgressText by viewModel.simulationProgressText.collectAsState()

    var showAutoSimDialog by remember { mutableStateOf(false) }
    var selectedMatchForBoxScore by remember { mutableStateOf<Match?>(null) }
    var targetMatchdayInput by remember { mutableStateOf("10") }

    val userMatch = remember(todayMatches, userTeam) {
        todayMatches.find { it.teamLocalId == userTeam?.id || it.teamVisitorId == userTeam?.id }
    }

    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        // Next Match / Day Card
        item {
            Card(
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(16.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer)
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = "Matchday ${game?.currentMatchday ?: 1} of 234",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        Text(
                            text = "Season ${game?.currentSeason ?: 1}",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }

                    Spacer(modifier = Modifier.height(12.dp))

                    if (userMatch != null) {
                        Card(
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface),
                            shape = RoundedCornerShape(12.dp),
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(16.dp),
                                horizontalArrangement = Arrangement.SpaceAround,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Text(
                                    text = if (userMatch.name != null) userMatch.name!! else "Today's Game",
                                    fontWeight = FontWeight.Bold,
                                    fontSize = 16.sp
                                )
                            }
                        }
                    } else {
                        Text("No fixture scheduled for your team today.", style = MaterialTheme.typography.bodyMedium)
                    }

                    Spacer(modifier = Modifier.height(16.dp))

                    // Simulation Action Buttons
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        Button(
                            onClick = { viewModel.advanceDay() },
                            enabled = !isSimulating,
                            modifier = Modifier.weight(1f),
                            shape = RoundedCornerShape(10.dp)
                        ) {
                            Icon(Icons.Default.PlayArrow, contentDescription = null)
                            Spacer(modifier = Modifier.width(6.dp))
                            Text(if (isSimulating) "Simulating..." else "Simulate Day")
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
                Text(
                    text = "League Matches (Day ${game?.currentMatchday})",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
            }

            items(todayMatches) { m ->
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { selectedMatchForBoxScore = m },
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant),
                    shape = RoundedCornerShape(10.dp)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(12.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = m.name ?: "Game #${m.id}",
                            style = MaterialTheme.typography.bodyMedium,
                            fontWeight = FontWeight.SemiBold
                        )
                        if (m.isPlayed) {
                            Text(
                                text = "Final",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.primary,
                                fontWeight = FontWeight.Bold
                            )
                        }
                    }
                }
            }
        }

        // Recent News Feed
        item {
            Text(
                text = "Recent League News",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
        }

        items(newsList.take(5)) { news ->
            Card(
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(10.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
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

    if (selectedMatchForBoxScore != null) {
        MatchBoxScoreDialog(
            match = selectedMatchForBoxScore,
            boxScores = emptyList(), // Can be loaded via repo if needed
            onDismiss = { selectedMatchForBoxScore = null }
        )
    }
}
