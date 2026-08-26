package com.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.basketmanager.re.domain.model.Player
import com.basketmanager.re.ui.components.PlayerDetailBottomSheet
import com.basketmanager.re.ui.components.PositionBadge
import com.basketmanager.re.ui.components.RatingBadge
import com.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@Composable
fun RosterScreen(
    viewModel: GameDashboardViewModel
) {
    val roster by viewModel.userRoster.collectAsState()
    var selectedPlayer by remember { mutableStateOf<Player?>(null) }
    var sortBy by remember { mutableStateOf("OVR") }

    val sortedRoster = remember(roster, sortBy) {
        when (sortBy) {
            "OVR" -> roster.sortedByDescending { it.overallRating }
            "POS" -> roster.sortedBy { it.positionFirst.id }
            "AGE" -> roster.sortedBy { it.age }
            "SAL" -> roster.sortedByDescending { it.salary }
            "POT" -> roster.sortedByDescending { it.potential }
            else -> roster.sortedByDescending { it.overallRating }
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
            Text(
                text = "Roster (${roster.size} Players)",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold
            )

            Row(horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                listOf("OVR", "POS", "SAL", "POT").forEach { option ->
                    FilterChip(
                        selected = sortBy == option,
                        onClick = { sortBy = option },
                        label = { Text(option, fontSize = 11.sp) }
                    )
                }
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(sortedRoster) { player ->
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
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(10.dp),
                            modifier = Modifier.weight(1f)
                        ) {
                            PositionBadge(position = player.positionFirst.shortName)
                            Column {
                                Text(
                                    text = player.name,
                                    fontWeight = FontWeight.Bold,
                                    style = MaterialTheme.typography.bodyLarge
                                )
                                Text(
                                    text = "Age: ${player.age} | $${player.salary / 1_000_000.0}M | ${player.yearsContract}y",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }

                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            if (player.stateInjury != 0) {
                                Text(
                                    text = "INJ",
                                    color = Color.Red,
                                    fontWeight = FontWeight.Bold,
                                    fontSize = 12.sp
                                )
                            }
                            RatingBadge(rating = player.overallRating)
                        }
                    }
                }
            }
        }
    }

    if (selectedPlayer != null) {
        PlayerDetailBottomSheet(
            player = selectedPlayer,
            onDismiss = { selectedPlayer = null }
        )
    }
}
