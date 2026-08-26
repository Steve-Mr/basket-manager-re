package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
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
import top.maary.basketmanager.re.ui.components.PlayerDetailBottomSheet
import top.maary.basketmanager.re.ui.components.PositionBadge
import top.maary.basketmanager.re.ui.components.RatingBadge
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel
import top.maary.basketmanager.re.ui.viewmodel.PlayerSeasonStats

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LeagueStatsScreen(
    viewModel: GameDashboardViewModel
) {
    val allPlayers by viewModel.allPlayers.collectAsState()
    val playerStats by viewModel.playerStatsList.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()

    var selectedTab by remember { mutableStateOf(0) } // 0: Top 100 MVP, 1: Top Rookies, 2: Stat Leaders
    var selectedLeaderCategory by remember { mutableStateOf("PTS") } // PTS, REB, AST, STL, BLK, PER
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }

    val teamMap = remember(allTeams) { allTeams.associateBy { it.id } }

    val top100Players = remember(allPlayers) {
        allPlayers.filter { it.teamId != null && it.teamId!! > 0 }
            .sortedByDescending { it.overallRating }
            .take(100)
    }

    val topRookies = remember(allPlayers) {
        allPlayers.filter { it.teamId != null && it.teamId!! > 0 && it.yearsExperience == 0 }
            .sortedByDescending { it.overallRating }
            .take(50)
    }

    val statLeaders = remember(playerStats, selectedLeaderCategory) {
        when (selectedLeaderCategory) {
            "PTS" -> playerStats.sortedByDescending { it.ppg }
            "REB" -> playerStats.sortedByDescending { it.rpg }
            "AST" -> playerStats.sortedByDescending { it.apg }
            "STL" -> playerStats.sortedByDescending { it.spg }
            "BLK" -> playerStats.sortedByDescending { it.bpg }
            "PER" -> playerStats.sortedByDescending { it.avgPer }
            else -> playerStats.sortedByDescending { it.ppg }
        }.take(50)
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Text(
            text = "League Leaders & Rankings",
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = "Top 100 MVP race, ROY candidates, and statistical leaders",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        Spacer(modifier = Modifier.height(12.dp))

        // Navigation Tabs
        PrimaryTabRow(selectedTabIndex = selectedTab) {
            Tab(
                selected = selectedTab == 0,
                onClick = { selectedTab = 0 },
                text = { Text("Top 100 MVP") }
            )
            Tab(
                selected = selectedTab == 1,
                onClick = { selectedTab = 1 },
                text = { Text("Top Rookies") }
            )
            Tab(
                selected = selectedTab == 2,
                onClick = { selectedTab = 2 },
                text = { Text("Stat Leaders") }
            )
        }

        Spacer(modifier = Modifier.height(10.dp))

        when (selectedTab) {
            0 -> {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    itemsIndexed(top100Players) { index, player ->
                        val team = teamMap[player.teamId]
                        LeaguePlayerRankRow(
                            rank = index + 1,
                            player = player,
                            teamName = team?.name ?: "FA",
                            trailingText = "OVR: ${player.overallRating}",
                            onClick = { selectedPlayerForDetail = player }
                        )
                    }
                }
            }

            1 -> {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    itemsIndexed(topRookies) { index, player ->
                        val team = teamMap[player.teamId]
                        LeaguePlayerRankRow(
                            rank = index + 1,
                            player = player,
                            teamName = team?.name ?: "FA",
                            trailingText = "Pot: ★${player.potential}",
                            onClick = { selectedPlayerForDetail = player }
                        )
                    }
                }
            }

            2 -> {
                Column(modifier = Modifier.fillMaxSize()) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .horizontalScroll(rememberScrollState()),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        listOf(
                            "PTS" to "Points (PPG)",
                            "REB" to "Rebounds (RPG)",
                            "AST" to "Assists (APG)",
                            "STL" to "Steals (SPG)",
                            "BLK" to "Blocks (BPG)",
                            "PER" to "PER Efficiency"
                        ).forEach { (cat, label) ->
                            FilterChip(
                                selected = selectedLeaderCategory == cat,
                                onClick = { selectedLeaderCategory = cat },
                                label = { Text(label) }
                            )
                        }
                    }

                    Spacer(modifier = Modifier.height(10.dp))

                    LazyColumn(
                        modifier = Modifier.fillMaxSize(),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        itemsIndexed(statLeaders) { index, stat ->
                            val team = teamMap[stat.player.teamId]
                            val statVal = when (selectedLeaderCategory) {
                                "PTS" -> String.format("%.1f PPG", stat.ppg)
                                "REB" -> String.format("%.1f RPG", stat.rpg)
                                "AST" -> String.format("%.1f APG", stat.apg)
                                "STL" -> String.format("%.1f SPG", stat.spg)
                                "BLK" -> String.format("%.1f BPG", stat.bpg)
                                "PER" -> String.format("%.1f PER", stat.avgPer)
                                else -> String.format("%.1f", stat.ppg)
                            }
                            LeaguePlayerRankRow(
                                rank = index + 1,
                                player = stat.player,
                                teamName = team?.name ?: "FA",
                                trailingText = "$statVal (${stat.gamesPlayed} GP)",
                                onClick = { selectedPlayerForDetail = stat.player }
                            )
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
fun LeaguePlayerRankRow(
    rank: Int,
    player: Player,
    teamName: String,
    trailingText: String,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(10.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 12.dp, vertical = 8.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(10.dp)
            ) {
                Surface(
                    shape = CircleShape,
                    color = when (rank) {
                        1 -> Color(0xFFFFD700)
                        2 -> Color(0xFFC0C0C0)
                        3 -> Color(0xFFCD7F32)
                        else -> MaterialTheme.colorScheme.surface
                    },
                    modifier = Modifier.size(28.dp)
                ) {
                    Box(contentAlignment = Alignment.Center) {
                        Text(
                            text = "#$rank",
                            fontWeight = FontWeight.ExtraBold,
                            fontSize = 11.sp,
                            color = if (rank <= 3) Color.Black else MaterialTheme.colorScheme.onSurface
                        )
                    }
                }

                RatingBadge(rating = player.overallRating)

                Column {
                    Text(text = player.name, fontWeight = FontWeight.Bold, fontSize = 14.sp)
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(6.dp)
                    ) {
                        PositionBadge(position = player.positionFirst)
                        Surface(
                            shape = RoundedCornerShape(4.dp),
                            color = MaterialTheme.colorScheme.primaryContainer
                        ) {
                            Text(
                                text = teamName,
                                fontSize = 10.sp,
                                fontWeight = FontWeight.ExtraBold,
                                modifier = Modifier.padding(horizontal = 4.dp, vertical = 2.dp)
                            )
                        }
                    }
                }
            }

            Text(
                text = trailingText,
                fontWeight = FontWeight.ExtraBold,
                color = MaterialTheme.colorScheme.primary,
                fontSize = 13.sp
            )
        }
    }
}
