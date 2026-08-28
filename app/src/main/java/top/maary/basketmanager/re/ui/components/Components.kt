package top.maary.basketmanager.re.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.automirrored.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import top.maary.basketmanager.re.R
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

@Composable
fun PotentialTierBadge(
    potential: Int,
    modifier: Modifier = Modifier
) {
    val (bgColor, starColor, labelColor) = when {
        potential >= 9 -> Triple(Color(0xFFFFF8E1), Color(0xFFFFB300), Color(0xFFB45309)) // Superstar Gold Tier
        potential >= 7 -> Triple(Color(0xFFFFF3E0), Color(0xFFFB8C00), Color(0xFFC2410C)) // High Potential Amber
        potential >= 5 -> Triple(Color(0xFFE0F2F1), Color(0xFF00897B), Color(0xFF0F766E)) // Solid Contender Teal
        else -> Triple(Color(0xFFECEFF1), Color(0xFF78909C), Color(0xFF475569))          // Role Player Slate
    }

    Surface(
        modifier = modifier,
        shape = RoundedCornerShape(10.dp),
        color = bgColor
    ) {
        Column(
            modifier = Modifier.padding(horizontal = 7.dp, vertical = 6.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Icon(
                Icons.Default.Star,
                contentDescription = null,
                tint = starColor,
                modifier = Modifier.size(20.dp)
            )
            Spacer(modifier = Modifier.height(2.dp))
            Text(
                text = "$potential",
                fontWeight = FontWeight.Black,
                fontSize = 12.sp,
                color = labelColor
            )
        }
    }
}

@Composable
fun ReadinessPill(
    form: Int,
    energy: Int,
    injuryDays: Int,
    modifier: Modifier = Modifier
) {
    if (injuryDays > 0) {
        Surface(
            shape = RoundedCornerShape(6.dp),
            color = MaterialTheme.colorScheme.errorContainer,
            modifier = modifier
        ) {
            Row(
                modifier = Modifier.padding(horizontal = 6.dp, vertical = 3.dp),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                Icon(Icons.Default.MedicalServices, contentDescription = null, tint = MaterialTheme.colorScheme.onErrorContainer, modifier = Modifier.size(12.dp))
                Text(
                    text = "INJ (${injuryDays}d)",
                    fontSize = 11.sp,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.onErrorContainer
                )
            }
        }
    } else {
        val readiness = ((form + energy) / 2).coerceIn(0, 99)
        val (tintBg, tintText) = when {
            readiness >= 80 -> Pair(RatingGreen.copy(alpha = 0.15f), RatingGreen)
            readiness >= 50 -> Pair(MaterialTheme.colorScheme.surfaceVariant, MaterialTheme.colorScheme.onSurfaceVariant)
            else -> Pair(RatingOrange.copy(alpha = 0.15f), RatingOrange)
        }

        Surface(
            shape = RoundedCornerShape(6.dp),
            color = tintBg,
            modifier = modifier
        ) {
            Row(
                modifier = Modifier.padding(horizontal = 6.dp, vertical = 3.dp),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                Icon(
                    imageVector = if (readiness >= 80) Icons.Default.Bolt else Icons.Default.BatteryChargingFull,
                    contentDescription = null,
                    tint = tintText,
                    modifier = Modifier.size(12.dp)
                )
                Text(
                    text = "$readiness% Ready",
                    fontSize = 11.sp,
                    fontWeight = FontWeight.Bold,
                    color = tintText
                )
            }
        }
    }
}

@Composable
fun M3PlayerCard(
    player: Player,
    modifier: Modifier = Modifier,
    onClick: () -> Unit = {},
    showReadiness: Boolean = true,
    customBadge: (@Composable () -> Unit)? = null
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(12.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(10.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Left: Tiered Potential Star Container + Player Info
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(10.dp),
                modifier = Modifier.weight(1f)
            ) {
                // 1. Potential Star Badge
                PotentialTierBadge(potential = player.potential)

                // 2. Name, Positions & Age Pill
                Column(verticalArrangement = Arrangement.spacedBy(3.dp)) {
                    Text(
                        text = player.name,
                        fontWeight = FontWeight.Bold,
                        fontSize = 14.sp,
                        maxLines = 1
                    )
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(6.dp)
                    ) {
                        PositionBadge(position = player.positionFirst)
                        if (player.positionSecond != Position.NONE) {
                            Text(
                                text = "· ${player.positionSecond.shortName}",
                                fontSize = 11.sp,
                                color = MaterialTheme.colorScheme.onSurfaceVariant,
                                fontWeight = FontWeight.Medium
                            )
                        }

                        // Prominent Age Pill
                        Surface(
                            shape = RoundedCornerShape(4.dp),
                            color = MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.5f)
                        ) {
                            Text(
                                text = "${player.age} yrs",
                                fontSize = 11.sp,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.onPrimaryContainer,
                                modifier = Modifier.padding(horizontal = 5.dp, vertical = 1.dp)
                            )
                        }
                    }
                }
            }

            // Right: Readiness / Custom Badge + Rating Badge
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                if (customBadge != null) {
                    customBadge()
                } else if (showReadiness) {
                    ReadinessPill(
                        form = player.stateForm,
                        energy = player.stateEnergy,
                        injuryDays = player.stateInjury
                    )
                }

                RatingBadge(rating = player.overallRating, size = 32)
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlayerDetailBottomSheet(
    player: Player?,
    stats: PlayerSeasonStats? = null,
    playoffStats: PlayerSeasonStats? = null,
    onSwapPosition: ((Player) -> Unit)? = null,
    onDismiss: () -> Unit
) {
    if (player == null) return

    var currentPlayer by remember(player) { mutableStateOf(player) }
    var selectedMainTab by remember { mutableStateOf(0) } // 0: Attributes & Scouting (First Tab), 1: Stats & Splits (Second Tab)
    var statsScopeTab by remember { mutableStateOf(0) } // 0: Regular Season, 1: Playoffs
    val activeStats = if (statsScopeTab == 0) stats else playoffStats

    val p = currentPlayer
    val formattedSalary = if (p.salary >= 1_000_000) {
        "$${String.format(java.util.Locale.US, "%.2f", p.salary / 1_000_000.0)}M"
    } else {
        "$${p.salary / 1_000}K"
    }

    ModalBottomSheet(
        onDismissRequest = onDismiss,
        sheetState = rememberModalBottomSheetState(skipPartiallyExpanded = true),
        containerColor = MaterialTheme.colorScheme.surface
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp, vertical = 6.dp)
        ) {
            // 1. TOP HEADER (PLAYER PROFILE)
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    RatingBadge(rating = p.overallRating, size = 46)
                    Column {
                        Text(
                            text = p.name,
                            style = MaterialTheme.typography.titleLarge,
                            fontWeight = FontWeight.ExtraBold
                        )
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(6.dp)
                        ) {
                            PositionBadge(position = p.positionFirst)
                            if (p.positionSecond != Position.NONE) {
                                PositionBadge(position = p.positionSecond)
                            }
                            Text(
                                text = "${stringResource(R.string.spinner_player_age)}: ${p.age} • ${stringResource(R.string.spinner_player_potential)}: ${p.potential}",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                }

                Column(horizontalAlignment = Alignment.End) {
                    Text(
                        text = formattedSalary,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.ExtraBold,
                        color = MaterialTheme.colorScheme.primary
                    )
                    Text(
                        text = "${p.yearsContract} ${stringResource(R.string.free_agent_years_contract)}",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            Spacer(modifier = Modifier.height(10.dp))

            // 2. MAIN TWO TABS: ATTRIBUTES (0) VS STATS (1)
            TabRow(
                selectedTabIndex = selectedMainTab,
                modifier = Modifier
                    .fillMaxWidth()
                    .clip(RoundedCornerShape(8.dp))
            ) {
                Tab(
                    selected = selectedMainTab == 0,
                    onClick = { selectedMainTab = 0 },
                    text = {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(6.dp)
                        ) {
                            Icon(Icons.Default.Tune, contentDescription = null, modifier = Modifier.size(16.dp))
                            Text(stringResource(R.string.player_tab_skills), fontWeight = FontWeight.Bold, fontSize = 13.sp)
                        }
                    }
                )
                Tab(
                    selected = selectedMainTab == 1,
                    onClick = { selectedMainTab = 1 },
                    text = {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(6.dp)
                        ) {
                            Icon(Icons.Default.QueryStats, contentDescription = null, modifier = Modifier.size(16.dp))
                            Text(stringResource(R.string.player_tab_statistic), fontWeight = FontWeight.Bold, fontSize = 13.sp)
                        }
                    }
                )
            }

            Spacer(modifier = Modifier.height(12.dp))

            // 3. TAB CONTENT
            if (selectedMainTab == 0) {
                // TAB 0: ATTRIBUTES & SCOUTING REPORT (FIRST TAB)
                Column(
                    modifier = Modifier.fillMaxWidth(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    // Position Swapping Control (if secondary position exists and callback provided)
                    if (p.positionSecond != Position.NONE && onSwapPosition != null) {
                        Card(
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.4f)),
                            shape = RoundedCornerShape(10.dp),
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(horizontal = 12.dp, vertical = 8.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Column(modifier = Modifier.weight(1f)) {
                                    Text(
                                        text = stringResource(R.string.player_skills_exchange_positions),
                                        fontWeight = FontWeight.Bold,
                                        fontSize = 13.sp,
                                        color = MaterialTheme.colorScheme.primary
                                    )
                                    Text(
                                        text = "${p.positionFirst.shortName} (${stringResource(R.string.team_position_first)}) ↔ ${p.positionSecond.shortName} (${stringResource(R.string.team_position_second)})",
                                        fontSize = 11.sp,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                                Button(
                                    onClick = {
                                        val swapped = p.copy(
                                            positionFirst = p.positionSecond,
                                            positionSecond = p.positionFirst
                                        )
                                        currentPlayer = swapped
                                        onSwapPosition(p)
                                    },
                                    shape = RoundedCornerShape(8.dp),
                                    contentPadding = PaddingValues(horizontal = 12.dp, vertical = 6.dp)
                                ) {
                                    Icon(Icons.Default.SwapHoriz, contentDescription = null, modifier = Modifier.size(16.dp))
                                    Spacer(modifier = Modifier.width(4.dp))
                                    Text(stringResource(R.string.player_skills_exchange_positions), fontSize = 11.sp)
                                }
                            }
                        }
                    }

                    // Physical & Condition Card
                    Card(
                        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant),
                        shape = RoundedCornerShape(10.dp),
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Column(modifier = Modifier.padding(12.dp), verticalArrangement = Arrangement.spacedBy(6.dp)) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(6.dp)
                            ) {
                                Icon(Icons.Default.FitnessCenter, contentDescription = null, tint = MaterialTheme.colorScheme.primary, modifier = Modifier.size(16.dp))
                                Text(stringResource(R.string.player_skills_physique), fontWeight = FontWeight.Bold, fontSize = 12.sp, color = MaterialTheme.colorScheme.primary)
                            }
                            SkillProgressBar(label = stringResource(R.string.player_skills_physique), value = p.skillPhysique)
                            Row(
                                modifier = Modifier.fillMaxWidth(),
                                horizontalArrangement = Arrangement.SpaceBetween
                            ) {
                                Text("${stringResource(R.string.spinner_player_energy)}: ${p.stateEnergy}%", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                                Text("${stringResource(R.string.spinner_player_form)}: ${p.stateForm}%", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                            }
                        }
                    }

                    // Offensive Skills Card
                    Card(
                        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant),
                        shape = RoundedCornerShape(10.dp),
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Column(modifier = Modifier.padding(12.dp), verticalArrangement = Arrangement.spacedBy(6.dp)) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(6.dp)
                            ) {
                                Icon(Icons.Default.SportsBasketball, contentDescription = null, tint = MaterialTheme.colorScheme.primary, modifier = Modifier.size(16.dp))
                                Text(stringResource(R.string.player_skills_attack), fontWeight = FontWeight.Bold, fontSize = 12.sp, color = MaterialTheme.colorScheme.primary)
                            }
                            SkillProgressBar(label = stringResource(R.string.player_skills_shot_int), value = p.skillShotInterior)
                            SkillProgressBar(label = stringResource(R.string.player_skills_shot_ext), value = p.skillShotExterior)
                            SkillProgressBar(label = stringResource(R.string.player_skills_shot_fre), value = p.skillShotFree)
                            SkillProgressBar(label = stringResource(R.string.player_skills_pass), value = p.skillPass)
                        }
                    }

                    // Defensive Skills Card
                    Card(
                        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant),
                        shape = RoundedCornerShape(10.dp),
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Column(modifier = Modifier.padding(12.dp), verticalArrangement = Arrangement.spacedBy(6.dp)) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(6.dp)
                            ) {
                                Icon(Icons.Default.Shield, contentDescription = null, tint = MaterialTheme.colorScheme.primary, modifier = Modifier.size(16.dp))
                                Text(stringResource(R.string.player_skills_defense), fontWeight = FontWeight.Bold, fontSize = 12.sp, color = MaterialTheme.colorScheme.primary)
                            }
                            SkillProgressBar(label = stringResource(R.string.player_skills_steal), value = p.skillSteal)
                            SkillProgressBar(label = stringResource(R.string.player_skills_block), value = p.skillBlock)
                            SkillProgressBar(label = stringResource(R.string.player_skills_rebound), value = p.skillRebound)
                        }
                    }
                }
            } else {
                // TAB 1: STATS & SHOOTING SPLITS (SECOND TAB)
                Column(
                    modifier = Modifier.fillMaxWidth(),
                    verticalArrangement = Arrangement.spacedBy(10.dp)
                ) {
                    // Regular vs Playoff Toggle
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = if (statsScopeTab == 0) "Regular Season Averages" else "Playoff Averages",
                            style = MaterialTheme.typography.titleSmall,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.primary
                        )
                        Row(horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                            FilterChip(
                                selected = statsScopeTab == 0,
                                onClick = { statsScopeTab = 0 },
                                label = { Text("Regular", fontSize = 11.sp) }
                            )
                            FilterChip(
                                selected = statsScopeTab == 1,
                                onClick = { statsScopeTab = 1 },
                                label = { Text("Playoffs", fontSize = 11.sp) }
                            )
                        }
                    }

                    if (activeStats != null && activeStats.gamesPlayed > 0) {
                        // 6-Metric Stat Cards Grid (PTS, REB, AST, STL, BLK, TOV)
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(6.dp)
                        ) {
                            ModernMetricCard(label = "PPG", value = String.format(java.util.Locale.US, "%.1f", activeStats.ppg), modifier = Modifier.weight(1f), highlight = true)
                            ModernMetricCard(label = "RPG", value = String.format(java.util.Locale.US, "%.1f", activeStats.rpg), modifier = Modifier.weight(1f))
                            ModernMetricCard(label = "APG", value = String.format(java.util.Locale.US, "%.1f", activeStats.apg), modifier = Modifier.weight(1f))
                            ModernMetricCard(label = "SPG", value = String.format(java.util.Locale.US, "%.1f", activeStats.spg), modifier = Modifier.weight(1f))
                            ModernMetricCard(label = "BPG", value = String.format(java.util.Locale.US, "%.1f", activeStats.bpg), modifier = Modifier.weight(1f))
                            ModernMetricCard(label = "TOPG", value = String.format(java.util.Locale.US, "%.1f", activeStats.topg), modifier = Modifier.weight(1f), isTurnover = true)
                        }

                        // Shooting Efficiency Splits Card (NBA Calibrated Benchmarks)
                        Card(
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant),
                            shape = RoundedCornerShape(10.dp),
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Column(modifier = Modifier.padding(12.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                                Text("Shooting Efficiency & Percentages", fontWeight = FontWeight.Bold, fontSize = 12.sp, color = MaterialTheme.colorScheme.primary)

                                ShootingSplitRow(
                                    label = "Field Goal (FG%)",
                                    percentage = activeStats.fgPercentage,
                                    made = activeStats.fgMadePerGame,
                                    attempted = activeStats.fgAttPerGame,
                                    highThreshold = 48.0,
                                    lowThreshold = 42.0
                                )
                                ShootingSplitRow(
                                    label = "3-Point (3P%)",
                                    percentage = activeStats.threePtPercentage,
                                    made = activeStats.threePtMadePerGame,
                                    attempted = activeStats.threePtAttPerGame,
                                    highThreshold = 37.5,
                                    lowThreshold = 33.0
                                )
                                ShootingSplitRow(
                                    label = "Free Throw (FT%)",
                                    percentage = activeStats.ftPercentage,
                                    made = activeStats.ftMadePerGame,
                                    attempted = activeStats.ftAttPerGame,
                                    highThreshold = 80.0,
                                    lowThreshold = 70.0
                                )
                            }
                        }

                        // Advanced & Playing Time Metrics
                        Card(
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.6f)),
                            shape = RoundedCornerShape(10.dp),
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(12.dp),
                                horizontalArrangement = Arrangement.SpaceAround,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                StatItem(label = "GP", value = "${activeStats.gamesPlayed}")
                                StatItem(label = "MIN", value = String.format(java.util.Locale.US, "%.1f", activeStats.mpg))
                                StatItem(label = "PF/G", value = String.format(java.util.Locale.US, "%.1f", activeStats.pfpg))
                                StatItem(label = "PER", value = String.format(java.util.Locale.US, "%.1f", activeStats.avgPer))
                            }
                        }
                    } else {
                        Card(
                            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant),
                            shape = RoundedCornerShape(10.dp),
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Box(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(24.dp),
                                contentAlignment = Alignment.Center
                            ) {
                                Text(
                                    text = if (statsScopeTab == 0) "No regular season game statistics recorded." else "No playoff appearances recorded.",
                                    fontSize = 12.sp,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }
                    }
                }
            }

            Spacer(modifier = Modifier.height(16.dp))
        }
    }
}

