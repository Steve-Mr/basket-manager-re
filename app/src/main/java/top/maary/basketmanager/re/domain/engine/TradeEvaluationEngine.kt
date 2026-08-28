package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.DraftPick
import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Team
import kotlin.math.abs

data class TradeEvaluationResult(
    val isAccepted: Boolean,
    val reasonMessage: String,
    val valueTeamA: Double,
    val valueTeamB: Double,
    val salaryDiffTeamA: Int,
    val salaryDiffTeamB: Int
)

data class CpuTradeBid(
    val partnerTeam: Team,
    val offeredPlayers: List<Player>,
    val offeredDraftPicks: List<DraftPick>,
    val valueOffered: Double,
    val salaryNetChange: Int,
    val summaryNote: String
)

data class CpuTargetInquiryResult(
    val isPossible: Boolean,
    val targetTeam: Team,
    val demandedPlayers: List<Player>,
    val demandedDraftPicks: List<DraftPick>,
    val message: String
)

object TradeEvaluationEngine {

    const val PICK_VALUE_R1 = 25.0
    const val PICK_VALUE_R2 = 8.0

    fun evaluateTrade(
        teamA: Team,
        teamB: Team,
        teamAPlayers: List<Player>,
        teamBPlayers: List<Player>,
        teamADraftPicks: List<DraftPick>,
        teamBDraftPicks: List<DraftPick>,
        teamARoster: List<Player>,
        teamBRoster: List<Player>
    ): TradeEvaluationResult {
        if (teamAPlayers.isEmpty() && teamADraftPicks.isEmpty()) {
            return TradeEvaluationResult(false, "Your team must include at least one player or draft pick.", 0.0, 0.0, 0, 0)
        }
        if (teamBPlayers.isEmpty() && teamBDraftPicks.isEmpty()) {
            return TradeEvaluationResult(false, "${teamB.name} must include at least one player or draft pick.", 0.0, 0.0, 0, 0)
        }

        // Roster size constraints (12..20 players)
        val newRosterSizeA = teamARoster.size - teamAPlayers.size + teamBPlayers.size
        val newRosterSizeB = teamBRoster.size - teamBPlayers.size + teamAPlayers.size

        if (newRosterSizeA < 12 || newRosterSizeA > 20) {
            return TradeEvaluationResult(false, "${teamA.name} roster size after trade ($newRosterSizeA) must be between 12 and 20.", 0.0, 0.0, 0, 0)
        }
        if (newRosterSizeB < 12 || newRosterSizeB > 20) {
            return TradeEvaluationResult(false, "${teamB.name} roster size after trade ($newRosterSizeB) must be between 12 and 20.", 0.0, 0.0, 0, 0)
        }

        // Salary Matching
        val salaryAOut = teamAPlayers.sumOf { it.salary }
        val salaryBOut = teamBPlayers.sumOf { it.salary }

        val currentSalaryA = teamARoster.sumOf { it.salary }
        val currentSalaryB = teamBRoster.sumOf { it.salary }

        val newSalaryA = currentSalaryA - salaryAOut + salaryBOut
        val newSalaryB = currentSalaryB - salaryBOut + salaryAOut

        if (newSalaryA > teamA.salaryCap) {
            return TradeEvaluationResult(false, "${teamA.name} exceeds salary cap ($${newSalaryA / 1_000_000}M / $${teamA.salaryCap / 1_000_000}M).", 0.0, 0.0, salaryBOut - salaryAOut, salaryAOut - salaryBOut)
        }
        if (newSalaryB > teamB.salaryCap) {
            return TradeEvaluationResult(false, "${teamB.name} exceeds salary cap ($${newSalaryB / 1_000_000}M / $${teamB.salaryCap / 1_000_000}M).", 0.0, 0.0, salaryBOut - salaryAOut, salaryAOut - salaryBOut)
        }

        // Value comparison
        val valueA = teamAPlayers.sumOf { it.marketValue } + teamADraftPicks.sumOf { if (it.round == 1) PICK_VALUE_R1 else PICK_VALUE_R2 }
        val valueB = teamBPlayers.sumOf { it.marketValue } + teamBDraftPicks.sumOf { if (it.round == 1) PICK_VALUE_R1 else PICK_VALUE_R2 }

        val ratio = if (valueB > 0) valueA / valueB else 1.0
        val isAccepted = ratio >= 0.85

        val reason = if (isAccepted) {
            "Trade accepted by ${teamB.name} front office!"
        } else {
            "${teamB.name} declined: Trade value is insufficient (${(ratio * 100).toInt()}% of required value)."
        }

        return TradeEvaluationResult(
            isAccepted = isAccepted,
            reasonMessage = reason,
            valueTeamA = valueA,
            valueTeamB = valueB,
            salaryDiffTeamA = salaryBOut - salaryAOut,
            salaryDiffTeamB = salaryAOut - salaryBOut
        )
    }

