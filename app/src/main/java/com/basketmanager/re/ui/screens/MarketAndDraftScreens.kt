package com.basketmanager.re.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.basketmanager.re.BasketManagerApplication
import com.basketmanager.re.domain.engine.FreeAgencyEngine
import com.basketmanager.re.domain.model.Player
import com.basketmanager.re.domain.model.Position
import com.basketmanager.re.ui.components.PlayerDetailBottomSheet
import com.basketmanager.re.ui.components.PositionBadge
import com.basketmanager.re.ui.components.RatingBadge
import com.basketmanager.re.ui.viewmodel.GameDashboardViewModel
import kotlinx.coroutines.launch

@Composable
fun FreeAgencyScreen(
    viewModel: GameDashboardViewModel
) {
    val repository = remember { BasketManagerApplication.instance.gameRepository }
    val scope = rememberCoroutineScope()
    val game by viewModel.game.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()

    var freeAgents by remember { mutableStateOf<List<Player>>(emptyList()) }
    var selectedPlayerForDetail by remember { mutableStateOf<Player?>(null) }
    var filterPos by remember { mutableStateOf<Position?>(null) }
    var signingPlayer by remember { mutableStateOf<Player?>(null) }

    LaunchedEffect(game) {
        val gId = game?.id ?: return@LaunchedEffect
        freeAgents = repository.getFreeAgents(gId).sortedByDescending { it.overallRating }
    }

    val filteredAgents = remember(freeAgents, filterPos) {
        if (filterPos == null) freeAgents else freeAgents.filter { it.positionFirst == filterPos || it.positionSecond == filterPos }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Text(
            text = "Free Agency Market",
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold
        )

        Spacer(modifier = Modifier.height(10.dp))

        // Position filter chips
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(6.dp)
        ) {
            FilterChip(selected = filterPos == null, onClick = { filterPos = null }, label = { Text("All") })
            listOf(Position.POINT_GUARD, Position.SHOOTING_GUARD, Position.SMALL_FORWARD, Position.POWER_FORWARD, Position.CENTER).forEach { p ->
                FilterChip(selected = filterPos == p, onClick = { filterPos = p }, label = { Text(p.shortName) })
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(filteredAgents) { player ->
                val expectedSal = FreeAgencyEngine.calculateExpectedSalary(player)
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { selectedPlayerForDetail = player },
                    shape = RoundedCornerShape(12.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(12.dp),
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(10.dp),
                            modifier = Modifier.weight(1f)
                        ) {
                            PositionBadge(position = player.positionFirst.shortName)
                            Column {
                                Text(player.name, fontWeight = FontWeight.Bold, style = MaterialTheme.typography.bodyLarge)
                                Text("Exp Salary: $${expectedSal / 1_000_000.0}M | Age ${player.age}", style = MaterialTheme.typography.bodySmall)
                            }
                        }

                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Button(
                                onClick = { signingPlayer = player },
                                shape = RoundedCornerShape(8.dp)
                            ) {
                                Text("Sign", fontSize = 12.sp)
                            }
                            RatingBadge(rating = player.overallRating)
                        }
                    }
                }
            }
        }
    }

    if (signingPlayer != null) {
        val sal = FreeAgencyEngine.calculateExpectedSalary(signingPlayer!!)
        AlertDialog(
            onDismissRequest = { signingPlayer = null },
            title = { Text("Sign Free Agent") },
            text = {
                Text("Offer contract to ${signingPlayer!!.name} for 2 years at $${sal / 1_000_000.0}M/year?")
            },
            confirmButton = {
                Button(
                    onClick = {
                        val p = signingPlayer!!
                        val t = userTeam ?: return@Button
                        scope.launch {
                            val success = repository.signFreeAgent(p.id, t.id, sal, 2)
                            signingPlayer = null
                            if (success && game != null) {
                                freeAgents = repository.getFreeAgents(game!!.id).sortedByDescending { it.overallRating }
                                viewModel.loadGame(game!!.id)
                            }
                        }
                    }
                ) {
                    Text("Confirm Signing")
                }
            },
            dismissButton = {
                TextButton(onClick = { signingPlayer = null }) {
                    Text("Cancel")
                }
            }
        )
    }

    if (selectedPlayerForDetail != null) {
        PlayerDetailBottomSheet(
            player = selectedPlayerForDetail,
            onDismiss = { selectedPlayerForDetail = null }
        )
    }
}

@Composable
fun DraftScreen(
    viewModel: GameDashboardViewModel
) {
    val repository = remember { BasketManagerApplication.instance.gameRepository }
    val game by viewModel.game.collectAsState()
    var prospects by remember { mutableStateOf<List<Player>>(emptyList()) }
    var selectedProspectForDetail by remember { mutableStateOf<Player?>(null) }

    LaunchedEffect(game) {
        val gId = game?.id ?: return@LaunchedEffect
        prospects = repository.getDraftProspects(gId)
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Text(
            text = "NBA Rookie Draft Board",
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = "Prospects Scouting & Rankings",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        Spacer(modifier = Modifier.height(12.dp))

        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(prospects) { prospect ->
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { selectedProspectForDetail = prospect },
                    shape = RoundedCornerShape(12.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(12.dp),
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(10.dp)
                        ) {
                            PositionBadge(position = prospect.positionFirst.shortName)
                            Column {
                                Text(prospect.name, fontWeight = FontWeight.Bold, style = MaterialTheme.typography.bodyLarge)
                                Text("Age: ${prospect.age} | Potential: ${prospect.potential}/10", style = MaterialTheme.typography.bodySmall)
                            }
                        }
                        RatingBadge(rating = prospect.overallRating)
                    }
                }
            }
        }
    }

    if (selectedProspectForDetail != null) {
        PlayerDetailBottomSheet(
            player = selectedProspectForDetail,
            onDismiss = { selectedProspectForDetail = null }
        )
    }
}
