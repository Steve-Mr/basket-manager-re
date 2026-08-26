package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.AutoFixHigh
import androidx.compose.material.icons.filled.Edit
import androidx.compose.material.icons.filled.Star
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
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
import top.maary.basketmanager.re.ui.viewmodel.LineupSlot

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LineupScreen(
    viewModel: GameDashboardViewModel
) {
    val game by viewModel.game.collectAsState()
    val roster by viewModel.userRoster.collectAsState()
    val tactic by viewModel.userTactic.collectAsState()

    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }
    var slotToAssign by remember { mutableStateOf<LineupSlot?>(null) }
    var starIndexToAssign by remember { mutableStateOf<Int?>(null) }

    val playerMap = remember(roster) { roster.associateBy { it.id } }

    Scaffold { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(horizontal = 16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            item {
                Spacer(modifier = Modifier.height(4.dp))
                // Title and Quick Optimize
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column {
                        Text(
                            text = "Tactics & Rotation",
                            style = MaterialTheme.typography.headlineSmall,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Tap any position or star slot to change player",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }

                    FilledTonalButton(
                        onClick = { viewModel.autoOptimizeLineup() },
                        shape = RoundedCornerShape(10.dp)
                    ) {
                        Icon(Icons.Default.AutoFixHigh, contentDescription = null, modifier = Modifier.size(16.dp))
                        Spacer(modifier = Modifier.width(6.dp))
                        Text("Auto-Fill", fontWeight = FontWeight.Bold)
                    }
                }
            }

            // Auto-Lineup Toggle Card
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(12.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f))
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 16.dp, vertical = 12.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column(modifier = Modifier.weight(1f)) {
                            Text(
                                text = "Auto-Optimize Before Match",
                                fontWeight = FontWeight.Bold,
                                style = MaterialTheme.typography.bodyMedium
                            )
                            Text(
                                text = if (game?.autoLineupEnabled == true)
                                    "System automatically rotates healthy/rested players."
                                else
                                    "Simulate strictly with your manual lineup above.",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }

                        Switch(
                            checked = game?.autoLineupEnabled == true,
                            onCheckedChange = { viewModel.toggleAutoLineup(it) }
                        )
                    }
                }
            }

            // Star Players Section
            item {
                Text(
                    text = "Key Star Players (Attack & Defense Bonus)",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.primary
                )
            }

            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    StarCard(
                        modifier = Modifier.weight(1f),
                        title = "1st Star (+3)",
                        starCount = 3,
                        player = playerMap[tactic?.starOnePlayerId],
                        onClick = { starIndexToAssign = 1 }
                    )
                    StarCard(
                        modifier = Modifier.weight(1f),
                        title = "2nd Star (+2)",
                        starCount = 2,
                        player = playerMap[tactic?.starTwoPlayerId],
                        onClick = { starIndexToAssign = 2 }
                    )
                    StarCard(
                        modifier = Modifier.weight(1f),
                        title = "3rd Star (+1)",
                        starCount = 1,
                        player = playerMap[tactic?.starThreePlayerId],
                        onClick = { starIndexToAssign = 3 }
                    )
                }
            }

            // Starters Section
            item {
                Text(
                    text = "Starting Five (Titulars)",
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

            // Bench Section
            item {
                Text(
                    text = "Bench Reserves",
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
                Spacer(modifier = Modifier.height(24.dp))
            }
        }
    }

    // Modal to Select Player for a Position Slot
    slotToAssign?.let { slot ->
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
                    text = "Select Player for ${slot.name.replace('_', ' ')}",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Spacer(modifier = Modifier.height(12.dp))

                LazyColumn(
                    modifier = Modifier
                        .fillMaxWidth()
                        .heightIn(max = 420.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(roster.sortedByDescending { it.overallRating }) { p ->
                        Card(
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable {
                                    viewModel.updateLineupSlot(slot, p.id)
                                    slotToAssign = null
                                },
                            colors = CardDefaults.cardColors(
                                containerColor = if (p.stateInjury > 0)
                                    MaterialTheme.colorScheme.errorContainer.copy(alpha = 0.5f)
                                else MaterialTheme.colorScheme.surface
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
                                    horizontalArrangement = Arrangement.spacedBy(10.dp)
                                ) {
                                    RatingBadge(rating = p.overallRating)
                                    Column {
                                        Text(text = p.name, fontWeight = FontWeight.Bold)
                                        Row(horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                                            PositionBadge(position = p.positionFirst)
                                            Text(
                                                text = "ENG: ${p.stateEnergy}% • FORM: ${p.stateForm}%",
                                                fontSize = 12.sp,
                                                color = MaterialTheme.colorScheme.onSurfaceVariant
                                            )
                                        }
                                    }
                                }

                                if (p.stateInjury > 0) {
                                    Text("Injured (${p.stateInjury}d)", color = MaterialTheme.colorScheme.error, fontSize = 12.sp, fontWeight = FontWeight.Bold)
                                } else {
                                    Button(
                                        onClick = {
                                            viewModel.updateLineupSlot(slot, p.id)
                                            slotToAssign = null
                                        },
                                        contentPadding = PaddingValues(horizontal = 12.dp, vertical = 6.dp)
                                    ) {
                                        Text("Assign")
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Modal to Select Star Player
    starIndexToAssign?.let { starIdx ->
        ModalBottomSheet(
            onDismissRequest = { starIndexToAssign = null },
            sheetState = rememberModalBottomSheetState(skipPartiallyExpanded = true)
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp)
            ) {
                Text(
                    text = "Select Star Player #$starIdx",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Spacer(modifier = Modifier.height(12.dp))

                LazyColumn(
                    modifier = Modifier
                        .fillMaxWidth()
                        .heightIn(max = 420.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    item {
                        OutlinedButton(
                            modifier = Modifier.fillMaxWidth(),
                            onClick = {
                                viewModel.updateStarPlayer(starIdx, null)
                                starIndexToAssign = null
                            }
                        ) {
                            Text("None / Clear Star")
                        }
                    }

                    items(roster.sortedByDescending { it.overallRating }) { p ->
                        Card(
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable {
                                    viewModel.updateStarPlayer(starIdx, p.id)
                                    starIndexToAssign = null
                                }
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
                                    RatingBadge(rating = p.overallRating)
                                    Column {
                                        Text(text = p.name, fontWeight = FontWeight.Bold)
                                        PositionBadge(position = p.positionFirst)
                                    }
                                }

                                Button(
                                    onClick = {
                                        viewModel.updateStarPlayer(starIdx, p.id)
                                        starIndexToAssign = null
                                    },
                                    contentPadding = PaddingValues(horizontal = 12.dp, vertical = 6.dp)
                                ) {
                                    Text("Set Star")
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    selectedPlayerForDetail?.let { player ->
        PlayerDetailBottomSheet(player = player, onDismiss = { selectedPlayerForDetail = null })
    }
}

@Composable
fun StarCard(
    modifier: Modifier = Modifier,
    title: String,
    starCount: Int,
    player: Player?,
    onClick: () -> Unit
) {
    Card(
        modifier = modifier.clickable(onClick = onClick),
        shape = RoundedCornerShape(12.dp),
        colors = CardDefaults.cardColors(
            containerColor = if (player != null) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(10.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                repeat(starCount) {
                    Icon(
                        Icons.Default.Star,
                        contentDescription = null,
                        tint = Color(0xFFFFB300),
                        modifier = Modifier.size(14.dp)
                    )
                }
            }
            Spacer(modifier = Modifier.height(2.dp))
            Text(
                text = title,
                fontSize = 11.sp,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = player?.shortName ?: "Unassigned",
                fontSize = 13.sp,
                fontWeight = FontWeight.ExtraBold,
                maxLines = 1
            )
            if (player != null) {
                Text(
                    text = "OVR: ${player.overallRating}",
                    fontSize = 11.sp,
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.Bold
                )
            }
        }
    }
}

@Composable
fun LineupSlotRow(
    slotLabel: String,
    position: Position,
    player: Player?,
    onAssign: () -> Unit,
    onDetail: (Player) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(8.dp),
        colors = CardDefaults.cardColors(
            containerColor = if (player == null) MaterialTheme.colorScheme.errorContainer.copy(alpha = 0.3f)
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
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Surface(
                    shape = RoundedCornerShape(6.dp),
                    color = MaterialTheme.colorScheme.secondaryContainer,
                    modifier = Modifier.width(60.dp)
                ) {
                    Text(
                        text = slotLabel,
                        fontSize = 11.sp,
                        fontWeight = FontWeight.ExtraBold,
                        modifier = Modifier.padding(vertical = 4.dp),
                        textAlign = androidx.compose.ui.text.style.TextAlign.Center
                    )
                }

                if (player != null) {
                    RatingBadge(rating = player.overallRating)
                    Column(
                        modifier = Modifier.clickable { onDetail(player) }
                    ) {
                        Text(
                            text = player.name,
                            fontWeight = FontWeight.SemiBold,
                            fontSize = 14.sp
                        )
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(6.dp)
                        ) {
                            PositionBadge(position = player.positionFirst)
                            Text(
                                text = "E:${player.stateEnergy}% F:${player.stateForm}%",
                                fontSize = 11.sp,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                } else {
                    Text(
                        text = "EMPTY SLOT",
                        fontWeight = FontWeight.Bold,
                        color = MaterialTheme.colorScheme.error,
                        fontSize = 13.sp
                    )
                }
            }

            IconButton(
                onClick = onAssign,
                modifier = Modifier.size(32.dp)
            ) {
                Icon(
                    Icons.Default.Edit,
                    contentDescription = "Change Player",
                    tint = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.size(18.dp)
                )
            }
        }
    }
}
