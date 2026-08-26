package top.maary.basketmanager.re.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Close
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import top.maary.basketmanager.re.domain.model.Match
import top.maary.basketmanager.re.domain.model.MatchResult
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Position
import top.maary.basketmanager.re.domain.model.Team
import top.maary.basketmanager.re.ui.theme.*
import top.maary.basketmanager.re.ui.viewmodel.PlayerSeasonStats

@Composable
fun RatingBadge(
    rating: Number,
    modifier: Modifier = Modifier,
    size: Int = 32
) {
    val rInt = rating.toInt()
    val bgColor = when {
        rInt >= 85 -> RatingGreen
        rInt >= 78 -> RatingBlue
        rInt >= 70 -> RatingYellow
        rInt >= 60 -> RatingOrange
        else -> RatingRed
    }

    Box(
        modifier = modifier
            .size(size.dp)
            .clip(CircleShape)
            .background(bgColor),
        contentAlignment = Alignment.Center
    ) {
        Text(
            text = rInt.toString(),
            color = Color.White,
            fontWeight = FontWeight.Bold,
            fontSize = (size * 0.42).sp
        )
    }
}

@Composable
fun PositionBadge(
    position: Position,
    modifier: Modifier = Modifier
) {
    PositionBadge(position = position.shortName, modifier = modifier)
}

