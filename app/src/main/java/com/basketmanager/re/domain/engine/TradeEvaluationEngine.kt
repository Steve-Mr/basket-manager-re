package com.basketmanager.re.domain.engine

import com.basketmanager.re.domain.model.DraftPick
import com.basketmanager.re.domain.model.Player
import com.basketmanager.re.domain.model.Team
import kotlin.math.abs

data class TradeEvaluationResult(
    val isAccepted: Boolean,
    val reasonMessage: String,
    val valueTeamA: Double,
    val valueTeamB: Double,
    val salaryDiffTeamA: Int,
    val salaryDiffTeamB: Int
)

object TradeEvaluationEngine {

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
            return TradeEvaluationResult(false, "Team A must include at least one player or draft pick.", 0.0, 0.0, 0, 0)
        }
        if (teamBPlayers.isEmpty() && teamBDraftPicks.isEmpty()) {
            return TradeEvaluationResult(false, "Team B must include at least one player or draft pick.", 0.0, 0.0, 0, 0)
        }

        // Roster size constraints (13..20 players)
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
            return TradeEvaluationResult(false, "${teamA.name} exceeds salary cap ($${newSalaryA} / $${teamA.salaryCap}).", 0.0, 0.0, salaryBOut - salaryAOut, salaryAOut - salaryBOut)
        }
        if (newSalaryB > teamB.salaryCap) {
            return TradeEvaluationResult(false, "${teamB.name} exceeds salary cap ($${newSalaryB} / $${teamB.salaryCap}).", 0.0, 0.0, salaryBOut - salaryAOut, salaryAOut - salaryBOut)
        }

        // Value comparison
        val pickValueRound1 = 25.0
        val pickValueRound2 = 8.0

        val valueA = teamAPlayers.sumOf { it.marketValue } + teamADraftPicks.sumOf { if (it.round == 1) pickValueRound1 else pickValueRound2 }
        val valueB = teamBPlayers.sumOf { it.marketValue } + teamBDraftPicks.sumOf { if (it.round == 1) pickValueRound1 else pickValueRound2 }

        // AI acceptance logic: value offered by Team A must be >= 85% of Team B value
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
}
