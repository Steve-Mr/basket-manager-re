package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.util.CurrencyUtils
import kotlin.math.max

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

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Sign ${player.name}") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(16.dp)) {
                Text("Offer details for the player to consider.")

                FinanceRow("Expected Salary", CurrencyUtils.formatCurrency(expectedSalary))
                FinanceRow("Cap Space", CurrencyUtils.formatCurrency(currentCapSpace))

                Divider()

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
            }
        },
        confirmButton = {
            Button(
                onClick = { onConfirm(salary, years) },
                enabled = satisfaction >= 80 && canAfford
            ) {
                Text("Send Offer")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
