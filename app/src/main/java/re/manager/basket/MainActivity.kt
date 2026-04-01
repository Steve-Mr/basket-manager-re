package re.manager.basket

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.compose.runtime.LaunchedEffect
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import re.manager.basket.data.importer.RosterImporter
import re.manager.basket.ui.screen.MainScaffold
import re.manager.basket.ui.theme.BasketManagerTheme
import re.manager.basket.ui.viewmodel.GameViewModel
import re.manager.basket.ui.viewmodel.PlayerListViewModel

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
                return PlayerListViewModel(database.playerDao()) as T
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContent {
            BasketManagerTheme {
                LaunchedEffect(Unit) {
                    gameViewModel.initializeAndLoadGame(this@MainActivity)
                    // Default load players for team 1 (User Team)
                    playerListViewModel.loadPlayers(1)
                }

                MainScaffold(
                    gameViewModel = gameViewModel,
                    playerListViewModel = playerListViewModel
                )
            }
        }
    }
}
