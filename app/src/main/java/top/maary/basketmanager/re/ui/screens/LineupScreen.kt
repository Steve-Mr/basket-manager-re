package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.AutoFixHigh
import androidx.compose.material.icons.filled.Star
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
fun LineupScreen(
    viewModel: GameDashboardViewModel
) {
    val roster by viewModel.userRoster.collectAsState()
    val tactic by viewModel.userTactic.collectAsState()
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }

    val playerMap = remember(roster) { roster.associateBy { it.id } }

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
                text = "Starting Lineup & Rotation",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold
            )

            Button(
                onClick = { viewModel.autoOptimizeLineup() },
                shape = RoundedCornerShape(8.dp)
            ) {
                Icon(Icons.Default.AutoFixHigh, contentDescription = null, modifier = Modifier.size(16.dp))
                Spacer(modifier = Modifier.width(4.dp))
                Text("Auto Lineup", fontSize = 12.sp)
            }
        }

        Spacer(modifier = Modifier.height(12.dp))

        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.spacedBy(10.dp)
        ) {
            // Starters Section
            item {
                Text(
                    text = "Starting 5 (Starters)",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.primary
                )
            }

            item { LineupSlotItem("PG", playerMap[tactic?.starterPgId]) { selectedPlayerForDetail = it } }
            item { LineupSlotItem("SG", playerMap[tactic?.starterSgId]) { selectedPlayerForDetail = it } }
            item { LineupSlotItem("SF", playerMap[tactic?.starterSfId]) { selectedPlayerForDetail = it } }
            item { LineupSlotItem("PF", playerMap[tactic?.starterPfId]) { selectedPlayerForDetail = it } }
            item { LineupSlotItem("C", playerMap[tactic?.starterCId]) { selectedPlayerForDetail = it } }

            // Bench Reserves Section
            item {
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = "Key Reserves (Bench)",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.secondary
                )
            }

            item { LineupSlotItem("Res PG", playerMap[tactic?.reservePgId]) { selectedPlayerForDetail = it } }
            item { LineupSlotItem("Res SG", playerMap[tactic?.reserveSgId]) { selectedPlayerForDetail = it } }
            item { LineupSlotItem("Res SF", playerMap[tactic?.reserveSfId]) { selectedPlayerForDetail = it } }
            item { LineupSlotItem("Res PF", playerMap[tactic?.reservePfId]) { selectedPlayerForDetail = it } }
            item { LineupSlotItem("Res C", playerMap[tactic?.reserveCId]) { selectedPlayerForDetail = it } }

            // Team Stars Section
            item {
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = "Team Stars (+3, +2, +1 Bonus)",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
            }

            item { StarPlayerItem("+3 Star", playerMap[tactic?.starOnePlayerId]) { selectedPlayerForDetail = it } }
            item { StarPlayerItem("+2 Star", playerMap[tactic?.starTwoPlayerId]) { selectedPlayerForDetail = it } }
            item { StarPlayerItem("+1 Star", playerMap[tactic?.starThreePlayerId]) { selectedPlayerForDetail = it } }
        }
    }

    if (selectedPlayerForDetail != null) {
        PlayerDetailBottomSheet(
            player = selectedPlayerForDetail,
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}

@Composable
fun LineupSlotItem(
    slotName: String,
    player: Player?,
    onClick: (Player) -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(enabled = player != null) { if (player != null) onClick(player) },
        shape = RoundedCornerShape(10.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(10.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(10.dp)
            ) {
                PositionBadge(position = slotName)
                Text(
                    text = player?.name ?: "Empty Slot",
                    fontWeight = FontWeight.Bold,
                    style = MaterialTheme.typography.bodyMedium
                )
            }

            if (player != null) {
                RatingBadge(rating = player.overallRating)
            }
        }
    }
}

@Composable
fun StarPlayerItem(
    starLabel: String,
    player: Player?,
    onClick: (Player) -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(enabled = player != null) { if (player != null) onClick(player) },
        shape = RoundedCornerShape(10.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(10.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(Icons.Default.Star, contentDescription = null, tint = Color(0xFFFFD700))
                Text(text = "$starLabel: ${player?.name ?: "None"}", fontWeight = FontWeight.Bold, style = MaterialTheme.typography.bodyMedium)
            }
            if (player != null) {
                RatingBadge(rating = player.overallRating)
            }
        }
    }
}
