package com.basketmanager.re.ui.components

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
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import com.basketmanager.re.domain.model.Match
import com.basketmanager.re.domain.model.MatchResult
import com.basketmanager.re.domain.model.Player
import com.basketmanager.re.ui.theme.*

@Composable
fun RatingBadge(
    rating: Double,
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
                Column {
                    Text(
                        text = player.name,
                        style = MaterialTheme.typography.titleLarge
                    )
                    Row(
                        modifier = Modifier.padding(top = 4.dp),
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        PositionBadge(position = player.positionFirst.shortName)
                        if (player.positionSecond != com.basketmanager.re.domain.model.Position.NONE) {
                            PositionBadge(position = player.positionSecond.shortName)
                        }
                        Text(
                            text = "Age: ${player.age} | Exp: ${player.yearsExperience}y",
                            style = MaterialTheme.typography.bodyMedium
                        )
                    }
                }
                RatingBadge(rating = player.overallRating, size = 44)
            }

            Divider(modifier = Modifier.padding(vertical = 12.dp))

            // Contract & Physical Status
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Column {
                    Text(
                        text = "Salary: $${String.format("%,d", player.salary)}",
                        style = MaterialTheme.typography.bodyMedium,
                        fontWeight = FontWeight.SemiBold
                    )
                    Text(
                        text = "Contract: ${player.yearsContract} years",
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
                Column {
                    Text(
                        text = "Energy: ${player.stateEnergy}% | Form: ${player.stateForm}%",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = "Potential: ${player.potential}/10",
                        style = MaterialTheme.typography.bodyMedium,
                        fontWeight = FontWeight.SemiBold,
                        color = MaterialTheme.colorScheme.secondary
                    )
                }
            }

            Divider(modifier = Modifier.padding(vertical = 12.dp))

            Text(
                text = "Player Attributes",
                style = MaterialTheme.typography.titleMedium,
                modifier = Modifier.padding(bottom = 8.dp)
            )

            // 8 Core Skills
            SkillProgressBar(name = "Physique / Speed", value = player.skillPhysique)
            SkillProgressBar(name = "Inside Shot (Paint)", value = player.skillShotInterior)
            SkillProgressBar(name = "Perimeter Shot (2PT/3PT)", value = player.skillShotExterior)
            SkillProgressBar(name = "Free Throw", value = player.skillShotFree)
            SkillProgressBar(name = "Passing / Playmaking", value = player.skillPass)
            SkillProgressBar(name = "Rebounding", value = player.skillRebound)
            SkillProgressBar(name = "Steals / Perimeter Defense", value = player.skillSteal)
            SkillProgressBar(name = "Shot Blocking / Interior Defense", value = player.skillBlock)

            Spacer(modifier = Modifier.height(24.dp))
        }
    }
}

@Composable
fun SkillProgressBar(
    name: String,
    value: Int
) {
    Column(modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp)) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text(text = name, style = MaterialTheme.typography.bodySmall)
            Text(text = value.toString(), style = MaterialTheme.typography.bodySmall, fontWeight = FontWeight.Bold)
        }
        LinearProgressIndicator(
            progress = { (value - 40).toFloat() / 59f },
            modifier = Modifier
                .fillMaxWidth()
                .height(6.dp)
                .clip(RoundedCornerShape(3.dp)),
            color = when {
                value >= 85 -> RatingGreen
                value >= 75 -> RatingBlue
                value >= 65 -> RatingYellow
                else -> RatingOrange
            },
            trackColor = MaterialTheme.colorScheme.surfaceVariant
        )
    }
}

