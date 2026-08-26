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
    val userTeam by viewModel.userTeam.collectAsState()

    var positionFilter by remember { mutableStateOf<Position?>(null) }
    var sortBy by remember { mutableStateOf("OVR") } // OVR, POS, POT, AGE
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }

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
            .padding(16.dp)
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
                label = { Text("All POS") }
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

        // Sorting Filter Chips (Horizontally scrollable)
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .horizontalScroll(rememberScrollState()),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Text("Sort:", fontSize = 12.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.onSurfaceVariant, modifier = Modifier.align(Alignment.CenterVertically))
            listOf("OVR" to "Rating", "POS" to "Position", "POT" to "Potential", "AGE" to "Age").forEach { (key, label) ->
                FilterChip(
                    selected = sortBy == key,
                    onClick = { sortBy = key },
                    label = { Text(label) }
                )
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        // Players List
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
                                Text(
                                    text = player.name,
                                    fontWeight = FontWeight.Bold,
                                    fontSize = 15.sp
                                )
                                Row(
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                                ) {
                                    PositionBadge(position = player.positionFirst)
                                    if (player.positionSecond != Position.NONE) {
                                        PositionBadge(position = player.positionSecond)
                                    }
                                    Text(
                                        text = "${player.age} yrs",
                                        fontSize = 12.sp,
                                        fontWeight = FontWeight.SemiBold,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                            }
                        }

                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            // Prominent Potential Badge
                            Surface(
                                shape = RoundedCornerShape(6.dp),
                                color = Color(0xFFFFD700).copy(alpha = 0.2f)
                            ) {
                                Text(
                                    text = "★ ${player.potential}",
                                    fontSize = 12.sp,
                                    fontWeight = FontWeight.ExtraBold,
                                    color = Color(0xFFB8860B),
                                    modifier = Modifier.padding(horizontal = 6.dp, vertical = 3.dp)
                                )
                            }

                            // Dual-position swap button
                            if (player.positionSecond != Position.NONE && player.positionSecond != player.positionFirst) {
                                IconButton(
                                    onClick = { viewModel.swapPlayerPositions(player) },
                                    modifier = Modifier.size(32.dp)
                                ) {
                                    Icon(
                                        Icons.Default.SwapHoriz,
                                        contentDescription = "Swap Positions",
                                        tint = MaterialTheme.colorScheme.primary
                                    )
                                }
                            }

                            // Injury / Form Status
                            if (player.stateInjury > 0) {
                                Surface(
                                    shape = RoundedCornerShape(4.dp),
                                    color = MaterialTheme.colorScheme.errorContainer
                                ) {
                                    Text(
                                        text = "INJ (${player.stateInjury}d)",
                                        fontSize = 11.sp,
                                        fontWeight = FontWeight.Bold,
                                        color = MaterialTheme.colorScheme.onErrorContainer,
                                        modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                                    )
                                }
                            } else {
                                Surface(
                                    shape = RoundedCornerShape(4.dp),
                                    color = MaterialTheme.colorScheme.surface
                                ) {
                                    Text(
                                        text = "F: ${player.stateForm}%",
                                        fontSize = 11.sp,
                                        modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(
            player = player,
            stats = viewModel.getPlayerSeasonStats(player.id),
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}
