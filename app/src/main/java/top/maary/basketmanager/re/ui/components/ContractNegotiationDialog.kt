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
import top.maary.basketmanager.re.domain.engine.ContractEngine
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Position
import top.maary.basketmanager.re.ui.theme.RatingGreen
import top.maary.basketmanager.re.ui.theme.RatingRed
import kotlin.math.roundToInt

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ContractNegotiationDialog(
    player: Player,
    isHomeTeamRenewal: Boolean = true,
    capAvailable: Int? = null,
    onDismiss: () -> Unit,
    onConfirmOffer: (years: Int, salary: Int, accepted: Boolean, feedbackMessage: String) -> Unit
) {
    val isExtension = player.yearsContract > 0
    val (marketSalary, openMarketSalary) = remember(player, isHomeTeamRenewal) {
        ContractEngine.calculateMarketDemandSalary(player, isHomeTeamRenewal)
    }
    var selectedYears by remember { mutableIntStateOf(if (player.age >= 34) 1 else if (player.age >= 30) 2 else 3) }

    val totalContractYears = if (isExtension) player.yearsContract + selectedYears else selectedYears

    val marketM = marketSalary / 1_000_000f
    val sliderMin = (marketM * 0.6f).coerceIn(0.5f, 35.0f)
    val sliderMax = (marketM * 1.5f).coerceIn(1.0f, 45.0f)
    val sliderSteps = ((sliderMax - sliderMin) / 0.05f).roundToInt().coerceAtLeast(1)

    var offeredSalaryFloat by remember { mutableFloatStateOf(marketM) }

    val currentOfferedSalaryInt = ((offeredSalaryFloat * 20).roundToInt() * 50_000).coerceAtLeast(500_000)
    val ratio = currentOfferedSalaryInt.toDouble() / marketSalary.toDouble()

    val currentTier = when {
        ratio >= 1.20 -> 4
        ratio >= 1.08 -> 3
        ratio >= 0.92 -> 2
        ratio >= 0.80 -> 1
        else -> 0
    }

    val estChance = ((player.loyalty + currentTier - (if (isExtension && player.loyalty <= 2) 1 else 0)) * 10).coerceIn(10, 95)

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

    val isMinContract = currentOfferedSalaryInt < 1_000_000
    // In NBA & BM15 rules: Home team renewals/extensions have Bird Rights and CAN exceed the salary cap!
    // Free Agency market signings must respect available cap room or use the Minimum Contract Exception (< $1.0M).
    val isAffordable = if (isHomeTeamRenewal) {
        true
    } else {
        capAvailable == null || currentOfferedSalaryInt <= capAvailable || isMinContract
    }

    val loyaltyQuote = if (isHomeTeamRenewal) {
        when (player.loyalty) {
            5 -> "★5 Franchise Icon: Loves the franchise and welcomes a hometown deal."
            4 -> "★4 High Loyalty: Wants to stay with the franchise on a fair contract."
            3 -> "★3 Balanced: Weighing options between staying and testing Free Agency."
            2 -> "★2 Exploring: Interested in exploring outside offers unless given a great deal."
            else -> "★1 Low Loyalty: Ready to test full open-market value in Free Agency."
        }
    } else {
        "Free Agent Market Demand: Target contract ~$${String.format("%.2f", marketSalary / 1_000_000.0)}M / year."
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
                        text = when {
                            isExtension -> "Contract Extension: ${player.name}"
                            isHomeTeamRenewal -> "Contract Renewal: ${player.name}"
                            else -> "Free Agent Offer: ${player.name}"
                        },
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

                // Cap Space, Bird Rights, and Minimum Exception Status
                if (isHomeTeamRenewal) {
                    if (capAvailable != null && currentOfferedSalaryInt > capAvailable) {
                        Surface(shape = RoundedCornerShape(4.dp), color = RatingGreen.copy(alpha = 0.15f)) {
                            Text(
                                text = "⚡ Bird Rights (Hometown Exception): Allowed to re-sign own players over salary cap",
                                color = RatingGreen,
                                fontSize = 10.sp,
                                fontWeight = FontWeight.Bold,
                                modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                            )
                        }
                    } else if (capAvailable != null) {
                        Text(
                            text = "Team Cap Room: ${formatMoney(capAvailable)} available",
                            fontSize = 11.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                } else {
                    // Free Agency Open Market signing checks
                    if (capAvailable != null) {
                        if (!isAffordable) {
                            Surface(shape = RoundedCornerShape(6.dp), color = RatingRed.copy(alpha = 0.15f)) {
                                Row(
                                    modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                                ) {
                                    Text("⚠️", fontSize = 12.sp)
                                    Text(
                                        text = "Exceeds Cap Space: ${formatMoney(capAvailable)} available. (Must be < $1.0M for Minimum Exception)",
                                        color = RatingRed,
                                        fontSize = 11.sp,
                                        fontWeight = FontWeight.Bold
                                    )
                                }
                            }
                        } else if (isMinContract) {
                            Surface(shape = RoundedCornerShape(4.dp), color = RatingGreen.copy(alpha = 0.15f)) {
                                Text(
                                    text = "⚡ Minimum Contract Exception (< $1.0M): Allowed under salary cap rules",
                                    color = RatingGreen,
                                    fontSize = 10.sp,
                                    fontWeight = FontWeight.Bold,
                                    modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                                )
                            }
                        } else {
                            Text(
                                text = "Team Cap Space: ${formatMoney(capAvailable)} available",
                                fontSize = 11.sp,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    } else if (isMinContract) {
                        Surface(shape = RoundedCornerShape(4.dp), color = RatingGreen.copy(alpha = 0.15f)) {
                            Text(
                                text = "⚡ Minimum Contract Exception (< $1.0M): Allowed even if over cap",
                                color = RatingGreen,
                                fontSize = 10.sp,
                                fontWeight = FontWeight.Bold,
                                modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
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
                        label = { Text("-20% (${formatMoney((pMinus20 * 1_000_000).toInt())})", fontSize = 11.sp) }
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
                        label = { Text("+20% (${formatMoney((pPlus20 * 1_000_000).toInt())})", fontSize = 11.sp) }
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

                // Contract Duration
                Text(
                    text = if (isExtension) "Extension Duration (+$selectedYears yr • Total contract: $totalContractYears yr):"
                    else "Contract Duration: $selectedYears Year${if (selectedYears > 1) "s" else ""}",
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Bold
                )
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                ) {
                    (1..4).forEach { y ->
                        FilterChip(
                            selected = selectedYears == y,
                            onClick = { selectedYears = y },
                            label = { Text("$y Yr${if (y > 1) "s" else ""}${if (isExtension) " (Total ${player.yearsContract + y}y)" else ""}", fontSize = 11.sp) },
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
                    onConfirmOffer(totalContractYears, currentOfferedSalaryInt, accepted, msg)
                },
                enabled = isAffordable
            ) {
                Text(
                    if (!isAffordable) "Insufficient Cap Space"
                    else when {
                        isExtension -> "Confirm Extension"
                        isHomeTeamRenewal -> "Submit Renewal Offer"
                        else -> "Submit FA Offer"
                    }
                )
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
