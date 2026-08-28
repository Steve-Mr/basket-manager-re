package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.SwapHoriz
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.res.stringResource
import top.maary.basketmanager.re.R
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Position
import top.maary.basketmanager.re.domain.model.Tactic
import top.maary.basketmanager.re.ui.components.M3PlayerCard
import top.maary.basketmanager.re.ui.components.PlayerDetailBottomSheet
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun RosterScreen(
    viewModel: GameDashboardViewModel
) {
    val roster by viewModel.userRoster.collectAsState()
    val tactic by viewModel.userTactic.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()

    var positionFilter by remember { mutableStateOf<Position?>(null) }
    var sortBy by remember { mutableStateOf("OVR") } // OVR, POS, POT, AGE
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }

    val playerMap = remember(roster) { roster.associateBy { it.id } }

    // Lineup Breakdown for "All POS" mode
    val starterIds = remember(tactic) {
        listOfNotNull(tactic?.starterPgId, tactic?.starterSgId, tactic?.starterSfId, tactic?.starterPfId, tactic?.starterCId)
    }
    val reserveIds = remember(tactic) {
        listOfNotNull(tactic?.reservePgId, tactic?.reserveSgId, tactic?.reserveSfId, tactic?.reservePfId, tactic?.reserveCId)
    }

    val startersList = remember(starterIds, playerMap) { starterIds.mapNotNull { playerMap[it] } }
    val reservesList = remember(reserveIds, playerMap) { reserveIds.mapNotNull { playerMap[it] } }
    val benchList = remember(roster, starterIds, reserveIds) {
        roster.filter { it.id !in starterIds && it.id !in reserveIds }.sortedByDescending { it.overallRating }
    }

    // Filtered list for specific position modes
    val filteredList = remember(roster, positionFilter, sortBy) {
        var list = roster
        if (positionFilter != null) {
            list = list.filter { it.positionFirst == positionFilter || it.positionSecond == positionFilter }
        }
        when (sortBy) {
            "OVR" -> list.sortedByDescending { it.overallRating }
            "POS" -> list.sortedBy { it.positionFirst.id }
            "POT" -> list.sortedByDescending { it.potential }
            "AGE" -> list.sortedBy { it.age }
            else -> list.sortedByDescending { it.overallRating }
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp, vertical = 10.dp)
    ) {
        // Top Header
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column {
                Text(
                    text = "${userTeam?.name ?: "Team"} Roster",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "${roster.size} Active Players (Max 20)",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Surface(
                shape = RoundedCornerShape(8.dp),
                color = MaterialTheme.colorScheme.primaryContainer
            ) {
                Text(
                    text = "Avg OVR: ${if (roster.isNotEmpty()) roster.map { it.overallRating }.average().toInt() else 0}",
                    modifier = Modifier.padding(horizontal = 10.dp, vertical = 6.dp),
                    fontWeight = FontWeight.Bold,
                    fontSize = 12.sp,
                    color = MaterialTheme.colorScheme.onPrimaryContainer
                )
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        // Position Filter Chips (Horizontally scrollable)
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .horizontalScroll(rememberScrollState()),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            FilterChip(
                selected = positionFilter == null,
                onClick = { positionFilter = null },
                label = { Text("All POS (Lineup Order)") }
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

        // Show Sort Chips ONLY when a specific position filter is selected
        if (positionFilter != null) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .horizontalScroll(rememberScrollState()),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Text(
                    text = "Sort:",
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    modifier = Modifier.align(Alignment.CenterVertically)
                )
                listOf("OVR" to "Rating", "POS" to "Position", "POT" to "Potential", "AGE" to "Age").forEach { (key, label) ->
                    FilterChip(
                        selected = sortBy == key,
                        onClick = { sortBy = key },
                        label = { Text(label) }
                    )
                }
            }
            Spacer(modifier = Modifier.height(8.dp))
        }

        // Main List Content
        if (positionFilter == null) {
            // ALL POS: Grouped by Lineup (Starters, Reserves, Bench Depth)
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                verticalArrangement = Arrangement.spacedBy(14.dp),
                contentPadding = PaddingValues(bottom = 20.dp)
            ) {
                // Card 1: Starters Group
                item {
                    RosterGroupCard(
                        title = "Starters",
                        badgeText = "5 Players • Avg ${if (startersList.isNotEmpty()) startersList.map { it.overallRating }.average().toInt() else 0}",
                        headerColor = MaterialTheme.colorScheme.primaryContainer,
                        players = startersList,
                        onPlayerClick = { selectedPlayerForDetail = it }
                    )
                }

                // Card 2: Reserves Group
                item {
                    RosterGroupCard(
                        title = "Reserves",
                        badgeText = "5 Players • Avg ${if (reservesList.isNotEmpty()) reservesList.map { it.overallRating }.average().toInt() else 0}",
                        headerColor = MaterialTheme.colorScheme.surfaceVariant,
                        players = reservesList,
                        onPlayerClick = { selectedPlayerForDetail = it }
                    )
                }

                // Card 3: Bench Depth Group (if any)
                if (benchList.isNotEmpty()) {
                    item {
                        RosterGroupCard(
                            title = "Bench Depth",
                            badgeText = "${benchList.size} Players",
                            headerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f),
                            players = benchList,
                            onPlayerClick = { selectedPlayerForDetail = it }
                        )
                    }
                }
            }
        } else {
            // Specific Position Filter List
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                verticalArrangement = Arrangement.spacedBy(8.dp),
                contentPadding = PaddingValues(bottom = 16.dp)
            ) {
                items(filteredList) { player ->
                    M3PlayerCard(
                        player = player,
                        onClick = { selectedPlayerForDetail = player }
                    )
                }
            }
        }
    }

    // Player Detail Modal with Position Swapping support
    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(
            player = player,
            stats = viewModel.getPlayerSeasonStats(player.id),
            playoffStats = viewModel.getPlayerPlayoffStats(player.id),
            onSwapPosition = { viewModel.swapPlayerPositions(it) },
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}

@Composable
fun RosterGroupCard(
    title: String,
    badgeText: String,
    headerColor: Color,
    players: List<Player>,
    onPlayerClick: (Player) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(14.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.35f)),
        border = androidx.compose.foundation.BorderStroke(1.dp, MaterialTheme.colorScheme.outlineVariant.copy(alpha = 0.3f))
    ) {
        Column(modifier = Modifier.fillMaxWidth().padding(10.dp)) {
            // Section Header
            Row(
                modifier = Modifier.fillMaxWidth().padding(bottom = 8.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = title,
                    fontWeight = FontWeight.ExtraBold,
                    fontSize = 13.sp,
                    color = MaterialTheme.colorScheme.primary
                )
                Surface(
                    shape = RoundedCornerShape(6.dp),
                    color = headerColor
                ) {
                    Text(
                        text = badgeText,
                        fontSize = 10.sp,
                        fontWeight = FontWeight.Bold,
                        modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                    )
                }
            }

            // List of Players inside this card
            Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                players.forEach { player ->
                    M3PlayerCard(
                        player = player,
                        onClick = { onPlayerClick(player) }
                    )
                }
            }
        }
    }
}
