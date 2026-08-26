package top.maary.basketmanager.re.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import top.maary.basketmanager.re.domain.model.Tactic
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel

@Composable
fun TacticsScreen(
    viewModel: GameDashboardViewModel
) {
    val tacticState by viewModel.userTactic.collectAsState()
    val tactic = tacticState ?: Tactic()

    var gameType by remember(tactic) { mutableFloatStateOf(tactic.gameType.toFloat()) }
    var benchImportance by remember(tactic) { mutableFloatStateOf(tactic.benchImportance.toFloat()) }
    var shotIntPercent by remember(tactic) { mutableFloatStateOf(tactic.shotInteriorPercent.toFloat()) }
    var shotTriplePercent by remember(tactic) { mutableFloatStateOf(tactic.shotTriplePercent.toFloat()) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text(
            text = "Team Tactics & Strategy",
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold
        )

        // 1. Game Pace & Style
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Text(
                    text = "Pace & Game Style",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = when {
                        gameType.toInt() < -1 -> "Very Conservative / Defense Focus (+Defense, -Attack)"
                        gameType.toInt() == -1 -> "Conservative / Control Pace"
                        gameType.toInt() == 0 -> "Balanced Tempo"
                        gameType.toInt() == 1 -> "Fast Pace / Attack Focus"
                        else -> "Aggressive / Run & Gun (+Attack, -Defense)"
                    },
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.primary
                )
                Slider(
                    value = gameType,
                    onValueChange = { gameType = it },
                    valueRange = -2f..2f,
                    steps = 3,
                    onValueChangeFinished = {
                        viewModel.updateTactic(tactic.copy(gameType = gameType.toInt()))
                    }
                )
            }
        }

        // 2. Bench Rotation Importance
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Text(
                    text = "Bench Rotation Depth: Level ${benchImportance.toInt()}",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = when (benchImportance.toInt()) {
                        1 -> "Starters heavy (38+ mins). High starter fatigue."
                        2 -> "Moderate starter minutes (34 mins)."
                        3 -> "Balanced rotation (Starters 30m, Bench 18m)."
                        4 -> "Deep bench usage (Starters 26m, Bench 22m)."
                        else -> "Equal sharing (Starters 24m, Bench 24m). Low fatigue."
                    },
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.secondary
                )
                Slider(
                    value = benchImportance,
                    onValueChange = { benchImportance = it },
                    valueRange = 1f..5f,
                    steps = 3,
                    onValueChangeFinished = {
                        viewModel.updateTactic(tactic.copy(benchImportance = benchImportance.toInt()))
                    }
                )
            }
        }

        // 3. Inside Shot Percentage
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Text(
                    text = "Interior Paint Attempts: ${shotIntPercent.toInt()}%",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Slider(
                    value = shotIntPercent,
                    onValueChange = { shotIntPercent = it },
                    valueRange = 35f..45f,
                    steps = 9,
                    onValueChangeFinished = {
                        viewModel.updateTactic(tactic.copy(shotInteriorPercent = shotIntPercent.toInt()))
                    }
                )
            }
        }

        // 4. 3-Point Shot Percentage
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Text(
                    text = "3-Point Attempts: ${shotTriplePercent.toInt()}%",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Slider(
                    value = shotTriplePercent,
                    onValueChange = { shotTriplePercent = it },
                    valueRange = 35f..45f,
                    steps = 9,
                    onValueChangeFinished = {
                        viewModel.updateTactic(tactic.copy(shotTriplePercent = shotTriplePercent.toInt()))
                    }
                )
            }
        }
    }
}
