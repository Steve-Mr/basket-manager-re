package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TacticEntity
import re.manager.basket.ui.viewmodel.GameViewModel
import re.manager.basket.ui.viewmodel.PlayerListViewModel
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TacticScreen(
    navController: NavController,
    gameViewModel: GameViewModel,
    playerListViewModel: PlayerListViewModel
) {
    val userTactic by gameViewModel.userTactic.collectAsState()
    val players by playerListViewModel.players.collectAsState()
    val gameState by gameViewModel.gameState.collectAsState()

    val myPlayers = players.map { it.originalEntity }.filter { it.teamId == gameState?.userTeamId }
    
    // Local state for editing before saving
    var editedTactic by remember(userTactic) { mutableStateOf(userTactic) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("战术与轮换设置", fontWeight = FontWeight.Bold) },
                navigationIcon = {
                    IconButton(onClick = { navController.popBackStack() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    TextButton(
                        onClick = { 
                            editedTactic?.let { gameViewModel.updateTactic(it) }
                            navController.popBackStack()
                        }
                    ) {
                        Text("保存", fontWeight = FontWeight.Bold)
                    }
                }
            )
        }
    ) { innerPadding ->
        if (editedTactic == null) {
            Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                Text("无法加载战术数据")
            }
        } else {
            val tactic = editedTactic!!
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(innerPadding)
                    .padding(horizontal = 16.dp),
                verticalArrangement = Arrangement.spacedBy(24.dp)
            ) {
                item {
                    Text("首发阵容", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.primary)
                }
                
                item {
                    PlayerDropdownSelector("控球后卫 (PG)", tactic.titPG, myPlayers) { newId ->
                        editedTactic = tactic.copy(titPG = newId)
                    }
                }
                item {
                    PlayerDropdownSelector("得分后卫 (SG)", tactic.titSG, myPlayers) { newId ->
                        editedTactic = tactic.copy(titSG = newId)
                    }
                }
                item {
                    PlayerDropdownSelector("小前锋 (SF)", tactic.titSF, myPlayers) { newId ->
                        editedTactic = tactic.copy(titSF = newId)
                    }
                }
                item {
                    PlayerDropdownSelector("大前锋 (PF)", tactic.titPF, myPlayers) { newId ->
                        editedTactic = tactic.copy(titPF = newId)
                    }
                }
                item {
                    PlayerDropdownSelector("中锋 (C)", tactic.titC, myPlayers) { newId ->
                        editedTactic = tactic.copy(titC = newId)
                    }
                }
                
                item {
                    HorizontalDivider()
                    Spacer(modifier = Modifier.height(8.dp))
                    Text("球队战术倾向", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.primary)
                }

                item {
                    Text("内线进攻比例: ${tactic.shotIntPercent}%", style = MaterialTheme.typography.bodyLarge)
                    Slider(
                        value = tactic.shotIntPercent.toFloat(),
                        onValueChange = { editedTactic = tactic.copy(shotIntPercent = it.toInt()) },
                        valueRange = 0f..100f
                    )
                }

                item {
                    Text("三分进攻比例: ${tactic.shotTriplePercent}%", style = MaterialTheme.typography.bodyLarge)
                    Slider(
                        value = tactic.shotTriplePercent.toFloat(),
                        onValueChange = { editedTactic = tactic.copy(shotTriplePercent = it.toInt()) },
                        valueRange = 0f..100f
                    )
                }

                item {
                    Text("替补使用深度 (1-10): ${tactic.benchImportance}", style = MaterialTheme.typography.bodyLarge)
                    Slider(
                        value = tactic.benchImportance.toFloat(),
                        onValueChange = { editedTactic = tactic.copy(benchImportance = it.toInt()) },
                        valueRange = 1f..10f,
                        steps = 8
                    )
                }
                
                item {
                    Spacer(modifier = Modifier.height(32.dp))
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlayerDropdownSelector(
    label: String,
    selectedPlayerId: Int,
    players: List<PlayerEntity>,
    onPlayerSelected: (Int) -> Unit
) {
    var expanded by remember { mutableStateOf(false) }
    val selectedPlayer = players.find { it.id == selectedPlayerId }
    val displayText = selectedPlayer?.let { "${it.name} (OVR: ${it.getAverageSkillAll().toInt()})" } ?: "未选择"

    ExposedDropdownMenuBox(
        expanded = expanded,
        onExpandedChange = { expanded = !expanded }
    ) {
        OutlinedTextField(
            value = displayText,
            onValueChange = {},
            readOnly = true,
            label = { Text(label) },
            trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded = expanded) },
            modifier = Modifier.fillMaxWidth().menuAnchor()
        )
        ExposedDropdownMenu(
            expanded = expanded,
            onDismissRequest = { expanded = false }
        ) {
            players.sortedByDescending { it.getAverageSkillAll() }.forEach { player ->
                DropdownMenuItem(
                    text = { Text("${player.name} (OVR: ${player.getAverageSkillAll().toInt()}) - ${player.positionFirst}") },
                    onClick = {
                        onPlayerSelected(player.id)
                        expanded = false
                    }
                )
            }
        }
    }
}
