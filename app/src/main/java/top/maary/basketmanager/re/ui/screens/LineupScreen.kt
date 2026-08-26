package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.AutoAwesome
import androidx.compose.material.icons.filled.Star
import androidx.compose.material.icons.filled.Warning
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
import top.maary.basketmanager.re.ui.theme.RatingRed
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

enum class LineupSlot(val title: String, val position: Position, val isStarter: Boolean) {
    STARTER_PG("Point Guard (PG)", Position.POINT_GUARD, true),
    STARTER_SG("Shooting Guard (SG)", Position.SHOOTING_GUARD, true),
    STARTER_SF("Small Forward (SF)", Position.SMALL_FORWARD, true),
    STARTER_PF("Power Forward (PF)", Position.POWER_FORWARD, true),
    STARTER_C("Center (C)", Position.CENTER, true),
    RESERVE_PG("6th Man PG", Position.POINT_GUARD, false),
    RESERVE_SG("6th Man SG", Position.SHOOTING_GUARD, false),
    RESERVE_SF("6th Man SF", Position.SMALL_FORWARD, false),
    RESERVE_PF("6th Man PF", Position.POWER_FORWARD, false),
    RESERVE_C("6th Man C", Position.CENTER, false)
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LineupScreen(
    viewModel: GameDashboardViewModel
) {
    val roster by viewModel.userRoster.collectAsState()
    val tactic by viewModel.userTactic.collectAsState()
    val game by viewModel.game.collectAsState()

    val playerMap = remember(roster) { roster.associateBy { it.id } }

    var slotToAssign by remember { mutableStateOf<LineupSlot?>(null) }
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }

    val star1 = playerMap[tactic?.starOnePlayerId]
    val star2 = playerMap[tactic?.starTwoPlayerId]
    val star3 = playerMap[tactic?.starThreePlayerId]

