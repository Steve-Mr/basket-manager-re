package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import top.maary.basketmanager.re.domain.model.Conference
import top.maary.basketmanager.re.domain.model.StandingsItem
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@Composable
fun StandingsScreen(
    viewModel: GameDashboardViewModel
) {
    val standings by viewModel.standings.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()
    var selectedTab by remember { mutableStateOf(0) } // 0: All, 1: East, 2: West

    val filteredList = remember(standings, selectedTab) {
        val sorted = standings.sortedWith(
            compareByDescending<StandingsItem> { it.gamesWon }
                .thenByDescending { it.pointDiff }
        )
        when (selectedTab) {
            1 -> sorted.filter { it.conference == Conference.EAST }
            2 -> sorted.filter { it.conference == Conference.WEST }
            else -> sorted
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Text(
            text = "League Standings",
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold
        )

        Spacer(modifier = Modifier.height(10.dp))

        TabRow(
            selectedTabIndex = selectedTab,
            modifier = Modifier.clip(RoundedCornerShape(8.dp))
        ) {
            Tab(selected = selectedTab == 0, onClick = { selectedTab = 0 }, text = { Text("Total (30)") })
            Tab(selected = selectedTab == 1, onClick = { selectedTab = 1 }, text = { Text("East (15)") })
            Tab(selected = selectedTab == 2, onClick = { selectedTab = 2 }, text = { Text("West (15)") })
        }

        Spacer(modifier = Modifier.height(12.dp))

        Card(
            modifier = Modifier.fillMaxSize(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
        ) {
            LazyColumn(modifier = Modifier.fillMaxSize().padding(8.dp)) {
                item {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(vertical = 6.dp),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text("POS", modifier = Modifier.weight(0.7f), fontWeight = FontWeight.Bold, fontSize = 11.sp)
                        Text("TEAM", modifier = Modifier.weight(2f), fontWeight = FontWeight.Bold, fontSize = 11.sp)
                        Text("W", modifier = Modifier.weight(0.7f), textAlign = TextAlign.Center, fontWeight = FontWeight.Bold, fontSize = 11.sp)
                        Text("L", modifier = Modifier.weight(0.7f), textAlign = TextAlign.Center, fontWeight = FontWeight.Bold, fontSize = 11.sp)
                        Text("PCT", modifier = Modifier.weight(0.9f), textAlign = TextAlign.Center, fontWeight = FontWeight.Bold, fontSize = 11.sp)
                        Text("DIFF", modifier = Modifier.weight(0.9f), textAlign = TextAlign.Center, fontWeight = FontWeight.Bold, fontSize = 11.sp)
                    }
                    Divider()
                }

                itemsIndexed(filteredList) { index, item ->
                    val isUser = item.teamId == userTeam?.id
                    val isPlayoffCutoff = (selectedTab != 0 && index == 7)

                    Column {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(vertical = 8.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("${index + 1}", modifier = Modifier.weight(0.7f), fontWeight = FontWeight.Bold, fontSize = 12.sp)
                            Text(
                                text = item.teamName,
                                modifier = Modifier.weight(2f),
                                fontWeight = if (isUser) FontWeight.Black else FontWeight.Medium,
                                color = if (isUser) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurface
                            )
                            Text("${item.gamesWon}", modifier = Modifier.weight(0.7f), textAlign = TextAlign.Center, fontSize = 12.sp)
                            Text("${item.gamesLost}", modifier = Modifier.weight(0.7f), textAlign = TextAlign.Center, fontSize = 12.sp)
                            Text(String.format("%.3f", item.winPercentage), modifier = Modifier.weight(0.9f), textAlign = TextAlign.Center, fontSize = 12.sp)
                            Text("${if (item.pointDiff > 0) "+" else ""}${item.pointDiff}", modifier = Modifier.weight(0.9f), textAlign = TextAlign.Center, fontSize = 12.sp)
                        }

                        if (isPlayoffCutoff) {
                            Divider(color = MaterialTheme.colorScheme.secondary, thickness = 2.dp)
                        } else {
                            Divider(color = MaterialTheme.colorScheme.surfaceVariant)
                        }
                    }
                }
            }
        }
    }
}
