package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Position
import kotlin.math.pow
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
        val openMarketValue = ((rawSalary / 50_000) * 50_000).coerceIn(500_000, 42_000_000)

        val negotiationBase = if (isHomeTeamRenewal) {
            // Authentic BM15 Hometown 80% Discount factor + Loyalty bonus
            val discountFactor = when (player.loyalty) {
                5 -> 0.72 // Super loyal franchise icon
                4 -> 0.76
                3 -> 0.80 // Standard BM15 home discount
                2 -> 0.85
                else -> 0.90
            }
            val discounted = (openMarketValue * discountFactor).toInt()
            ((discounted / 50_000) * 50_000).coerceIn(500_000, 36_000_000)
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
        val isExtension = player.yearsContract > 0

        val tier = when {
            ratio >= 1.20 -> 4
            ratio >= 1.08 -> 3
            ratio >= 0.92 -> 2
            ratio >= 0.80 -> 1
            else -> 0
        }

        val roll = Random.nextInt(0, 10)
        val loyaltyPenalty = if (isExtension && player.loyalty <= 2) 1 else 0
        val threshold = (player.loyalty + tier - loyaltyPenalty).coerceIn(1, 9)
        val accepted = roll < threshold

        fun formatMoney(a: Int) = if (a >= 1_000_000) "$${String.format("%.2f", a / 1_000_000.0)}M" else "$${a / 1_000}K"

        val msg = if (accepted) {
            val discountNote = if (isHomeTeamRenewal && offeredSalary < openMarket) {
                " (Includes a team-friendly hometown discount from open market value of ${formatMoney(openMarket)}/yr)"
            } else ""
            if (isExtension) {
                val totalYears = player.yearsContract + offeredYears
                "${player.name} has ACCEPTED your contract extension offer of ${formatMoney(offeredSalary)}/yr for an extra $offeredYears year(s) (Total contract: $totalYears years)!$discountNote"
            } else if (isHomeTeamRenewal) {
                "${player.name} has ACCEPTED your contract renewal offer of ${formatMoney(offeredSalary)}/yr for $offeredYears year(s)!$discountNote"
            } else {
                "${player.name} has ACCEPTED your Free Agency contract offer of ${formatMoney(offeredSalary)}/yr for $offeredYears year(s)!"
            }
        } else {
            val demandTip = when {
                isExtension && player.loyalty <= 2 -> "He prefers to play out his remaining contract year and explore Free Agency."
                tier <= 1 -> "He feels this offer is below his expectations and requests at least ${formatMoney(marketBase)}/yr."
                tier == 2 -> "He is leaning towards testing Free Agency (market value ~${formatMoney(openMarket)}/yr) unless offered a slight raise."
                else -> "Negotiations stalled. Consider adjusting the contract term length or salary."
            }
            "${player.name} has REJECTED your contract offer.\n\n$demandTip"
        }

        return Pair(accepted, msg)
    }
}
