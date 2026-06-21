package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.ui.viewmodel.PlayerListViewModel
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import re.manager.basket.ui.navigation.Screen
import re.manager.basket.domain.model.Position

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LeaguePlayersScreen(
    navController: NavController,
    playerListViewModel: PlayerListViewModel
) {
    val players by playerListViewModel.players.collectAsState()
    
    var selectedTab by remember { mutableStateOf(0) }
    var selectedPosition by remember { mutableStateOf(Position.PG) }

    val rawPlayers = players.map { it.originalEntity }
    val filteredPlayers = remember(rawPlayers, selectedTab, selectedPosition) {
        when (selectedTab) {
            0 -> rawPlayers.sortedByDescending { it.getAverageSkillAll() }.take(100)
            1 -> rawPlayers.filter { it.positionFirst == selectedPosition }.sortedByDescending { it.getAverageSkillAll() }.take(100)
            2 -> rawPlayers.filter { it.yearsExperience == 0 }.sortedByDescending { it.getAverageSkillAll() }.take(100)
            3 -> rawPlayers.filter { it.yearsExperience == 0 && it.positionFirst == selectedPosition }.sortedByDescending { it.getAverageSkillAll() }.take(100)
            else -> emptyList()
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("联盟球员百强榜", fontWeight = FontWeight.Bold) },
                navigationIcon = {
                    IconButton(onClick = { navController.popBackStack() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { innerPadding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(innerPadding)
        ) {
            ScrollableTabRow(
                selectedTabIndex = selectedTab,
                edgePadding = 16.dp,
                modifier = Modifier.fillMaxWidth()
            ) {
                val tabs = listOf("所有球员", "按位置", "新秀", "新秀按位置")
                tabs.forEachIndexed { index, title ->
                    Tab(
                        selected = selectedTab == index,
                        onClick = { selectedTab = index },
                        text = { Text(title) }
                    )
                }
            }

            if (selectedTab == 1 || selectedTab == 3) {
                ScrollableTabRow(
                    selectedTabIndex = Position.entries.filter { it != Position.NONE }.indexOf(selectedPosition),
                    edgePadding = 16.dp,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    val positions = Position.entries.filter { it != Position.NONE }
                    positions.forEach { pos ->
                        Tab(
                            selected = selectedPosition == pos,
                            onClick = { selectedPosition = pos },
                            text = { Text(pos.name) }
                        )
                    }
                }
            }

            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(filteredPlayers) { player ->
                    ElevatedCard(
                        modifier = Modifier.fillMaxWidth(),
                        onClick = { navController.navigate(Screen.PlayerDetail.createRoute(player.id)) }
                    ) {
                        Row(
                            modifier = Modifier.fillMaxWidth().padding(12.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Column {
                                Row(verticalAlignment = Alignment.CenterVertically) {
                                    Surface(
                                        color = MaterialTheme.colorScheme.secondaryContainer,
                                        shape = MaterialTheme.shapes.small,
                                        modifier = Modifier.padding(end = 8.dp)
                                    ) {
                                        Text(
                                            text = player.positionFirst.name, 
                                            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
                                            style = MaterialTheme.typography.labelMedium,
                                            color = MaterialTheme.colorScheme.onSecondaryContainer
                                        )
                                    }
                                    Text(player.name, fontWeight = FontWeight.Bold, style = MaterialTheme.typography.bodyLarge)
                                }
                                Text("Age: ${player.age} | Exp: ${player.yearsExperience}y", style = MaterialTheme.typography.bodySmall)
                            }
                            
                            Text("OVR: ${player.getAverageSkillAll().toInt()}", style = MaterialTheme.typography.titleMedium, color = MaterialTheme.colorScheme.primary, fontWeight = FontWeight.Bold)
                        }
                    }
                }
            }
        }
    }
}
