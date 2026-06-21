package re.manager.basket.ui.screen

import androidx.compose.ui.text.font.FontWeight
import re.manager.basket.ui.navigation.Screen
import androidx.compose.foundation.layout.*
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

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text(
            text = "办公桌", 
            style = MaterialTheme.typography.headlineLarge,
            fontWeight = FontWeight.Bold
        )
        
        ElevatedCard(
            modifier = Modifier.fillMaxWidth(),
            onClick = { navController.navigate(Screen.DraftScouting.route) }
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Text("选秀考察 (Draft Scouting)", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                Spacer(modifier = Modifier.height(8.dp))
                Text("Preview incoming rookies ->")
            }
        }
        
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

        ElevatedCard(
            modifier = Modifier.fillMaxWidth(),
            onClick = { navController.navigate(Screen.History.route) }
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Text("历史荣誉室 (League History)", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                Spacer(modifier = Modifier.height(8.dp))
                Text("Tap to view past champions & MVPs ->")
            }
        }
    }
}
