package re.manager.basket.ui.screen

import androidx.compose.ui.text.font.FontWeight
import re.manager.basket.ui.navigation.Screen
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController

import re.manager.basket.ui.viewmodel.GameViewModel
import re.manager.basket.ui.viewmodel.LeagueViewModel
import re.manager.basket.ui.viewmodel.MarketViewModel

@Composable
fun FrontOfficeHubScreen(
    navController: NavController,
    gameViewModel: GameViewModel,
    marketViewModel: MarketViewModel,
    leagueViewModel: LeagueViewModel
) {
    val gameState by gameViewModel.gameState.collectAsState()

    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp),
        contentPadding = PaddingValues(vertical = 16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        item {
            Text(
                text = "办公桌", 
                style = MaterialTheme.typography.headlineLarge,
                fontWeight = FontWeight.Bold
            )
        }
        
        item {
            ElevatedCard(
                modifier = Modifier.fillMaxWidth(),
                onClick = { navController.navigate("league_players") }
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text("联盟球员百强榜 (Top 100 Players)", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                    Spacer(modifier = Modifier.height(8.dp))
                    Text("Search and view all players in the league ->")
                }
            }
        }

        item {
            ElevatedCard(
                modifier = Modifier.fillMaxWidth(),
                onClick = { navController.navigate(Screen.DraftScouting.route) }
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text("本赛季待选新秀 (Upcoming Draft Class)", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                    Spacer(modifier = Modifier.height(8.dp))
                    Text("Preview incoming rookies ->")
                }
            }
        }
        
        item {
            ElevatedCard(
                modifier = Modifier.fillMaxWidth(),
                onClick = { navController.navigate(Screen.FreeAgency.route) }
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text("自由市场 (Free Agency)", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                    Spacer(modifier = Modifier.height(8.dp))
                    Text("Tap to sign players ->")
                }
            }
        }

        item {
            ElevatedCard(
                modifier = Modifier.fillMaxWidth(),
                onClick = { navController.navigate(Screen.History.route) }
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text("联盟历史 (League History)", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                    Spacer(modifier = Modifier.height(8.dp))
                    Text("View past champions and MVP awards ->")
                }
            }
        }
    }
}
