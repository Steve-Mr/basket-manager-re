package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController

import re.manager.basket.ui.viewmodel.GameViewModel
import re.manager.basket.ui.viewmodel.LeagueViewModel
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import re.manager.basket.ui.navigation.Screen
import re.manager.basket.domain.model.Conference

@Composable
fun DashboardHubScreen(
    navController: NavController,
    gameViewModel: GameViewModel,
    leagueViewModel: LeagueViewModel
) {
    val gameState by gameViewModel.gameState.collectAsState()
    val nextMatch by gameViewModel.nextMatch.collectAsState()
    val news by gameViewModel.news.collectAsState()
    val standings by leagueViewModel.standings.collectAsState()

    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp),
        contentPadding = PaddingValues(vertical = 16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        item {
            Text(
                text = "主看台", 
                style = MaterialTheme.typography.headlineLarge,
                fontWeight = FontWeight.Bold
            )
        }
        
        item {
            ElevatedCard(
                modifier = Modifier.fillMaxWidth(),
                onClick = { navController.navigate(Screen.Calendar.route) }
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(Icons.Filled.DateRange, contentDescription = null, tint = MaterialTheme.colorScheme.primary)
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("下一场预告", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                    }
                    Spacer(modifier = Modifier.height(8.dp))
                    if (nextMatch != null) {
                        val (match, opp) = nextMatch!!
                        Text("Day ${match.matchday}: vs ${opp.name}")
                    } else {
                        Text("赛季结束或暂无比赛")
                    }
                }
            }
        }
        
        item {
            ElevatedCard(
                modifier = Modifier.fillMaxWidth(),
                onClick = { navController.navigate("standings") }
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(Icons.Filled.List, contentDescription = null, tint = MaterialTheme.colorScheme.primary)
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("联盟战绩概览", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                    }
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    if (standings.isNotEmpty()) {
                        Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceEvenly) {
                            Column(modifier = Modifier.weight(1f)) {
                                Text("东部联盟", fontWeight = FontWeight.Bold)
                                standings.filter { it.first.conference == Conference.EAST }.take(3).forEachIndexed { index, st ->
                                    Text("${index + 1}. ${st.first.name} ${st.second.gamesWon}-${st.second.gamesLost}", style = MaterialTheme.typography.bodyMedium)
                                }
                            }
                            Column(modifier = Modifier.weight(1f)) {
                                Text("西部联盟", fontWeight = FontWeight.Bold)
                                standings.filter { it.first.conference == Conference.WEST }.take(3).forEachIndexed { index, st ->
                                    Text("${index + 1}. ${st.first.name} ${st.second.gamesWon}-${st.second.gamesLost}", style = MaterialTheme.typography.bodyMedium)
                                }
                            }
                        }
                    } else {
                        Text("暂无战绩", style = MaterialTheme.typography.bodyMedium)
                    }
                }
            }
        }

        item {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(Icons.Filled.Notifications, contentDescription = null, tint = MaterialTheme.colorScheme.primary)
                Spacer(modifier = Modifier.width(8.dp))
                Text("联盟新闻速览", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
            }
        }

        if (news.isEmpty()) {
            item {
                Text("暂无最新新闻", style = MaterialTheme.typography.bodyMedium)
            }
        } else {
            items(news.take(10)) { newsItem ->
                Card(modifier = Modifier.fillMaxWidth()) {
                    Column(modifier = Modifier.padding(12.dp)) {
                        Text(text = newsItem.title, style = MaterialTheme.typography.bodyMedium, fontWeight = FontWeight.Bold)
                        Text(text = newsItem.body, style = MaterialTheme.typography.bodySmall)
                    }
                }
            }
        }
    }
}
