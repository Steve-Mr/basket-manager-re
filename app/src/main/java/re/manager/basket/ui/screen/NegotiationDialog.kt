package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.util.CurrencyUtils
import kotlin.math.max

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NegotiationDialog(
    player: PlayerEntity,
    currentCapSpace: Int,
    onDismiss: () -> Unit,
    onConfirm: (salary: Int, years: Int) -> Unit
) {
    var salary by remember { mutableStateOf(max(player.salary, 500000)) }
    var years by remember { mutableStateOf(max(player.yearsContract, 1)) }

    // Satisfaction Calculation: A simple formula based on player's value and offer
    val expectedSalary = (player.getValue() * 100000).toInt().coerceAtLeast(500000)
    val satisfaction = (salary.toFloat() / expectedSalary.toFloat() * 100).toInt()

    val canAfford = salary <= currentCapSpace
    val sheetState = rememberModalBottomSheetState()

    ModalBottomSheet(
        onDismissRequest = onDismiss,
        sheetState = sheetState
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 24.dp, vertical = 16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Text("向 ${player.name} 发送报价", style = MaterialTheme.typography.headlineSmall, fontWeight = FontWeight.Bold)
            Text("Player will consider the offer for a few days.", style = MaterialTheme.typography.bodyMedium)

            FinanceRow("Expected Salary", CurrencyUtils.formatCurrency(expectedSalary))
            FinanceRow("Cap Space", CurrencyUtils.formatCurrency(currentCapSpace))

            HorizontalDivider()

            Column {
                Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
                    Text("Salary", fontWeight = FontWeight.Bold)
                    Text(CurrencyUtils.formatCurrency(salary))
                }
                Slider(
                    value = salary.toFloat(),
                    onValueChange = { salary = it.toInt() },
                    valueRange = 500000f..(expectedSalary * 2f).coerceAtLeast(1000000f)
                )
            }

            Column {
                Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
                    Text("Years", fontWeight = FontWeight.Bold)
                    Text("$years y")
                }
                Slider(
                    value = years.toFloat(),
                    onValueChange = { years = it.toInt() },
                    valueRange = 1f..5f
                )
            }

            Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
                Text("Player Satisfaction", fontWeight = FontWeight.Bold)
                Text("$satisfaction%", color = if (satisfaction >= 100) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.error)
            }

            if (!canAfford) {
                Text("Warning: Offer exceeds salary cap!", color = MaterialTheme.colorScheme.error, style = MaterialTheme.typography.bodySmall)
            }

            Spacer(modifier = Modifier.height(16.dp))

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.End
            ) {
                TextButton(onClick = onDismiss) {
                    Text("Cancel")
                }
                Spacer(modifier = Modifier.width(8.dp))
                Button(
                    onClick = { onConfirm(salary, years) },
                    enabled = satisfaction >= 80 && canAfford
                ) {
                    Text("Send Offer")
                }
            }
            Spacer(modifier = Modifier.height(32.dp))
        }
    }
}
