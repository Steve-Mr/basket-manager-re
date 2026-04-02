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
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.LeagueEntity
import re.manager.basket.data.entity.TeamEntity

class LeagueViewModel(private val database: AppDatabase) : ViewModel() {
    private val _standings = MutableStateFlow<List<Pair<TeamEntity, LeagueEntity>>>(emptyList())
    val standings: StateFlow<List<Pair<TeamEntity, LeagueEntity>>> = _standings.asStateFlow()

    fun loadStandings(gameId: Int) {
        viewModelScope.launch {
            val teams = database.teamDao().getTeamsByGame(gameId).associateBy { it.id }
            val stats = database.leagueDao().getStandings(gameId)
            _standings.value = stats.mapNotNull {
                teams[it.teamId]?.let { team -> team to it }
            }
        }
    }
}

@Composable
fun LeagueStandingsScreen(gameId: Int, leagueViewModel: LeagueViewModel) {
    val standings by leagueViewModel.standings.collectAsState()

    LaunchedEffect(gameId) {
        leagueViewModel.loadStandings(gameId)
    }

    Column(modifier = Modifier.fillMaxSize().padding(16.dp)) {
        Text(text = "League Standings", style = MaterialTheme.typography.headlineMedium)
        Spacer(modifier = Modifier.height(16.dp))

        Row(modifier = Modifier.fillMaxWidth().padding(horizontal = 16.dp, vertical = 8.dp)) {
            Text(text = "Team", modifier = Modifier.weight(1f), fontWeight = FontWeight.Bold)
            Text(text = "W", modifier = Modifier.width(40.dp), fontWeight = FontWeight.Bold)
            Text(text = "L", modifier = Modifier.width(40.dp), fontWeight = FontWeight.Bold)
            Text(text = "PTS", modifier = Modifier.width(60.dp), fontWeight = FontWeight.Bold)
        }
        Divider()

        LazyColumn(modifier = Modifier.fillMaxWidth()) {
            items(standings) { (team, league) ->
                Row(modifier = Modifier.fillMaxWidth().padding(16.dp)) {
                    Text(text = team.name, modifier = Modifier.weight(1f))
                    Text(text = league.gamesWon.toString(), modifier = Modifier.width(40.dp))
                    Text(text = league.gamesLost.toString(), modifier = Modifier.width(40.dp))
                    Text(text = "${league.pointsScored - league.pointsAllowed}", modifier = Modifier.width(60.dp))
                }
                Divider(modifier = Modifier.padding(horizontal = 16.dp))
            }
        }
    }
}