    /**
     * Feature 2: Shop My Assets (League-Wide Bids / Asset Shopping)
     * Finds competitive offers from CPU teams across the league.
     */
    fun findTradeOffersForAssets(
        userTeam: Team,
        offeredPlayers: List<Player>,
        offeredPicks: List<DraftPick>,
        userRoster: List<Player>,
        cpuTeams: List<Team>,
        cpuRosters: Map<Long, List<Player>>,
        cpuPicks: Map<Long, List<DraftPick>>
    ): List<CpuTradeBid> {
        val userOutSalary = offeredPlayers.sumOf { it.salary }
        val userOutVal = offeredPlayers.sumOf { it.marketValue } + offeredPicks.sumOf { if (it.round == 1) PICK_VALUE_R1 else PICK_VALUE_R2 }
        val userCurrSalary = userRoster.sumOf { it.salary }

        if (userOutVal <= 0.0) return emptyList()

        val bids = mutableListOf<CpuTradeBid>()

        for (cpuTeam in cpuTeams) {
            val cRoster = cpuRosters[cpuTeam.id] ?: continue
            val cPicks = cpuPicks[cpuTeam.id] ?: emptyList()
            val cCurrSalary = cRoster.sumOf { it.salary }

            val validCombos = mutableListOf<CpuTradeBid>()

            // 1. Single player offers from CPU
            for (p in cRoster) {
                // Don't trade away superstar if offer is small
                if (p.overallRating >= 88 && userOutVal < 60.0) continue

                val pickOptions = listOf(null) + cPicks
                for (pick in pickOptions) {
                    val comboPlayers = listOf(p)
                    val comboPicks = listOfNotNull(pick)

                    val cOutSal = comboPlayers.sumOf { it.salary }
                    val cOutVal = comboPlayers.sumOf { it.marketValue } + comboPicks.sumOf { if (it.round == 1) PICK_VALUE_R1 else PICK_VALUE_R2 }

                    val newUSize = userRoster.size - offeredPlayers.size + comboPlayers.size
                    val newCSize = cRoster.size - comboPlayers.size + offeredPlayers.size
                    if (newUSize !in 12..20 || newCSize !in 12..20) continue

                    val newUSal = userCurrSalary - userOutSalary + cOutSal
                    val newCSal = cCurrSalary - cOutSal + userOutSalary
                    if (newUSal > userTeam.salaryCap || newCSal > cpuTeam.salaryCap) continue

                    val ratio = cOutVal / userOutVal
                    if (ratio in 0.75..1.25) {
                        validCombos.add(
                            CpuTradeBid(
                                partnerTeam = cpuTeam,
                                offeredPlayers = comboPlayers,
                                offeredDraftPicks = comboPicks,
                                valueOffered = cOutVal,
                                salaryNetChange = cOutSal - userOutSalary,
                                summaryNote = "${cpuTeam.name} offers ${comboPlayers.joinToString { it.shortName }}" +
                                        if (comboPicks.isNotEmpty()) " + Round ${comboPicks[0].round} Pick" else ""
                            )
                        )
                    }
                }
            }

            // 2. 2-player offers from CPU if no single player matches
            if (validCombos.isEmpty() && cRoster.size >= 14) {
                val nonStars = cRoster.filter { it.overallRating < 86 }
                for (i in nonStars.indices) {
                    for (j in (i + 1) until minOf(i + 5, nonStars.size)) {
                        val comboPlayers = listOf(nonStars[i], nonStars[j])
                        val cOutSal = comboPlayers.sumOf { it.salary }
                        val cOutVal = comboPlayers.sumOf { it.marketValue }

                        val newUSize = userRoster.size - offeredPlayers.size + comboPlayers.size
                        val newCSize = cRoster.size - comboPlayers.size + offeredPlayers.size
                        if (newUSize !in 12..20 || newCSize !in 12..20) continue

                        val newUSal = userCurrSalary - userOutSalary + cOutSal
                        val newCSal = cCurrSalary - cOutSal + userOutSalary
                        if (newUSal > userTeam.salaryCap || newCSal > cpuTeam.salaryCap) continue

                        val ratio = cOutVal / userOutVal
                        if (ratio in 0.75..1.25) {
                            validCombos.add(
                                CpuTradeBid(
                                    partnerTeam = cpuTeam,
                                    offeredPlayers = comboPlayers,
                                    offeredDraftPicks = emptyList(),
                                    valueOffered = cOutVal,
                                    salaryNetChange = cOutSal - userOutSalary,
                                    summaryNote = "${cpuTeam.name} offers 2 players: ${comboPlayers.joinToString { it.shortName }}"
                                )
                            )
                        }
                    }
                }
            }

            if (validCombos.isNotEmpty()) {
                // Select the bid closest to 100% fair value
                val best = validCombos.minByOrNull { abs(it.valueOffered - userOutVal) }
                if (best != null) bids.add(best)
            }
        }

        return bids.sortedByDescending { it.valueOffered }
    }

