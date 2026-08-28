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

@Composable
fun LeagueStatsScreen(
    viewModel: GameDashboardViewModel
) {
    val allPlayers by viewModel.allPlayers.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()
    val regularStatsList by viewModel.playerStatsList.collectAsState()
    val playoffStatsList by viewModel.playerPlayoffStatsList.collectAsState()

    var selectedTab by remember { mutableStateOf(0) } // 0: Top 100 Overall, 1: Top Rookies, 2: Stat Leaders
    var selectedPositionFilter by remember { mutableStateOf<Position?>(null) }
    var selectedLeaderCategory by remember { mutableStateOf("PTS") }
    var selectedStatsScope by remember { mutableStateOf(0) } // 0: Regular Season, 1: Playoffs

    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }

    val teamMap = remember(allTeams) { allTeams.associateBy { it.id } }

    val filteredTopPlayers = remember(allPlayers, selectedPositionFilter) {
        val pool = if (selectedPositionFilter != null) {
            allPlayers.filter { it.positionFirst == selectedPositionFilter || it.positionSecond == selectedPositionFilter }
        } else {
            allPlayers
        }
        pool.sortedByDescending { it.overallRating }.take(100)
    }

    val filteredTopRookies = remember(allPlayers, selectedPositionFilter) {
        val pool = allPlayers.filter { it.yearsExperience == 0 }
        val posFiltered = if (selectedPositionFilter != null) {
            pool.filter { it.positionFirst == selectedPositionFilter || it.positionSecond == selectedPositionFilter }
        } else {
            pool
        }
        posFiltered.sortedByDescending { it.overallRating }.take(100)
    }

    val activeStatsList = if (selectedStatsScope == 0) regularStatsList else playoffStatsList

    val currentGame by viewModel.game.collectAsState()
    val currentMatchday = currentGame?.currentMatchday ?: 1

    val statLeaders = remember(activeStatsList, selectedLeaderCategory, selectedStatsScope, currentMatchday) {
        val qualified = if (selectedStatsScope == 0) {
            // Authentic BM15 Qualification: MPG >= 15.0 and gamesPlayed >= max(3, currentMatchday / 10)
            val minGames = (currentMatchday / 10).coerceAtLeast(3)
            activeStatsList.filter { it.gamesPlayed >= minGames && it.mpg >= 15.0 }
        } else {
            // Playoff Qualification: at least 1 playoff game
            activeStatsList.filter { it.gamesPlayed >= 1 }
        }
        when (selectedLeaderCategory) {
            "PTS" -> qualified.sortedByDescending { it.ppg }.take(50)
            "REB" -> qualified.sortedByDescending { it.rpg }.take(50)
            "AST" -> qualified.sortedByDescending { it.apg }.take(50)
            "STL" -> qualified.sortedByDescending { it.spg }.take(50)
            "BLK" -> qualified.sortedByDescending { it.bpg }.take(50)
            "PER" -> qualified.sortedByDescending { it.avgPer }.take(50)
            else -> qualified.sortedByDescending { it.ppg }.take(50)
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp, vertical = 10.dp)
    ) {
        Text(
            text = "League Leaders & Rankings",
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = "Browse all-time superstars, rising rookies, and statistical leaders",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        Spacer(modifier = Modifier.height(10.dp))

        TabRow(
            selectedTabIndex = selectedTab,
            modifier = Modifier.clip(RoundedCornerShape(8.dp))
        ) {
            Tab(selected = selectedTab == 0, onClick = { selectedTab = 0 }, text = { Text("Top 100") })
            Tab(selected = selectedTab == 1, onClick = { selectedTab = 1 }, text = { Text("Rookies") })
            Tab(selected = selectedTab == 2, onClick = { selectedTab = 2 }, text = { Text("Leaders") })
        }

        Spacer(modifier = Modifier.height(10.dp))

        // Position Filter Chips for Tab 0 and Tab 1
        if (selectedTab == 0 || selectedTab == 1) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .horizontalScroll(rememberScrollState()),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                FilterChip(
                    selected = selectedPositionFilter == null,
                    onClick = { selectedPositionFilter = null },
                    label = { Text("ALL") }
                )
                listOf(Position.PG, Position.SG, Position.SF, Position.PF, Position.C).forEach { pos ->
                    FilterChip(
                        selected = selectedPositionFilter == pos,
                        onClick = { selectedPositionFilter = if (selectedPositionFilter == pos) null else pos },
                        label = { Text(pos.shortName) }
                    )
                }
            }
            Spacer(modifier = Modifier.height(8.dp))
        }

        when (selectedTab) {
            0 -> {
                val headerTitle = if (selectedPositionFilter == null) "Top 100 League Players"
                else "Top 100 ${selectedPositionFilter!!.shortName} Players"

                Row(
                    modifier = Modifier.fillMaxWidth().padding(bottom = 6.dp),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Text(text = headerTitle, style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.Bold)
                    Text(text = "${filteredTopPlayers.size} Players", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                }

                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    itemsIndexed(filteredTopPlayers) { index, player ->
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

            1 -> {
                val headerTitle = if (selectedPositionFilter == null) "Top Rookie Candidates"
                else "Top Rookie ${selectedPositionFilter!!.shortName} Candidates"

                Row(
                    modifier = Modifier.fillMaxWidth().padding(bottom = 6.dp),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Text(text = headerTitle, style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.Bold)
                    Text(text = "${filteredTopRookies.size} Rookies", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                }

                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    itemsIndexed(filteredTopRookies) { index, player ->
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
                    // Regular vs Playoff Scope Selector
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        TabRow(
                            selectedTabIndex = selectedStatsScope,
                            modifier = Modifier.width(220.dp).clip(RoundedCornerShape(6.dp))
                        ) {
                            Tab(selected = selectedStatsScope == 0, onClick = { selectedStatsScope = 0 }, text = { Text("Regular", fontSize = 12.sp) })
                            Tab(selected = selectedStatsScope == 1, onClick = { selectedStatsScope = 1 }, text = { Text("Playoffs", fontSize = 12.sp) })
                        }

                        Text(
                            text = "${statLeaders.size} Qualifiers",
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }

                    Spacer(modifier = Modifier.height(10.dp))

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

                    if (statLeaders.isNotEmpty()) {
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
                    } else {
                        Box(
                            modifier = Modifier.fillMaxSize().padding(32.dp),
                            contentAlignment = Alignment.Center
                        ) {
                            Text(
                                text = if (selectedStatsScope == 0) "No regular season game stats recorded yet"
                                else "Playoffs have not started yet (Day 167+)",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
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
