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
import re.manager.basket.ui.viewmodel.PlayerListViewModel
import re.manager.basket.ui.viewmodel.LeagueViewModel
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import re.manager.basket.ui.navigation.Screen
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.Alignment
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.platform.LocalContext

@Composable
fun FranchiseHubScreen(
    navController: NavController,
    gameViewModel: GameViewModel,
    playerListViewModel: PlayerListViewModel,
    leagueViewModel: LeagueViewModel
) {
    val gameState by gameViewModel.gameState.collectAsState()
    val userTactic by gameViewModel.userTactic.collectAsState()
    val availableTeams by gameViewModel.availableTeams.collectAsState()
    val players by playerListViewModel.players.collectAsState()
    val standings by leagueViewModel.standings.collectAsState()

    val myTeam = availableTeams.find { it.id == gameState?.userTeamId }
    val myStanding = standings.find { it.first.id == myTeam?.id }?.second

    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp),
        contentPadding = PaddingValues(vertical = 16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        item {
            Text(
                text = "球队中心", 
                style = MaterialTheme.typography.headlineLarge,
                fontWeight = FontWeight.Bold
            )
        }
        
        if (myTeam != null) {
            item {
                ElevatedCard(
                    modifier = Modifier.fillMaxWidth(),
                    onClick = { navController.navigate(Screen.TeamDetail.createRoute(myTeam.id)) }
                ) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween, verticalAlignment = Alignment.CenterVertically) {
                            Text(myTeam.fullName, style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
                            if (myStanding != null) {
                                Text(
                                    text = "${myStanding.gamesWon} W - ${myStanding.gamesLost} L",
                                    style = MaterialTheme.typography.titleMedium,
                                    color = MaterialTheme.colorScheme.primary,
                                    fontWeight = FontWeight.Bold
                                )
                            }
                        }
                        Spacer(modifier = Modifier.height(8.dp))
                        Text("Conference: ${myTeam.conference}")
                        Text("Division: ${myTeam.division}")
                        Spacer(modifier = Modifier.height(8.dp))
                        Text("点击查看财务情况与详细信息 ->", color = MaterialTheme.colorScheme.primary, style = MaterialTheme.typography.labelLarge)
                    }
                }
            }
        }
        
        item {
            Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween, verticalAlignment = Alignment.CenterVertically) {
                Text("当前轮换阵容", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                FilledTonalButton(onClick = { navController.navigate("tactic") }) {
                    Text("调整战术与轮换")
                }
            }
        }

        if (userTactic != null) {
            val starters = listOf(
                "PG" to userTactic!!.titPG,
                "SG" to userTactic!!.titSG,
                "SF" to userTactic!!.titSF,
                "PF" to userTactic!!.titPF,
                "C" to userTactic!!.titC
            ).mapNotNull { (pos, id) -> 
                players.find { it.originalEntity.id == id }?.let { pos to it.originalEntity }
            }
                
            items(starters) { (pos, player) ->
                ElevatedCard(
                    modifier = Modifier.fillMaxWidth(),
                    onClick = { navController.navigate(Screen.PlayerDetail.createRoute(player.id)) }
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth().padding(12.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column(modifier = Modifier.weight(1f)) {
                            Row(verticalAlignment = Alignment.CenterVertically) {
                                Surface(
                                    color = MaterialTheme.colorScheme.secondaryContainer,
                                    shape = MaterialTheme.shapes.small,
                                    modifier = Modifier.padding(end = 8.dp)
                                ) {
                                    Text(
                                        text = pos, 
                                        modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
                                        style = MaterialTheme.typography.labelMedium,
                                        color = MaterialTheme.colorScheme.onSecondaryContainer
                                    )
                                }
                                Text(player.name, fontWeight = FontWeight.Bold)
                            }
                            Text("Age: ${player.age} | Salary: $${player.salary}", style = MaterialTheme.typography.bodySmall)
                        }
                        
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Column(horizontalAlignment = Alignment.CenterHorizontally, modifier = Modifier.padding(end = 12.dp)) {
                                Text("OVR", style = MaterialTheme.typography.labelSmall)
                                Text(player.getAverageSkillAll().toInt().toString(), color = MaterialTheme.colorScheme.primary, fontWeight = FontWeight.Bold)
                            }

                            // Potential Stars
                            val starIcon = when {
                                player.potential >= 9 -> "star6"
                                player.potential >= 7 -> "star5"
                                player.potential >= 5 -> "star4"
                                player.potential >= 3 -> "star3"
                                player.potential >= 1 -> "star2"
                                else -> "star1"
                            }
                            val context = LocalContext.current
                            val resId = context.resources.getIdentifier(starIcon, "drawable", context.packageName)
                            if (resId != 0) {
                                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                                    Icon(
                                        painter = painterResource(id = resId),
                                        contentDescription = "Potential",
                                        modifier = Modifier.size(32.dp),
                                        tint = androidx.compose.ui.graphics.Color.Unspecified
                                    )
                                    Text("POT", style = MaterialTheme.typography.labelSmall)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
