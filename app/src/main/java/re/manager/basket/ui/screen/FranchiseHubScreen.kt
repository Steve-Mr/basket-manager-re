package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import re.manager.basket.ui.viewmodel.GameViewModel
import re.manager.basket.ui.viewmodel.PlayerListViewModel
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import re.manager.basket.ui.navigation.Screen
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.Alignment
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*

@Composable
fun FranchiseHubScreen(
    navController: NavController,
    gameViewModel: GameViewModel,
    playerListViewModel: PlayerListViewModel
) {
    val gameState by gameViewModel.gameState.collectAsState()
    val userTactic by gameViewModel.userTactic.collectAsState()
    val availableTeams by gameViewModel.availableTeams.collectAsState()
    val players by playerListViewModel.players.collectAsState()

    val myTeam = availableTeams.find { it.id == gameState?.userTeamId }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text(
            text = "球队中心", 
            style = MaterialTheme.typography.headlineLarge,
            fontWeight = FontWeight.Bold
        )
        
        if (myTeam != null) {
            ElevatedCard(
                modifier = Modifier.fillMaxWidth(),
                onClick = { navController.navigate(Screen.TeamDetail.createRoute(myTeam.id)) }
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text(myTeam.fullName, style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
                    Spacer(modifier = Modifier.height(8.dp))
                    Text("Conference: ${myTeam.conference}")
                    Text("Division: ${myTeam.division}")
                    Text("Click to view full team card and finances ->", color = MaterialTheme.colorScheme.primary)
                }
            }
        }
        
        Text("当前轮换阵容", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
        // Simplified lineup view
        if (userTactic != null) {
            val starters = listOf(userTactic!!.titPG, userTactic!!.titSG, userTactic!!.titSF, userTactic!!.titPF, userTactic!!.titC)
                .mapNotNull { id -> players.find { it.originalEntity.id == id } }
                
            starters.forEach { playerState ->
                val player = playerState.originalEntity
                ElevatedCard(
                    modifier = Modifier.fillMaxWidth(),
                    onClick = { navController.navigate(Screen.PlayerDetail.createRoute(player.id)) }
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth().padding(12.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column {
                            Text(player.name, fontWeight = FontWeight.Bold)
                            Text("Starter | Age: ${player.age}", style = MaterialTheme.typography.bodySmall)
                        }
                        Text("OVR: ${player.getAverageSkillAll().toInt()}", color = MaterialTheme.colorScheme.primary, fontWeight = FontWeight.Bold)
                    }
                }
            }
        }
    }
}
