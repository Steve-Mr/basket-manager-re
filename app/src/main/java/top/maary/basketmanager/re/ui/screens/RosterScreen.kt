package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
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
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@Composable
fun RosterScreen(
    viewModel: GameDashboardViewModel
) {
    val roster by viewModel.userRoster.collectAsState()
    var selectedPlayer by remember { mutableStateOf<Player?>(null) }
    var sortBy by remember { mutableStateOf("OVR") }
    var positionFilter by remember { mutableStateOf<Position?>(null) }

    val filteredAndSortedRoster = remember(roster, sortBy, positionFilter) {
        var list = roster
        if (positionFilter != null) {
            list = list.filter { it.positionFirst == positionFilter || it.positionSecond == positionFilter }
        }
        when (sortBy) {
            "OVR" -> list.sortedByDescending { it.overallRating }
            "POS" -> list.sortedBy { it.positionFirst.id }
            "AGE" -> list.sortedBy { it.age }
            "SAL" -> list.sortedByDescending { it.salary }
            "POT" -> list.sortedByDescending { it.potential }
            else -> list.sortedByDescending { it.overallRating }
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        // Header
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column {
                Text(
                    text = "Team Roster",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "${filteredAndSortedRoster.size} of ${roster.size} Players • Total: $${roster.sumOf { it.salary } / 1_000_000.0}M",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
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
            Text(
                text = "Sort:",
                fontSize = 12.sp,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                modifier = Modifier.align(Alignment.CenterVertically)
            )
            listOf(
                "OVR" to "Rating",
                "POS" to "Position",
                "SAL" to "Salary",
                "POT" to "Potential",
                "AGE" to "Age"
            ).forEach { (key, label) ->
                FilterChip(
                    selected = sortBy == key,
                    onClick = { sortBy = key },
                    label = { Text(label) }
                )
            }
        }

        Spacer(modifier = Modifier.height(12.dp))

        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(filteredAndSortedRoster) { player ->
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { selectedPlayer = player },
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
                                    style = MaterialTheme.typography.titleMedium,
                                    fontWeight = FontWeight.Bold
                                )
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
                                        fontSize = 12.sp,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                            }
                        }

                        Column(horizontalAlignment = Alignment.End) {
                            Text(
                                text = "$${player.salary / 1_000_000.0}M",
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.primary
                            )
                            Text(
                                text = "${player.yearsContract} yrs left",
                                fontSize = 12.sp,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                            if (player.stateInjury > 0) {
                                Text(
                                    text = "Injured (${player.stateInjury}d)",
                                    fontSize = 11.sp,
                                    fontWeight = FontWeight.Bold,
                                    color = MaterialTheme.colorScheme.error
                                )
                            }
                        }
                    }
                }
            }
        }
    }

    selectedPlayer?.let { player ->
        PlayerDetailBottomSheet(player = player, onDismiss = { selectedPlayer = null })
    }
}
