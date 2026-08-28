package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDownward
import androidx.compose.material.icons.filled.ArrowUpward
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
import top.maary.basketmanager.re.R
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.ui.components.PlayerDetailBottomSheet
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel
import top.maary.basketmanager.re.ui.viewmodel.PlayerSeasonStats

private enum class StatSortField {
    NAME, GP, MIN, PTS, REB, AST, BLK, STL, PER
}

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
    var sortField by remember { mutableStateOf(StatSortField.PTS) }
    var sortAscending by remember { mutableStateOf(false) }
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }

    val activeStats = if (selectedScope == 0) regularStatsList else playoffStatsList
    val teamPlayerStats = remember(activeStats, effectiveTeamId) {
        activeStats.filter { it.player.teamId == effectiveTeamId }
    }

    val sortedPlayerStats = remember(teamPlayerStats, sortField, sortAscending) {
        val comparator = when (sortField) {
            StatSortField.NAME -> compareBy<PlayerSeasonStats> { it.player.name }
            StatSortField.GP -> compareBy { it.gamesPlayed }
            StatSortField.MIN -> compareBy { it.mpg }
            StatSortField.PTS -> compareBy { it.ppg }
            StatSortField.REB -> compareBy { it.rpg }
            StatSortField.AST -> compareBy { it.apg }
            StatSortField.BLK -> compareBy { it.bpg }
            StatSortField.STL -> compareBy { it.spg }
            StatSortField.PER -> compareBy { it.avgPer }
        }
        if (sortAscending) teamPlayerStats.sortedWith(comparator)
        else teamPlayerStats.sortedWith(comparator.reversed())
    }

    // Team Overall Averages
    val totalGames = teamPlayerStats.maxOfOrNull { it.gamesPlayed } ?: 0
    val teamPpg = teamPlayerStats.sumOf { it.ppg }
    val teamRpg = teamPlayerStats.sumOf { it.rpg }
    val teamApg = teamPlayerStats.sumOf { it.apg }
    val teamSpg = teamPlayerStats.sumOf { it.spg }
    val teamBpg = teamPlayerStats.sumOf { it.bpg }

    val activePlayersWithPer = teamPlayerStats.filter { it.gamesPlayed > 0 && it.avgPer > 0.0 }
    val teamAvgPer = if (activePlayersWithPer.isNotEmpty()) {
        activePlayersWithPer.map { it.avgPer }.average()
    } else 0.0

    val hScrollState = rememberScrollState()

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
                    text = "${effectiveTeam?.name ?: "Team"} Stats",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.ExtraBold
                )
                Text(
                    text = if (selectedScope == 0) "Regular Season ($totalGames GP)" else "Playoffs ($totalGames GP)",
                    fontSize = 11.sp,
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

        // Material 3 Expressive Table Card
        Card(
            modifier = Modifier
                .fillMaxWidth()
                .weight(1f),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
        ) {
            Column(modifier = Modifier.fillMaxSize()) {
                // Table Container (Horizontally Scrollable)
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .weight(1f)
                        .horizontalScroll(hScrollState)
                ) {
                    Column(modifier = Modifier.width(620.dp)) {
                        // 1. Table Header Row (Clickable Sort Headers)
                        Surface(
                            color = MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.5f),
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(vertical = 8.dp, horizontal = 8.dp),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                TableHeaderCell(
                                    title = "Name",
                                    field = StatSortField.NAME,
                                    activeField = sortField,
                                    isAscending = sortAscending,
                                    width = 130.dp,
                                    align = TextAlign.Start,
                                    onClick = {
                                        if (sortField == StatSortField.NAME) sortAscending = !sortAscending
                                        else { sortField = StatSortField.NAME; sortAscending = true }
                                    }
                                )
                                TableHeaderCell(
                                    title = "GP",
                                    field = StatSortField.GP,
                                    activeField = sortField,
                                    isAscending = sortAscending,
                                    width = 50.dp,
                                    onClick = {
                                        if (sortField == StatSortField.GP) sortAscending = !sortAscending
                                        else { sortField = StatSortField.GP; sortAscending = false }
                                    }
                                )
                                TableHeaderCell(
                                    title = "MIN",
                                    field = StatSortField.MIN,
                                    activeField = sortField,
                                    isAscending = sortAscending,
                                    width = 55.dp,
                                    onClick = {
                                        if (sortField == StatSortField.MIN) sortAscending = !sortAscending
                                        else { sortField = StatSortField.MIN; sortAscending = false }
                                    }
                                )
                                TableHeaderCell(
                                    title = "PTS",
                                    field = StatSortField.PTS,
                                    activeField = sortField,
                                    isAscending = sortAscending,
                                    width = 55.dp,
                                    onClick = {
                                        if (sortField == StatSortField.PTS) sortAscending = !sortAscending
                                        else { sortField = StatSortField.PTS; sortAscending = false }
                                    }
                                )
                                TableHeaderCell(
                                    title = "REB",
                                    field = StatSortField.REB,
                                    activeField = sortField,
                                    isAscending = sortAscending,
                                    width = 55.dp,
                                    onClick = {
                                        if (sortField == StatSortField.REB) sortAscending = !sortAscending
                                        else { sortField = StatSortField.REB; sortAscending = false }
                                    }
                                )
                                TableHeaderCell(
                                    title = "AST",
                                    field = StatSortField.AST,
                                    activeField = sortField,
                                    isAscending = sortAscending,
                                    width = 55.dp,
                                    onClick = {
                                        if (sortField == StatSortField.AST) sortAscending = !sortAscending
                                        else { sortField = StatSortField.AST; sortAscending = false }
                                    }
                                )
                                TableHeaderCell(
                                    title = "BLK",
                                    field = StatSortField.BLK,
                                    activeField = sortField,
                                    isAscending = sortAscending,
                                    width = 55.dp,
                                    onClick = {
                                        if (sortField == StatSortField.BLK) sortAscending = !sortAscending
                                        else { sortField = StatSortField.BLK; sortAscending = false }
                                    }
                                )
                                TableHeaderCell(
                                    title = "STL",
                                    field = StatSortField.STL,
                                    activeField = sortField,
                                    isAscending = sortAscending,
                                    width = 55.dp,
                                    onClick = {
                                        if (sortField == StatSortField.STL) sortAscending = !sortAscending
                                        else { sortField = StatSortField.STL; sortAscending = false }
                                    }
                                )
                                TableHeaderCell(
                                    title = "PER",
                                    field = StatSortField.PER,
                                    activeField = sortField,
                                    isAscending = sortAscending,
                                    width = 60.dp,
                                    onClick = {
                                        if (sortField == StatSortField.PER) sortAscending = !sortAscending
                                        else { sortField = StatSortField.PER; sortAscending = false }
                                    }
                                )
                            }
                        }

                        HorizontalDivider(thickness = 0.5.dp, color = MaterialTheme.colorScheme.outlineVariant)

                        // 2. Player Rows
                        LazyColumn(
                            modifier = Modifier
                                .fillMaxWidth()
                                .weight(1f)
                        ) {
                            itemsIndexed(sortedPlayerStats) { index, pStat ->
                                val rowBg = if (index % 2 == 1) MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.3f) else Color.Transparent
                                TablePlayerRow(
                                    stat = pStat,
                                    bgColor = rowBg,
                                    onClick = { selectedPlayerForDetail = pStat.player }
                                )
                                HorizontalDivider(thickness = 0.5.dp, color = MaterialTheme.colorScheme.outlineVariant.copy(alpha = 0.4f))
                            }
                        }

                        // 3. Highlighted Bottom Sticky Summary Row: Team Total
                        Surface(
                            color = RatingGreen.copy(alpha = 0.2f),
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(vertical = 10.dp, horizontal = 8.dp),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Text(
                                    text = "Team Total",
                                    fontWeight = FontWeight.Black,
                                    fontSize = 12.sp,
                                    color = Color(0xFF1B5E20),
                                    modifier = Modifier.width(130.dp)
                                )
                                TableCell(text = "$totalGames", width = 50.dp, isBold = true, color = Color(0xFF1B5E20))
                                TableCell(text = "-", width = 55.dp, isBold = true, color = Color(0xFF1B5E20))
                                TableCell(text = String.format(java.util.Locale.US, "%.1f", teamPpg), width = 55.dp, isBold = true, color = Color(0xFF1B5E20))
                                TableCell(text = String.format(java.util.Locale.US, "%.1f", teamRpg), width = 55.dp, isBold = true, color = Color(0xFF1B5E20))
                                TableCell(text = String.format(java.util.Locale.US, "%.1f", teamApg), width = 55.dp, isBold = true, color = Color(0xFF1B5E20))
                                TableCell(text = String.format(java.util.Locale.US, "%.1f", teamBpg), width = 55.dp, isBold = true, color = Color(0xFF1B5E20))
                                TableCell(text = String.format(java.util.Locale.US, "%.1f", teamSpg), width = 55.dp, isBold = true, color = Color(0xFF1B5E20))
                                TableCell(text = String.format(java.util.Locale.US, "%.2f", teamAvgPer), width = 60.dp, isBold = true, color = Color(0xFF1B5E20))
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
            onSwapPosition = if (player.teamId == userTeam?.id) { { viewModel.swapPlayerPositions(it) } } else null,
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}

@Composable
private fun TableHeaderCell(
    title: String,
    field: StatSortField,
    activeField: StatSortField,
    isAscending: Boolean,
    width: androidx.compose.ui.unit.Dp,
    align: TextAlign = TextAlign.Center,
    onClick: () -> Unit
) {
    val isSelected = field == activeField
    Row(
        modifier = Modifier
            .width(width)
            .clip(RoundedCornerShape(4.dp))
            .clickable(onClick = onClick)
            .padding(vertical = 2.dp, horizontal = 2.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = if (align == TextAlign.Start) Arrangement.Start else Arrangement.Center
    ) {
        Text(
            text = title,
            fontSize = 11.sp,
            fontWeight = if (isSelected) FontWeight.Black else FontWeight.Bold,
            color = if (isSelected) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurface,
            textAlign = align
        )
        if (isSelected) {
            Icon(
                imageVector = if (isAscending) Icons.Default.ArrowUpward else Icons.Default.ArrowDownward,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.primary,
                modifier = Modifier.size(12.dp)
            )
        }
    }
}

@Composable
private fun TablePlayerRow(
    stat: PlayerSeasonStats,
    bgColor: Color,
    onClick: () -> Unit
) {
    val p = stat.player
    val hasPlayed = stat.gamesPlayed > 0

    Row(
        modifier = Modifier
            .fillMaxWidth()
            .background(bgColor)
            .clickable(onClick = onClick)
            .padding(vertical = 8.dp, horizontal = 8.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Player Name & Position Badge Column
        Row(
            modifier = Modifier.width(130.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(4.dp)
        ) {
            Text(
                text = p.shortName,
                fontSize = 12.sp,
                fontWeight = FontWeight.Bold,
                maxLines = 1,
                modifier = Modifier.weight(1f)
            )
            Surface(
                shape = RoundedCornerShape(3.dp),
                color = MaterialTheme.colorScheme.primaryContainer
            ) {
                Text(
                    text = p.positionFirst.shortName,
                    fontSize = 9.sp,
                    fontWeight = FontWeight.SemiBold,
                    color = MaterialTheme.colorScheme.onPrimaryContainer,
                    modifier = Modifier.padding(horizontal = 3.dp, vertical = 1.dp)
                )
            }
        }

        // Numeric Stat Columns (Hyphen "-" when no games played, like BM15)
        TableCell(text = if (hasPlayed) "${stat.gamesPlayed}" else "-", width = 50.dp)
        TableCell(text = if (hasPlayed) String.format(java.util.Locale.US, "%.1f", stat.mpg) else "-", width = 55.dp)
        TableCell(text = if (hasPlayed) String.format(java.util.Locale.US, "%.1f", stat.ppg) else "-", width = 55.dp, isBold = hasPlayed)
        TableCell(text = if (hasPlayed) String.format(java.util.Locale.US, "%.1f", stat.rpg) else "-", width = 55.dp)
        TableCell(text = if (hasPlayed) String.format(java.util.Locale.US, "%.1f", stat.apg) else "-", width = 55.dp)
        TableCell(text = if (hasPlayed) String.format(java.util.Locale.US, "%.1f", stat.bpg) else "-", width = 55.dp)
        TableCell(text = if (hasPlayed) String.format(java.util.Locale.US, "%.1f", stat.spg) else "-", width = 55.dp)
        TableCell(text = if (hasPlayed) String.format(java.util.Locale.US, "%.2f", stat.avgPer) else "-", width = 60.dp, isBold = hasPlayed)
    }
}

@Composable
private fun TableCell(
    text: String,
    width: androidx.compose.ui.unit.Dp,
    isBold: Boolean = false,
    color: Color = Color.Unspecified
) {
    Text(
        text = text,
        fontSize = 11.sp,
        fontWeight = if (isBold) FontWeight.Bold else FontWeight.Normal,
        color = if (color != Color.Unspecified) color else MaterialTheme.colorScheme.onSurface,
        textAlign = TextAlign.Center,
        modifier = Modifier.width(width)
    )
}