    Scaffold(
        floatingActionButton = {
            ExtendedFloatingActionButton(
                onClick = { viewModel.optimizeUserLineup() },
                icon = { Icon(Icons.Default.AutoAwesome, contentDescription = null) },
                text = { Text("Auto Optimize") },
                containerColor = MaterialTheme.colorScheme.primary
            )
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(14.dp)
        ) {
            // Auto-Lineup Engine Toggle
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(12.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(14.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column(modifier = Modifier.weight(1f)) {
                            Text(
                                text = "Match Auto-Lineup",
                                fontWeight = FontWeight.Bold,
                                style = MaterialTheme.typography.titleMedium,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                            Text(
                                text = if (game?.autoLineupEnabled == true) "Engine automatically manages energy & form." else "Manual mode: Your exact lineup will simulate.",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.8f)
                            )
                        }
                        Switch(
                            checked = game?.autoLineupEnabled == true,
                            onCheckedChange = { viewModel.toggleAutoLineup(it) }
                        )
                    }
                }
            }

            // Key Star Players (+3, +2, +1 bonus)
            item {
                Text(
                    text = "Key Star Players (Tactical Bonuses)",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "1st Star (+3 Off/Def) • 2nd Star (+2 Off/Def) • 3rd Star (+1 Off/Def)",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    StarPlayerCard(modifier = Modifier.weight(1f), starRank = 1, bonus = "+3", player = star1)
                    StarPlayerCard(modifier = Modifier.weight(1f), starRank = 2, bonus = "+2", player = star2)
                    StarPlayerCard(modifier = Modifier.weight(1f), starRank = 3, bonus = "+1", player = star3)
                }
            }

            // Starting Five
            item {
                Text(
                    text = "Starting Lineup (首发五虎)",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
            }

            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(12.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                ) {
                    Column(modifier = Modifier.padding(8.dp), verticalArrangement = Arrangement.spacedBy(6.dp)) {
                        LineupSlotRow("PG", Position.POINT_GUARD, playerMap[tactic?.starterPgId], onAssign = { slotToAssign = LineupSlot.STARTER_PG }, onDetail = { selectedPlayerForDetail = it })
                        LineupSlotRow("SG", Position.SHOOTING_GUARD, playerMap[tactic?.starterSgId], onAssign = { slotToAssign = LineupSlot.STARTER_SG }, onDetail = { selectedPlayerForDetail = it })
                        LineupSlotRow("SF", Position.SMALL_FORWARD, playerMap[tactic?.starterSfId], onAssign = { slotToAssign = LineupSlot.STARTER_SF }, onDetail = { selectedPlayerForDetail = it })
                        LineupSlotRow("PF", Position.POWER_FORWARD, playerMap[tactic?.starterPfId], onAssign = { slotToAssign = LineupSlot.STARTER_PF }, onDetail = { selectedPlayerForDetail = it })
                        LineupSlotRow("C", Position.CENTER, playerMap[tactic?.starterCId], onAssign = { slotToAssign = LineupSlot.STARTER_C }, onDetail = { selectedPlayerForDetail = it })
                    }
                }
            }

            // Bench Rotation
            item {
                Text(
                    text = "Bench Rotation (6th-Man Reserves)",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
            }

            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(12.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.7f))
                ) {
                    Column(modifier = Modifier.padding(8.dp), verticalArrangement = Arrangement.spacedBy(6.dp)) {
                        LineupSlotRow("PG (6th)", Position.POINT_GUARD, playerMap[tactic?.reservePgId], onAssign = { slotToAssign = LineupSlot.RESERVE_PG }, onDetail = { selectedPlayerForDetail = it })
                        LineupSlotRow("SG (6th)", Position.SHOOTING_GUARD, playerMap[tactic?.reserveSgId], onAssign = { slotToAssign = LineupSlot.RESERVE_SG }, onDetail = { selectedPlayerForDetail = it })
                        LineupSlotRow("SF (6th)", Position.SMALL_FORWARD, playerMap[tactic?.reserveSfId], onAssign = { slotToAssign = LineupSlot.RESERVE_SF }, onDetail = { selectedPlayerForDetail = it })
                        LineupSlotRow("PF (6th)", Position.POWER_FORWARD, playerMap[tactic?.reservePfId], onAssign = { slotToAssign = LineupSlot.RESERVE_PF }, onDetail = { selectedPlayerForDetail = it })
                        LineupSlotRow("C (6th)", Position.CENTER, playerMap[tactic?.reserveCId], onAssign = { slotToAssign = LineupSlot.RESERVE_C }, onDetail = { selectedPlayerForDetail = it })
                    }
                }
            }

            item {
                Spacer(modifier = Modifier.height(60.dp))
            }
        }
    }

    // Modal to Select Player for a Position Slot (Categorized by Position Match)
    slotToAssign?.let { slot ->
        val requiredPos = slot.position

        // 3 Groups: Primary Match, Secondary Match, Out of Position
        val primaryMatches = remember(roster, requiredPos) {
            roster.filter { it.positionFirst == requiredPos }.sortedByDescending { it.overallRating }
        }
        val secondaryMatches = remember(roster, requiredPos) {
            roster.filter { it.positionSecond == requiredPos && it.positionFirst != requiredPos }.sortedByDescending { it.overallRating }
        }
        val outOfPositionMatches = remember(roster, requiredPos) {
            roster.filter { it.positionFirst != requiredPos && it.positionSecond != requiredPos }.sortedByDescending { it.overallRating }
        }

        ModalBottomSheet(
            onDismissRequest = { slotToAssign = null },
            sheetState = rememberModalBottomSheetState(skipPartiallyExpanded = true)
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp)
            ) {
                Text(
                    text = "Assign Player: ${slot.title}",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Select from eligible roster players",
                    fontSize = 12.sp,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )

                Spacer(modifier = Modifier.height(12.dp))

                LazyColumn(
                    modifier = Modifier.fillMaxWidth(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    // Group 1: Primary Position Matches
                    item {
                        Text(
                            text = "PRIMARY POSITION MATCHES (0 Penalty)",
                            fontSize = 12.sp,
                            fontWeight = FontWeight.Bold,
                            color = RatingGreen
                        )
                    }

                    if (primaryMatches.isEmpty()) {
                        item { Text("No player with primary $requiredPos", fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant) }
                    } else {
                        items(primaryMatches) { player ->
                            CandidatePlayerRow(player = player, penalty = 0) {
                                applySlotAssignment(slot, player.id, tactic, viewModel)
                                slotToAssign = null
                            }
                        }
                    }

                    // Group 2: Secondary Position Matches
                    item {
                        Spacer(modifier = Modifier.height(6.dp))
                        Text(
                            text = "SECONDARY POSITION MATCHES (-2 Penalty)",
                            fontSize = 12.sp,
                            fontWeight = FontWeight.Bold,
                            color = Color(0xFFD97706)
                        )
                    }

                    if (secondaryMatches.isEmpty()) {
                        item { Text("No player with secondary $requiredPos", fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant) }
                    } else {
                        items(secondaryMatches) { player ->
                            CandidatePlayerRow(player = player, penalty = -2) {
                                applySlotAssignment(slot, player.id, tactic, viewModel)
                                slotToAssign = null
                            }
                        }
                    }

                    // Group 3: Out of Position
                    item {
                        Spacer(modifier = Modifier.height(6.dp))
                        Text(
                            text = "OUT OF POSITION (-7 Penalty)",
                            fontSize = 12.sp,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.error
                        )
                    }

                    items(outOfPositionMatches) { player ->
                        CandidatePlayerRow(player = player, penalty = -7) {
                            applySlotAssignment(slot, player.id, tactic, viewModel)
                            slotToAssign = null
                        }
                    }
                }
            }
        }
    }

    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(
            player = player,
            stats = viewModel.getPlayerSeasonStats(player.id), playoffStats = viewModel.getPlayerPlayoffStats(player.id),
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}

