package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Clear
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Star
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import top.maary.basketmanager.re.R
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Tactic
import top.maary.basketmanager.re.ui.components.PositionBadge
import top.maary.basketmanager.re.ui.components.RatingBadge
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TacticsBottomSheet(
    viewModel: GameDashboardViewModel,
    onDismiss: () -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss,
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
                        text = stringResource(R.string.team_tab_tactic),
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.ExtraBold
                    )
                    Text(
                        text = "Configure offensive hierarchy, game pace, and shot distribution",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                IconButton(onClick = onDismiss) {
                    Icon(Icons.Default.Close, contentDescription = "Close")
                }
            }

            Spacer(modifier = Modifier.height(8.dp))

            TacticsContent(viewModel = viewModel, modifier = Modifier.heightIn(max = 520.dp))
        }
    }
}

@Composable
fun TacticsScreen(
    viewModel: GameDashboardViewModel
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp, vertical = 10.dp)
    ) {
        Text(
            text = "Team Tactics & Strategy",
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = "Configure offensive hierarchy, game pace, and shot distribution",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Spacer(modifier = Modifier.height(10.dp))
        TacticsContent(viewModel = viewModel, modifier = Modifier.fillMaxSize())
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TacticsContent(
    viewModel: GameDashboardViewModel,
    modifier: Modifier = Modifier
) {
    val roster by viewModel.userRoster.collectAsState()
    val tacticState by viewModel.userTactic.collectAsState()
    val tactic = tacticState ?: Tactic()

    var gameType by remember(tactic) { mutableFloatStateOf(tactic.gameType.toFloat()) }
    var benchImportance by remember(tactic) { mutableFloatStateOf(tactic.benchImportance.toFloat()) }
    var shotIntPercent by remember(tactic) { mutableFloatStateOf(tactic.shotInteriorPercent.toFloat()) }
    var shotTriplePercent by remember(tactic) { mutableFloatStateOf(tactic.shotTriplePercent.toFloat()) }

    var selectedStarIndexForEdit by remember { mutableStateOf<Int?>(null) } // 1, 2, 3

    val playerMap = remember(roster) { roster.associateBy { it.id } }
    val starOnePlayer = tactic.starOnePlayerId?.let { playerMap[it] }
    val starTwoPlayer = tactic.starTwoPlayerId?.let { playerMap[it] }
    val starThreePlayer = tactic.starThreePlayerId?.let { playerMap[it] }

    Column(
        modifier = modifier.verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(14.dp)
    ) {
        // 1. Key Stars / Offensive Hierarchy
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Text(
                    text = "Key Stars (Offensive Priority)",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.primary
                )
                Text(
                    text = "Designate primary scoring options to receive higher shot volume in crunch time",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )

                Spacer(modifier = Modifier.height(12.dp))

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    StarSelectorCard(
                        modifier = Modifier.weight(1f),
                        starRank = 1,
                        bonusText = "+30% Usage",
                        player = starOnePlayer,
                        onClick = { selectedStarIndexForEdit = 1 }
                    )
                    StarSelectorCard(
                        modifier = Modifier.weight(1f),
                        starRank = 2,
                        bonusText = "+20% Usage",
                        player = starTwoPlayer,
                        onClick = { selectedStarIndexForEdit = 2 }
                    )
                    StarSelectorCard(
                        modifier = Modifier.weight(1f),
                        starRank = 3,
                        bonusText = "+10% Usage",
                        player = starThreePlayer,
                        onClick = { selectedStarIndexForEdit = 3 }
                    )
                }
            }
        }

        // 2. Game Pace & Style
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Text(
                    text = "Pace & Game Style",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = when {
                        gameType.toInt() < -1 -> "Very Conservative / Defense Focus (+Defense, -Attack)"
                        gameType.toInt() == -1 -> "Conservative / Control Pace"
                        gameType.toInt() == 0 -> "Balanced Tempo"
                        gameType.toInt() == 1 -> "Fast Pace / Attack Focus"
                        else -> "Aggressive / Run & Gun (+Attack, -Defense)"
                    },
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.primary
                )
                Slider(
                    value = gameType,
                    onValueChange = { gameType = it },
                    valueRange = -2f..2f,
                    steps = 3,
                    onValueChangeFinished = {
                        viewModel.updateTactic(tactic.copy(gameType = gameType.toInt()))
                    }
                )
            }
        }

        // 3. Bench Rotation Importance
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Text(
                    text = "Bench Rotation Depth: Level ${benchImportance.toInt()}",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = when (benchImportance.toInt()) {
                        1 -> "Starters heavy (38+ mins). High starter fatigue."
                        2 -> "Moderate starter minutes (34 mins)."
                        3 -> "Balanced rotation (Starters 30m, Bench 18m)."
                        4 -> "Deep bench usage (Starters 26m, Bench 22m)."
                        else -> "Equal sharing (Starters 24m, Bench 24m). Low fatigue."
                    },
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.secondary
                )
                Slider(
                    value = benchImportance,
                    onValueChange = { benchImportance = it },
                    valueRange = 1f..5f,
                    steps = 3,
                    onValueChangeFinished = {
                        viewModel.updateTactic(tactic.copy(benchImportance = benchImportance.toInt()))
                    }
                )
            }
        }

        // 4. Inside Shot Percentage
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Text(
                    text = "Interior Paint Attempts: ${shotIntPercent.toInt()}%",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Slider(
                    value = shotIntPercent,
                    onValueChange = { shotIntPercent = it },
                    valueRange = 35f..45f,
                    steps = 9,
                    onValueChangeFinished = {
                        viewModel.updateTactic(tactic.copy(shotInteriorPercent = shotIntPercent.toInt()))
                    }
                )
            }
        }

        // 5. 3-Point Shot Percentage
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Text(
                    text = "3-Point Attempts: ${shotTriplePercent.toInt()}%",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Slider(
                    value = shotTriplePercent,
                    onValueChange = { shotTriplePercent = it },
                    valueRange = 35f..45f,
                    steps = 9,
                    onValueChangeFinished = {
                        viewModel.updateTactic(tactic.copy(shotTriplePercent = shotTriplePercent.toInt()))
                    }
                )
            }
        }

        Spacer(modifier = Modifier.height(16.dp))
    }

    // Key Star Assignment Bottom Sheet
    selectedStarIndexForEdit?.let { starIdx ->
        ModalBottomSheet(
            onDismissRequest = { selectedStarIndexForEdit = null },
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
                    Text(
                        text = "Assign Star Option #$starIdx",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    TextButton(
                        onClick = {
                            val updated = tactic.assignStar(starIdx, null)
                            viewModel.updateTactic(updated)
                            selectedStarIndexForEdit = null
                        }
                    ) {
                        Icon(Icons.Default.Clear, contentDescription = null, modifier = Modifier.size(16.dp))
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Clear Star")
                    }
                }

                Spacer(modifier = Modifier.height(8.dp))

                LazyColumn(
                    modifier = Modifier.fillMaxWidth().heightIn(max = 400.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(roster.sortedByDescending { it.overallRating }) { player ->
                        Card(
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable {
                                    val updated = tactic.assignStar(starIdx, player.id)
                                    viewModel.updateTactic(updated)
                                    selectedStarIndexForEdit = null
                                },
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
                                        Text(text = player.name, fontWeight = FontWeight.Bold)
                                        Row(horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                                            PositionBadge(position = player.positionFirst)
                                            Text(
                                                text = "Attack: ${player.attackRating} • Pot: ★${player.potential}",
                                                fontSize = 11.sp,
                                                color = MaterialTheme.colorScheme.onSurfaceVariant
                                            )
                                        }
                                    }
                                }

                                if (player.id == starOnePlayer?.id || player.id == starTwoPlayer?.id || player.id == starThreePlayer?.id) {
                                    Surface(
                                        shape = RoundedCornerShape(4.dp),
                                        color = Color(0xFFFFD700).copy(alpha = 0.2f)
                                    ) {
                                        Text("Assigned", fontSize = 11.sp, fontWeight = FontWeight.Bold, color = Color(0xFFB45309), modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp))
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

@Composable
fun StarSelectorCard(
    modifier: Modifier = Modifier,
    starRank: Int,
    bonusText: String,
    player: Player?,
    onClick: () -> Unit
) {
    Card(
        modifier = modifier.clickable(onClick = onClick),
        shape = RoundedCornerShape(10.dp),
        colors = CardDefaults.cardColors(
            containerColor = if (player != null) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.5f)
            else MaterialTheme.colorScheme.surface
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(10.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                Icon(
                    Icons.Default.Star,
                    contentDescription = null,
                    tint = Color(0xFFFFD700),
                    modifier = Modifier.size(16.dp)
                )
                Text(
                    text = "Star #$starRank",
                    fontWeight = FontWeight.Bold,
                    fontSize = 12.sp
                )
            }
            Text(
                text = bonusText,
                fontSize = 10.sp,
                color = MaterialTheme.colorScheme.primary,
                fontWeight = FontWeight.Bold
            )

            Spacer(modifier = Modifier.height(8.dp))

            if (player != null) {
                RatingBadge(rating = player.overallRating, size = 32)
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = player.shortName,
                    fontWeight = FontWeight.ExtraBold,
                    fontSize = 12.sp,
                    maxLines = 1
                )
                PositionBadge(position = player.positionFirst)
            } else {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(52.dp),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        text = "Tap to Assign",
                        fontSize = 11.sp,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
}
