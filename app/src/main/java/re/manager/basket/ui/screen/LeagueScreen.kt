package re.manager.basket.ui.screen

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.List
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.domain.model.Position
import re.manager.basket.ui.viewmodel.LeagueViewModel
import re.manager.basket.ui.viewmodel.PlayerUiState

@Composable
fun LeagueScreen(
    gameId: Int,
    viewModel: LeagueViewModel,
    onPlayerClick: (Int) -> Unit
) {
    var selectedTab by remember { mutableIntStateOf(0) } // 0: Standings, 1: Top 100, 2: Rookies, 3: Awards
    var showFilter by remember { mutableStateOf(false) }
    var currentPositionFilter by remember { mutableStateOf(Position.NONE) }

    LaunchedEffect(gameId) {
        viewModel.load(gameId)
    }

    Column(modifier = Modifier.fillMaxSize()) {
        TabRow(selectedTabIndex = selectedTab) {
            Tab(selected = selectedTab == 0, onClick = { selectedTab = 0; showFilter = false }) {
                Text("Standings", modifier = Modifier.padding(16.dp))
            }
            Tab(selected = selectedTab == 1, onClick = { selectedTab = 1; showFilter = true }) {
                Text("Top 100", modifier = Modifier.padding(16.dp))
            }
            Tab(selected = selectedTab == 2, onClick = { selectedTab = 2; showFilter = true }) {
                Text("Rookies", modifier = Modifier.padding(16.dp))
            }
            Tab(selected = selectedTab == 3, onClick = { selectedTab = 3; showFilter = false }) {
                Text("Awards", modifier = Modifier.padding(16.dp))
            }
        }

        if (showFilter) {
            PositionFilterRow(
                currentPosition = currentPositionFilter,
                onPositionSelected = {
                    currentPositionFilter = it
                    viewModel.setFilterPosition(it)
                }
            )
        }

        when (selectedTab) {
            0 -> LeagueStandingsScreen(gameId, viewModel)
            1 -> TopPlayersList(viewModel.top100Players.collectAsState().value, onPlayerClick)
            2 -> TopPlayersList(viewModel.rookies.collectAsState().value, onPlayerClick)
            3 -> AwardsList(viewModel.awards.collectAsState().value)
        }
    }
}

@Composable
fun PositionFilterRow(
    currentPosition: Position,
    onPositionSelected: (Position) -> Unit
) {
    ScrollableTabRow(
        selectedTabIndex = currentPosition.id,
        edgePadding = 16.dp,
        containerColor = MaterialTheme.colorScheme.surfaceVariant,
        divider = {}
    ) {
        Position.entries.forEach { position ->
            Tab(
                selected = currentPosition == position,
                onClick = { onPositionSelected(position) },
                text = { Text(if (position == Position.NONE) "ALL" else position.name) }
            )
        }
    }
}

@Composable
fun AwardsList(awards: List<re.manager.basket.data.entity.AwardEntity>) {
    LazyColumn(modifier = Modifier.fillMaxSize()) {
        items(awards) { award ->
            Card(modifier = Modifier.fillMaxWidth().padding(16.dp, 8.dp)) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text("Season ${award.season}", style = MaterialTheme.typography.labelSmall)
                    Text(award.type.name, style = MaterialTheme.typography.titleLarge, color = MaterialTheme.colorScheme.primary)
                    Spacer(Modifier.height(4.dp))
                    Text(award.value ?: "", fontWeight = FontWeight.Bold)
                }
            }
        }
    }
}

@Composable
fun TopPlayersList(players: List<PlayerUiState>, onPlayerClick: (Int) -> Unit) {
    LazyColumn(modifier = Modifier.fillMaxSize()) {
        item {
            Row(
                modifier = Modifier.fillMaxWidth().padding(16.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text("#", modifier = Modifier.width(30.dp), fontWeight = FontWeight.Bold)
                Text("Player", modifier = Modifier.weight(1f), fontWeight = FontWeight.Bold)
                Text("Pos", modifier = Modifier.width(40.dp), fontWeight = FontWeight.Bold)
                Text("Age", modifier = Modifier.width(40.dp), fontWeight = FontWeight.Bold)
                Text("Avg", modifier = Modifier.width(40.dp), fontWeight = FontWeight.Bold)
            }
            HorizontalDivider()
        }
        items(players.size) { index ->
            val player = players[index]
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable { onPlayerClick(player.id) }
                    .padding(16.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text("${index + 1}", modifier = Modifier.width(30.dp))
                Column(modifier = Modifier.weight(1f)) {
                    Text(player.name, fontWeight = FontWeight.Bold)
                }
                Text(player.positionText, modifier = Modifier.width(40.dp))
                Text(player.age.toString(), modifier = Modifier.width(40.dp))
                Text(player.avgSkill.toString(), modifier = Modifier.width(40.dp))
            }
            HorizontalDivider(modifier = Modifier.padding(horizontal = 16.dp))
        }
    }
}
