package re.manager.basket.ui.screen

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.GameEntity

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SaveSelectionScreen(
    games: List<GameEntity>,
    onSelectGame: (Int) -> Unit,
    onCreateGame: (String) -> Unit
) {
    var showCreateDialog by remember { mutableStateOf(false) }
    var newGameName by remember { mutableStateOf("") }

    Scaffold(
        topBar = {
            CenterAlignedTopAppBar(title = { Text("Select Save Game") })
        },
        floatingActionButton = {
            FloatingActionButton(onClick = { showCreateDialog = true }) {
                Icon(Icons.Default.Add, contentDescription = "New Game")
            }
        }
    ) { innerPadding ->
        if (games.isEmpty()) {
            Box(modifier = Modifier.fillMaxSize().padding(innerPadding), contentAlignment = Alignment.Center) {
                Text("No save games found. Create one!")
            }
        } else {
            LazyColumn(
                modifier = Modifier.fillMaxSize().padding(innerPadding),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(games) { game ->
                    Card(
                        modifier = Modifier.fillMaxWidth().clickable { onSelectGame(game.id) }
                    ) {
                        Column(modifier = Modifier.padding(16.dp)) {
                            Text(text = game.name, style = MaterialTheme.typography.titleLarge)
                            Text(text = "Season ${game.currentSeason} - Day ${game.currentMatchday}")
                        }
                    }
                }
            }
        }

        if (showCreateDialog) {
            AlertDialog(
                onDismissRequest = { showCreateDialog = false },
                title = { Text("New Game") },
                text = {
                    TextField(
                        value = newGameName,
                        onValueChange = { newGameName = it },
                        label = { Text("Game Name") }
                    )
                },
                confirmButton = {
                    Button(onClick = {
                        if (newGameName.isNotBlank()) {
                            onCreateGame(newGameName)
                            showCreateDialog = false
                        }
                    }) {
                        Text("Create")
                    }
                },
                dismissButton = {
                    TextButton(onClick = { showCreateDialog = false }) {
                        Text("Cancel")
                    }
                }
            )
        }
    }
}
