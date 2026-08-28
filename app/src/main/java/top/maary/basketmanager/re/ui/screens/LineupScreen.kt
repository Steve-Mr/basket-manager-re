package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.AutoAwesome
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import top.maary.basketmanager.re.domain.model.LineupSlot
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
fun LineupScreen(
    viewModel: GameDashboardViewModel
) {
    val roster by viewModel.userRoster.collectAsState()
    val tactic by viewModel.userTactic.collectAsState()

    var selectedSlotForEdit by remember { mutableStateOf<LineupSlot?>(null) }
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }

    val playerMap = remember(roster) { roster.associateBy { it.id } }

    val starterPg = tactic?.starterPgId?.let { playerMap[it] }
    val starterSg = tactic?.starterSgId?.let { playerMap[it] }
    val starterSf = tactic?.starterSfId?.let { playerMap[it] }
    val starterPf = tactic?.starterPfId?.let { playerMap[it] }
    val starterC = tactic?.starterCId?.let { playerMap[it] }

    val reservePg = tactic?.reservePgId?.let { playerMap[it] }
    val reserveSg = tactic?.reserveSgId?.let { playerMap[it] }
    val reserveSf = tactic?.reserveSfId?.let { playerMap[it] }
    val reservePf = tactic?.reservePfId?.let { playerMap[it] }
    val reserveC = tactic?.reserveCId?.let { playerMap[it] }

    val startersList = remember(starterPg, starterSg, starterSf, starterPf, starterC) {
        listOfNotNull(starterPg, starterSg, starterSf, starterPf, starterC)
    }
    val reservesList = remember(reservePg, reserveSg, reserveSf, reservePf, reserveC) {
        listOfNotNull(reservePg, reserveSg, reserveSf, reservePf, reserveC)
    }

    val injuredInRotation = remember(startersList, reservesList) {
        (startersList + reservesList).filter { it.stateInjury > 0 }
    }

    val starterAvgOvr = if (startersList.isNotEmpty()) startersList.map { it.overallRating }.average().toInt() else 0
    val reserveAvgOvr = if (reservesList.isNotEmpty()) reservesList.map { it.overallRating }.average().toInt() else 0

    val positionRows = listOf(
        Triple(Position.PG, LineupSlot.STARTER_PG to starterPg, LineupSlot.RESERVE_PG to reservePg),
        Triple(Position.SG, LineupSlot.STARTER_SG to starterSg, LineupSlot.RESERVE_SG to reserveSg),
        Triple(Position.SF, LineupSlot.STARTER_SF to starterSf, LineupSlot.RESERVE_SF to reserveSf),
        Triple(Position.PF, LineupSlot.STARTER_PF to starterPf, LineupSlot.RESERVE_PF to reservePf),
        Triple(Position.C, LineupSlot.STARTER_C to starterC, LineupSlot.RESERVE_C to reserveC)
    )

    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(start = 16.dp, end = 16.dp, top = 12.dp, bottom = 24.dp),
        verticalArrangement = Arrangement.spacedBy(10.dp)
    ) {
        // Top Header
        item {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    Text(
                        text = "Lineup & Rotation",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "Starters (Left) • Reserves (Right)",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }

                Button(
                    onClick = { viewModel.optimizeUserLineup() },
                    shape = RoundedCornerShape(8.dp),
                    contentPadding = PaddingValues(horizontal = 10.dp, vertical = 6.dp)
                ) {
                    Icon(Icons.Default.AutoAwesome, contentDescription = null, modifier = Modifier.size(16.dp))
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Auto Optimize", fontSize = 12.sp)
                }
            }
        }

        // Injury Warning Notice
        if (injuredInRotation.isNotEmpty()) {
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(10.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.errorContainer)
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth().padding(12.dp),
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(10.dp)
                    ) {
                        Text("⚠️", fontSize = 20.sp)
                        Column {
                            Text(
                                text = "Rotation Injury Alert",
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.onErrorContainer
                            )
                            Text(
                                text = "${injuredInRotation.size} rotation player(s) injured. Auto-swapping will replace them or tap to adjust.",
                                fontSize = 12.sp,
                                color = MaterialTheme.colorScheme.onErrorContainer
                            )
                        }
                    }
                }
            }
        }

        // Column Group Headers (Starters vs Reserves)
        item {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(10.dp)
            ) {
                // Left Header: Starters
                Surface(
                    shape = RoundedCornerShape(8.dp),
                    color = MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.7f),
                    modifier = Modifier.weight(1f)
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth().padding(horizontal = 10.dp, vertical = 6.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = "🌟 STARTERS",
                            fontWeight = FontWeight.Black,
                            fontSize = 12.sp,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        Text(
                            text = "Avg $starterAvgOvr",
                            fontWeight = FontWeight.Bold,
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.primary
                        )
                    }
                }

                // Right Header: Reserves
                Surface(
                    shape = RoundedCornerShape(8.dp),
                    color = MaterialTheme.colorScheme.surfaceVariant,
                    modifier = Modifier.weight(1f)
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth().padding(horizontal = 10.dp, vertical = 6.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = "🔄 RESERVES",
                            fontWeight = FontWeight.Black,
                            fontSize = 12.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Text(
                            text = "Avg $reserveAvgOvr",
                            fontWeight = FontWeight.Bold,
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.outline
                        )
                    }
                }
            }
        }

        // 5 Position Rows: Starters on Left, Reserves on Right
        items(positionRows) { (pos, starterPair, reservePair) ->
            val (starterSlot, starterP) = starterPair
            val (reserveSlot, reserveP) = reservePair

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(10.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Left Column: Starter Card
                Box(modifier = Modifier.weight(1f)) {
                    CompactLineupSlotCard(
                        slot = starterSlot,
                        position = pos,
                        player = starterP,
                        isStarter = true,
                        onClick = { selectedSlotForEdit = starterSlot },
                        onDetail = { if (starterP != null) selectedPlayerForDetail = starterP }
                    )
                }

                // Right Column: Reserve Card
                Box(modifier = Modifier.weight(1f)) {
                    CompactLineupSlotCard(
                        slot = reserveSlot,
                        position = pos,
                        player = reserveP,
                        isStarter = false,
                        onClick = { selectedSlotForEdit = reserveSlot },
                        onDetail = { if (reserveP != null) selectedPlayerForDetail = reserveP }
                    )
                }
            }
        }
    }

    // Candidate Selection Bottom Sheet
    selectedSlotForEdit?.let { slot ->
        ModalBottomSheet(
            onDismissRequest = { selectedSlotForEdit = null },
            sheetState = rememberModalBottomSheetState(skipPartiallyExpanded = true)
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp)
            ) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column {
                        Text(
                            text = "Select ${slot.title}",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Target Position: ${slot.position.name} • Auto-swaps if already in lineup",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }

                Spacer(modifier = Modifier.height(10.dp))

                LazyColumn(
                    modifier = Modifier.fillMaxWidth().heightIn(max = 420.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(roster.sortedByDescending { it.overallRating }) { player ->
                        val isCurrentSlotHolder = tactic?.getPlayerIdForSlot(slot) == player.id
                        val currentAssignedSlot = tactic?.findSlotForPlayer(player.id)
                        val isInjured = player.stateInjury > 0
                        val posPenalty = player.getPositionPenalty(slot.position)

                        Card(
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable {
                                    applySlotAssignment(slot, player.id, tactic, viewModel)
                                    selectedSlotForEdit = null
                                },
                            shape = RoundedCornerShape(10.dp),
                            colors = CardDefaults.cardColors(
                                containerColor = if (isCurrentSlotHolder) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.6f)
                                else MaterialTheme.colorScheme.surfaceVariant
                            )
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(10.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Row(
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.spacedBy(10.dp)
                                ) {
                                    RatingBadge(rating = (player.overallRating + player.getPositionPenalty(slot.position)).coerceAtLeast(40))
                                    Column {
                                        Text(
                                            text = player.name,
                                            fontWeight = FontWeight.Bold,
                                            fontSize = 14.sp
                                        )
                                        Row(horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                                            PositionBadge(position = player.positionFirst)
                                            if (player.positionSecond != Position.NONE) {
                                                PositionBadge(position = player.positionSecond)
                                            }
                                            Text(
                                                text = "★${player.potential} • ${player.age}y",
                                                fontSize = 11.sp,
                                                color = MaterialTheme.colorScheme.onSurfaceVariant
                                            )
                                        }
                                    }
                                }

                                Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                                    if (isInjured) {
                                        Surface(shape = RoundedCornerShape(4.dp), color = MaterialTheme.colorScheme.errorContainer) {
                                            Text("INJ (${player.stateInjury}d)", fontSize = 10.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.onErrorContainer, modifier = Modifier.padding(3.dp))
                                        }
                                    }
                                    if (posPenalty < 0) {
                                        Surface(shape = RoundedCornerShape(4.dp), color = if (posPenalty == -2) Color(0xFFD97706).copy(alpha = 0.2f) else MaterialTheme.colorScheme.errorContainer) {
                                            Text(
                                                text = if (posPenalty == -2) "-2 OVR" else "-7 OVR",
                                                fontSize = 10.sp,
                                                fontWeight = FontWeight.Bold,
                                                color = if (posPenalty == -2) Color(0xFFD97706) else MaterialTheme.colorScheme.error,
                                                modifier = Modifier.padding(horizontal = 4.dp, vertical = 2.dp)
                                            )
                                        }
                                    }
                                    if (currentAssignedSlot != null) {
                                        Surface(
                                            shape = RoundedCornerShape(4.dp),
                                            color = if (currentAssignedSlot == slot) RatingGreen.copy(alpha = 0.2f) else MaterialTheme.colorScheme.outlineVariant.copy(alpha = 0.5f)
                                        ) {
                                            Text(
                                                text = if (currentAssignedSlot == slot) "Current" else "In ${currentAssignedSlot.title.substringBefore(" ")}",
                                                fontSize = 10.sp,
                                                fontWeight = FontWeight.Bold,
                                                color = if (currentAssignedSlot == slot) RatingGreen else MaterialTheme.colorScheme.onSurfaceVariant,
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
        }
    }

    // Player Detail Modal
    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(
            player = player,
            stats = viewModel.getPlayerSeasonStats(player.id),
            playoffStats = viewModel.getPlayerPlayoffStats(player.id),
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}

@Composable
fun CompactLineupSlotCard(
    slot: LineupSlot,
    position: Position,
    player: Player?,
    isStarter: Boolean,
    onClick: () -> Unit,
    onDetail: () -> Unit
) {
    val isInjured = player != null && player.stateInjury > 0
    val posPenalty = player?.getPositionPenalty(position) ?: 0

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(10.dp))
            .clickable(onClick = onClick)
            .then(
                if (isStarter) Modifier.border(1.dp, MaterialTheme.colorScheme.primary.copy(alpha = 0.4f), RoundedCornerShape(10.dp))
                else Modifier.border(0.5.dp, MaterialTheme.colorScheme.outlineVariant, RoundedCornerShape(10.dp))
            ),
        shape = RoundedCornerShape(10.dp),
        colors = CardDefaults.cardColors(
            containerColor = if (isStarter) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.25f)
            else MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 8.dp, vertical = 8.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(6.dp),
                modifier = Modifier.weight(1f)
            ) {
                // Position Badge
                PositionBadge(position = position)

                if (player != null) {
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = player.shortName,
                            fontWeight = FontWeight.Bold,
                            fontSize = 12.sp,
                            maxLines = 1
                        )
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(4.dp)
                        ) {
                            if (isInjured) {
                                Text(
                                    text = "INJ (${player.stateInjury}d)",
                                    fontSize = 9.sp,
                                    fontWeight = FontWeight.Bold,
                                    color = MaterialTheme.colorScheme.error
                                )
                            } else if (posPenalty < 0) {
                                Text(
                                    text = if (posPenalty == -2) "-2 OutPos" else "-7 OutPos",
                                    fontSize = 9.sp,
                                    fontWeight = FontWeight.Bold,
                                    color = if (posPenalty == -2) Color(0xFFD97706) else MaterialTheme.colorScheme.error
                                )
                            } else {
                                Text(
                                    text = "★${player.potential} • ${player.age}y",
                                    fontSize = 10.sp,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }
                    }
                } else {
                    Text(
                        text = "Tap to Assign",
                        fontSize = 11.sp,
                        color = MaterialTheme.colorScheme.outline,
                        modifier = Modifier.weight(1f)
                    )
                }
            }

            if (player != null) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    RatingBadge(rating = (player.overallRating + player.getPositionPenalty(position)).coerceAtLeast(40), size = 26)
                }
            }
        }
    }
}

private fun applySlotAssignment(
    slot: LineupSlot,
    playerId: Long,
    tactic: Tactic?,
    viewModel: GameDashboardViewModel
) {
    val current = tactic ?: return
    val updated = current.assignPlayerToSlot(slot, playerId)
    viewModel.updateTactic(updated)
}
