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
import androidx.compose.material.icons.filled.HowToVote
import androidx.compose.material.icons.filled.PersonAdd
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

    var positionFilter by remember { mutableStateOf<Position?>(null) }
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }
    var playerToSign by remember { mutableStateOf<Player?>(null) }
    var contractYears by remember { mutableIntStateOf(1) }
    var signFeedbackMsg by remember { mutableStateOf<String?>(null) }

    val filteredList = remember(freeAgents, positionFilter) {
        if (positionFilter == null) freeAgents
        else freeAgents.filter { it.positionFirst == positionFilter || it.positionSecond == positionFilter }
    }

    val totalSalary = remember(roster) { roster.sumOf { it.salary } }
    val capRemaining = (userTeam?.salaryCap ?: 70_000_000) - totalSalary

    fun formatMoney(amount: Int): String {
        return if (amount >= 1_000_000) "$${amount / 1_000_000}M" else "$${amount / 1_000}K"
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Text(
            text = "Free Agency Market",
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = "Sign available free agents to complete your roster. Cap Room: ${formatMoney(capRemaining)}",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        Spacer(modifier = Modifier.height(12.dp))

        // Position Filter Chips
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .horizontalScroll(rememberScrollState()),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            FilterChip(
                selected = positionFilter == null,
                onClick = { positionFilter = null },
                label = { Text("All (${freeAgents.size})") }
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
            items(filteredList) { player ->
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { selectedPlayerForDetail = player },
                    shape = RoundedCornerShape(10.dp),
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
                                Text(text = player.name, fontWeight = FontWeight.Bold)
                                Row(
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                                ) {
                                    PositionBadge(position = player.positionFirst)
                                    Text(
                                        text = "Age: ${player.age} • Pot: ★${player.potential} • Demands: ${formatMoney(player.salary)}/yr",
                                        fontSize = 11.sp,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                            }
                        }

                        Button(
                            onClick = {
                                playerToSign = player
                                contractYears = 1
                            },
                            shape = RoundedCornerShape(8.dp),
                            contentPadding = PaddingValues(horizontal = 10.dp, vertical = 6.dp)
                        ) {
                            Icon(Icons.Default.PersonAdd, contentDescription = null, modifier = Modifier.size(16.dp))
                            Spacer(modifier = Modifier.width(4.dp))
                            Text("Sign", fontSize = 12.sp)
                        }
                    }
                }
            }
        }
    }

    // Signing Modal Dialog
    playerToSign?.let { player ->
        AlertDialog(
            onDismissRequest = { playerToSign = null },
            title = { Text("Sign Free Agent: ${player.name}") },
            text = {
                Column(verticalArrangement = Arrangement.spacedBy(10.dp)) {
                    Text("Demanded Salary: ${formatMoney(player.salary)} / year", fontWeight = FontWeight.Bold)
                    Text("Cap Room Available: ${formatMoney(capRemaining)}", color = if (capRemaining >= player.salary) Color.Unspecified else MaterialTheme.colorScheme.error)

                    Text("Contract Length:", fontSize = 12.sp)
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        (1..3).forEach { y ->
                            FilterChip(
                                selected = contractYears == y,
                                onClick = { contractYears = y },
                                label = { Text("$y Years") }
                            )
                        }
                    }
                }
            },
            confirmButton = {
                Button(
                    onClick = {
                        val p = player
                        playerToSign = null
                        if (capRemaining < p.salary) {
                            signFeedbackMsg = "Cannot sign ${p.name}: exceeds salary cap limit!"
                        } else {
                            viewModel.signFreeAgent(p.id, p.salary, contractYears) { success ->
                                signFeedbackMsg = if (success) "Successfully signed ${p.name}!" else "Failed to sign ${p.name}."
                            }
                        }
                    }
                ) {
                    Text("Confirm Signing")
                }
            },
            dismissButton = {
                TextButton(onClick = { playerToSign = null }) {
                    Text("Cancel")
                }
            }
        )
    }

    signFeedbackMsg?.let { msg ->
        AlertDialog(
            onDismissRequest = { signFeedbackMsg = null },
            title = { Text("Free Agency Notice") },
            text = { Text(msg) },
            confirmButton = {
                Button(onClick = { signFeedbackMsg = null }) {
                    Text("OK")
                }
            }
        )
    }

    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(
            player = player,
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}

@Composable
fun DraftScreen(
    viewModel: GameDashboardViewModel
) {
    val game by viewModel.game.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()
    val draftPicks by viewModel.draftPicks.collectAsState()

    var selectedTab by remember { mutableStateOf(0) } // 0: Big Board, 1: Pick Ownership
    var positionFilter by remember { mutableStateOf<Position?>(null) }
    var selectedProspectForDetail by remember { mutableStateOf<Player?>(null) }
    var prospectToDraft by remember { mutableStateOf<Player?>(null) }
    var draftFeedbackMsg by remember { mutableStateOf<String?>(null) }

    val teamMap = remember(allTeams) { allTeams.associateBy { it.id } }
    val userPicks = remember(draftPicks, userTeam) {
        draftPicks.filter { it.currentTeamId == userTeam?.id }
    }

    val draftClass = remember(game?.id, game?.currentSeason) {
        val gId = game?.id ?: 1L
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
            text = "Rookie Draft Hub",
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
        TabRow(selectedTabIndex = selectedTab) {
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
