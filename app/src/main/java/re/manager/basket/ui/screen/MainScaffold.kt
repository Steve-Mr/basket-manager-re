package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import re.manager.basket.ui.viewmodel.GameViewModel
import re.manager.basket.ui.viewmodel.PlayerListViewModel
import re.manager.basket.ui.viewmodel.PlayerUiState
import re.manager.basket.ui.viewmodel.MarketViewModel

@Composable
fun MainScaffold(
    gameViewModel: GameViewModel,
    playerListViewModel: PlayerListViewModel,
    marketViewModel: MarketViewModel,
    leagueViewModel: LeagueViewModel
) {
    val gameState by gameViewModel.gameState.collectAsState()
    val players by playerListViewModel.players.collectAsState()
    val isSimulating by gameViewModel.isSimulating.collectAsState()
    val simProgress by gameViewModel.simProgress.collectAsState()
    val nextMatch by gameViewModel.nextMatch.collectAsState()
    val news by gameViewModel.news.collectAsState()

    MainScaffoldContent(
        selectedItemInitial = 0,
        gameState = gameState,
        players = players,
        marketViewModel = marketViewModel,
        leagueViewModel = leagueViewModel,
        isSimulating = isSimulating,
        simProgress = simProgress,
        nextMatch = nextMatch,
        news = news,
        onNextDay = { gameViewModel.nextDay() }
    )
}

@Composable
fun MainScaffoldContent(
    selectedItemInitial: Int,
    gameState: re.manager.basket.data.entity.GameEntity?,
    players: List<PlayerUiState>,
    marketViewModel: MarketViewModel,
    leagueViewModel: LeagueViewModel,
    isSimulating: Boolean,
    simProgress: Float,
    nextMatch: Pair<re.manager.basket.data.entity.MatchEntity, re.manager.basket.data.entity.TeamEntity>?,
    news: List<re.manager.basket.data.entity.NewsEntity>,
    onNextDay: () -> Unit
) {
    var selectedItem by remember { mutableIntStateOf(selectedItemInitial) }
    val items = listOf("Home", "Team", "League", "Market")
    val icons = listOf(Icons.Filled.Home, Icons.Filled.Person, Icons.Filled.List, Icons.Filled.ShoppingCart)

    Scaffold(
        bottomBar = {
            NavigationBar {
                items.forEachIndexed { index, item ->
                    NavigationBarItem(
                        icon = { Icon(icons[index], contentDescription = item) },
                        label = { Text(item) },
                        selected = selectedItem == index,
                        onClick = { selectedItem = index }
                    )
                }
            }
        },
        floatingActionButton = {
            ExtendedFloatingActionButton(
                onClick = onNextDay,
                icon = { Icon(Icons.Filled.PlayArrow, "Next Day") },
                text = { Text("Next Day") }
            )
        }
    ) { innerPadding ->
        Surface(modifier = Modifier.padding(innerPadding)) {
            Box(modifier = Modifier.fillMaxSize()) {
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

                when (selectedItem) {
                    0 -> DashboardContent(gameState, nextMatch, news)
                    1 -> TeamSquadContent(players)
                    2 -> gameState?.let {
                        LeagueStandingsScreen(gameId = it.id, leagueViewModel = leagueViewModel)
                    }
                    3 -> gameState?.let {
                        MarketScreen(
                            gameId = it.id,
                            userTeamId = it.userTeamId ?: 1,
                            marketViewModel = marketViewModel
                        )
                    }
                }
            }
        }
    }
}
