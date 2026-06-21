package re.manager.basket.ui.screen

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import re.manager.basket.ui.viewmodel.LeagueViewModel
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import re.manager.basket.domain.model.Conference

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun StandingsScreen(
    navController: NavController,
    leagueViewModel: LeagueViewModel
) {
    val standings by leagueViewModel.standings.collectAsState()
    var selectedConference by remember { mutableStateOf(Conference.EAST) } 

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("联盟战绩榜", fontWeight = FontWeight.Bold) },
                navigationIcon = {
                    IconButton(onClick = { navController.popBackStack() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { innerPadding ->
        Column(modifier = Modifier.fillMaxSize().padding(innerPadding)) {
            TabRow(selectedTabIndex = if (selectedConference == Conference.EAST) 0 else 1) {
                Tab(selected = selectedConference == Conference.EAST, onClick = { selectedConference = Conference.EAST }) {
                    Text("东部联盟", modifier = Modifier.padding(16.dp))
                }
                Tab(selected = selectedConference == Conference.WEST, onClick = { selectedConference = Conference.WEST }) {
                    Text("西部联盟", modifier = Modifier.padding(16.dp))
                }
            }

            Row(modifier = Modifier.fillMaxWidth().padding(horizontal = 16.dp, vertical = 8.dp)) {
                Text(text = "排名", modifier = Modifier.width(40.dp), fontWeight = FontWeight.Bold)
                Text(text = "球队", modifier = Modifier.weight(1f), fontWeight = FontWeight.Bold)
                Text(text = "胜", modifier = Modifier.width(40.dp), fontWeight = FontWeight.Bold)
                Text(text = "负", modifier = Modifier.width(40.dp), fontWeight = FontWeight.Bold)
                Text(text = "净胜分", modifier = Modifier.width(60.dp), fontWeight = FontWeight.Bold)
            }
            HorizontalDivider()

            val filteredStandings = standings.filter { it.first.conference == selectedConference }
                .sortedWith(compareByDescending<Pair<re.manager.basket.data.entity.TeamEntity, re.manager.basket.data.entity.LeagueEntity>> { it.second.gamesWon }.thenBy { it.second.gamesLost })

            LazyColumn(modifier = Modifier.fillMaxWidth()) {
                items(filteredStandings.size) { index ->
                    val state = filteredStandings[index]
                    val isPlayoffZone = index < 8

                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .background(if (isPlayoffZone) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.2f) else Color.Transparent)
                            .clickable { /* navController.navigate(Screen.TeamDetail.createRoute(state.team.id)) */ }
                            .padding(16.dp),
                        verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                    ) {
                        Text(
                            text = "${index + 1}",
                            modifier = Modifier.width(40.dp),
                            color = if (isPlayoffZone) MaterialTheme.colorScheme.primary else Color.Unspecified,
                            fontWeight = if (isPlayoffZone) FontWeight.Bold else FontWeight.Normal
                        )
                        Text(text = state.first.name, modifier = Modifier.weight(1f), fontWeight = FontWeight.Bold)
                        Text(text = state.second.gamesWon.toString(), modifier = Modifier.width(40.dp))
                        Text(text = state.second.gamesLost.toString(), modifier = Modifier.width(40.dp))
                        Text(text = "${state.second.pointsScored - state.second.pointsAllowed}", modifier = Modifier.width(60.dp))
                    }
                    HorizontalDivider(modifier = Modifier.padding(horizontal = 16.dp))
                }
            }
        }
    }
}
