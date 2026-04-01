package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.TacticEntity

@Composable
fun TacticScreen(tactic: TacticEntity, onUpdate: (TacticEntity) -> Unit) {
    Column(modifier = Modifier.padding(16.dp)) {
        Text("Team Tactics", style = MaterialTheme.typography.headlineMedium)
        Spacer(modifier = Modifier.height(24.dp))

        Text("Interior Shot Preference: ${tactic.shotIntPercent}%")
        Slider(
            value = tactic.shotIntPercent.toFloat(),
            onValueChange = { onUpdate(tactic.copy(shotIntPercent = it.toInt())) },
            valueRange = 0f..100f
        )

        Spacer(modifier = Modifier.height(16.dp))

        Text("Triple Shot Preference: ${tactic.shotTriplePercent}%")
        Slider(
            value = tactic.shotTriplePercent.toFloat(),
            onValueChange = { onUpdate(tactic.copy(shotTriplePercent = it.toInt())) },
            valueRange = 0f..100f
        )
    }
}
