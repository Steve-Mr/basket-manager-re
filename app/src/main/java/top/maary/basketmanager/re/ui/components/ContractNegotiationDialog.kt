package top.maary.basketmanager.re.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
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
import top.maary.basketmanager.re.domain.model.Position
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.theme.RatingRed
import kotlin.math.pow
import kotlin.math.roundToInt
import kotlin.random.Random

object ContractEngine {
    fun calculateMarketDemandSalary(
        player: Player,
        isHomeTeamRenewal: Boolean = true
    ): Pair<Int, Int> { // (negotiationBase, openMarketValue)
        val ovr = player.overallRating.toDouble()
        val subAvg = (ovr - 40.0).coerceAtLeast(0.0)
        val age = player.age
        val potential = player.potential
        val pos2Bonus = if (player.positionSecond != Position.NONE) 1.10 else 1.0

        var baseVal = (120.0 * ((subAvg.pow(4) / 400.0) * ((40 - age) + (potential * 2) + 75))) / 100.0
        baseVal *= pos2Bonus
        val rawSalary = (baseVal * 10.0).toInt()
        val openMarketValue = ((rawSalary / 100_000) * 100_000).coerceIn(1_000_000, 42_000_000)

        val negotiationBase = if (isHomeTeamRenewal) {
            // Authentic BM15 Hometown 80% Discount factor + Loyalty loyalty bonus
            val discountFactor = when (player.loyalty) {
                5 -> 0.72 // Super loyal franchise icon
                4 -> 0.76
                3 -> 0.80 // Standard BM15 home discount
                2 -> 0.85
                else -> 0.90
            }
            val discounted = (openMarketValue * discountFactor).toInt()
            ((discounted / 100_000) * 100_000).coerceIn(1_000_000, 36_000_000)
        } else {
            openMarketValue
        }

        return Pair(negotiationBase, openMarketValue)
    }

