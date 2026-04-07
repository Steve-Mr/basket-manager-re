package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.MatchResultEntity
import re.manager.basket.ui.viewmodel.MarketViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlayerDetailScreen(
    player: PlayerEntity,
    stats: List<MatchResultEntity>,
    marketViewModel: MarketViewModel? = null,
    onTogglePosition: () -> Unit = {},
    onBack: () -> Unit
) {
    val tradeOffers by marketViewModel?.tradeOffers?.collectAsState() ?: remember { mutableStateOf(emptyList()) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(player.name) },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            item {
                Text("Basic Information", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
                Card(modifier = Modifier.fillMaxWidth()) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween, verticalAlignment = androidx.compose.ui.Alignment.CenterVertically) {
                            Column {
                                Text("Age: ${player.age}")
                                Text("Exp: ${player.yearsExperience}y")
                                player.teamId?.let { Text("Team ID: $it") }
                            }

                            val starIcon = when {
                                player.potential >= 9 -> "star6"
                                player.potential >= 7 -> "star5"
                                player.potential >= 5 -> "star4"
                                player.potential >= 3 -> "star3"
                                player.potential >= 1 -> "star2"
                                else -> "star1"
                            }
                            val context = androidx.compose.ui.platform.LocalContext.current
                            val resId = context.resources.getIdentifier(starIcon, "drawable", context.packageName)
                            if (resId != 0) {
                                Column(horizontalAlignment = androidx.compose.ui.Alignment.CenterHorizontally) {
                                    Icon(
                                        painter = painterResource(id = resId),
                                        contentDescription = "Potential",
                                        modifier = Modifier.size(48.dp),
                                        tint = androidx.compose.ui.graphics.Color.Unspecified
                                    )
                                    Text("Potential", style = MaterialTheme.typography.labelSmall)
                                }
                            }
                        }

                        Spacer(modifier = Modifier.height(8.dp))

                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                        ) {
                            val activePos = if (player.primaryPositionActive) player.positionFirst else player.positionSecond
                            Text("Position: $activePos (Active)", fontWeight = FontWeight.Bold)
                            if (player.positionSecond != re.manager.basket.domain.model.Position.NONE) {
                                FilledTonalButton(onClick = onTogglePosition) {
                                    Text("Switch Position")
                                }
                            }
                        }

                        Spacer(modifier = Modifier.height(8.dp))
                        Row(verticalAlignment = androidx.compose.ui.Alignment.CenterVertically) {
                            Text("Rating: ${player.getAverageSkillAll().toInt()}", style = MaterialTheme.typography.headlineMedium, color = MaterialTheme.colorScheme.primary)
                            Spacer(Modifier.weight(1f))
                            // ONLY show Shop Player if player belongs to a team (can be traded)
                            if (player.teamId != null) {
                                Button(onClick = { marketViewModel?.shopPlayer(player) }) {
                                    Text("Shop Player")
                                }
                            }
                        }
                    }
                }
            }

            if (tradeOffers.isNotEmpty()) {
                item {
                    Text("Trade Offers (Accept to Trade Away)", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.secondary)
                    tradeOffers.forEach { offer ->
                        Card(modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp)) {
                            Row(modifier = Modifier.padding(16.dp), verticalAlignment = androidx.compose.ui.Alignment.CenterVertically) {
                                Column(modifier = Modifier.weight(1f)) {
                                    Text(offer.team.name, fontWeight = FontWeight.Bold)
                                    offer.players.forEach { p -> Text(p.name, style = MaterialTheme.typography.bodySmall) }
                                    offer.picks.forEach { p -> Text("R${p.round} (${p.year})", style = MaterialTheme.typography.bodySmall) }
                                }
                                Button(onClick = {
                                    marketViewModel?.acceptShopOffer(offer, player)
                                    onBack()
                                }) {
                                    Text("Accept Deal")
                                }
                            }
                        }
                    }
                    TextButton(onClick = { marketViewModel?.clearShopOffers() }, modifier = Modifier.fillMaxWidth()) {
                        Text("Clear Offers")
                    }
                }
            }

            item {
                Text("Skills", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
                Card(modifier = Modifier.fillMaxWidth()) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        SkillRow("Physique", player.skillPhysique)
                        SkillRow("Shot Interior", player.skillShotInterior)
                        SkillRow("Shot Exterior", player.skillShotExterior)
                        SkillRow("Shot Free", player.skillShotFree)
                        SkillRow("Pass", player.skillPass)
                        SkillRow("Rebound", player.skillRebound)
                        SkillRow("Steal", player.skillSteal)
                        SkillRow("Block", player.skillBlock)
                    }
                }
            }

            item {
                Text("Season Statistics", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Bold)
            }

            val statsBySeason = stats.filter { it.minutesPlayed > 0 }.groupBy { it.season }
            if (statsBySeason.isEmpty()) {
                item {
                    Text("No games played yet.", style = MaterialTheme.typography.bodyMedium)
                }
            } else {
                statsBySeason.keys.sortedDescending().forEach { season ->
                    val filteredStats = statsBySeason[season] ?: emptyList()
                    item {
                        Text("Season $season", style = MaterialTheme.typography.titleMedium, color = MaterialTheme.colorScheme.primary)
                        val games = filteredStats.size
                        val avgPts = filteredStats.sumOf { it.points }.toFloat() / games
                        val avgReb = filteredStats.sumOf { (it.rebounds + 0.5).toInt() }.toFloat() / games
                        val avgAst = filteredStats.sumOf { (it.assists + 0.5).toInt() }.toFloat() / games
                        val avgStl = filteredStats.sumOf { (it.steals + 0.5).toInt() }.toFloat() / games
                        val avgBlk = filteredStats.sumOf { (it.blocks + 0.5).toInt() }.toFloat() / games
                        val avgPer = filteredStats.sumOf { it.getPer() }.toFloat() / games

                        Card(modifier = Modifier.fillMaxWidth()) {
                            Column(modifier = Modifier.padding(16.dp)) {
                                Text("Games Played: $games")
                                Text("PPG: %.1f".format(avgPts))
                                Text("RPG: %.1f".format(avgReb))
                                Text("APG: %.1f".format(avgAst))
                                Text("SPG: %.1f".format(avgStl))
                                Text("BPG: %.1f".format(avgBlk))
                                Text("PER: %.2f".format(avgPer))
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun SkillRow(label: String, value: Int) {
    Column(modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp)) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text(label)
            Text(value.toString(), fontWeight = FontWeight.Bold, color = if (value >= 80) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurface)
        }
        LinearProgressIndicator(
            progress = { (value.toFloat() / 100f).coerceIn(0f, 1f) },
            modifier = Modifier.fillMaxWidth().height(4.dp),
            color = if (value >= 80) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.secondary
        )
    }
}
