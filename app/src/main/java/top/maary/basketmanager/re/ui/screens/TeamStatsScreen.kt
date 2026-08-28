package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
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
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.theme.RatingRed
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel
import top.maary.basketmanager.re.ui.viewmodel.PlayerSeasonStats

@Composable
fun TeamStatsScreen(
    viewModel: GameDashboardViewModel,
    targetTeamId: Long? = null
) {
    val userTeam by viewModel.userTeam.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()
    val regularStatsList by viewModel.playerStatsList.collectAsState()
    val playoffStatsList by viewModel.playerPlayoffStatsList.collectAsState()

    val effectiveTeamId = targetTeamId ?: userTeam?.id ?: 0L
    val effectiveTeam = remember(allTeams, effectiveTeamId) { allTeams.find { it.id == effectiveTeamId } }

    var selectedScope by remember { mutableStateOf(0) } // 0: Regular Season, 1: Playoffs
    var sortCategory by remember { mutableStateOf("PTS") }
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }

    val activeStats = if (selectedScope == 0) regularStatsList else playoffStatsList
    val teamPlayerStats = remember(activeStats, effectiveTeamId) {
        activeStats.filter { it.player.teamId == effectiveTeamId }
    }

    val sortedPlayerStats = remember(teamPlayerStats, sortCategory) {
        when (sortCategory) {
            "PTS" -> teamPlayerStats.sortedByDescending { it.ppg }
            "REB" -> teamPlayerStats.sortedByDescending { it.rpg }
            "AST" -> teamPlayerStats.sortedByDescending { it.apg }
            "STL" -> teamPlayerStats.sortedByDescending { it.spg }
            "BLK" -> teamPlayerStats.sortedByDescending { it.bpg }
            "TOV" -> teamPlayerStats.sortedByDescending { it.topg }
            "FG%" -> teamPlayerStats.sortedByDescending { it.fgPercentage }
            "3P%" -> teamPlayerStats.sortedByDescending { it.threePtPercentage }
            "FT%" -> teamPlayerStats.sortedByDescending { it.ftPercentage }
            "MIN" -> teamPlayerStats.sortedByDescending { it.mpg }
            "GP" -> teamPlayerStats.sortedByDescending { it.gamesPlayed }
            "PER" -> teamPlayerStats.sortedByDescending { it.avgPer }
            else -> teamPlayerStats.sortedByDescending { it.ppg }
        }
    }

    // Team Overall Averages
    val totalGames = teamPlayerStats.maxOfOrNull { it.gamesPlayed } ?: 0
    val teamPpg = teamPlayerStats.sumOf { it.ppg }
    val teamRpg = teamPlayerStats.sumOf { it.rpg }
    val teamApg = teamPlayerStats.sumOf { it.apg }
    val teamSpg = teamPlayerStats.sumOf { it.spg }
    val teamBpg = teamPlayerStats.sumOf { it.bpg }
    val teamTopg = teamPlayerStats.sumOf { it.topg }

    val totalFgM = teamPlayerStats.sumOf { it.fgMadePerGame }
    val totalFgA = teamPlayerStats.sumOf { it.fgAttPerGame }
    val teamFgPct = if (totalFgA > 0) (totalFgM / totalFgA) * 100.0 else 0.0

    val total3PM = teamPlayerStats.sumOf { it.threePtMadePerGame }
    val total3PA = teamPlayerStats.sumOf { it.threePtAttPerGame }
    val team3PPct = if (total3PA > 0) (total3PM / total3PA) * 100.0 else 0.0

    val totalFtM = teamPlayerStats.sumOf { it.ftMadePerGame }
    val totalFtA = teamPlayerStats.sumOf { it.ftAttPerGame }
    val teamFtPct = if (totalFtA > 0) (totalFtM / totalFtA) * 100.0 else 0.0

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 14.dp, vertical = 8.dp)
    ) {
        // Top Header with Scope Switcher
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column {
                Text(
                    text = "${effectiveTeam?.name ?: "Team"} Statistics",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.ExtraBold
                )
                Text(
                    text = if (selectedScope == 0) "Regular Season Performance ($totalGames GP)" else "Playoffs Performance ($totalGames GP)",
                    fontSize = 12.sp,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Row(horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                FilterChip(
                    selected = selectedScope == 0,
                    onClick = { selectedScope = 0 },
                    label = { Text("Regular", fontSize = 11.sp, fontWeight = FontWeight.Bold) }
                )
                FilterChip(
                    selected = selectedScope == 1,
                    onClick = { selectedScope = 1 },
                    label = { Text("Playoffs", fontSize = 11.sp, fontWeight = FontWeight.Bold) }
                )
            }
        }

        Spacer(modifier = Modifier.height(8.dp))

        // Team Aggregate Card
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
        ) {
            Column(modifier = Modifier.padding(12.dp), verticalArrangement = Arrangement.spacedBy(6.dp)) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceAround
                ) {
                    TeamStatBadge("PPG", String.format(java.util.Locale.US, "%.1f", teamPpg))
                    TeamStatBadge("RPG", String.format(java.util.Locale.US, "%.1f", teamRpg))
                    TeamStatBadge("APG", String.format(java.util.Locale.US, "%.1f", teamApg))
                    TeamStatBadge("SPG", String.format(java.util.Locale.US, "%.1f", teamSpg))
                    TeamStatBadge("BPG", String.format(java.util.Locale.US, "%.1f", teamBpg))
                    TeamStatBadge("TOPG", String.format(java.util.Locale.US, "%.1f", teamTopg), isAlert = true)
                }
                HorizontalDivider(modifier = Modifier.padding(vertical = 4.dp))
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceAround
                ) {
                    Text("FG%: ${String.format(java.util.Locale.US, "%.1f", teamFgPct)}%", fontSize = 11.sp, fontWeight = FontWeight.Bold)
                    Text("3P%: ${String.format(java.util.Locale.US, "%.1f", team3PPct)}%", fontSize = 11.sp, fontWeight = FontWeight.Bold)
                    Text("FT%: ${String.format(java.util.Locale.US, "%.1f", teamFtPct)}%", fontSize = 11.sp, fontWeight = FontWeight.Bold)
                }
            }
        }

        Spacer(modifier = Modifier.height(8.dp))

        // Sort Category Filter Chips
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .horizontalScroll(rememberScrollState()),
            horizontalArrangement = Arrangement.spacedBy(6.dp)
        ) {
            val categories = listOf("PTS", "REB", "AST", "STL", "BLK", "TOV", "FG%", "3P%", "FT%", "MIN", "GP", "PER")
            categories.forEach { cat ->
                FilterChip(
                    selected = sortCategory == cat,
                    onClick = { sortCategory = cat },
                    label = { Text(cat, fontSize = 11.sp, fontWeight = FontWeight.SemiBold) }
                )
            }
        }

        Spacer(modifier = Modifier.height(6.dp))

        // Player Stats List
        if (sortedPlayerStats.isEmpty()) {
            Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                Text(
                    text = if (selectedScope == 0) "No regular season game stats recorded yet." else "No playoff appearances recorded.",
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        } else {
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                verticalArrangement = Arrangement.spacedBy(6.dp),
                contentPadding = PaddingValues(bottom = 16.dp)
            ) {
                items(sortedPlayerStats) { pStat ->
                    TeamPlayerStatCard(
                        pStat = pStat,
                        onClick = { selectedPlayerForDetail = pStat.player }
                    )
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
private fun TeamStatBadge(label: String, value: String, isAlert: Boolean = false) {
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Text(
            text = value,
            fontSize = 14.sp,
            fontWeight = FontWeight.ExtraBold,
            color = if (isAlert) RatingRed else MaterialTheme.colorScheme.primary
        )
        Text(
            text = label,
            fontSize = 10.sp,
            fontWeight = FontWeight.Bold,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@Composable
private fun TeamPlayerStatCard(
    pStat: PlayerSeasonStats,
    onClick: () -> Unit
) {
    val player = pStat.player
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable { onClick() },
        shape = RoundedCornerShape(10.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 12.dp, vertical = 8.dp),
            verticalArrangement = Arrangement.spacedBy(4.dp)
        ) {
            // Row 1: Profile & Playing Time
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    RatingBadge(rating = player.overallRating, size = 30)
                    PositionBadge(position = player.positionFirst)
                    Column {
                        Text(text = player.name, fontWeight = FontWeight.Bold, fontSize = 13.sp)
                        Text(
                            text = "${pStat.gamesPlayed} GP • ${String.format(java.util.Locale.US, "%.1f", pStat.mpg)} MPG",
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }

                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Text(
                        text = "${String.format(java.util.Locale.US, "%.1f", pStat.ppg)} PTS",
                        fontSize = 14.sp,
                        fontWeight = FontWeight.ExtraBold,
                        color = MaterialTheme.colorScheme.primary
                    )
                    Text(
                        text = "${String.format(java.util.Locale.US, "%.1f", pStat.rpg)} REB",
                        fontSize = 12.sp,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "${String.format(java.util.Locale.US, "%.1f", pStat.apg)} AST",
                        fontSize = 12.sp,
                        fontWeight = FontWeight.Bold
                    )
                }
            }

            // Row 2: Defense & Ball Security (STL, BLK, TOV, PF)
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                    Text("STL: ${String.format(java.util.Locale.US, "%.1f", pStat.spg)}", fontSize = 11.sp)
                    Text("•", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    Text("BLK: ${String.format(java.util.Locale.US, "%.1f", pStat.bpg)}", fontSize = 11.sp)
                    Text("•", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    Text(
                        text = "TOV: ${String.format(java.util.Locale.US, "%.1f", pStat.topg)}",
                        fontSize = 11.sp,
                        fontWeight = FontWeight.Bold,
                        color = if (pStat.topg >= 2.5) RatingRed else MaterialTheme.colorScheme.onSurface
                    )
                    Text("•", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    Text("PF: ${String.format(java.util.Locale.US, "%.1f", pStat.pfpg)}", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                }

                Text(
                    text = "PER: ${String.format(java.util.Locale.US, "%.1f", pStat.avgPer)}",
                    fontSize = 11.sp,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.primary
                )
            }

            // Row 3: Shooting Splits & Percentages
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "FG: ${String.format(java.util.Locale.US, "%.1f", pStat.fgPercentage)}% (${String.format(java.util.Locale.US, "%.1f", pStat.fgMadePerGame)}/${String.format(java.util.Locale.US, "%.1f", pStat.fgAttPerGame)}) • 3PT: ${String.format(java.util.Locale.US, "%.1f", pStat.threePtPercentage)}% • FT: ${String.format(java.util.Locale.US, "%.1f", pStat.ftPercentage)}%",
                    fontSize = 10.sp,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}
