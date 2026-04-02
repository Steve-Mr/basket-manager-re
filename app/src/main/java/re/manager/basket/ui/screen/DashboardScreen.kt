package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import re.manager.basket.ui.viewmodel.GameViewModel

@Composable
fun DashboardScreen(
    viewModel: GameViewModel,
    onShowCalendar: () -> Unit = {}
) {
    val gameState by viewModel.gameState.collectAsState()
    val nextMatch by viewModel.nextMatch.collectAsState()
    val news by viewModel.news.collectAsState()
    DashboardContent(gameState, nextMatch, news, onShowCalendar)
}

@Composable
fun DashboardContent(
    gameState: re.manager.basket.data.entity.GameEntity?,
    nextMatch: Pair<re.manager.basket.data.entity.MatchEntity, re.manager.basket.data.entity.TeamEntity>?,
    news: List<re.manager.basket.data.entity.NewsEntity>,
    onShowCalendar: () -> Unit = {}
) {
    Column(
        modifier = Modifier.fillMaxSize().padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        gameState?.let { game ->
            Text(text = "Season: ${game.currentSeason}", style = MaterialTheme.typography.headlineMedium)
            Text(text = "Matchday: ${game.currentMatchday}", style = MaterialTheme.typography.titleLarge)

            Spacer(modifier = Modifier.height(16.dp))

            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer),
                onClick = onShowCalendar
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text(text = "Next Event", style = MaterialTheme.typography.titleMedium)
                    if (nextMatch != null) {
                        val (match, opponent) = nextMatch
                        Text(
                            text = "Day ${match.matchday}: vs ${opponent.fullName}",
                            style = MaterialTheme.typography.headlineSmall
                        )
                        Text(
                            text = if (match.teamLocalId == game.userTeamId) "At Home" else "Away Game",
                            style = MaterialTheme.typography.bodyMedium
                        )
                    } else {
                        Text(text = "Season Finished or No Matches", style = MaterialTheme.typography.bodyLarge)
                    }
                }
            }

            Spacer(modifier = Modifier.height(8.dp))
            Text(text = "League News", style = MaterialTheme.typography.titleLarge)

            LazyColumn(
                modifier = Modifier.fillMaxWidth().weight(1f),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(news) { item ->
                    Card(modifier = Modifier.fillMaxWidth()) {
                        Column(modifier = Modifier.padding(12.dp)) {
                            Text(text = "Day ${item.matchday}: ${item.title}", style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.Bold)
                            Text(text = item.body, style = MaterialTheme.typography.bodySmall)
                        }
                    }
                }
            }
        } ?: run {
            Box(Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                CircularProgressIndicator()
            }
        }
    }
}
