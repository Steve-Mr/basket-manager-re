package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController

import re.manager.basket.ui.viewmodel.GameViewModel
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import re.manager.basket.ui.navigation.Screen

@Composable
fun DashboardHubScreen(
    navController: NavController,
    gameViewModel: GameViewModel
) {
    val gameState by gameViewModel.gameState.collectAsState()
    val nextMatch by gameViewModel.nextMatch.collectAsState()
    val news by gameViewModel.news.collectAsState()

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text(
            text = "主看台", 
            style = MaterialTheme.typography.headlineLarge,
            fontWeight = FontWeight.Bold
        )
        
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
        
        ElevatedCard(
            modifier = Modifier.fillMaxWidth()
            // onClick = { navController.navigate(Screen.News.route) }
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Icon(Icons.Filled.Notifications, contentDescription = null, tint = MaterialTheme.colorScheme.primary)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("联盟新闻速览", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                }
                Spacer(modifier = Modifier.height(8.dp))
                if (news.isNotEmpty()) {
                    Text(text = news.first().title, style = MaterialTheme.typography.bodyMedium, fontWeight = FontWeight.Bold)
                    Text(text = news.first().body, style = MaterialTheme.typography.bodyMedium)
                } else {
                    Text("暂无最新新闻", style = MaterialTheme.typography.bodyMedium)
                }
            }
        }
    }
}
