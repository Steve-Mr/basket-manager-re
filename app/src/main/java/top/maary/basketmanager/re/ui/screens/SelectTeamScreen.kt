package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.Info
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
import top.maary.basketmanager.re.domain.engine.RosterParser
import top.maary.basketmanager.re.domain.model.Conference
import top.maary.basketmanager.re.domain.model.Division
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Team
import top.maary.basketmanager.re.ui.components.PositionBadge
import top.maary.basketmanager.re.ui.components.RatingBadge
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

    // Pre-parse rosters from raw resources to preview squads
    val allRosterPlayers = remember {
        val stream = context.resources.openRawResource(R.raw.rosters)
        RosterParser.parseRostersCsv(stream)
    }

    val teamList = remember {
        listOf(
            TeamSelectionItem("BOS", Division.E1_ATLANTIC, Team.getDefaultSalaryCap("BOS"), Team.getTeamColor("BOS")),
            TeamSelectionItem("BRO", Division.E1_ATLANTIC, Team.getDefaultSalaryCap("BRO"), Team.getTeamColor("BRO")),
            TeamSelectionItem("NYK", Division.E1_ATLANTIC, Team.getDefaultSalaryCap("NYK"), Team.getTeamColor("NYK")),
            TeamSelectionItem("PHI", Division.E1_ATLANTIC, Team.getDefaultSalaryCap("PHI"), Team.getTeamColor("PHI")),
            TeamSelectionItem("TOR", Division.E1_ATLANTIC, Team.getDefaultSalaryCap("TOR"), Team.getTeamColor("TOR")),

            TeamSelectionItem("CHI", Division.E2_CENTRAL, Team.getDefaultSalaryCap("CHI"), Team.getTeamColor("CHI")),
            TeamSelectionItem("CLE", Division.E2_CENTRAL, Team.getDefaultSalaryCap("CLE"), Team.getTeamColor("CLE")),
            TeamSelectionItem("DET", Division.E2_CENTRAL, Team.getDefaultSalaryCap("DET"), Team.getTeamColor("DET")),
            TeamSelectionItem("IND", Division.E2_CENTRAL, Team.getDefaultSalaryCap("IND"), Team.getTeamColor("IND")),
            TeamSelectionItem("MIL", Division.E2_CENTRAL, Team.getDefaultSalaryCap("MIL"), Team.getTeamColor("MIL")),

            TeamSelectionItem("ATL", Division.E3_SOUTHEAST, Team.getDefaultSalaryCap("ATL"), Team.getTeamColor("ATL")),
            TeamSelectionItem("CHA", Division.E3_SOUTHEAST, Team.getDefaultSalaryCap("CHA"), Team.getTeamColor("CHA")),
            TeamSelectionItem("MIA", Division.E3_SOUTHEAST, Team.getDefaultSalaryCap("MIA"), Team.getTeamColor("MIA")),
            TeamSelectionItem("ORL", Division.E3_SOUTHEAST, Team.getDefaultSalaryCap("ORL"), Team.getTeamColor("ORL")),
            TeamSelectionItem("WAS", Division.E3_SOUTHEAST, Team.getDefaultSalaryCap("WAS"), Team.getTeamColor("WAS")),

            TeamSelectionItem("DAL", Division.W1_SOUTHWEST, Team.getDefaultSalaryCap("DAL"), Team.getTeamColor("DAL")),
            TeamSelectionItem("HOU", Division.W1_SOUTHWEST, Team.getDefaultSalaryCap("HOU"), Team.getTeamColor("HOU")),
            TeamSelectionItem("MEM", Division.W1_SOUTHWEST, Team.getDefaultSalaryCap("MEM"), Team.getTeamColor("MEM")),
            TeamSelectionItem("NOR", Division.W1_SOUTHWEST, Team.getDefaultSalaryCap("NOR"), Team.getTeamColor("NOR")),
            TeamSelectionItem("SAN", Division.W1_SOUTHWEST, Team.getDefaultSalaryCap("SAN"), Team.getTeamColor("SAN")),

            TeamSelectionItem("DEN", Division.W2_NORTHWEST, Team.getDefaultSalaryCap("DEN"), Team.getTeamColor("DEN")),
            TeamSelectionItem("MIN", Division.W2_NORTHWEST, Team.getDefaultSalaryCap("MIN"), Team.getTeamColor("MIN")),
            TeamSelectionItem("POR", Division.W2_NORTHWEST, Team.getDefaultSalaryCap("POR"), Team.getTeamColor("POR")),
            TeamSelectionItem("OKC", Division.W2_NORTHWEST, Team.getDefaultSalaryCap("OKC"), Team.getTeamColor("OKC")),
            TeamSelectionItem("UTA", Division.W2_NORTHWEST, Team.getDefaultSalaryCap("UTA"), Team.getTeamColor("UTA")),

            TeamSelectionItem("GSW", Division.W3_PACIFIC, Team.getDefaultSalaryCap("GSW"), Team.getTeamColor("GSW")),
            TeamSelectionItem("LAC", Division.W3_PACIFIC, Team.getDefaultSalaryCap("LAC"), Team.getTeamColor("LAC")),
            TeamSelectionItem("LAL", Division.W3_PACIFIC, Team.getDefaultSalaryCap("LAL"), Team.getTeamColor("LAL")),
            TeamSelectionItem("PHO", Division.W3_PACIFIC, Team.getDefaultSalaryCap("PHO"), Team.getTeamColor("PHO")),
            TeamSelectionItem("SAC", Division.W3_PACIFIC, Team.getDefaultSalaryCap("SAC"), Team.getTeamColor("SAC"))
        )
    }

    val filteredTeams = remember(selectedConference) {
        if (selectedConference == null) teamList
        else teamList.filter { it.division.conference == selectedConference }
    }

    val selectedTeam = remember(selectedTeamName) {
        teamList.find { it.name == selectedTeamName } ?: teamList[0]
    }

    val selectedTeamRoster = remember(selectedTeamName) {
        allRosterPlayers
            .filter { it.teamCode.equals(selectedTeamName, ignoreCase = true) }
            .map { it.player }
            .sortedByDescending { it.overallRating }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Choose Your Team", fontWeight = FontWeight.Bold) },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.surface
                )
            )
        },
        bottomBar = {
            Surface(
                tonalElevation = 8.dp,
                shadowElevation = 8.dp
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
                            text = "Selected: ${selectedTeam.name}",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Cap: $${selectedTeam.salaryCap / 1_000_000}M • ${selectedTeamRoster.size} Players",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }

                    Button(
                        onClick = {
                            val stream = context.resources.openRawResource(R.raw.rosters)
                            viewModel.createNewGame(
                                name = gameName,
                                userTeamName = selectedTeamName,
                                rosterStream = stream,
                                onCreated = { session ->
                                    onGameCreated(session.id)
                                }
                            )
                        },
                        enabled = !isLoading,
                        shape = RoundedCornerShape(12.dp),
                        colors = ButtonDefaults.buttonColors(
                            containerColor = MaterialTheme.colorScheme.primary
                        )
                    ) {
                        if (isLoading) {
                            CircularProgressIndicator(modifier = Modifier.size(20.dp), strokeWidth = 2.dp)
                        } else {
                            Text("Start Game", fontWeight = FontWeight.Bold)
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
        ) {
            // Conference Filters
            SingleChoiceSegmentedButtonRow(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp)
            ) {
                SegmentedButton(
                    selected = selectedConference == null,
                    onClick = { selectedConference = null },
                    shape = SegmentedButtonDefaults.itemShape(index = 0, count = 3)
                ) {
                    Text("All 30")
                }
                SegmentedButton(
                    selected = selectedConference == Conference.EAST,
                    onClick = { selectedConference = Conference.EAST },
                    shape = SegmentedButtonDefaults.itemShape(index = 1, count = 3)
                ) {
                    Text("East")
                }
                SegmentedButton(
                    selected = selectedConference == Conference.WEST,
                    onClick = { selectedConference = Conference.WEST },
                    shape = SegmentedButtonDefaults.itemShape(index = 2, count = 3)
                ) {
                    Text("West")
                }
            }

            // Teams Grid (Takes upper portion)
            LazyVerticalGrid(
                columns = GridCells.Adaptive(minSize = 64.dp),
                modifier = Modifier
                    .fillMaxWidth()
                    .height(180.dp)
                    .padding(horizontal = 16.dp),
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(filteredTeams) { item ->
                    val isSelected = (item.name == selectedTeamName)
                    val teamColor = try {
                        Color(android.graphics.Color.parseColor(item.colorHex))
                    } catch (_: Exception) {
                        MaterialTheme.colorScheme.primary
                    }

                    Card(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { selectedTeamName = item.name },
                        shape = RoundedCornerShape(12.dp),
                        colors = CardDefaults.cardColors(
                            containerColor = if (isSelected) teamColor else MaterialTheme.colorScheme.surfaceVariant
                        ),
                        elevation = CardDefaults.cardElevation(if (isSelected) 4.dp else 1.dp)
                    ) {
                        Column(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(vertical = 10.dp),
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.Center
                        ) {
                            Box(
                                modifier = Modifier
                                    .size(24.dp)
                                    .clip(CircleShape)
                                    .background(if (isSelected) Color.White.copy(alpha = 0.3f) else teamColor),
                                contentAlignment = Alignment.Center
                            ) {
                                if (isSelected) {
                                    Icon(Icons.Default.Check, contentDescription = null, tint = Color.White, modifier = Modifier.size(16.dp))
                                }
                            }
                            Spacer(modifier = Modifier.height(4.dp))
                            Text(
                                text = item.name,
                                fontWeight = FontWeight.ExtraBold,
                                fontSize = 14.sp,
                                color = if (isSelected) Color.White else MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                }
            }

            HorizontalDivider(modifier = Modifier.padding(vertical = 8.dp))

            // Team Roster Preview Header
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 4.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "${selectedTeam.name} Roster (${selectedTeamRoster.size})",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Div: ${selectedTeam.division.displayName}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            // Player List of Selected Team
            LazyColumn(
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(1f)
                    .padding(horizontal = 16.dp),
                verticalArrangement = Arrangement.spacedBy(6.dp)
            ) {
                items(selectedTeamRoster) { player ->
                    TeamRosterPreviewRow(player)
                }
            }
        }
    }
}

@Composable
fun TeamRosterPreviewRow(player: Player) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(10.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.6f))
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 12.dp, vertical = 8.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(10.dp)
            ) {
                RatingBadge(rating = player.overallRating)
                Column {
                    Text(text = player.name, fontWeight = FontWeight.SemiBold, fontSize = 14.sp)
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(6.dp)
                    ) {
                        PositionBadge(position = player.positionFirst)
                        if (player.positionSecond.id > 0) {
                            PositionBadge(position = player.positionSecond)
                        }
                        Text(
                            text = "Age: ${player.age} • Pot: ★${player.potential}",
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }

            Text(
                text = "$${player.salary / 1_000_000.0}M (${player.yearsContract}y)",
                fontWeight = FontWeight.Bold,
                fontSize = 13.sp,
                color = MaterialTheme.colorScheme.primary
            )
        }
    }
}
