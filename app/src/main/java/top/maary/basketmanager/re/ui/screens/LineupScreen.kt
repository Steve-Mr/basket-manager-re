package top.maary.basketmanager.re.ui.screens

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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Position
import top.maary.basketmanager.re.domain.model.Tactic
import top.maary.basketmanager.re.domain.model.LineupSlot
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

    val injuredInRotation = remember(tactic, roster) {
        listOfNotNull(starterPg, starterSg, starterSf, starterPf, starterC,
            reservePg, reserveSg, reserveSf, reservePf, reserveC).filter { it.stateInjury > 0 }
    }

    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(start = 16.dp, end = 16.dp, top = 12.dp, bottom = 16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
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
                        text = "Customize starting 5 and 2nd unit rotation slots",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }

                Button(
                    onClick = { viewModel.optimizeUserLineup() },
                    shape = RoundedCornerShape(8.dp)
                ) {
                    Icon(Icons.Default.AutoAwesome, contentDescription = null, modifier = Modifier.size(16.dp))
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Auto Optimize")
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
                                text = "${injuredInRotation.size} active rotation players are injured. Please substitute them before matchday simulation.",
                                fontSize = 12.sp,
                                color = MaterialTheme.colorScheme.onErrorContainer
                            )
                        }
                    }
                }
            }
        }

        // Section 1: Starting Five
        item {
            Text(
                text = "Starting Five (Starters)",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.primary
            )
        }

        item {
            LineupSlotCard(
                slotLabel = Position.PG,
                slotTitle = "PG • Point Guard",
                player = starterPg,
                slotPos = Position.PG,
                onClick = { selectedSlotForEdit = LineupSlot.STARTER_PG },
                onDetail = { selectedPlayerForDetail = it }
            )
        }
        item {
            LineupSlotCard(
                slotLabel = Position.SG,
                slotTitle = "SG • Shooting Guard",
                player = starterSg,
                slotPos = Position.SG,
                onClick = { selectedSlotForEdit = LineupSlot.STARTER_SG },
                onDetail = { selectedPlayerForDetail = it }
            )
        }
        item {
            LineupSlotCard(
                slotLabel = Position.SF,
                slotTitle = "SF • Small Forward",
                player = starterSf,
                slotPos = Position.SF,
                onClick = { selectedSlotForEdit = LineupSlot.STARTER_SF },
                onDetail = { selectedPlayerForDetail = it }
            )
        }
        item {
            LineupSlotCard(
                slotLabel = Position.PF,
                slotTitle = "PF • Power Forward",
                player = starterPf,
                slotPos = Position.PF,
                onClick = { selectedSlotForEdit = LineupSlot.STARTER_PF },
                onDetail = { selectedPlayerForDetail = it }
            )
        }
        item {
            LineupSlotCard(
                slotLabel = Position.C,
                slotTitle = "C • Center",
                player = starterC,
                slotPos = Position.C,
                onClick = { selectedSlotForEdit = LineupSlot.STARTER_C },
                onDetail = { selectedPlayerForDetail = it }
            )
        }

        // Section 2: Bench Rotation
        item {
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = "Bench Rotation (2nd Unit)",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.primary
            )
        }

        item {
            LineupSlotCard(
                slotLabel = Position.PG,
                slotTitle = "Backup PG",
                player = reservePg,
                slotPos = Position.PG,
                onClick = { selectedSlotForEdit = LineupSlot.RESERVE_PG },
                onDetail = { selectedPlayerForDetail = it }
            )
        }
        item {
            LineupSlotCard(
                slotLabel = Position.SG,
                slotTitle = "Backup SG",
                player = reserveSg,
                slotPos = Position.SG,
                onClick = { selectedSlotForEdit = LineupSlot.RESERVE_SG },
                onDetail = { selectedPlayerForDetail = it }
            )
        }
        item {
            LineupSlotCard(
                slotLabel = Position.SF,
                slotTitle = "Backup SF",
                player = reserveSf,
                slotPos = Position.SF,
                onClick = { selectedSlotForEdit = LineupSlot.RESERVE_SF },
                onDetail = { selectedPlayerForDetail = it }
            )
        }
        item {
            LineupSlotCard(
                slotLabel = Position.PF,
                slotTitle = "Backup PF",
                player = reservePf,
                slotPos = Position.PF,
                onClick = { selectedSlotForEdit = LineupSlot.RESERVE_PF },
                onDetail = { selectedPlayerForDetail = it }
            )
        }
        item {
            LineupSlotCard(
                slotLabel = Position.C,
                slotTitle = "Backup C",
                player = reserveC,
                slotPos = Position.C,
                onClick = { selectedSlotForEdit = LineupSlot.RESERVE_C },
                onDetail = { selectedPlayerForDetail = it }
            )
        }
    }

    // Candidate Selection Bottom Sheet
    selectedSlotForEdit?.let { slot ->
        val reqPos = slot.position
        val primaryCandidates = roster.filter { it.positionFirst == reqPos }
        val secondaryCandidates = roster.filter { it.positionFirst != reqPos && it.positionSecond == reqPos }
        val otherCandidates = roster.filter { it.positionFirst != reqPos && it.positionSecond != reqPos }

        ModalBottomSheet(
            onDismissRequest = { selectedSlotForEdit = null },
            sheetState = rememberModalBottomSheetState(skipPartiallyExpanded = true)
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp)
            ) {
                Text(
                    text = "Assign Player for ${slot.title}",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Target Position: ${reqPos.shortName}",
                    fontSize = 12.sp,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )

                Spacer(modifier = Modifier.height(10.dp))

                LazyColumn(
                    modifier = Modifier.fillMaxWidth().heightIn(max = 450.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    if (primaryCandidates.isNotEmpty()) {
                        item {
                            Text(
                                text = "Natural Matches (0 Position Penalty)",
                                fontSize = 12.sp,
                                fontWeight = FontWeight.Bold,
                                color = RatingGreen
                            )
                        }
                        items(primaryCandidates.sortedByDescending { it.overallRating }) { player ->
                            CandidatePlayerRow(player = player, posPenalty = 0) {
                                applySlotAssignment(slot, player.id, tactic, viewModel)
                                selectedSlotForEdit = null
                            }
                        }
                    }

                    if (secondaryCandidates.isNotEmpty()) {
                        item {
                            Text(
                                text = "Secondary Position Matches (-2 Position Penalty)",
                                fontSize = 12.sp,
                                fontWeight = FontWeight.Bold,
                                color = Color(0xFFD97706)
                            )
                        }
                        items(secondaryCandidates.sortedByDescending { it.overallRating }) { player ->
                            CandidatePlayerRow(player = player, posPenalty = -2) {
                                applySlotAssignment(slot, player.id, tactic, viewModel)
                                selectedSlotForEdit = null
                            }
                        }
                    }

                    if (otherCandidates.isNotEmpty()) {
                        item {
                            Text(
                                text = "Out of Position Candidates (-7 Position Penalty)",
                                fontSize = 12.sp,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.error
                            )
                        }
                        items(otherCandidates.sortedByDescending { it.overallRating }) { player ->
                            CandidatePlayerRow(player = player, posPenalty = -7) {
                                applySlotAssignment(slot, player.id, tactic, viewModel)
                                selectedSlotForEdit = null
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
            playoffStats = viewModel.getPlayerPlayoffStats(player.id),
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}

@Composable
fun LineupSlotCard(
    slotLabel: Position,
    slotTitle: String,
    player: Player?,
    slotPos: Position,
    onClick: () -> Unit,
    onDetail: (Player) -> Unit
) {
    val isInjured = player?.stateInjury?.let { it > 0 } ?: false
    val posPenalty = player?.getPositionPenalty(slotPos) ?: 0

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(10.dp),
        colors = CardDefaults.cardColors(
            containerColor = when {
                isInjured -> MaterialTheme.colorScheme.errorContainer.copy(alpha = 0.5f)
                posPenalty == -7 -> MaterialTheme.colorScheme.errorContainer.copy(alpha = 0.2f)
                posPenalty == -2 -> Color(0xFFD97706).copy(alpha = 0.12f)
                else -> MaterialTheme.colorScheme.surfaceVariant
            }
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
                PositionBadge(position = slotLabel)

                if (player != null) {
                    RatingBadge(rating = player.overallRating)
                    Column {
                        Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                            Text(
                                text = player.name,
                                fontWeight = FontWeight.Bold,
                                fontSize = 14.sp
                            )
                            if (isInjured) {
                                Surface(
                                    shape = RoundedCornerShape(4.dp),
                                    color = MaterialTheme.colorScheme.errorContainer
                                ) {
                                    Text(
                                        text = "⚠️ INJ (${player.stateInjury}d)",
                                        fontSize = 10.sp,
                                        fontWeight = FontWeight.ExtraBold,
                                        color = MaterialTheme.colorScheme.onErrorContainer,
                                        modifier = Modifier.padding(horizontal = 4.dp, vertical = 1.dp)
                                    )
                                }
                            } else if (posPenalty < 0) {
                                Surface(
                                    shape = RoundedCornerShape(4.dp),
                                    color = if (posPenalty == -2) Color(0xFFD97706).copy(alpha = 0.2f) else MaterialTheme.colorScheme.errorContainer
                                ) {
                                    Text(
                                        text = if (posPenalty == -2) "-2 Sec Pos" else "-7 Out of Pos",
                                        fontSize = 10.sp,
                                        fontWeight = FontWeight.Bold,
                                        color = if (posPenalty == -2) Color(0xFFD97706) else MaterialTheme.colorScheme.error,
                                        modifier = Modifier.padding(horizontal = 4.dp, vertical = 1.dp)
                                    )
                                }
                            }
                        }
                        Text(
                            text = "Energy: ${player.stateEnergy}% • Form: ${player.stateForm}%",
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                } else {
                    Text(
                        text = "Empty Slot - Tap to Assign",
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        fontSize = 13.sp
                    )
                }
            }

            if (player != null) {
                TextButton(
                    onClick = { onDetail(player) },
                    contentPadding = PaddingValues(horizontal = 8.dp, vertical = 2.dp)
                ) {
                    Text("Stats", fontSize = 12.sp)
                }
            }
        }
    }
}

@Composable
fun CandidatePlayerRow(player: Player, posPenalty: Int, onSelect: () -> Unit) {
    val isInjured = player.stateInjury > 0

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onSelect),
        shape = RoundedCornerShape(8.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
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
                RatingBadge(rating = player.overallRating)
                Column {
                    Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                        Text(player.name, fontWeight = FontWeight.Bold, fontSize = 14.sp)
                        PositionBadge(position = player.positionFirst)
                        if (player.positionSecond != Position.NONE) {
                            PositionBadge(position = player.positionSecond)
                        }
                    }
                    Text(
                        text = "Energy: ${player.stateEnergy}% • Form: ${player.stateForm}% • Age: ${player.age}",
                        fontSize = 11.sp,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                if (isInjured) {
                    Surface(shape = RoundedCornerShape(4.dp), color = MaterialTheme.colorScheme.errorContainer) {
                        Text("INJ (${player.stateInjury}d)", fontSize = 10.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.onErrorContainer, modifier = Modifier.padding(4.dp))
                    }
                }
                if (posPenalty < 0) {
                    Surface(shape = RoundedCornerShape(4.dp), color = if (posPenalty == -2) Color(0xFFD97706).copy(alpha = 0.2f) else MaterialTheme.colorScheme.errorContainer) {
                        Text(
                            text = if (posPenalty == -2) "-2 Penalty" else "-7 Penalty",
                            fontSize = 11.sp,
                            fontWeight = FontWeight.Bold,
                            color = if (posPenalty == -2) Color(0xFFD97706) else MaterialTheme.colorScheme.error,
                            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                        )
                    }
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
