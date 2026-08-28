package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.*

object AwardsEngine {

    fun calculateMvpPodium(
        players: List<Player>,
        teamMap: Map<Long, Team>,
        regularStatsMap: Map<Long, List<MatchResult>>
    ): NewsItem? {
        val qualifiedPlayers = players.mapNotNull { p ->
            val stats = regularStatsMap[p.id] ?: return@mapNotNull null
            val gp = stats.size
            if (gp < 15) return@mapNotNull null
            val totalMinutes = stats.sumOf { it.minutesPlayed }
            val mpg = totalMinutes.toDouble() / gp
            if (mpg < 18.0) return@mapNotNull null

            val avgPer = stats.sumOf { it.per } / gp
            val ppg = stats.sumOf { it.points }.toDouble() / gp
            val rpg = stats.sumOf { it.rebounds }.toDouble() / gp
            val apg = stats.sumOf { it.passesOk }.toDouble() / gp

            Triple(p, avgPer, "PER ${String.format("%.1f", avgPer)} (${String.format("%.1f", ppg)} PPG, ${String.format("%.1f", rpg)} RPG, ${String.format("%.1f", apg)} APG)")
        }.sortedByDescending { it.second }.take(3)

        if (qualifiedPlayers.isEmpty()) return null

        val topMvp = qualifiedPlayers.first().first
        val bodyBuilder = StringBuilder()
        qualifiedPlayers.forEachIndexed { index, (p, _, statLine) ->
            val tName = teamMap[p.teamId]?.name ?: "FA"
            bodyBuilder.append("${index + 1}. ${p.name} ($tName) - $statLine\n")
        }

        return NewsItem(
            gameId = topMvp.gameId,
            matchday = 167,
            type = NewsType.INFO,
            title = "🏆 Most Valuable Players (MVP)",
            body = bodyBuilder.toString().trimEnd(),
            team1Id = topMvp.teamId,
            playerId = topMvp.id
        )
    }

    fun calculateRoyPodium(
        players: List<Player>,
        teamMap: Map<Long, Team>,
        regularStatsMap: Map<Long, List<MatchResult>>
    ): NewsItem? {
        val qualifiedRookies = players.filter { it.yearsExperience == 0 }.mapNotNull { p ->
            val stats = regularStatsMap[p.id] ?: return@mapNotNull null
            val gp = stats.size
            if (gp < 10) return@mapNotNull null
            val totalMinutes = stats.sumOf { it.minutesPlayed }
            val mpg = totalMinutes.toDouble() / gp
            if (mpg < 14.0) return@mapNotNull null

            val avgPer = stats.sumOf { it.per } / gp
            val ppg = stats.sumOf { it.points }.toDouble() / gp
            val rpg = stats.sumOf { it.rebounds }.toDouble() / gp
            val apg = stats.sumOf { it.passesOk }.toDouble() / gp

            Triple(p, avgPer, "PER ${String.format("%.1f", avgPer)} (${String.format("%.1f", ppg)} PPG, ${String.format("%.1f", rpg)} RPG, ${String.format("%.1f", apg)} APG)")
        }.sortedByDescending { it.second }.take(3)

        if (qualifiedRookies.isEmpty()) return null

        val topRoy = qualifiedRookies.first().first
        val bodyBuilder = StringBuilder()
        qualifiedRookies.forEachIndexed { index, (p, _, statLine) ->
            val tName = teamMap[p.teamId]?.name ?: "FA"
            bodyBuilder.append("${index + 1}. ${p.name} ($tName) - $statLine\n")
        }

        return NewsItem(
            gameId = topRoy.gameId,
            matchday = 167,
            type = NewsType.INFO,
            title = "⭐ Rookies of the Year (ROY)",
            body = bodyBuilder.toString().trimEnd(),
            team1Id = topRoy.teamId,
            playerId = topRoy.id
        )
    }
}