@Composable
fun ModernMetricCard(
    label: String,
    value: String,
    modifier: Modifier = Modifier,
    highlight: Boolean = false,
    isTurnover: Boolean = false
) {
    Card(
        modifier = modifier,
        shape = RoundedCornerShape(8.dp),
        colors = CardDefaults.cardColors(
            containerColor = when {
                highlight -> MaterialTheme.colorScheme.primaryContainer
                isTurnover -> RatingRed.copy(alpha = 0.12f)
                else -> MaterialTheme.colorScheme.surfaceVariant
            }
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(vertical = 8.dp, horizontal = 2.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                text = value,
                fontSize = 13.sp,
                fontWeight = FontWeight.ExtraBold,
                color = when {
                    highlight -> MaterialTheme.colorScheme.primary
                    isTurnover -> RatingRed
                    else -> MaterialTheme.colorScheme.onSurface
                }
            )
            Text(
                text = label,
                fontSize = 9.sp,
                fontWeight = FontWeight.Bold,
                color = if (isTurnover) RatingRed.copy(alpha = 0.8f) else MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
fun ShootingSplitRow(
    label: String,
    percentage: Double,
    made: Double,
    attempted: Double,
    highThreshold: Double = 48.0,
    lowThreshold: Double = 42.0
) {
    val pctColor = when {
        percentage >= highThreshold -> RatingGreen
        percentage >= lowThreshold -> Color(0xFFD97706)
        else -> RatingRed
    }

    Column(modifier = Modifier.fillMaxWidth()) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(label, fontSize = 11.sp, fontWeight = FontWeight.SemiBold)
            Text(
                text = "${String.format(java.util.Locale.US, "%.1f", percentage)}%  (${String.format(java.util.Locale.US, "%.1f", made)}/${String.format(java.util.Locale.US, "%.1f", attempted)})",
                fontSize = 11.sp,
                fontWeight = FontWeight.Bold,
                color = pctColor
            )
        }
        Spacer(modifier = Modifier.height(2.dp))
        LinearProgressIndicator(
            progress = { (percentage / 100.0).toFloat().coerceIn(0f, 1f) },
            modifier = Modifier
                .fillMaxWidth()
                .height(5.dp)
                .clip(RoundedCornerShape(3.dp)),
            color = pctColor,
            trackColor = MaterialTheme.colorScheme.surface
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

    val visitorResults = remember(boxScores, visitorTeam) {
        val vId = visitorTeam?.id ?: match.teamVisitorId
        boxScores.filter { it.teamId == vId }
    }

    val localResults = remember(boxScores, localTeam) {
        val lId = localTeam?.id ?: match.teamLocalId
        boxScores.filter { it.teamId == lId }
    }

    // Team Totals & Shooting Comparison
    val vFgM = visitorResults.sumOf { it.totalFgMade }
    val vFgA = visitorResults.sumOf { it.totalFgAttempted }
    val vFgPct = if (vFgA > 0) (vFgM.toDouble() / vFgA) * 100.0 else 0.0

    val lFgM = localResults.sumOf { it.totalFgMade }
    val lFgA = localResults.sumOf { it.totalFgAttempted }
    val lFgPct = if (lFgA > 0) (lFgM.toDouble() / lFgA) * 100.0 else 0.0

    val v3PM = visitorResults.sumOf { it.shotsExteriorTripleOk }
    val v3PA = visitorResults.sumOf { it.total3PtAttempted }
    val v3PPct = if (v3PA > 0) (v3PM.toDouble() / v3PA) * 100.0 else 0.0

    val l3PM = localResults.sumOf { it.shotsExteriorTripleOk }
    val l3PA = localResults.sumOf { it.total3PtAttempted }
    val l3PPct = if (l3PA > 0) (l3PM.toDouble() / l3PA) * 100.0 else 0.0

    val vFtM = visitorResults.sumOf { it.shotsFreeOk }
    val vFtA = visitorResults.sumOf { it.totalFtAttempted }
    val vFtPct = if (vFtA > 0) (vFtM.toDouble() / vFtA) * 100.0 else 0.0

    val lFtM = localResults.sumOf { it.shotsFreeOk }
    val lFtA = localResults.sumOf { it.totalFtAttempted }
    val lFtPct = if (lFtA > 0) (lFtM.toDouble() / lFtA) * 100.0 else 0.0

    val vReb = visitorResults.sumOf { it.rebounds }
    val lReb = localResults.sumOf { it.rebounds }

    val vAst = visitorResults.sumOf { it.passesOk }
    val lAst = localResults.sumOf { it.passesOk }

    val vStl = visitorResults.sumOf { it.steals }
    val lStl = localResults.sumOf { it.steals }

    val vBlk = visitorResults.sumOf { it.blocks }
    val lBlk = localResults.sumOf { it.blocks }

    val vTov = visitorResults.sumOf { it.passesKo }
    val lTov = localResults.sumOf { it.passesKo }

    // Starters vs Reserves breakdown (starters are top 5 by minutes played)
    val visitorStarters = remember(visitorResults) { visitorResults.sortedByDescending { it.minutesPlayed }.take(5) }
    val visitorReserves = remember(visitorResults) { visitorResults.sortedByDescending { it.minutesPlayed }.drop(5) }

    val localStarters = remember(localResults) { localResults.sortedByDescending { it.minutesPlayed }.take(5) }
    val localReserves = remember(localResults) { localResults.sortedByDescending { it.minutesPlayed }.drop(5) }

    var selectedTeamTab by remember { mutableStateOf(0) } // 0: Visitor, 1: Local
    var showTeamComparison by remember { mutableStateOf(false) }

    Dialog(onDismissRequest = onDismiss) {
        Card(
            modifier = Modifier
                .fillMaxWidth()
                .fillMaxHeight(0.92f),
            shape = RoundedCornerShape(16.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
        ) {
            Column(modifier = Modifier.fillMaxSize().padding(14.dp)) {
                // Header Bar
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column {
                        Text(
                            text = match.name ?: "NBA Box Score",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.ExtraBold
                        )
                        Text(
                            text = "Matchday ${match.matchday} • Final",
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                    IconButton(onClick = onDismiss) {
                        Icon(Icons.Default.Close, contentDescription = "Close")
                    }
                }

                // Quarter breakdown line score
                Card(
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant),
                    shape = RoundedCornerShape(10.dp),
                    modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp)
                ) {
                    Column(modifier = Modifier.padding(8.dp)) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceAround
                        ) {
                            Text("Team", fontWeight = FontWeight.Bold, fontSize = 11.sp, modifier = Modifier.weight(1.5f))
                            Text("Q1", fontWeight = FontWeight.Bold, fontSize = 11.sp, modifier = Modifier.weight(1f))
                            Text("Q2", fontWeight = FontWeight.Bold, fontSize = 11.sp, modifier = Modifier.weight(1f))
                            Text("Q3", fontWeight = FontWeight.Bold, fontSize = 11.sp, modifier = Modifier.weight(1f))
                            Text("Q4", fontWeight = FontWeight.Bold, fontSize = 11.sp, modifier = Modifier.weight(1f))
                            if ((match.localOt ?: 0) > 0 || (match.visitorOt ?: 0) > 0) {
                                Text("OT", fontWeight = FontWeight.Bold, fontSize = 11.sp, modifier = Modifier.weight(1f))
                            }
                            Text("FINAL", fontWeight = FontWeight.ExtraBold, fontSize = 11.sp, color = MaterialTheme.colorScheme.primary, modifier = Modifier.weight(1.2f))
                        }
                        HorizontalDivider(modifier = Modifier.padding(vertical = 4.dp))
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceAround
                        ) {
                            Text(visitorTeam?.name ?: "VIS", fontSize = 11.sp, fontWeight = FontWeight.Bold, modifier = Modifier.weight(1.5f))
                            Text("${match.visitorQuarter1 ?: 0}", fontSize = 11.sp, modifier = Modifier.weight(1f))
                            Text("${match.visitorQuarter2 ?: 0}", fontSize = 11.sp, modifier = Modifier.weight(1f))
                            Text("${match.visitorQuarter3 ?: 0}", fontSize = 11.sp, modifier = Modifier.weight(1f))
                            Text("${match.visitorQuarter4 ?: 0}", fontSize = 11.sp, modifier = Modifier.weight(1f))
                            if ((match.localOt ?: 0) > 0 || (match.visitorOt ?: 0) > 0) {
                                Text("${match.visitorOt ?: 0}", fontSize = 11.sp, modifier = Modifier.weight(1f))
                            }
                            Text("${match.visitorScore ?: 0}", fontSize = 11.sp, fontWeight = FontWeight.ExtraBold, color = if ((match.visitorScore ?: 0) > (match.localScore ?: 0)) RatingGreen else MaterialTheme.colorScheme.onSurface, modifier = Modifier.weight(1.2f))
                        }
                        Row(
                            modifier = Modifier.fillMaxWidth().padding(top = 2.dp),
                            horizontalArrangement = Arrangement.SpaceAround
                        ) {
                            Text(localTeam?.name ?: "LOC", fontSize = 11.sp, fontWeight = FontWeight.Bold, modifier = Modifier.weight(1.5f))
                            Text("${match.localQuarter1 ?: 0}", fontSize = 11.sp, modifier = Modifier.weight(1f))
                            Text("${match.localQuarter2 ?: 0}", fontSize = 11.sp, modifier = Modifier.weight(1f))
                            Text("${match.localQuarter3 ?: 0}", fontSize = 11.sp, modifier = Modifier.weight(1f))
                            Text("${match.localQuarter4 ?: 0}", fontSize = 11.sp, modifier = Modifier.weight(1f))
                            if ((match.localOt ?: 0) > 0 || (match.visitorOt ?: 0) > 0) {
                                Text("${match.localOt ?: 0}", fontSize = 11.sp, modifier = Modifier.weight(1f))
                            }
                            Text("${match.localScore ?: 0}", fontSize = 11.sp, fontWeight = FontWeight.ExtraBold, color = if ((match.localScore ?: 0) > (match.visitorScore ?: 0)) RatingGreen else MaterialTheme.colorScheme.onSurface, modifier = Modifier.weight(1.2f))
                        }
                    }
                }

                // Team Comparison Toggle Bar
                Card(
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f)),
                    shape = RoundedCornerShape(8.dp),
                    modifier = Modifier.fillMaxWidth().clickable { showTeamComparison = !showTeamComparison }.padding(vertical = 2.dp)
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth().padding(horizontal = 10.dp, vertical = 6.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = if (showTeamComparison) "▼ Hide Team Stats Comparison" else "▶ View Team Stats Comparison (FG%, 3P%, TOV, REB...)",
                            fontSize = 11.sp,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.primary
                        )
                    }
                    if (showTeamComparison) {
                        Column(modifier = Modifier.padding(horizontal = 10.dp, vertical = 4.dp), verticalArrangement = Arrangement.spacedBy(4.dp)) {
                            TeamStatCompareRow(label = "Field Goal (FG%)", vVal = "${String.format(java.util.Locale.US, "%.1f", vFgPct)}% ($vFgM/$vFgA)", lVal = "${String.format(java.util.Locale.US, "%.1f", lFgPct)}% ($lFgM/$lFgA)")
                            TeamStatCompareRow(label = "3-Point (3P%)", vVal = "${String.format(java.util.Locale.US, "%.1f", v3PPct)}% ($v3PM/$v3PA)", lVal = "${String.format(java.util.Locale.US, "%.1f", l3PPct)}% ($l3PM/$l3PA)")
                            TeamStatCompareRow(label = "Free Throw (FT%)", vVal = "${String.format(java.util.Locale.US, "%.1f", vFtPct)}% ($vFtM/$vFtA)", lVal = "${String.format(java.util.Locale.US, "%.1f", lFtPct)}% ($lFtM/$lFtA)")
                            TeamStatCompareRow(label = "Total Rebounds", vVal = "$vReb", lVal = "$lReb")
                            TeamStatCompareRow(label = "Total Assists", vVal = "$vAst", lVal = "$lAst")
                            TeamStatCompareRow(label = "Steals / Blocks", vVal = "$vStl / $vBlk", lVal = "$lStl / $lBlk")
                            TeamStatCompareRow(label = "Turnovers (TOV)", vVal = "$vTov", lVal = "$lTov", isTurnover = true)
                        }
                    }
                }

                Spacer(modifier = Modifier.height(4.dp))

                // Team Tab Switch
                SingleChoiceSegmentedButtonRow(
                    modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp)
                ) {
                    SegmentedButton(
                        selected = selectedTeamTab == 0,
                        onClick = { selectedTeamTab = 0 },
                        shape = SegmentedButtonDefaults.itemShape(index = 0, count = 2)
                    ) {
                        Text("${visitorTeam?.name ?: "VIS"} (${match.visitorScore ?: 0})", fontWeight = FontWeight.Bold, fontSize = 12.sp)
                    }
                    SegmentedButton(
                        selected = selectedTeamTab == 1,
                        onClick = { selectedTeamTab = 1 },
                        shape = SegmentedButtonDefaults.itemShape(index = 1, count = 2)
                    ) {
                        Text("${localTeam?.name ?: "LOC"} (${match.localScore ?: 0})", fontWeight = FontWeight.Bold, fontSize = 12.sp)
                    }
                }

                val currentStarters = if (selectedTeamTab == 0) visitorStarters else localStarters
                val currentReserves = if (selectedTeamTab == 0) visitorReserves else localReserves

                LazyColumn(
                    modifier = Modifier.weight(1f),
                    verticalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    item {
                        Text(
                            text = "STARTERS",
                            style = MaterialTheme.typography.labelMedium,
                            fontWeight = FontWeight.ExtraBold,
                            color = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.padding(top = 4.dp, bottom = 2.dp)
                        )
                    }

                    items(currentStarters) { stat ->
                        BoxScorePlayerRow(stat = stat)
                    }

                    if (currentReserves.isNotEmpty()) {
                        item {
                            Text(
                                text = "BENCH RESERVES",
                                style = MaterialTheme.typography.labelMedium,
                                fontWeight = FontWeight.ExtraBold,
                                color = MaterialTheme.colorScheme.onSurfaceVariant,
                                modifier = Modifier.padding(top = 8.dp, bottom = 2.dp)
                            )
                        }

                        items(currentReserves) { stat ->
                            BoxScorePlayerRow(stat = stat)
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun TeamStatCompareRow(label: String, vVal: String, lVal: String, isTurnover: Boolean = false) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(vVal, fontSize = 11.sp, fontWeight = FontWeight.Bold, modifier = Modifier.weight(1f))
        Text(label, fontSize = 10.sp, color = if (isTurnover) RatingRed else MaterialTheme.colorScheme.onSurfaceVariant, modifier = Modifier.weight(1.5f), textAlign = androidx.compose.ui.text.style.TextAlign.Center)
        Text(lVal, fontSize = 11.sp, fontWeight = FontWeight.Bold, modifier = Modifier.weight(1f), textAlign = androidx.compose.ui.text.style.TextAlign.End)
    }
}

@Composable
fun BoxScorePlayerRow(stat: MatchResult) {
    val fgTotal = stat.totalFgAttempted
    val fgMade = stat.totalFgMade
    val fgPct = String.format(java.util.Locale.US, "%.1f", stat.fgPercentage)

    val tpTotal = stat.total3PtAttempted
    val tpMade = stat.shotsExteriorTripleOk
    val tpPct = String.format(java.util.Locale.US, "%.1f", stat.threePtPercentage)

    val ftTotal = stat.totalFtAttempted
    val ftMade = stat.shotsFreeOk
    val ftPct = String.format(java.util.Locale.US, "%.1f", stat.ftPercentage)

    val perFormatted = String.format(java.util.Locale.US, "%.1f", stat.per)

    Card(
        shape = RoundedCornerShape(8.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f)),
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 10.dp, vertical = 6.dp),
            verticalArrangement = Arrangement.spacedBy(3.dp)
        ) {
            // Row 1: Player Name, Minutes, Primary Core Stats (PTS, REB, AST)
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                ) {
                    Text(stat.playerName, fontWeight = FontWeight.ExtraBold, fontSize = 13.sp)
                    Surface(
                        shape = RoundedCornerShape(4.dp),
                        color = MaterialTheme.colorScheme.surface
                    ) {
                        Text(
                            text = "${stat.minutesPlayed}m",
                            fontSize = 10.sp,
                            fontWeight = FontWeight.Bold,
                            modifier = Modifier.padding(horizontal = 4.dp, vertical = 1.dp),
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }

                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Text(
                        text = "${stat.points} PTS",
                        fontWeight = FontWeight.ExtraBold,
                        fontSize = 13.sp,
                        color = MaterialTheme.colorScheme.primary
                    )
                    Text(
                        text = "${stat.rebounds} REB",
                        fontSize = 12.sp,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "${stat.passesOk} AST",
                        fontSize = 12.sp,
                        fontWeight = FontWeight.Bold
                    )
                }
            }

            // Row 2: Shooting Splits (FG%, 3P%, FT%)
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "FG: $fgMade/$fgTotal ($fgPct%) • 3PT: $tpMade/$tpTotal ($tpPct%) • FT: $ftMade/$ftTotal ($ftPct%)",
                    fontSize = 10.sp,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            // Row 3: Defense & Discipline (STL, BLK, TOV/Turnovers, PF/Fouls, PER)
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                    Text("STL: ${stat.steals}", fontSize = 10.sp, fontWeight = FontWeight.Medium)
                    Text("•", fontSize = 10.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    Text("BLK: ${stat.blocks}", fontSize = 10.sp, fontWeight = FontWeight.Medium)
                    Text("•", fontSize = 10.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    Text(
                        text = "TOV: ${stat.passesKo}",
                        fontSize = 10.sp,
                        fontWeight = FontWeight.Bold,
                        color = if (stat.passesKo >= 3) RatingRed else MaterialTheme.colorScheme.onSurface
                    )
                    Text("•", fontSize = 10.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    Text("PF: ${stat.fouls}", fontSize = 10.sp, color = if (stat.fouls >= 5) RatingRed else MaterialTheme.colorScheme.onSurfaceVariant)
                }
                Text(
                    text = "PER: $perFormatted",
                    fontSize = 10.sp,
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.Bold
                )
            }
        }
    }
}

@Composable
fun StatItem(label: String, value: String) {
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Text(
            text = value,
            style = MaterialTheme.typography.titleMedium,
            fontWeight = FontWeight.ExtraBold,
            color = MaterialTheme.colorScheme.primary
        )
        Text(
            text = label,
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@Composable
fun SkillProgressBar(label: String, value: Int) {
    val color = when {
        value >= 85 -> RatingGreen
        value >= 70 -> Color(0xFFD97706)
        else -> RatingRed
    }

    Column(modifier = Modifier.fillMaxWidth().padding(vertical = 2.dp)) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(text = label, style = MaterialTheme.typography.bodySmall, fontWeight = FontWeight.Medium)
            Text(text = value.toString(), style = MaterialTheme.typography.bodySmall, fontWeight = FontWeight.Bold, color = color)
        }
        LinearProgressIndicator(
            progress = { (value / 100f).coerceIn(0f, 1f) },
            modifier = Modifier
                .fillMaxWidth()
                .height(6.dp)
                .clip(RoundedCornerShape(3.dp)),
            color = color,
            trackColor = MaterialTheme.colorScheme.surface
        )
    }
}