    fun evaluateContractOffer(
        player: Player,
        offeredSalary: Int,
        offeredYears: Int,
        isHomeTeamRenewal: Boolean = true
    ): Pair<Boolean, String> {
        val (marketBase, openMarket) = calculateMarketDemandSalary(player, isHomeTeamRenewal)
        val ratio = offeredSalary.toDouble() / marketBase.toDouble()

        val tier = when {
            ratio >= 1.20 -> 4
            ratio >= 1.08 -> 3
            ratio >= 0.92 -> 2
            ratio >= 0.80 -> 1
            else -> 0
        }

        val roll = Random.nextInt(0, 10)
        val threshold = (player.loyalty + tier).coerceIn(1, 9)
        val accepted = roll < threshold

        fun formatMoney(a: Int) = if (a >= 1_000_000) "$${String.format("%.2f", a / 1_000_000.0)}M" else "$${a / 1_000}K"

        val msg = if (accepted) {
            val discountNote = if (isHomeTeamRenewal && offeredSalary < openMarket) {
                " (Includes a team-friendly hometown discount from his open market身价 of ${formatMoney(openMarket)}/yr)"
            } else ""
            "${player.name} has ACCEPTED your contract extension offer of ${formatMoney(offeredSalary)}/yr for $offeredYears year(s)!$discountNote"
        } else {
            val demandTip = when (tier) {
                0, 1 -> "He feels this offer is below his expectations and requests at least ${formatMoney(marketBase)}/yr."
                2 -> "He is leaning towards testing Free Agency (open market worth ~${formatMoney(openMarket)}/yr) unless offered a slight raise."
                else -> "Negotiations stalled. Consider adjusting the contract term length or adding compensation."
            }
            "${player.name} has REJECTED your contract offer.\n\n$demandTip"
        }

        return Pair(accepted, msg)
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ContractNegotiationDialog(
    player: Player,
    isHomeTeamRenewal: Boolean = true,
    onDismiss: () -> Unit,
    onConfirmOffer: (years: Int, salary: Int, accepted: Boolean, feedbackMessage: String) -> Unit
) {
    val (marketSalary, openMarketSalary) = remember(player, isHomeTeamRenewal) {
        ContractEngine.calculateMarketDemandSalary(player, isHomeTeamRenewal)
    }
    var selectedYears by remember { mutableIntStateOf(if (player.age >= 34) 2 else 3) }

    val marketM = marketSalary / 1_000_000f
    val sliderMin = (marketM * 0.6f).coerceAtLeast(0.8f)
    val sliderMax = (marketM * 1.5f).coerceIn(2.5f, 42.0f)
    val sliderSteps = ((sliderMax - sliderMin) / 0.1f).roundToInt().coerceAtLeast(1)

    var offeredSalaryFloat by remember { mutableFloatStateOf(marketM) }

    val currentOfferedSalaryInt = ((offeredSalaryFloat * 10).roundToInt() * 100_000).coerceAtLeast(800_000)
    val ratio = currentOfferedSalaryInt.toDouble() / marketSalary.toDouble()

    val currentTier = when {
        ratio >= 1.20 -> 4
        ratio >= 1.08 -> 3
        ratio >= 0.92 -> 2
        ratio >= 0.80 -> 1
        else -> 0
    }

    val estChance = ((player.loyalty + currentTier) * 10).coerceIn(10, 95)

    val sentimentColor = when {
        estChance >= 75 -> RatingGreen
        estChance >= 50 -> Color(0xFFD97706)
        else -> RatingRed
    }

    val sentimentText = when {
        estChance >= 80 -> "Very Likely to Accept (~${estChance}%)"
        estChance >= 60 -> "Fair Chance to Accept (~${estChance}%)"
        estChance >= 40 -> "Uncertain / Testing Market (~${estChance}%)"
        else -> "Likely to Reject (~${estChance}%)"
    }

    fun formatMoney(a: Int) = if (a >= 1_000_000) "$${String.format("%.2f", a / 1_000_000.0)}M" else "$${a / 1_000}K"

    val loyaltyQuote = when (player.loyalty) {
        5 -> "★5 Franchise Icon: \"I love this team! Willing to take a friendly hometown deal.\""
        4 -> "★4 High Loyalty: \"I want to stay with the franchise if given a fair contract.\""
        3 -> "★3 Balanced: \"Weighing my options between staying and testing Free Agency.\""
        2 -> "★2 Exploring: \"Interested in exploring outside offers unless given a great deal.\""
        else -> "★1 Low Loyalty: \"Ready to test my full open-market value in Free Agency.\""
    }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Column {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Negotiate: ${player.name}",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    RatingBadge(rating = player.overallRating)
                }
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "${player.positionFirst.shortName} • Age ${player.age} • Target: ${formatMoney(marketSalary)}/yr",
                        fontSize = 12.sp,
                        color = MaterialTheme.colorScheme.primary,
                        fontWeight = FontWeight.SemiBold
                    )
                    if (isHomeTeamRenewal && marketSalary < openMarketSalary) {
                        Surface(
                            shape = RoundedCornerShape(4.dp),
                            color = MaterialTheme.colorScheme.tertiaryContainer
                        ) {
                            Text(
                                text = "🏠 Hometown Discount",
                                fontSize = 9.sp,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.onTertiaryContainer,
                                modifier = Modifier.padding(horizontal = 4.dp, vertical = 2.dp)
                            )
                        }
                    }
                }
                if (isHomeTeamRenewal && marketSalary < openMarketSalary) {
                    Text(
                        text = "Open Market FA Value: ${formatMoney(openMarketSalary)}/yr",
                        fontSize = 10.sp,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        },
        text = {
            Column(
                modifier = Modifier.fillMaxWidth(),
                verticalArrangement = Arrangement.spacedBy(10.dp)
            ) {
                // Loyalty and Mood Card
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(8.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                ) {
                    Column(modifier = Modifier.padding(10.dp)) {
                        Text(
                            text = loyaltyQuote,
                            fontSize = 11.sp,
                            fontStyle = androidx.compose.ui.text.font.FontStyle.Italic
                        )
                        Spacer(modifier = Modifier.height(6.dp))
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text("Acceptance Outlook:", fontSize = 11.sp, color = MaterialTheme.colorScheme.onSurfaceVariant)
                            Text(
                                text = sentimentText,
                                fontSize = 11.sp,
                                fontWeight = FontWeight.Bold,
                                color = sentimentColor
                            )
                        }
                    }
                }

                // 5 One-Tap Preset Option Chips (Original BM15 Tiers)
                Text("Quick Preset Offers:", fontSize = 12.sp, fontWeight = FontWeight.Bold)
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .horizontalScroll(rememberScrollState()),
                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                ) {
                    val pMinus20 = ((marketSalary * 0.80) / 1_000_000f).toFloat()
                    val pMinus10 = ((marketSalary * 0.90) / 1_000_000f).toFloat()
                    val pBase = (marketSalary / 1_000_000f)
                    val pPlus10 = ((marketSalary * 1.10) / 1_000_000f).toFloat()
                    val pPlus20 = ((marketSalary * 1.20) / 1_000_000f).toFloat()

                    FilterChip(
                        selected = currentTier == 0,
                        onClick = { offeredSalaryFloat = pMinus20.coerceIn(sliderMin, sliderMax) },
                        label = { Text("-20% Cut (${formatMoney((pMinus20 * 1_000_000).toInt())})", fontSize = 11.sp) }
                    )
                    FilterChip(
                        selected = currentTier == 1,
                        onClick = { offeredSalaryFloat = pMinus10.coerceIn(sliderMin, sliderMax) },
                        label = { Text("-10% (${formatMoney((pMinus10 * 1_000_000).toInt())})", fontSize = 11.sp) }
                    )
                    FilterChip(
                        selected = currentTier == 2,
                        onClick = { offeredSalaryFloat = pBase.coerceIn(sliderMin, sliderMax) },
                        label = { Text("Base (${formatMoney((pBase * 1_000_000).toInt())})", fontSize = 11.sp) }
                    )
                    FilterChip(
                        selected = currentTier == 3,
                        onClick = { offeredSalaryFloat = pPlus10.coerceIn(sliderMin, sliderMax) },
                        label = { Text("+10% (${formatMoney((pPlus10 * 1_000_000).toInt())})", fontSize = 11.sp) }
                    )
                    FilterChip(
                        selected = currentTier == 4,
                        onClick = { offeredSalaryFloat = pPlus20.coerceIn(sliderMin, sliderMax) },
                        label = { Text("+20% Max (${formatMoney((pPlus20 * 1_000_000).toInt())})", fontSize = 11.sp) }
                    )
                }

                HorizontalDivider()

                // Slider Adjustment with Dynamic Range Centered around Market Salary
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Offered Annual Salary:", fontSize = 12.sp, fontWeight = FontWeight.Bold)
                    Text(
                        text = "${formatMoney(currentOfferedSalaryInt)} / yr",
                        fontSize = 14.sp,
                        fontWeight = FontWeight.ExtraBold,
                        color = MaterialTheme.colorScheme.primary
                    )
                }

                Slider(
                    value = offeredSalaryFloat.coerceIn(sliderMin, sliderMax),
                    onValueChange = { offeredSalaryFloat = it },
                    valueRange = sliderMin..sliderMax,
                    steps = sliderSteps
                )

                // Contract Duration (1 to 5 Years)
                Text("Contract Length ($selectedYears Year${if (selectedYears > 1) "s" else ""}):", fontSize = 12.sp, fontWeight = FontWeight.Bold)
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                ) {
                    (1..5).forEach { y ->
                        FilterChip(
                            selected = selectedYears == y,
                            onClick = { selectedYears = y },
                            label = { Text("$y Yr${if (y > 1) "s" else ""}", fontSize = 12.sp) },
                            modifier = Modifier.weight(1f)
                        )
                    }
                }
            }
        },
        confirmButton = {
            Button(
                onClick = {
                    val (accepted, msg) = ContractEngine.evaluateContractOffer(player, currentOfferedSalaryInt, selectedYears, isHomeTeamRenewal)
                    onConfirmOffer(selectedYears, currentOfferedSalaryInt, accepted, msg)
                }
            ) {
                Text("Submit Offer")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
