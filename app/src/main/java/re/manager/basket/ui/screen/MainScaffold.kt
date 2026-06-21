package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.DateRange
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import re.manager.basket.ui.components.FloatingToolbar
import re.manager.basket.ui.navigation.BasketNavGraph
import re.manager.basket.ui.viewmodel.GameViewModel
import re.manager.basket.ui.viewmodel.LeagueViewModel
import re.manager.basket.ui.viewmodel.MarketViewModel
import re.manager.basket.ui.viewmodel.PlayerListViewModel

@Composable
fun MainScaffold(
    gameViewModel: GameViewModel,
    playerListViewModel: PlayerListViewModel,
    marketViewModel: MarketViewModel,
    leagueViewModel: LeagueViewModel
) {
    val isSimulating by gameViewModel.isSimulating.collectAsState()
    val showAutoLineupDialog by gameViewModel.showAutoLineupDialog.collectAsState()
    val simProgress by gameViewModel.simProgress.collectAsState()

    val navController = rememberNavController()
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentRoute = navBackStackEntry?.destination?.route

    Scaffold(
        floatingActionButtonPosition = FabPosition.Center,
        floatingActionButton = {
            // Only show FloatingToolbar on the 3 main Hubs
            val showToolbar = currentRoute in listOf("dashboard", "franchise_hub", "front_office_hub")
            
            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                if (showToolbar) {
                    // Quick Action FAB for simulation
                    var expanded by remember { mutableStateOf(false) }
                    Row(
                        horizontalArrangement = Arrangement.End, 
                        modifier = Modifier.fillMaxWidth().padding(end = 16.dp, bottom = 16.dp)
                    ) {
                        Column(horizontalAlignment = Alignment.End) {
                            if (expanded) {
                                SmallFloatingActionButton(onClick = { gameViewModel.onNextDayClick(30); expanded = false }, modifier = Modifier.padding(bottom = 8.dp)) {
                                    Text("1M", modifier = Modifier.padding(horizontal = 8.dp))
                                }
                                SmallFloatingActionButton(onClick = { gameViewModel.onNextDayClick(7); expanded = false }, modifier = Modifier.padding(bottom = 8.dp)) {
                                    Text("1W", modifier = Modifier.padding(horizontal = 8.dp))
                                }
                            }
                            ExtendedFloatingActionButton(
                                onClick = { if (expanded) gameViewModel.onNextDayClick(1) else expanded = true },
                                icon = { Icon(if (expanded) Icons.Filled.PlayArrow else Icons.Filled.Add, "Simulate") },
                                text = { Text(if (expanded) "Next Day" else "Play...") },
                                containerColor = MaterialTheme.colorScheme.tertiaryContainer,
                                contentColor = MaterialTheme.colorScheme.onTertiaryContainer
                            )
                        }
                    }
                    
                    FloatingToolbar(
                        currentRoute = currentRoute,
                        onNavigate = { route ->
                            navController.navigate(route) {
                                popUpTo(navController.graph.startDestinationId) { saveState = true }
                                launchSingleTop = true
                                restoreState = true
                            }
                        }
                    )
                }
            }
        }
    ) { innerPadding ->
        Box(modifier = Modifier.padding(innerPadding).fillMaxSize()) {
            BasketNavGraph(
                navController = navController,
                gameViewModel = gameViewModel,
                playerListViewModel = playerListViewModel,
                marketViewModel = marketViewModel,
                leagueViewModel = leagueViewModel
            )

            // Global Dialogs overlaying everything
            if (isSimulating) {
                Dialog(onDismissRequest = {}) {
                    Card {
                        Column(
                            modifier = Modifier.padding(24.dp),
                            horizontalAlignment = Alignment.CenterHorizontally
                        ) {
                            Text("Simulating League Matches...", style = MaterialTheme.typography.titleMedium)
                            Spacer(modifier = Modifier.height(16.dp))
                            LinearProgressIndicator(
                                progress = { simProgress },
                                modifier = Modifier.fillMaxWidth()
                            )
                            Text("${(simProgress * 100).toInt()}%", modifier = Modifier.padding(top = 8.dp))
                        }
                    }
                }
            }

            if (showAutoLineupDialog) {
                AlertDialog(
                    onDismissRequest = { gameViewModel.dismissAutoLineupDialog() },
                    title = { Text("Incomplete Lineup") },
                    text = { Text("Your lineup is not fully assigned. Would you like to automatically arrange the best possible lineup or cancel to set it manually?") },
                    confirmButton = {
                        Button(onClick = { gameViewModel.autoArrangeAndSimulate(1) }) { Text("Auto Arrange") }
                    },
                    dismissButton = {
                        TextButton(onClick = { gameViewModel.dismissAutoLineupDialog() }) { Text("Set Manually") }
                    }
                )
            }
        }
    }
}
