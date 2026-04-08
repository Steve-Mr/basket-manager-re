package re.manager.basket.ui.screen

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.Send
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.DraftPickEntity
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TeamEntity
import re.manager.basket.ui.viewmodel.MarketViewModel
import re.manager.basket.ui.viewmodel.TradeOffer
import re.manager.basket.util.CurrencyUtils
import kotlinx.coroutines.launch

@Composable
fun TradeScreen(
    userTeamId: Int,
    marketViewModel: MarketViewModel,
    userPlayers: List<PlayerEntity>
) {
    val otherTeams by marketViewModel.otherTeams.collectAsState()
    val selectedTradeTeamId by marketViewModel.selectedTradeTeamId.collectAsState()
    val tradeTeamPlayers by marketViewModel.tradeTeamPlayers.collectAsState()
    val tradeTeamPicks by marketViewModel.tradeTeamPicks.collectAsState()
    val userTeamPicks by marketViewModel.userTeamPicks.collectAsState()
    val tradeOffers by marketViewModel.tradeOffers.collectAsState()

    var selectedUserPlayers by remember { mutableStateOf(setOf<Int>()) }
    var selectedUserPicks by remember { mutableStateOf(setOf<Int>()) }
    var selectedTradePlayers by remember { mutableStateOf(setOf<Int>()) }
    var selectedTradePicks by remember { mutableStateOf(setOf<Int>()) }

    var tradeResult by remember { mutableStateOf<String?>(null) }
    var showShopDialog by remember { mutableStateOf(false) }
    val scope = rememberCoroutineScope()

    Column(modifier = Modifier.fillMaxSize().padding(16.dp)) {
        Text("Trade Center", style = MaterialTheme.typography.headlineMedium)
        Spacer(modifier = Modifier.height(16.dp))

        // Multi-Asset Shopping Section
        Button(
            onClick = {
                marketViewModel.shopAssets(
                    userPlayers.filter { selectedUserPlayers.contains(it.id) },
                    userTeamPicks.filter { selectedUserPicks.contains(it.id) }
                )
                showShopDialog = true
            },
            modifier = Modifier.fillMaxWidth(),
            enabled = selectedUserPlayers.isNotEmpty() || selectedUserPicks.isNotEmpty(),
            colors = ButtonDefaults.buttonColors(containerColor = MaterialTheme.colorScheme.secondary)
        ) {
            Icon(Icons.Default.Search, null)
            Spacer(Modifier.width(8.dp))
            Text("Shop Selected Assets (Get Offers)")
        }

        Spacer(modifier = Modifier.height(16.dp))
        HorizontalDivider()
        Spacer(modifier = Modifier.height(16.dp))

        // Team Selector for manual trade
        var expanded by remember { mutableStateOf(false) }
        val selectedTeam = otherTeams.find { it.id == selectedTradeTeamId }
        Box {
            OutlinedButton(onClick = { expanded = true }, modifier = Modifier.fillMaxWidth()) {
                Text(selectedTeam?.fullName ?: "Select Team for Manual Trade")
            }
            DropdownMenu(expanded = expanded, onDismissRequest = { expanded = false }) {
                otherTeams.forEach { team ->
                    DropdownMenuItem(
                        text = { Text(team.fullName) },
                        onClick = {
                            marketViewModel.selectTradeTeam(team.id)
                            expanded = false
                            selectedTradePlayers = emptySet()
                            selectedTradePicks = emptySet()
                        }
                    )
                }
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        Row(modifier = Modifier.weight(1f)) {
            // User Side
            Column(modifier = Modifier.weight(1f).padding(end = 8.dp)) {
                Text("Your Assets", fontWeight = FontWeight.Bold)
                AssetList(
                    players = userPlayers,
                    picks = userTeamPicks,
                    selectedPlayers = selectedUserPlayers,
                    selectedPicks = selectedUserPicks,
                    onPlayerToggle = { id ->
                        selectedUserPlayers = if (selectedUserPlayers.contains(id)) selectedUserPlayers - id else if (selectedUserPlayers.size < 3) selectedUserPlayers + id else selectedUserPlayers
                    },
                    onPickToggle = { id ->
                        selectedUserPicks = if (selectedUserPicks.contains(id)) selectedUserPicks - id else if (selectedUserPicks.size + selectedUserPlayers.size < 3) selectedUserPicks + id else selectedUserPicks
                    }
                )
            }

            // Trade Partner Side
            Column(modifier = Modifier.weight(1f).padding(start = 8.dp)) {
                Text("${selectedTeam?.name ?: "Partner"} Assets", fontWeight = FontWeight.Bold)
                if (selectedTradeTeamId != null) {
                    AssetList(
                        players = tradeTeamPlayers,
                        picks = tradeTeamPicks,
                        selectedPlayers = selectedTradePlayers,
                        selectedPicks = selectedTradePicks,
                        onPlayerToggle = { id ->
                            selectedTradePlayers = if (selectedTradePlayers.contains(id)) selectedTradePlayers - id else if (selectedTradePlayers.size < 3) selectedTradePlayers + id else selectedTradePlayers
                        },
                        onPickToggle = { id ->
                            selectedTradePicks = if (selectedTradePicks.contains(id)) selectedTradePicks - id else if (selectedTradePicks.size + selectedTradePlayers.size < 3) selectedTradePicks + id else selectedTradePicks
                        }
                    )
                } else {
                    Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                        Text("Select team above", style = MaterialTheme.typography.bodySmall)
                    }
                }
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        Button(
            onClick = {
                    val userValue = userPlayers.filter { selectedUserPlayers.contains(it.id) }.sumOf { it.getValue() } +
                                   userTeamPicks.filter { selectedUserPicks.contains(it.id) }.sumOf { if (it.round == 1) 15.0 else 5.0 }
                    val tradeValue = tradeTeamPlayers.filter { selectedTradePlayers.contains(it.id) }.sumOf { it.getValue() } +
                                    tradeTeamPicks.filter { selectedTradePicks.contains(it.id) }.sumOf { if (it.round == 1) 15.0 else 5.0 }

                if (userValue >= tradeValue * 1.1) {
                    scope.launch {
                        marketViewModel.executeTrade(
                            userTeamId = userTeamId,
                            targetTeamId = selectedTradeTeamId!!,
                            userPlayers = userPlayers.filter { selectedUserPlayers.contains(it.id) },
                            targetPlayers = tradeTeamPlayers.filter { selectedTradePlayers.contains(it.id) },
                            userPicks = userTeamPicks.filter { selectedUserPicks.contains(it.id) },
                            targetPicks = tradeTeamPicks.filter { selectedTradePicks.contains(it.id) }
                        )
                    }
                    tradeResult = "Trade Accepted!"
                    selectedUserPlayers = emptySet(); selectedUserPicks = emptySet()
                    selectedTradePlayers = emptySet(); selectedTradePicks = emptySet()
                } else {
                    tradeResult = "Trade Rejected. Insufficient value."
                }
            },
            modifier = Modifier.fillMaxWidth(),
            enabled = selectedTradeTeamId != null && (selectedUserPlayers.isNotEmpty() || selectedUserPicks.isNotEmpty()) && (selectedTradePlayers.isNotEmpty() || selectedTradePicks.isNotEmpty())
        ) {
            Icon(Icons.AutoMirrored.Filled.Send, null)
            Spacer(Modifier.width(8.dp))
            Text("Propose Manual Trade")
        }
    }

    if (showShopDialog) {
        AlertDialog(
            onDismissRequest = { showShopDialog = false; marketViewModel.clearShopOffers() },
            title = { Text("AI Offers for Your Assets") },
            text = {
                if (tradeOffers.isEmpty()) {
                    Text("Searching for comparable deals...")
                } else {
                    LazyColumn(modifier = Modifier.heightIn(max = 400.dp)) {
                        items(tradeOffers) { offer ->
                            Card(modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp)) {
                                Row(modifier = Modifier.padding(12.dp), verticalAlignment = Alignment.CenterVertically) {
                                    Column(modifier = Modifier.weight(1f)) {
                                        Text(offer.team.name, fontWeight = FontWeight.Bold)
                                        offer.players.forEach { p -> Text(p.name, style = MaterialTheme.typography.bodySmall) }
                                        offer.picks.forEach { p -> Text("R${p.round} (${p.year})", style = MaterialTheme.typography.bodySmall) }
                                    }
                                    Button(onClick = {
                                        marketViewModel.acceptShopOffer(
                                            offer,
                                            userPlayers.filter { selectedUserPlayers.contains(it.id) },
                                            userTeamPicks.filter { selectedUserPicks.contains(it.id) }
                                        )
                                        selectedUserPlayers = emptySet(); selectedUserPicks = emptySet()
                                        showShopDialog = false
                                    }) {
                                        Text("Accept")
                                    }
                                }
                            }
                        }
                    }
                }
            },
            confirmButton = { TextButton(onClick = { showShopDialog = false }) { Text("Close") } }
        )
    }

    if (tradeResult != null) {
        AlertDialog(
            onDismissRequest = { tradeResult = null },
            confirmButton = { Button(onClick = { tradeResult = null }) { Text("OK") } },
            title = { Text("Trade Result") },
            text = { Text(tradeResult!!) }
        )
    }
}

@Composable
fun AssetList(
    players: List<PlayerEntity>,
    picks: List<DraftPickEntity>,
    selectedPlayers: Set<Int>,
    selectedPicks: Set<Int>,
    onPlayerToggle: (Int) -> Unit,
    onPickToggle: (Int) -> Unit
) {
    LazyColumn(modifier = Modifier.fillMaxSize()) {
        item { Text("Players", style = MaterialTheme.typography.labelSmall) }
        items(players) { player ->
            AssetItem(
                label = player.name,
                subLabel = "Avg: ${player.getAverageSkillAll().toInt()}",
                isSelected = selectedPlayers.contains(player.id),
                onClick = { onPlayerToggle(player.id) }
            )
        }
        item { Spacer(Modifier.height(8.dp)) }
        item { Text("Picks", style = MaterialTheme.typography.labelSmall) }
        items(picks) { pick ->
            AssetItem(
                label = "R${pick.round} (${pick.year})",
                subLabel = "Orig: ${re.manager.basket.domain.model.Constants.INITIAL_SALARY_CAPS.keys.toList().getOrNull(pick.originalTeamId - 1) ?: pick.originalTeamId}",
                isSelected = selectedPicks.contains(pick.id),
                onClick = { onPickToggle(pick.id) }
            )
        }
    }
}

@Composable
fun AssetItem(label: String, subLabel: String, isSelected: Boolean, onClick: () -> Unit) {
    Card(
        modifier = Modifier.fillMaxWidth().padding(vertical = 2.dp).clickable { onClick() },
        colors = CardDefaults.cardColors(
            containerColor = if (isSelected) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(modifier = Modifier.padding(8.dp)) {
            Text(label, style = MaterialTheme.typography.bodySmall, fontWeight = FontWeight.Bold, maxLines = 1)
            Text(subLabel, style = MaterialTheme.typography.labelSmall)
        }
    }
}
