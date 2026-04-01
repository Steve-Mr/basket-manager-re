package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import re.manager.basket.ui.viewmodel.PlayerListViewModel

@Composable
fun PlayerListScreen(viewModel: PlayerListViewModel) {
    val players by viewModel.players.collectAsState()

    LazyColumn {
        items(players) { player ->
            Column {
                Text(text = player.name)
                Text(text = "Age: ${player.age}")
            }
        }
    }
}
