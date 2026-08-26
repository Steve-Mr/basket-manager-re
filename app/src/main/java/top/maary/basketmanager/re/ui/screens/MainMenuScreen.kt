package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Delete
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import top.maary.basketmanager.re.R
import top.maary.basketmanager.re.domain.model.GameSession
import top.maary.basketmanager.re.ui.viewmodel.MainViewModel

@Composable
fun MainMenuScreen(
    viewModel: MainViewModel,
    onNavigateToSelectTeam: (String) -> Unit,
    onNavigateToGame: (Long) -> Unit
) {
    val savedGames by viewModel.savedGames.collectAsState()
    var showNewGameDialog by remember { mutableStateOf(false) }
    var showLoadGameDialog by remember { mutableStateOf(false) }
    var gameNameInput by remember { mutableStateOf("") }

    LaunchedEffect(Unit) {
        viewModel.loadSavedGames()
    }

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(MaterialTheme.colorScheme.background)
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(24.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            // App Banner / Logo
            Image(
                painter = painterResource(id = R.drawable.bm15),
                contentDescription = "Basket Manager Logo",
                modifier = Modifier
                    .size(140.dp)
                    .clip(RoundedCornerShape(24.dp))
            )

            Spacer(modifier = Modifier.height(16.dp))

            Text(
                text = "BASKET MANAGER",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Black,
                fontSize = 24.sp,
                color = MaterialTheme.colorScheme.primary
            )
            Text(
                text = "Modern Edition",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.secondary
            )

            Spacer(modifier = Modifier.height(36.dp))

            // Menu Action Buttons
            Button(
                onClick = { showNewGameDialog = true },
                modifier = Modifier
                    .fillMaxWidth(0.75f)
                    .height(50.dp),
                shape = RoundedCornerShape(12.dp)
            ) {
                Icon(Icons.Default.Add, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("New Game", fontWeight = FontWeight.Bold)
            }

            Spacer(modifier = Modifier.height(14.dp))

            if (savedGames.isNotEmpty()) {
                val latestGame = savedGames.first()
                Button(
                    onClick = { onNavigateToGame(latestGame.id) },
                    modifier = Modifier
                        .fillMaxWidth(0.75f)
                        .height(50.dp),
                    shape = RoundedCornerShape(12.dp),
                    colors = ButtonDefaults.buttonColors(containerColor = MaterialTheme.colorScheme.secondary)
                ) {
                    Icon(Icons.Default.PlayArrow, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Continue Game", fontWeight = FontWeight.Bold)
                }

                Spacer(modifier = Modifier.height(14.dp))

                OutlinedButton(
                    onClick = { showLoadGameDialog = true },
                    modifier = Modifier
                        .fillMaxWidth(0.75f)
                        .height(50.dp),
                    shape = RoundedCornerShape(12.dp)
                ) {
                    Text("Load Game (${savedGames.size})", fontWeight = FontWeight.SemiBold)
                }
            }
        }

        // Dialog for New Game Name
        if (showNewGameDialog) {
            AlertDialog(
                onDismissRequest = { showNewGameDialog = false },
                title = { Text("Start New Franchise") },
                text = {
                    Column {
                        Text("Enter a name for your franchise save:", style = MaterialTheme.typography.bodyMedium)
                        Spacer(modifier = Modifier.height(8.dp))
                        OutlinedTextField(
                            value = gameNameInput,
                            onValueChange = { gameNameInput = it },
                            placeholder = { Text("e.g. My Franchise 2026") },
                            singleLine = true,
                            modifier = Modifier.fillMaxWidth()
                        )
                    }
                },
                confirmButton = {
                    Button(
                        onClick = {
                            val name = gameNameInput.ifBlank { "My Franchise" }
                            showNewGameDialog = false
                            gameNameInput = ""
                            onNavigateToSelectTeam(name)
                        }
                    ) {
                        Text("Next: Select Team")
                    }
                },
                dismissButton = {
                    TextButton(onClick = { showNewGameDialog = false }) {
                        Text("Cancel")
                    }
                }
            )
        }

        // Dialog for Load Game
        if (showLoadGameDialog) {
            AlertDialog(
                onDismissRequest = { showLoadGameDialog = false },
                title = { Text("Load Saved Game") },
                text = {
                    LazyColumn(modifier = Modifier.fillMaxWidth().height(260.dp)) {
                        items(savedGames) { game ->
                            Card(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(vertical = 4.dp),
                                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                            ) {
                                Row(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(12.dp),
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.SpaceBetween
                                ) {
                                    Column(modifier = Modifier.weight(1f)) {
                                        Text(text = game.name, fontWeight = FontWeight.Bold)
                                        Text(
                                            text = "Season ${game.currentSeason} | Day ${game.currentMatchday}",
                                            style = MaterialTheme.typography.bodySmall
                                        )
                                    }
                                    Row {
                                        Button(
                                            onClick = {
                                                showLoadGameDialog = false
                                                onNavigateToGame(game.id)
                                            },
                                            modifier = Modifier.height(36.dp),
                                            shape = RoundedCornerShape(8.dp)
                                        ) {
                                            Text("Play")
                                        }
                                        Spacer(modifier = Modifier.width(4.dp))
                                        IconButton(onClick = { viewModel.deleteGame(game.id) }) {
                                            Icon(Icons.Default.Delete, contentDescription = "Delete", tint = Color.Red)
                                        }
                                    }
                                }
                            }
                        }
                    }
                },
                confirmButton = {
                    TextButton(onClick = { showLoadGameDialog = false }) {
                        Text("Close")
                    }
                }
            )
        }
    }
}
