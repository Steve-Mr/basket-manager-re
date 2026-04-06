package re.manager.basket

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.compose.runtime.*
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import re.manager.basket.data.importer.RosterImporter
import re.manager.basket.ui.screen.MainScaffold
import re.manager.basket.ui.screen.SaveSelectionScreen
import re.manager.basket.ui.screen.TeamSelectionScreen
import re.manager.basket.ui.screen.TeamPreviewScreen
import re.manager.basket.ui.theme.BasketManagerTheme
import re.manager.basket.ui.viewmodel.GameViewModel
import re.manager.basket.ui.viewmodel.PlayerListViewModel
import re.manager.basket.ui.viewmodel.MarketViewModel
import re.manager.basket.ui.viewmodel.LeagueViewModel

class MainActivity : ComponentActivity() {

    private val database by lazy { (application as BasketApplication).database }

    private val gameViewModel: GameViewModel by viewModels {
        object : ViewModelProvider.Factory {
            override fun <T : ViewModel> create(modelClass: Class<T>): T {
                return GameViewModel(database) as T
            }
        }
    }

    private val playerListViewModel: PlayerListViewModel by viewModels {
        object : ViewModelProvider.Factory {
            override fun <T : ViewModel> create(modelClass: Class<T>): T {
                return PlayerListViewModel(database) as T
            }
        }
    }

    private val marketViewModel: MarketViewModel by viewModels {
        object : ViewModelProvider.Factory {
            override fun <T : ViewModel> create(modelClass: Class<T>): T {
                return MarketViewModel(database) as T
            }
        }
    }

    private val leagueViewModel: LeagueViewModel by viewModels {
        object : ViewModelProvider.Factory {
            override fun <T : ViewModel> create(modelClass: Class<T>): T {
                return LeagueViewModel(database) as T
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContent {
            BasketManagerTheme {
                val gameState by gameViewModel.gameState.collectAsState()
                val allGames by gameViewModel.allGames.collectAsState()
                val availableTeams by gameViewModel.availableTeams.collectAsState()
                val previewPlayers by gameViewModel.previewPlayers.collectAsState()

                var selectedPreviewTeamId by remember { mutableStateOf<Int?>(null) }

                LaunchedEffect(Unit) {
                    gameViewModel.loadAllGames()
                }

                if (gameState == null) {
                    SaveSelectionScreen(
                        games = allGames,
                        onSelectGame = { gameViewModel.loadGame(it) },
                        onCreateGame = { gameViewModel.createNewGame(this@MainActivity, it) }
                    )
                } else if (gameState?.userTeamId == null) {
                    val previewTeam = availableTeams.find { it.id == selectedPreviewTeamId }

                    if (previewTeam != null) {
                        TeamPreviewScreen(
                            team = previewTeam,
                            players = previewPlayers,
                            onConfirm = {
                                gameViewModel.selectTeam(previewTeam.id)
                                selectedPreviewTeamId = null
                            },
                            onBack = { selectedPreviewTeamId = null }
                        )
                    } else {
                        TeamSelectionScreen(
                            teams = availableTeams,
                            onSelectTeam = {
                                selectedPreviewTeamId = it
                                gameViewModel.loadPreviewPlayers(it)
                            }
                        )
                    }
                } else {
                    // Make sure player list is loaded when game is loaded
                    LaunchedEffect(gameState?.userTeamId) {
                        gameState?.userTeamId?.let { teamId ->
                            playerListViewModel.loadPlayers(teamId, gameState?.id)
                        }
                    }

                    MainScaffold(
                        gameViewModel = gameViewModel,
                        playerListViewModel = playerListViewModel,
                        marketViewModel = marketViewModel,
                        leagueViewModel = leagueViewModel
                    )
                }
            }
        }
    }
}
