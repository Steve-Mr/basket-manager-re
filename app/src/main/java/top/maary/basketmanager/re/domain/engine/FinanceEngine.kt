package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.PlayoffSeries
import top.maary.basketmanager.re.domain.model.StandingsItem

data class SalaryCapAdjustment(
    val teamId: Long,
    val deltaSalaryCap: Int,
    val breakdownReasons: List<String>
)

object FinanceEngine {

    const val SALARY_CAP_MIN = 50_000_000
    const val SALARY_CAP_MAX = 120_000_000

    /**
     * Authentic BM15 Salary Cap Performance-Based Calculation:
     * - Playoff Qualified: Base +$2.0M
     *   - Division Champion: +$1.0M
     *   - Reached Conference Semis (Won R1): +$1.0M
     *   - Reached Conference Finals (Won R2): +$1.0M
     *   - Reached NBA Finals (Won Conf Finals): +$1.0M
     *   - NBA Champion: +$1.0M
     * - Non-Playoff Teams: Base -$3.0M
     *   - Division Bottom (5th): -$1.0M
     *   - Conference Last Place (15th): -$1.0M
     */
    fun calculateSalaryCapAdjustments(
        standings: List<StandingsItem>,
        playoffSeries: List<PlayoffSeries>
    ): Map<Long, SalaryCapAdjustment> {
        val confMap = standings.groupBy { it.conference }
            .mapValues { (_, list) -> list.sortedWith(compareByDescending<StandingsItem> { it.gamesWon }.thenBy { it.gamesLost }) }

        val divMap = standings.groupBy { it.division }
            .mapValues { (_, list) -> list.sortedWith(compareByDescending<StandingsItem> { it.gamesWon }.thenBy { it.gamesLost }) }

        val playoffTeamIds = mutableSetOf<Long>()
        confMap.values.forEach { sList ->
            sList.take(8).forEach { playoffTeamIds.add(it.teamId) }
        }

        val semisTeams = mutableSetOf<Long>()
        val confFinalTeams = mutableSetOf<Long>()
        val finalsTeams = mutableSetOf<Long>()
        var championTeamId: Long? = null

        playoffSeries.forEach { s ->
            val winner = s.winnerTeamId
            if (winner != null) {
                when (s.round) {
                    1 -> semisTeams.add(winner)
                    2 -> confFinalTeams.add(winner)
                    3 -> finalsTeams.add(winner)
                    4 -> championTeamId = winner
                }
            }
        }

        val adjustments = mutableMapOf<Long, SalaryCapAdjustment>()

        standings.forEach { s ->
            val tId = s.teamId
            var diff = 0
            val reasons = mutableListOf<String>()

            val divList = divMap[s.division] ?: emptyList()
            val divRank = divList.indexOfFirst { it.teamId == tId } + 1

            val confList = confMap[s.conference] ?: emptyList()
            val confRank = confList.indexOfFirst { it.teamId == tId } + 1

            if (playoffTeamIds.contains(tId)) {
                // Playoff Qualified (+ $2.0M)
                diff += 2_000_000
                reasons.add("季后赛资格 (+ $2.0M)")

                if (divRank == 1) {
                    diff += 1_000_000
                    reasons.add("分赛区冠军 (+ $1.0M)")
                }
                if (semisTeams.contains(tId)) {
                    diff += 1_000_000
                    reasons.add("打进分区半决赛 (+ $1.0M)")
                }
                if (confFinalTeams.contains(tId)) {
                    diff += 1_000_000
                    reasons.add("打进分区决赛 (+ $1.0M)")
                }
                if (finalsTeams.contains(tId)) {
                    diff += 1_000_000
                    reasons.add("打进总决赛 (+ $1.0M)")
                }
                if (tId == championTeamId) {
                    diff += 1_000_000
                    reasons.add("🏆 夺得总冠军 (+ $1.0M)")
                }
            } else {
                // Missed Playoffs (- $3.0M)
                diff -= 3_000_000
                reasons.add("无缘季后赛 (- $3.0M)")

                if (divRank == 5) {
                    diff -= 1_000_000
                    reasons.add("赛区垫底 (- $1.0M)")
                }
                if (confRank == 15) {
                    diff -= 1_000_000
                    reasons.add("分区联盟垫底 (- $1.0M)")
                }
            }

            adjustments[tId] = SalaryCapAdjustment(
                teamId = tId,
                deltaSalaryCap = diff,
                breakdownReasons = reasons
            )
        }

        return adjustments
    }
}
