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
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Position
import top.maary.basketmanager.re.domain.model.Tactic
import top.maary.basketmanager.re.ui.components.PlayerDetailBottomSheet
import top.maary.basketmanager.re.ui.components.PositionBadge
import top.maary.basketmanager.re.ui.components.RatingBadge
import top.maary.basketmanager.re.ui.theme.RatingGreen
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
                verticalArrangement = Arrangement.spacedBy(12.dp),
                contentPadding = PaddingValues(bottom = 16.dp)
            ) {
                // Card 1: 🌟 Starters Group
                item {
                    RosterGroupCard(
                        title = "🌟 STARTERS (首发五虎)",
                        badgeText = "5 Players • Avg ${if (startersList.isNotEmpty()) startersList.map { it.overallRating }.average().toInt() else 0}",
                        headerColor = MaterialTheme.colorScheme.primaryContainer,
                        players = startersList,
                        onPlayerClick = { selectedPlayerForDetail = it },
                        onSwapPos = { viewModel.swapPlayerPositions(it) }
                    )
                }

                // Card 2: 🔄 Reserves Group
                item {
                    RosterGroupCard(
                        title = "🔄 RESERVES (主要替补)",
                        badgeText = "5 Players • Avg ${if (reservesList.isNotEmpty()) reservesList.map { it.overallRating }.average().toInt() else 0}",
                        headerColor = MaterialTheme.colorScheme.surfaceVariant,
                        players = reservesList,
                        onPlayerClick = { selectedPlayerForDetail = it },
                        onSwapPos = { viewModel.swapPlayerPositions(it) }
                    )
                }

                // Card 3: 🪑 Bench Depth Group (if any)
                if (benchList.isNotEmpty()) {
                    item {
                        RosterGroupCard(
                            title = "🪑 BENCH DEPTH (板凳深度 / 未激活)",
                            badgeText = "${benchList.size} Players",
                            headerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f),
                            players = benchList,
                            onPlayerClick = { selectedPlayerForDetail = it },
                            onSwapPos = { viewModel.swapPlayerPositions(it) }
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
                    RosterPlayerRowCard(
                        player = player,
                        onClick = { selectedPlayerForDetail = player },
                        onSwapPos = { viewModel.swapPlayerPositions(player) }
                    )
                }
            }
        }
    }

    // Player Detail Modal
    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(
            player = player,
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
    onPlayerClick: (Player) -> Unit,
    onSwapPos: (Player) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(12.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f))
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
                    fontWeight = FontWeight.Black,
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
                    RosterPlayerRowCard(
                        player = player,
                        onClick = { onPlayerClick(player) },
                        onSwapPos = { onSwapPos(player) }
                    )
                }
            }
        }
    }
}

@Composable
fun RosterPlayerRowCard(
    player: Player,
    onClick: () -> Unit,
    onSwapPos: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(8.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 10.dp, vertical = 8.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                RatingBadge(rating = player.overallRating, size = 28)

                Column {
                    Text(
                        text = player.name,
                        fontWeight = FontWeight.Bold,
                        fontSize = 13.sp
                    )
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(4.dp)
                    ) {
                        PositionBadge(position = player.positionFirst)
                        if (player.positionSecond != Position.NONE) {
                            PositionBadge(position = player.positionSecond)
                        }
                        Text(
                            text = "${player.age} yrs",
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }

            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(6.dp)
            ) {
                // Potential Badge
                Surface(
                    shape = RoundedCornerShape(4.dp),
                    color = Color(0xFFFFD700).copy(alpha = 0.2f)
                ) {
                    Text(
                        text = "★ ${player.potential}",
                        fontSize = 11.sp,
                        fontWeight = FontWeight.ExtraBold,
                        color = Color(0xFFB8860B),
                        modifier = Modifier.padding(horizontal = 5.dp, vertical = 2.dp)
                    )
                }

                // Dual-position swap button
                if (player.positionSecond != Position.NONE && player.positionSecond != player.positionFirst) {
                    IconButton(
                        onClick = onSwapPos,
                        modifier = Modifier.size(28.dp)
                    ) {
                        Icon(
                            Icons.Default.SwapHoriz,
                            contentDescription = "Swap Positions",
                            tint = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.size(16.dp)
                        )
                    }
                }

                // Injury Status
                if (player.stateInjury > 0) {
                    Surface(
                        shape = RoundedCornerShape(4.dp),
                        color = MaterialTheme.colorScheme.errorContainer
                    ) {
                        Text(
                            text = "INJ (${player.stateInjury}d)",
                            fontSize = 10.sp,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.onErrorContainer,
                            modifier = Modifier.padding(horizontal = 4.dp, vertical = 2.dp)
                        )
                    }
                }
            }
        }
    }
}
