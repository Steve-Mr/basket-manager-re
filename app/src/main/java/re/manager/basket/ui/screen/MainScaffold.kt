package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun MainScaffold() {
    var selectedItem by remember { mutableIntStateOf(0) }
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
                onClick = { /* Drive game logic */ },
                icon = { Icon(Icons.Filled.PlayArrow, "Next Day") },
                text = { Text("Next Day") }
            )
        }
    ) { innerPadding ->
        Surface(modifier = Modifier.padding(innerPadding)) {
            Box(modifier = Modifier.fillMaxSize()) {
                when (selectedItem) {
                    0 -> Text("Matchday 1: Regular Season", Modifier.align(Alignment.Center))
                    1 -> Text("My Team Squad", Modifier.align(Alignment.Center))
                    2 -> Text("League Standings", Modifier.align(Alignment.Center))
                    3 -> Text("Transfer Market", Modifier.align(Alignment.Center))
                }
            }
        }
    }
}
