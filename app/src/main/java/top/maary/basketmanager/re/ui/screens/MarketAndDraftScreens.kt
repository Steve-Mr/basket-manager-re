package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.HowToVote
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import top.maary.basketmanager.re.domain.engine.DraftEngine
import top.maary.basketmanager.re.domain.model.DraftPick
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Position
import top.maary.basketmanager.re.ui.components.PlayerDetailBottomSheet
import top.maary.basketmanager.re.ui.components.PositionBadge
import top.maary.basketmanager.re.ui.components.RatingBadge
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun FreeAgencyScreen(
    viewModel: GameDashboardViewModel
) {
    val freeAgents by viewModel.freeAgents.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()
    val roster by viewModel.userRoster.collectAsState()

    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }
    var selectedPlayerForSign by remember { mutableStateOf<Player?>(null) }
    var positionFilter by remember { mutableStateOf<Position?>(null) }
    var sortBy by remember { mutableStateOf("OVR") }

    val totalPayroll = remember(roster) { roster.sumOf { it.salary } }
    val salaryCap = userTeam?.salaryCap ?: 70_000_000
    val capRoom = salaryCap - totalPayroll

    val filteredList = remember(freeAgents, positionFilter, sortBy) {
        var list = freeAgents
        if (positionFilter != null) {
            list = list.filter { it.positionFirst == positionFilter || it.positionSecond == positionFilter }
        }
        when (sortBy) {
            "OVR" -> list.sortedByDescending { it.overallRating }
            "POT" -> list.sortedByDescending { it.potential }
            "AGE" -> list.sortedBy { it.age }
            "SAL" -> list.sortedBy { it.salary }
            else -> list.sortedByDescending { it.overallRating }
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column {
                Text(
                    text = "Free Agency Market",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "${freeAgents.size} available players • Cap Room: $${capRoom / 1_000_000.0}M",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        // Position Filter
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .horizontalScroll(rememberScrollState()),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            FilterChip(
                selected = positionFilter == null,
                onClick = { positionFilter = null },
                label = { Text("All Positions") }
            )
            listOf(Position.POINT_GUARD, Position.SHOOTING_GUARD, Position.SMALL_FORWARD, Position.POWER_FORWARD, Position.CENTER).forEach { pos ->
                FilterChip(
                    selected = positionFilter == pos,
                    onClick = { positionFilter = if (positionFilter == pos) null else pos },
                    label = { Text(pos.shortName) }
                )
            }
        }

        Spacer(modifier = Modifier.height(6.dp))

        // Sort Filter
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .horizontalScroll(rememberScrollState()),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Text("Sort:", fontSize = 12.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.onSurfaceVariant, modifier = Modifier.align(Alignment.CenterVertically))
            listOf("OVR" to "Rating", "POT" to "Potential", "AGE" to "Youngest", "SAL" to "Cheapest").forEach { (key, label) ->
                FilterChip(
                    selected = sortBy == key,
                    onClick = { sortBy = key },
                    label = { Text(label) }
                )
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(filteredList) { player ->
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { selectedPlayerForDetail = player },
                    shape = RoundedCornerShape(12.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(12.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(10.dp)
                        ) {
                            RatingBadge(rating = player.overallRating)
                            Column {
                                Text(player.name, fontWeight = FontWeight.Bold, fontSize = 14.sp)
                                Row(
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                                ) {
                                    PositionBadge(position = player.positionFirst)
                                    Text(
                                        text = "Age: ${player.age} • Pot: ★${player.potential}",
                                        fontSize = 11.sp,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                            }
                        }

                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Column(horizontalAlignment = Alignment.End) {
                                Text(
                                    text = "$${player.salary / 1_000_000.0}M/yr",
                                    fontWeight = FontWeight.Bold,
                                    fontSize = 13.sp,
                                    color = MaterialTheme.colorScheme.primary
                                )
                                Text("Ask: 1-2 yrs", fontSize = 10.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                            }

                            Button(
                                onClick = { selectedPlayerForSign = player },
                                shape = RoundedCornerShape(8.dp),
                                contentPadding = PaddingValues(horizontal = 10.dp, vertical = 4.dp),
                                enabled = capRoom >= player.salary && roster.size < 20
                            ) {
                                Text("Sign", fontSize = 12.sp, fontWeight = FontWeight.Bold)
                            }
                        }
                    }
                }
            }
        }
    }

    // Sign Free Agent Dialog
    selectedPlayerForSign?.let { player ->
        var offerYears by remember { mutableStateOf(1) }
        var offerSalary by remember { mutableStateOf(player.salary) }

        AlertDialog(
            onDismissRequest = { selectedPlayerForSign = null },
            title = { Text("Sign ${player.name}") },
            text = {
                Column(verticalArrangement = Arrangement.spacedBy(10.dp)) {
                    Text("Offered Contract Terms:")
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text("Years: $offerYears")
                        Row(horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                            (1..4).forEach { y ->
                                FilterChip(
                                    selected = offerYears == y,
                                    onClick = { offerYears = y },
                                    label = { Text("${y}y") }
                                )
                            }
                        }
                    }
                    Text("Salary: $${offerSalary / 1_000_000.0}M per year")
                    Text(
                        text = "Cap Room Available: $${capRoom / 1_000_000.0}M",
                        fontSize = 11.sp,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            },
            confirmButton = {
                Button(
                    onClick = {
                        viewModel.signFreeAgent(player.id, offerSalary, offerYears) { success ->
                            selectedPlayerForSign = null
                        }
                    }
                ) {
                    Text("Confirm Signing")
                }
            },
            dismissButton = {
                TextButton(onClick = { selectedPlayerForSign = null }) {
                    Text("Cancel")
                }
            }
        )
    }

    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(player = player, onDismiss = { selectedPlayerForDetail = null })
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DraftScreen(
    viewModel: GameDashboardViewModel
) {
    val game by viewModel.game.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()
    val draftPicks by viewModel.draftPicks.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()

    var selectedTab by remember { mutableStateOf(0) } // 0: Upcoming Draft Class (Big Board), 1: Draft Pick Ownership
    var positionFilter by remember { mutableStateOf<Position?>(null) }
    var selectedProspectForDetail by remember { mutableStateOf<Player?>(null) }

    val teamMap = remember(allTeams) { allTeams.associateBy { it.id } }

    // Seeded Upcoming Draft Class (60 top college/international prospects)
    val draftClass = remember(game?.id, game?.currentSeason) {
        val gId = game?.id ?: 1L
        val seasonSeed = (game?.currentSeason ?: 1) * 1000L
        DraftEngine.generateDraftProspects(gId, count = 60).sortedByDescending { it.overallRating }
    }

    val filteredProspects = remember(draftClass, positionFilter) {
        if (positionFilter == null) draftClass
        else draftClass.filter { it.positionFirst == positionFilter || it.positionSecond == positionFilter }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Text(
            text = "NBA Rookie Draft Hub",
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = "Season ${game?.currentSeason ?: 1} Incoming Draft Class & Pick Ownership",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        Spacer(modifier = Modifier.height(12.dp))

        // Tabs
        PrimaryTabRow(selectedTabIndex = selectedTab) {
            Tab(
                selected = selectedTab == 0,
                onClick = { selectedTab = 0 },
                text = { Text("Draft Big Board (${draftClass.size})") }
            )
            Tab(
                selected = selectedTab == 1,
                onClick = { selectedTab = 1 },
                text = { Text("Pick Ownership (30 Teams)") }
            )
        }

        Spacer(modifier = Modifier.height(10.dp))

        when (selectedTab) {
            0 -> {
                // Position Filter
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .horizontalScroll(rememberScrollState()),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    FilterChip(
                        selected = positionFilter == null,
                        onClick = { positionFilter = null },
                        label = { Text("All Positions") }
                    )
                    listOf(Position.POINT_GUARD, Position.SHOOTING_GUARD, Position.SMALL_FORWARD, Position.POWER_FORWARD, Position.CENTER).forEach { pos ->
                        FilterChip(
                            selected = positionFilter == pos,
                            onClick = { positionFilter = if (positionFilter == pos) null else pos },
                            label = { Text(pos.shortName) }
                        )
                    }
                }

                Spacer(modifier = Modifier.height(10.dp))

                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    itemsIndexed(filteredProspects) { index, prospect ->
                        val projPick = when {
                            index < 3 -> "Top 3 Pick"
                            index < 14 -> "Lottery Pick"
                            index < 30 -> "1st Round"
                            else -> "2nd Round"
                        }

                        Card(
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable { selectedProspectForDetail = prospect },
                            shape = RoundedCornerShape(12.dp),
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(12.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Row(
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.spacedBy(10.dp)
                                ) {
                                    Surface(
                                        shape = CircleShape,
                                        color = when (index) {
                                            0 -> Color(0xFFFFD700)
                                            1 -> Color(0xFFC0C0C0)
                                            2 -> Color(0xFFCD7F32)
                                            else -> MaterialTheme.colorScheme.surface
                                        },
                                        modifier = Modifier.size(28.dp)
                                    ) {
                                        Box(contentAlignment = Alignment.Center) {
                                            Text(
                                                text = "#${index + 1}",
                                                fontWeight = FontWeight.ExtraBold,
                                                fontSize = 11.sp,
                                                color = if (index < 3) Color.Black else MaterialTheme.colorScheme.onSurface
                                            )
                                        }
                                    }

                                    RatingBadge(rating = prospect.overallRating)

                                    Column {
                                        Text(prospect.name, fontWeight = FontWeight.Bold, fontSize = 14.sp)
                                        Row(
                                            verticalAlignment = Alignment.CenterVertically,
                                            horizontalArrangement = Arrangement.spacedBy(6.dp)
                                        ) {
                                            PositionBadge(position = prospect.positionFirst)
                                            Text(
                                                text = "Age: ${prospect.age} • Pot: ★${prospect.potential}",
                                                fontSize = 11.sp,
                                                color = MaterialTheme.colorScheme.onSurfaceVariant
                                            )
                                        }
                                    }
                                }

                                Surface(
                                    shape = RoundedCornerShape(6.dp),
                                    color = if (index < 14) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surface
                                ) {
                                    Text(
                                        text = projPick,
                                        fontSize = 11.sp,
                                        fontWeight = FontWeight.Bold,
                                        modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                                        color = if (index < 14) MaterialTheme.colorScheme.onPrimaryContainer else MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                            }
                        }
                    }
                }
            }

            1 -> {
                // Draft Pick Ownership
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(draftPicks) { pick ->
                        val origTeam = teamMap[pick.originalTeamId]
                        val currTeam = teamMap[pick.currentTeamId]
                        val isUserPick = (pick.currentTeamId == userTeam?.id)

                        Card(
                            modifier = Modifier.fillMaxWidth(),
                            shape = RoundedCornerShape(10.dp),
                            colors = CardDefaults.cardColors(
                                containerColor = if (isUserPick) MaterialTheme.colorScheme.primaryContainer
                                else MaterialTheme.colorScheme.surfaceVariant
                            )
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(12.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Row(
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                                ) {
                                    Icon(
                                        Icons.Default.HowToVote,
                                        contentDescription = null,
                                        tint = if (isUserPick) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                    Column {
                                        Text(
                                            text = "Round ${pick.round} Draft Pick",
                                            fontWeight = FontWeight.Bold,
                                            fontSize = 14.sp
                                        )
                                        Text(
                                            text = "Original Team: ${origTeam?.name ?: "N/A"}",
                                            fontSize = 11.sp,
                                            color = MaterialTheme.colorScheme.onSurfaceVariant
                                        )
                                    }
                                }

                                Surface(
                                    shape = RoundedCornerShape(6.dp),
                                    color = if (isUserPick) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.surface
                                ) {
                                    Text(
                                        text = "Owner: ${currTeam?.name ?: "N/A"}",
                                        fontSize = 11.sp,
                                        fontWeight = FontWeight.ExtraBold,
                                        modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                                        color = if (isUserPick) Color.White else MaterialTheme.colorScheme.onSurface
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    selectedProspectForDetail?.let { player ->
        PlayerDetailBottomSheet(player = player, onDismiss = { selectedProspectForDetail = null })
    }
}
