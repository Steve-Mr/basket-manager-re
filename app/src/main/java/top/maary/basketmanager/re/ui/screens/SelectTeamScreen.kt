package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Check
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import top.maary.basketmanager.re.R
import top.maary.basketmanager.re.domain.model.Conference
import top.maary.basketmanager.re.domain.model.Division
import top.maary.basketmanager.re.domain.model.Team
import top.maary.basketmanager.re.ui.viewmodel.MainViewModel

data class TeamSelectionItem(
    val name: String,
    val division: Division,
    val salaryCap: Int,
    val colorHex: String
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SelectTeamScreen(
    gameName: String,
    viewModel: MainViewModel,
    onBack: () -> Unit,
    onGameCreated: (Long) -> Unit
) {
    val context = LocalContext.current
    var selectedConference by remember { mutableStateOf<Conference?>(null) }
    var selectedTeamName by remember { mutableStateOf("BOS") }
    val isLoading by viewModel.isLoading.collectAsState()

    val allTeams = remember {
        listOf(
            // Eastern Conference
            TeamSelectionItem("BOS", Division.E1_ATLANTIC, 80_000_000, "#05854C"),
            TeamSelectionItem("BRO", Division.E1_ATLANTIC, 80_000_000, "#000000"),
            TeamSelectionItem("NYK", Division.E1_ATLANTIC, 80_000_000, "#0953A0"),
            TeamSelectionItem("PHI", Division.E1_ATLANTIC, 55_000_000, "#D0103A"),
            TeamSelectionItem("TOR", Division.E1_ATLANTIC, 75_000_000, "#B31B1B"),

            TeamSelectionItem("CHI", Division.E2_CENTRAL, 80_000_000, "#D4001F"),
            TeamSelectionItem("CLE", Division.E2_CENTRAL, 70_000_000, "#9F1425"),
            TeamSelectionItem("DET", Division.E2_CENTRAL, 60_000_000, "#006BB6"),
            TeamSelectionItem("IND", Division.E2_CENTRAL, 75_000_000, "#002E62"),
            TeamSelectionItem("MIL", Division.E2_CENTRAL, 55_000_000, "#00330A"),

            TeamSelectionItem("ATL", Division.E3_SOUTHEAST, 65_000_000, "#01244C"),
            TeamSelectionItem("CHA", Division.E3_SOUTHEAST, 65_000_000, "#29588B"),
            TeamSelectionItem("MIA", Division.E3_SOUTHEAST, 80_000_000, "#B62630"),
            TeamSelectionItem("ORL", Division.E3_SOUTHEAST, 70_000_000, "#0047AB"),
            TeamSelectionItem("WAS", Division.E3_SOUTHEAST, 70_000_000, "#002244"),

            // Western Conference
            TeamSelectionItem("DAL", Division.W1_SOUTHWEST, 80_000_000, "#006AB5"),
            TeamSelectionItem("HOU", Division.W1_SOUTHWEST, 80_000_000, "#CC0000"),
            TeamSelectionItem("MEM", Division.W1_SOUTHWEST, 55_000_000, "#001B41"),
            TeamSelectionItem("NOR", Division.W1_SOUTHWEST, 70_000_000, "#002B5C"),
            TeamSelectionItem("SAN", Division.W1_SOUTHWEST, 80_000_000, "#111111"),

            TeamSelectionItem("DEN", Division.W2_NORTHWEST, 65_000_000, "#4393D1"),
            TeamSelectionItem("MIN", Division.W2_NORTHWEST, 60_000_000, "#015287"),
            TeamSelectionItem("POR", Division.W2_NORTHWEST, 70_000_000, "#222222"),
            TeamSelectionItem("OKC", Division.W2_NORTHWEST, 75_000_000, "#007DC3"),
            TeamSelectionItem("UTA", Division.W2_NORTHWEST, 60_000_000, "#00275D"),

            TeamSelectionItem("GSW", Division.W3_PACIFIC, 75_000_000, "#002942"),
            TeamSelectionItem("LAC", Division.W3_PACIFIC, 80_000_000, "#EE2944"),
            TeamSelectionItem("LAL", Division.W3_PACIFIC, 80_000_000, "#4A2583"),
            TeamSelectionItem("PHO", Division.W3_PACIFIC, 60_000_000, "#1C105E"),
            TeamSelectionItem("SAC", Division.W3_PACIFIC, 70_000_000, "#753BBD")
        )
    }

    val filteredTeams = remember(selectedConference) {
        if (selectedConference == null) allTeams else allTeams.filter { it.division.conference == selectedConference }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Select Your Team") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        },
        bottomBar = {
            Surface(
                tonalElevation = 6.dp,
                modifier = Modifier.fillMaxWidth()
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column {
                        Text(
                            text = "Selected: $selectedTeamName",
                            fontWeight = FontWeight.Bold,
                            style = MaterialTheme.typography.titleMedium
                        )
                        val cap = allTeams.find { it.name == selectedTeamName }?.salaryCap ?: 70_000_000
                        Text(
                            text = "Cap: $${cap / 1_000_000}M",
                            style = MaterialTheme.typography.bodySmall
                        )
                    }

                    Button(
                        onClick = {
                            val stream = context.resources.openRawResource(R.raw.rosters)
                            viewModel.createGame(gameName, selectedTeamName, stream) { newSession ->
                                onGameCreated(newSession.id)
                            }
                        },
                        enabled = !isLoading,
                        shape = RoundedCornerShape(12.dp)
                    ) {
                        if (isLoading) {
                            CircularProgressIndicator(modifier = Modifier.size(20.dp), color = Color.White)
                        } else {
                            Text("Start Season", fontWeight = FontWeight.Bold)
                        }
                    }
                }
            }
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(horizontal = 16.dp)
        ) {
            // Conference filter tabs
            TabRow(
                selectedTabIndex = when (selectedConference) {
                    null -> 0
                    Conference.EAST -> 1
                    Conference.WEST -> 2
                },
                modifier = Modifier.clip(RoundedCornerShape(8.dp))
            ) {
                Tab(selected = selectedConference == null, onClick = { selectedConference = null }, text = { Text("All (30)") })
                Tab(selected = selectedConference == Conference.EAST, onClick = { selectedConference = Conference.EAST }, text = { Text("East (15)") })
                Tab(selected = selectedConference == Conference.WEST, onClick = { selectedConference = Conference.WEST }, text = { Text("West (15)") })
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Teams Grid
            LazyVerticalGrid(
                columns = GridCells.Fixed(3),
                horizontalArrangement = Arrangement.spacedBy(10.dp),
                verticalArrangement = Arrangement.spacedBy(10.dp),
                modifier = Modifier.fillMaxSize()
            ) {
                items(filteredTeams) { team ->
                    val isSelected = team.name == selectedTeamName
                    val parsedColor = try {
                        Color(android.graphics.Color.parseColor(team.colorHex))
                    } catch (_: Exception) {
                        MaterialTheme.colorScheme.primary
                    }

                    Card(
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(105.dp)
                            .clickable { selectedTeamName = team.name },
                        shape = RoundedCornerShape(12.dp),
                        colors = CardDefaults.cardColors(
                            containerColor = if (isSelected) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surfaceVariant
                        ),
                        border = if (isSelected) CardDefaults.outlinedCardBorder().copy(brush = androidx.compose.ui.graphics.SolidColor(MaterialTheme.colorScheme.primary)) else null
                    ) {
                        Column(
                            modifier = Modifier
                                .fillMaxSize()
                                .padding(8.dp),
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.Center
                        ) {
                            Box(
                                modifier = Modifier
                                    .size(36.dp)
                                    .clip(CircleShape)
                                    .background(parsedColor),
                                contentAlignment = Alignment.Center
                            ) {
                                if (isSelected) {
                                    Icon(Icons.Default.Check, contentDescription = null, tint = Color.White, modifier = Modifier.size(20.dp))
                                }
                            }

                            Spacer(modifier = Modifier.height(6.dp))

                            Text(
                                text = team.name,
                                fontWeight = FontWeight.Bold,
                                fontSize = 16.sp,
                                textAlign = TextAlign.Center
                            )
                            Text(
                                text = "$${team.salaryCap / 1_000_000}M Cap",
                                style = MaterialTheme.typography.labelSmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                }
            }
        }
    }
}