@Composable
fun MatchBoxScoreDialog(
    match: Match?,
    boxScores: List<MatchResult>,
    onDismiss: () -> Unit
) {
    if (match == null) return

    Dialog(onDismissRequest = onDismiss) {
        Card(
            modifier = Modifier
                .fillMaxWidth()
                .fillMaxHeight(0.85f),
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
                    modifier = Modifier.fillMaxWidth().padding(vertical = 8.dp)
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth().padding(8.dp),
                        horizontalArrangement = Arrangement.SpaceAround
                    ) {
                        Text("Q1", fontWeight = FontWeight.Bold, fontSize = 12.sp)
                        Text("Q2", fontWeight = FontWeight.Bold, fontSize = 12.sp)
                        Text("Q3", fontWeight = FontWeight.Bold, fontSize = 12.sp)
                        Text("Q4", fontWeight = FontWeight.Bold, fontSize = 12.sp)
                        if ((match.localOt ?: 0) > 0) Text("OT", fontWeight = FontWeight.Bold, fontSize = 12.sp)
                        Text("TOT", fontWeight = FontWeight.Bold, fontSize = 12.sp)
                    }
                    Row(
                        modifier = Modifier.fillMaxWidth().padding(horizontal = 8.dp, vertical = 2.dp),
                        horizontalArrangement = Arrangement.SpaceAround
                    ) {
                        Text("${match.localQuarter1 ?: 0}", fontSize = 12.sp)
                        Text("${match.localQuarter2 ?: 0}", fontSize = 12.sp)
                        Text("${match.localQuarter3 ?: 0}", fontSize = 12.sp)
                        Text("${match.localQuarter4 ?: 0}", fontSize = 12.sp)
                        if ((match.localOt ?: 0) > 0) Text("${match.localOt ?: 0}", fontSize = 12.sp)
                        Text("${match.localScore ?: 0}", fontWeight = FontWeight.Bold, fontSize = 12.sp)
                    }
                    Row(
                        modifier = Modifier.fillMaxWidth().padding(horizontal = 8.dp, vertical = 2.dp),
                        horizontalArrangement = Arrangement.SpaceAround
                    ) {
                        Text("${match.visitorQuarter1 ?: 0}", fontSize = 12.sp)
                        Text("${match.visitorQuarter2 ?: 0}", fontSize = 12.sp)
                        Text("${match.visitorQuarter3 ?: 0}", fontSize = 12.sp)
                        Text("${match.visitorQuarter4 ?: 0}", fontSize = 12.sp)
                        if ((match.visitorOt ?: 0) > 0) Text("${match.visitorOt ?: 0}", fontSize = 12.sp)
                        Text("${match.visitorScore ?: 0}", fontWeight = FontWeight.Bold, fontSize = 12.sp)
                    }
                }

                Divider(modifier = Modifier.padding(vertical = 8.dp))

                // Player Stats List
                LazyColumn(modifier = Modifier.fillMaxSize()) {
                    item {
                        Row(
                            modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp),
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text("PLAYER", modifier = Modifier.weight(2f), fontWeight = FontWeight.Bold, fontSize = 11.sp)
                            Text("MIN", modifier = Modifier.weight(0.7f), textAlign = TextAlign.Center, fontWeight = FontWeight.Bold, fontSize = 11.sp)
                            Text("PTS", modifier = Modifier.weight(0.7f), textAlign = TextAlign.Center, fontWeight = FontWeight.Bold, fontSize = 11.sp)
                            Text("REB", modifier = Modifier.weight(0.7f), textAlign = TextAlign.Center, fontWeight = FontWeight.Bold, fontSize = 11.sp)
                            Text("AST", modifier = Modifier.weight(0.7f), textAlign = TextAlign.Center, fontWeight = FontWeight.Bold, fontSize = 11.sp)
                            Text("PER", modifier = Modifier.weight(0.8f), textAlign = TextAlign.Center, fontWeight = FontWeight.Bold, fontSize = 11.sp)
                        }
                    }

                    items(boxScores.sortedByDescending { it.points }) { p ->
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(vertical = 4.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text(p.playerName, modifier = Modifier.weight(2f), style = MaterialTheme.typography.bodyMedium)
                            Text("${p.minutesPlayed}", modifier = Modifier.weight(0.7f), textAlign = TextAlign.Center, style = MaterialTheme.typography.bodyMedium)
                            Text("${p.points}", modifier = Modifier.weight(0.7f), textAlign = TextAlign.Center, fontWeight = FontWeight.Bold, style = MaterialTheme.typography.bodyMedium)
                            Text("${p.rebounds}", modifier = Modifier.weight(0.7f), textAlign = TextAlign.Center, style = MaterialTheme.typography.bodyMedium)
                            Text("${p.passesOk}", modifier = Modifier.weight(0.7f), textAlign = TextAlign.Center, style = MaterialTheme.typography.bodyMedium)
                            Text(String.format("%.1f", p.per), modifier = Modifier.weight(0.8f), textAlign = TextAlign.Center, color = MaterialTheme.colorScheme.primary, style = MaterialTheme.typography.bodyMedium)
                        }
                    }
                }
            }
        }
    }
}
