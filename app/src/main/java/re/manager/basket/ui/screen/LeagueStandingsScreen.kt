package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.*
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.LeagueEntity
import re.manager.basket.data.entity.TeamEntity
import androidx.compose.foundation.clickable
import androidx.compose.foundation.background
import androidx.compose.runtime.*
import androidx.compose.ui.graphics.Color

class LeagueViewModel(private val database: AppDatabase) : ViewModel() {
    private val _gameId = MutableStateFlow<Int?>(null)

    @OptIn(ExperimentalCoroutinesApi::class)
    val standings: StateFlow<List<Pair<TeamEntity, LeagueEntity>>> = _gameId.flatMapLatest { gameId ->
        if (gameId == null) flowOf(emptyList())
        else {
            combine(
                database.leagueDao().getStandingsFlow(gameId),
                database.teamDao().getTeamsByGameFlow(gameId)
            ) { stats, teams ->
                val teamMap = teams.associateBy { it.id }
                stats.mapNotNull { teamMap[it.teamId]?.let { team -> team to it } }
            }
        }
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    fun loadStandings(gameId: Int) {
        _gameId.value = gameId
    }
}

@Composable
fun LeagueStandingsScreen(
    gameId: Int,
    leagueViewModel: LeagueViewModel,
    onTeamClick: (TeamEntity, LeagueEntity) -> Unit = { _, _ -> }
) {
    val standings by leagueViewModel.standings.collectAsState()
    var selectedConference by remember { mutableIntStateOf(1) } // 1: East, 2: West

    LaunchedEffect(gameId) {
        leagueViewModel.loadStandings(gameId)
    }

    Column(modifier = Modifier.fillMaxSize().padding(16.dp)) {
        Text(text = "League Standings", style = MaterialTheme.typography.headlineMedium)
        Spacer(modifier = Modifier.height(16.dp))

        TabRow(selectedTabIndex = selectedConference - 1) {
            Tab(selected = selectedConference == 1, onClick = { selectedConference = 1 }) {
                Text("EAST", modifier = Modifier.padding(16.dp))
            }
            Tab(selected = selectedConference == 2, onClick = { selectedConference = 2 }) {
                Text("WEST", modifier = Modifier.padding(16.dp))
            }
        }

        Row(modifier = Modifier.fillMaxWidth().padding(horizontal = 16.dp, vertical = 8.dp)) {
            Text(text = "Pos", modifier = Modifier.width(32.dp), fontWeight = FontWeight.Bold)
            Text(text = "Team", modifier = Modifier.weight(1f), fontWeight = FontWeight.Bold)
            Text(text = "W", modifier = Modifier.width(40.dp), fontWeight = FontWeight.Bold)
            Text(text = "L", modifier = Modifier.width(40.dp), fontWeight = FontWeight.Bold)
            Text(text = "PTS", modifier = Modifier.width(60.dp), fontWeight = FontWeight.Bold)
        }
        HorizontalDivider()

        val filteredStandings = standings.filter { it.first.conference.id == selectedConference }
            .sortedByDescending { it.second.gamesWon }

        LazyColumn(modifier = Modifier.fillMaxWidth()) {
            items(filteredStandings.size) { index ->
                val (team, league) = filteredStandings[index]
                val isPlayoffZone = index < 8

                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .background(if (isPlayoffZone) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.2f) else Color.Transparent)
                        .clickable { onTeamClick(team, league) }
                        .padding(16.dp),
                    verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                ) {
                    Text(
                        text = "${index + 1}",
                        modifier = Modifier.width(32.dp),
                        color = if (isPlayoffZone) MaterialTheme.colorScheme.primary else Color.Unspecified,
                        fontWeight = if (isPlayoffZone) FontWeight.Bold else FontWeight.Normal
                    )
                    Text(text = team.name, modifier = Modifier.weight(1f))
                    Text(text = league.gamesWon.toString(), modifier = Modifier.width(40.dp))
                    Text(text = league.gamesLost.toString(), modifier = Modifier.width(40.dp))
                    Text(text = "${league.pointsScored - league.pointsAllowed}", modifier = Modifier.width(60.dp))
                }
                HorizontalDivider(modifier = Modifier.padding(horizontal = 16.dp))
            }
        }
    }
}
