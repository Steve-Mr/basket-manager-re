package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.SwapHoriz
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import top.maary.basketmanager.re.BasketManagerApplication
import top.maary.basketmanager.re.domain.engine.TradeEvaluationResult
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Team
import top.maary.basketmanager.re.domain.model.TradeProposal
import top.maary.basketmanager.re.ui.components.RatingBadge
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel
import kotlinx.coroutines.launch

@Composable
fun TradeScreen(
    viewModel: GameDashboardViewModel
) {
    val repository = remember { BasketManagerApplication.instance.gameRepository }
    val scope = rememberCoroutineScope()

    val userTeam by viewModel.userTeam.collectAsState()
    val allTeams by viewModel.allTeams.collectAsState()
    val userRoster by viewModel.userRoster.collectAsState()

    var selectedPartnerTeam by remember { mutableStateOf<Team?>(null) }
    var partnerRoster by remember { mutableStateOf<List<Player>>(emptyList()) }

    val selectedUserPlayers = remember { mutableStateListOf<Long>() }
    val selectedPartnerPlayers = remember { mutableStateListOf<Long>() }

    var tradeResult by remember { mutableStateOf<TradeEvaluationResult?>(null) }
    var showResultDialog by remember { mutableStateOf(false) }

    LaunchedEffect(allTeams, userTeam) {
        if (selectedPartnerTeam == null && allTeams.isNotEmpty()) {
            selectedPartnerTeam = allTeams.firstOrNull { it.id != userTeam?.id }
        }
    }

    LaunchedEffect(selectedPartnerTeam) {
        val partner = selectedPartnerTeam
        if (partner != null) {
            partnerRoster = repository.getTeamPlayers(partner.id)
            selectedPartnerPlayers.clear()
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "NBA Trade Machine",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold
            )

            Button(
                onClick = {
                    val uTeam = userTeam ?: return@Button
                    val pTeam = selectedPartnerTeam ?: return@Button
                    val proposal = TradeProposal(
                        teamAId = uTeam.id,
                        teamBId = pTeam.id,
                        teamAPlayerIds = selectedUserPlayers.toList(),
                        teamBPlayerIds = selectedPartnerPlayers.toList()
                    )
                    scope.launch {
                        val res = repository.executeTrade(proposal)
                        tradeResult = res
                        showResultDialog = true
                        if (res.isAccepted) {
                            selectedUserPlayers.clear()
                            selectedPartnerPlayers.clear()
                            viewModel.loadGame(uTeam.gameId)
                        }
                    }
                },
                enabled = selectedUserPlayers.isNotEmpty() && selectedPartnerPlayers.isNotEmpty(),
                shape = RoundedCornerShape(8.dp)
            ) {
                Icon(Icons.Default.SwapHoriz, contentDescription = null)
                Spacer(modifier = Modifier.width(4.dp))
                Text("Propose Trade")
            }
        }

        Spacer(modifier = Modifier.height(12.dp))

        // Partner Team Selector
        var teamDropdownExpanded by remember { mutableStateOf(false) }
        Box(modifier = Modifier.fillMaxWidth()) {
            OutlinedButton(
                onClick = { teamDropdownExpanded = true },
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(8.dp)
            ) {
                Text("Trading Partner: ${selectedPartnerTeam?.name ?: "Select Team"}")
            }
            DropdownMenu(
                expanded = teamDropdownExpanded,
                onDismissRequest = { teamDropdownExpanded = false }
            ) {
                allTeams.filter { it.id != userTeam?.id }.forEach { team ->
                    DropdownMenuItem(
                        text = { Text("${team.name} - Cap Space: $${(team.salaryCap / 1_000_000)}M") },
                        onClick = {
                            selectedPartnerTeam = team
                            teamDropdownExpanded = false
                        }
                    )
                }
            }
        }

        Spacer(modifier = Modifier.height(12.dp))

        // Trade Blocks: Left (User Team), Right (Partner Team)
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .weight(1f),
            horizontalArrangement = Arrangement.spacedBy(10.dp)
        ) {
            // User Team Column
            Card(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxHeight(),
                shape = RoundedCornerShape(12.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
            ) {
                Column(modifier = Modifier.padding(8.dp)) {
                    Text(
                        text = "${userTeam?.name ?: "My Team"} Assets",
                        fontWeight = FontWeight.Bold,
                        style = MaterialTheme.typography.titleSmall,
                        color = MaterialTheme.colorScheme.primary
                    )
                    Spacer(modifier = Modifier.height(6.dp))
                    LazyColumn(modifier = Modifier.fillMaxSize()) {
                        items(userRoster) { player ->
                            val isSelected = selectedUserPlayers.contains(player.id)
                            Card(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(vertical = 3.dp)
                                    .clickable {
                                        if (isSelected) selectedUserPlayers.remove(player.id)
                                        else if (selectedUserPlayers.size < 3) selectedUserPlayers.add(player.id)
                                    },
                                shape = RoundedCornerShape(8.dp),
                                colors = CardDefaults.cardColors(
                                    containerColor = if (isSelected) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surface
                                )
                            ) {
                                Row(
                                    modifier = Modifier.padding(6.dp),
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.SpaceBetween
                                ) {
                                    Column(modifier = Modifier.weight(1f)) {
                                        Text(player.shortName, fontWeight = FontWeight.Bold, fontSize = 12.sp)
                                        Text("$${player.salary / 1_000_000.0}M", fontSize = 10.sp)
                                    }
                                    RatingBadge(rating = player.overallRating, size = 26)
                                }
                            }
                        }
                    }
                }
            }

            // Partner Team Column
            Card(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxHeight(),
                shape = RoundedCornerShape(12.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
            ) {
                Column(modifier = Modifier.padding(8.dp)) {
                    Text(
                        text = "${selectedPartnerTeam?.name ?: "Opponent"} Assets",
                        fontWeight = FontWeight.Bold,
                        style = MaterialTheme.typography.titleSmall,
                        color = MaterialTheme.colorScheme.secondary
                    )
                    Spacer(modifier = Modifier.height(6.dp))
                    LazyColumn(modifier = Modifier.fillMaxSize()) {
                        items(partnerRoster) { player ->
                            val isSelected = selectedPartnerPlayers.contains(player.id)
                            Card(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(vertical = 3.dp)
                                    .clickable {
                                        if (isSelected) selectedPartnerPlayers.remove(player.id)
                                        else if (selectedPartnerPlayers.size < 3) selectedPartnerPlayers.add(player.id)
                                    },
                                shape = RoundedCornerShape(8.dp),
                                colors = CardDefaults.cardColors(
                                    containerColor = if (isSelected) MaterialTheme.colorScheme.secondaryContainer else MaterialTheme.colorScheme.surface
                                )
                            ) {
                                Row(
                                    modifier = Modifier.padding(6.dp),
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.SpaceBetween
                                ) {
                                    Column(modifier = Modifier.weight(1f)) {
                                        Text(player.shortName, fontWeight = FontWeight.Bold, fontSize = 12.sp)
                                        Text("$${player.salary / 1_000_000.0}M", fontSize = 10.sp)
                                    }
                                    RatingBadge(rating = player.overallRating, size = 26)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    if (showResultDialog && tradeResult != null) {
        AlertDialog(
            onDismissRequest = { showResultDialog = false },
            title = { Text(if (tradeResult!!.isAccepted) "Trade Accepted!" else "Trade Rejected") },
            text = { Text(tradeResult!!.reasonMessage) },
            confirmButton = {
                Button(onClick = { showResultDialog = false }) {
                    Text("OK")
                }
            }
        )
    }
}