@Composable
fun PositionBadge(
    position: String,
    modifier: Modifier = Modifier
) {
    Box(
        modifier = modifier
            .clip(RoundedCornerShape(4.dp))
            .background(MaterialTheme.colorScheme.primaryContainer)
            .padding(horizontal = 6.dp, vertical = 2.dp)
    ) {
        Text(
            text = position,
            color = MaterialTheme.colorScheme.onPrimaryContainer,
            fontWeight = FontWeight.SemiBold,
            fontSize = 11.sp
        )
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlayerDetailBottomSheet(
    player: Player?,
    stats: PlayerSeasonStats? = null,
    onDismiss: () -> Unit
) {
    if (player == null) return

    ModalBottomSheet(
        onDismissRequest = onDismiss,
        sheetState = rememberModalBottomSheetState(skipPartiallyExpanded = true)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 20.dp, vertical = 10.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    RatingBadge(rating = player.overallRating, size = 44)
                    Column {
                        Text(
                            text = player.name,
                            style = MaterialTheme.typography.titleLarge,
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
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                }

                Column(horizontalAlignment = Alignment.End) {
                    Text(
                        text = "$${player.salary / 1_000_000.0}M",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        color = MaterialTheme.colorScheme.primary
                    )
                    Text(
                        text = "${player.yearsContract} yrs left",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            HorizontalDivider(modifier = Modifier.padding(vertical = 10.dp))

            // Season Statistics Section
            Text(
                text = "Season Statistics",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            Spacer(modifier = Modifier.height(6.dp))

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                StatCard(label = "GP", value = "${stats?.gamesPlayed ?: 0}")
                StatCard(label = "PPG", value = String.format("%.1f", stats?.ppg ?: 0.0))
                StatCard(label = "RPG", value = String.format("%.1f", stats?.rpg ?: 0.0))
                StatCard(label = "APG", value = String.format("%.1f", stats?.apg ?: 0.0))
                StatCard(label = "SPG", value = String.format("%.1f", stats?.spg ?: 0.0))
                StatCard(label = "BPG", value = String.format("%.1f", stats?.bpg ?: 0.0))
                StatCard(label = "PER", value = String.format("%.1f", stats?.avgPer ?: 0.0))
            }

            HorizontalDivider(modifier = Modifier.padding(vertical = 10.dp))

            Text(
                text = "Player Attributes",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )

            Spacer(modifier = Modifier.height(6.dp))

            SkillProgressBar(label = "Physique / Energy", value = player.skillPhysique)
            SkillProgressBar(label = "Interior Shooting (2PT)", value = player.skillShotInterior)
            SkillProgressBar(label = "Exterior Shooting (2PT/3PT)", value = player.skillShotExterior)
            SkillProgressBar(label = "Free Throw", value = player.skillShotFree)
            SkillProgressBar(label = "Passing / Vision", value = player.skillPass)
            SkillProgressBar(label = "Rebounding", value = player.skillRebound)
            SkillProgressBar(label = "Stealing", value = player.skillSteal)
            SkillProgressBar(label = "Shot Blocking", value = player.skillBlock)

            HorizontalDivider(modifier = Modifier.padding(vertical = 10.dp))

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Column {
                    Text("Form", fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    Text("${player.stateForm}%", fontWeight = FontWeight.Bold)
                }
                Column {
                    Text("Energy", fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    Text("${player.stateEnergy}%", fontWeight = FontWeight.Bold)
                }
                Column {
                    Text("Injury Status", fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    if (player.stateInjury > 0) {
                        Text("${player.stateInjury} days", color = MaterialTheme.colorScheme.error, fontWeight = FontWeight.Bold)
                    } else {
                        Text("Healthy", color = RatingGreen, fontWeight = FontWeight.Bold)
                    }
                }
                Column {
                    Text("Loyalty", fontSize = 12.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    Text("★".repeat(player.loyalty), color = MaterialTheme.colorScheme.primary)
                }
            }

            Spacer(modifier = Modifier.height(24.dp))
        }
    }
}

@Composable
fun StatCard(label: String, value: String) {
    Card(
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant),
        shape = RoundedCornerShape(8.dp)
    ) {
        Column(
            modifier = Modifier.padding(horizontal = 8.dp, vertical = 6.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(label, fontSize = 10.sp, color = MaterialTheme.colorScheme.onSurfaceVariant, fontWeight = FontWeight.Bold)
            Text(value, fontSize = 12.sp, fontWeight = FontWeight.ExtraBold)
        }
    }
}

@Composable
fun SkillProgressBar(
    label: String,
    value: Int
) {
    Column(modifier = Modifier.fillMaxWidth().padding(vertical = 2.dp)) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text(text = label, fontSize = 11.sp)
            Text(text = value.toString(), fontSize = 11.sp, fontWeight = FontWeight.Bold)
        }
        LinearProgressIndicator(
            progress = { (value / 100f).coerceIn(0f, 1f) },
            modifier = Modifier.fillMaxWidth().height(5.dp).clip(RoundedCornerShape(3.dp)),
            color = when {
                value >= 80 -> RatingGreen
                value >= 65 -> RatingBlue
                value >= 50 -> RatingYellow
                else -> RatingOrange
            }
        )
    }
}

@Composable
fun MatchBoxScoreDialog(
    match: Match?,
    localTeam: Team? = null,
    visitorTeam: Team? = null,
    boxScores: List<MatchResult>,
    onDismiss: () -> Unit
) {
    if (match == null) return

    val visitorPlayers = remember(boxScores, visitorTeam) {
        val vId = visitorTeam?.id ?: match.teamVisitorId
        boxScores.filter { it.teamId == vId }.sortedByDescending { it.points }
    }

    val localPlayers = remember(boxScores, localTeam) {
        val lId = localTeam?.id ?: match.teamLocalId
        boxScores.filter { it.teamId == lId }.sortedByDescending { it.points }
    }

    var selectedTeamTab by remember { mutableStateOf(0) } // 0: Visitor, 1: Local

    Dialog(onDismissRequest = onDismiss) {
        Card(
            modifier = Modifier
                .fillMaxWidth()
                .fillMaxHeight(0.88f),
            shape = RoundedCornerShape(16.dp)
        ) {
            Column(modifier = Modifier.fillMaxSize().padding(16.dp)) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = match.name ?: "Box Score",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    IconButton(onClick = onDismiss) {
                        Icon(Icons.Default.Close, contentDescription = "Close")
                    }
                }

                // Quarter breakdown table
                Card(
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant),
                    modifier = Modifier.fillMaxWidth().padding(vertical = 6.dp)
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth().padding(8.dp),
                        horizontalArrangement = Arrangement.SpaceAround
                    ) {
                        Text("Team", fontWeight = FontWeight.Bold, fontSize = 11.sp)
                        Text("Q1", fontWeight = FontWeight.Bold, fontSize = 11.sp)
                        Text("Q2", fontWeight = FontWeight.Bold, fontSize = 11.sp)
                        Text("Q3", fontWeight = FontWeight.Bold, fontSize = 11.sp)
                        Text("Q4", fontWeight = FontWeight.Bold, fontSize = 11.sp)
                        if ((match.localOt ?: 0) > 0 || (match.visitorOt ?: 0) > 0) {
                            Text("OT", fontWeight = FontWeight.Bold, fontSize = 11.sp)
                        }
                        Text("TOT", fontWeight = FontWeight.Bold, fontSize = 11.sp, color = MaterialTheme.colorScheme.primary)
                    }
                    HorizontalDivider()
                    Row(
                        modifier = Modifier.fillMaxWidth().padding(8.dp),
                        horizontalArrangement = Arrangement.SpaceAround
                    ) {
                        Text(visitorTeam?.name ?: "VIS", fontSize = 11.sp, fontWeight = FontWeight.Bold)
                        Text("${match.visitorQuarter1 ?: 0}", fontSize = 11.sp)
                        Text("${match.visitorQuarter2 ?: 0}", fontSize = 11.sp)
                        Text("${match.visitorQuarter3 ?: 0}", fontSize = 11.sp)
                        Text("${match.visitorQuarter4 ?: 0}", fontSize = 11.sp)
                        if ((match.localOt ?: 0) > 0 || (match.visitorOt ?: 0) > 0) {
                            Text("${match.visitorOt ?: 0}", fontSize = 11.sp)
                        }
                        Text("${match.visitorScore ?: 0}", fontSize = 11.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.primary)
                    }
                    Row(
                        modifier = Modifier.fillMaxWidth().padding(8.dp),
                        horizontalArrangement = Arrangement.SpaceAround
                    ) {
                        Text(localTeam?.name ?: "LOC", fontSize = 11.sp, fontWeight = FontWeight.Bold)
                        Text("${match.localQuarter1 ?: 0}", fontSize = 11.sp)
                        Text("${match.localQuarter2 ?: 0}", fontSize = 11.sp)
                        Text("${match.localQuarter3 ?: 0}", fontSize = 11.sp)
                        Text("${match.localQuarter4 ?: 0}", fontSize = 11.sp)
                        if ((match.localOt ?: 0) > 0 || (match.visitorOt ?: 0) > 0) {
                            Text("${match.localOt ?: 0}", fontSize = 11.sp)
                        }
                        Text("${match.localScore ?: 0}", fontSize = 11.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.primary)
                    }
                }

                // Team Tab Switch to separate stats cleanly
                SingleChoiceSegmentedButtonRow(
                    modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp)
                ) {
                    SegmentedButton(
                        selected = selectedTeamTab == 0,
                        onClick = { selectedTeamTab = 0 },
                        shape = SegmentedButtonDefaults.itemShape(index = 0, count = 2)
                    ) {
                        Text("${visitorTeam?.name ?: "VIS"} (${match.visitorScore ?: 0})", fontWeight = FontWeight.Bold)
                    }
                    SegmentedButton(
                        selected = selectedTeamTab == 1,
                        onClick = { selectedTeamTab = 1 },
                        shape = SegmentedButtonDefaults.itemShape(index = 1, count = 2)
                    ) {
                        Text("${localTeam?.name ?: "LOC"} (${match.localScore ?: 0})", fontWeight = FontWeight.Bold)
                    }
                }

                val currentDisplayedPlayers = if (selectedTeamTab == 0) visitorPlayers else localPlayers

                LazyColumn(
                    modifier = Modifier.weight(1f),
                    verticalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    items(currentDisplayedPlayers) { stat ->
                        Card(
                            shape = RoundedCornerShape(8.dp),
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f)),
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Row(
                                modifier = Modifier.fillMaxWidth().padding(horizontal = 10.dp, vertical = 6.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Column {
                                    Text(stat.playerName, fontWeight = FontWeight.Bold, fontSize = 13.sp)
                                    Text(
                                        text = "${stat.minutesPlayed} MIN • PER: ${stat.per} • F: ${stat.fouls}",
                                        fontSize = 11.sp,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                                Column(horizontalAlignment = Alignment.End) {
                                    Text(
                                        text = "${stat.points} PTS",
                                        fontWeight = FontWeight.ExtraBold,
                                        fontSize = 13.sp,
                                        color = MaterialTheme.colorScheme.primary
                                    )
                                    Text(
                                        text = "${stat.rebounds} REB, ${stat.passesOk} AST, ${stat.steals} STL, ${stat.blocks} BLK",
                                        fontSize = 10.sp,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
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