    /**
     * Feature 3: Target Asset Inquiry (Inquire Target Team Counter-Offer)
     * Ask what the target CPU team demands from user's roster & picks in exchange for requested assets.
     */
    fun generateCpuDemandForTargetAssets(
        userTeam: Team,
        userRoster: List<Player>,
        userPicks: List<DraftPick>,
        targetTeam: Team,
        targetPlayers: List<Player>,
        targetPicks: List<DraftPick>,
        targetRoster: List<Player>
    ): CpuTargetInquiryResult {
        val targetOutSalary = targetPlayers.sumOf { it.salary }
        val targetOutVal = targetPlayers.sumOf { it.marketValue } + targetPicks.sumOf { if (it.round == 1) PICK_VALUE_R1 else PICK_VALUE_R2 }
        val targetCurrSalary = targetRoster.sumOf { it.salary }
        val userCurrSalary = userRoster.sumOf { it.salary }

        if (targetOutVal <= 0.0) {
            return CpuTargetInquiryResult(false, targetTeam, emptyList(), emptyList(), "Please select target player(s) or pick(s).")
        }

        val candidates = mutableListOf<Pair<List<Player>, List<DraftPick>>>()

        // 1. Check single player + pick combos from User
        for (p in userRoster) {
            val pickOptions = listOf(null) + userPicks
            for (pick in pickOptions) {
                val comboPlayers = listOf(p)
                val comboPicks = listOfNotNull(pick)

                val uOutSal = comboPlayers.sumOf { it.salary }
                val uOutVal = comboPlayers.sumOf { it.marketValue } + comboPicks.sumOf { if (it.round == 1) PICK_VALUE_R1 else PICK_VALUE_R2 }

                val newUSize = userRoster.size - comboPlayers.size + targetPlayers.size
                val newTSize = targetRoster.size - targetPlayers.size + comboPlayers.size
                if (newUSize !in 12..20 || newTSize !in 12..20) continue

                val newUSal = userCurrSalary - uOutSal + targetOutSalary
                val newTSal = targetCurrSalary - targetOutSalary + uOutSal
                if (newUSal > userTeam.salaryCap || newTSal > targetTeam.salaryCap) continue

                val ratio = uOutVal / targetOutVal
                if (ratio in 0.88..1.35) {
                    candidates.add(comboPlayers to comboPicks)
                }
            }
        }

        // 2. Check 2-player combos from User if needed
        if (candidates.isEmpty() && userRoster.size >= 14) {
            for (i in userRoster.indices) {
                for (j in (i + 1) until minOf(i + 6, userRoster.size)) {
                    val comboPlayers = listOf(userRoster[i], userRoster[j])
                    val pickOptions = listOf(null) + userPicks
                    for (pick in pickOptions) {
                        val comboPicks = listOfNotNull(pick)
                        val uOutSal = comboPlayers.sumOf { it.salary }
                        val uOutVal = comboPlayers.sumOf { it.marketValue } + comboPicks.sumOf { if (it.round == 1) PICK_VALUE_R1 else PICK_VALUE_R2 }

                        val newUSize = userRoster.size - comboPlayers.size + targetPlayers.size
                        val newTSize = targetRoster.size - targetPlayers.size + comboPlayers.size
                        if (newUSize !in 12..20 || newTSize !in 12..20) continue

                        val newUSal = userCurrSalary - uOutSal + targetOutSalary
                        val newTSal = targetCurrSalary - targetOutSalary + uOutSal
                        if (newUSal > userTeam.salaryCap || newTSal > targetTeam.salaryCap) continue

                        val ratio = uOutVal / targetOutVal
                        if (ratio in 0.88..1.40) {
                            candidates.add(comboPlayers to comboPicks)
                        }
                    }
                }
            }
        }

        if (candidates.isNotEmpty()) {
            val best = candidates.minByOrNull { (pList, pkList) ->
                val valSum = pList.sumOf { it.marketValue } + pkList.sumOf { if (it.round == 1) PICK_VALUE_R1 else PICK_VALUE_R2 }
                abs(valSum - targetOutVal)
            }!!
            val (demandedPlayers, demandedPicks) = best
            val requestedNames = targetPlayers.joinToString { it.shortName }
            val demandNames = demandedPlayers.joinToString { it.name } + if (demandedPicks.isNotEmpty()) " + Round ${demandedPicks[0].round} Pick" else ""

            return CpuTargetInquiryResult(
                isPossible = true,
                targetTeam = targetTeam,
                demandedPlayers = demandedPlayers,
                demandedDraftPicks = demandedPicks,
                message = "${targetTeam.name} front office agrees to part with $requestedNames in exchange for:\n\n👉 $demandNames"
            )
        } else {
            return CpuTargetInquiryResult(
                isPossible = false,
                targetTeam = targetTeam,
                demandedPlayers = emptyList(),
                demandedDraftPicks = emptyList(),
                message = "${targetTeam.name} considers the requested asset(s) untouchable. None of your available player/draft pick packages meet their trade valuation or salary constraints."
            )
        }
    }
}