@Composable
fun LineupSlotRow(
    slotLabel: String,
    slotPos: Position,
    player: Player?,
    onAssign: () -> Unit,
    onDetail: (Player) -> Unit
) {
    val isInjured = player != null && player.stateInjury > 0
    val penalty = player?.getPenalty(slotPos) ?: 0
    val isOutOfPos = player != null && player.positionFirst != slotPos

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable { onAssign() },
        shape = RoundedCornerShape(8.dp),
        border = if (isInjured) BorderStroke(1.5.dp, MaterialTheme.colorScheme.error)
        else if (isOutOfPos) BorderStroke(1.dp, Color(0xFFD97706)) else null,
        colors = CardDefaults.cardColors(
            containerColor = if (isInjured) MaterialTheme.colorScheme.errorContainer.copy(alpha = 0.25f)
            else MaterialTheme.colorScheme.surface
        )
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
                            } else if (penalty < 0) {
                                Surface(
                                    shape = RoundedCornerShape(4.dp),
                                    color = Color(0xFFD97706).copy(alpha = 0.2f)
                                ) {
                                    Text(
                                        text = "$penalty Penalty",
                                        fontSize = 10.sp,
                                        fontWeight = FontWeight.Bold,
                                        color = Color(0xFFD97706),
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
fun CandidatePlayerRow(player: Player, penalty: Int, onSelect: () -> Unit) {
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
                if (penalty < 0) {
                    Surface(shape = RoundedCornerShape(4.dp), color = Color(0xFFD97706).copy(alpha = 0.2f)) {
                        Text("$penalty Penalty", fontSize = 11.sp, fontWeight = FontWeight.Bold, color = Color(0xFFD97706), modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp))
                    }
                }
            }
        }
    }
}

@Composable
fun StarPlayerCard(
    modifier: Modifier = Modifier,
    starRank: Int,
    bonus: String,
    player: Player?
) {
    Card(
        modifier = modifier,
        shape = RoundedCornerShape(10.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(8.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                Icon(Icons.Default.Star, contentDescription = null, tint = Color(0xFFFFD700), modifier = Modifier.size(16.dp))
                Text("Star #$starRank ($bonus)", fontWeight = FontWeight.Bold, fontSize = 11.sp)
            }
            Spacer(modifier = Modifier.height(4.dp))
            if (player != null) {
                RatingBadge(rating = player.overallRating, size = 28)
                Spacer(modifier = Modifier.height(2.dp))
                Text(player.shortName, fontWeight = FontWeight.Bold, fontSize = 12.sp, maxLines = 1)
            } else {
                Text("None", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
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
    val updated = when (slot) {
        LineupSlot.STARTER_PG -> current.copy(starterPgId = playerId)
        LineupSlot.STARTER_SG -> current.copy(starterSgId = playerId)
        LineupSlot.STARTER_SF -> current.copy(starterSfId = playerId)
        LineupSlot.STARTER_PF -> current.copy(starterPfId = playerId)
        LineupSlot.STARTER_C -> current.copy(starterCId = playerId)
        LineupSlot.RESERVE_PG -> current.copy(reservePgId = playerId)
        LineupSlot.RESERVE_SG -> current.copy(reserveSgId = playerId)
        LineupSlot.RESERVE_SF -> current.copy(reserveSfId = playerId)
        LineupSlot.RESERVE_PF -> current.copy(reservePfId = playerId)
        LineupSlot.RESERVE_C -> current.copy(reserveCId = playerId)
    }
    viewModel.updateTactic(updated)
}
