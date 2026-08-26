package com.basketmanager.re.domain.model

data class StandingsItem(
    val teamId: Long,
    val teamName: String,
    val conference: Conference,
    val division: Division,
    val gamesWon: Int = 0,
    val gamesLost: Int = 0,
    val pointsScored: Int = 0,
    val pointsAllowed: Int = 0
) {
    val totalGames: Int get() = gamesWon + gamesLost
    val winPercentage: Double get() = if (totalGames > 0) gamesWon.toDouble() / totalGames else 0.0
    val pointDiff: Int get() = pointsScored - pointsAllowed
}

data class PlayoffSeries(
    val id: Long = 0,
    val gameId: Long = 0,
    val conference: Conference?,
    val round: Int, // 1: Quarterfinals, 2: Semis, 3: Conf Finals, 4: NBA Finals
    val seed1: Int,
    val seed2: Int,
    val team1Id: Long,
    val team2Id: Long,
    val team1Wins: Int = 0,
    val team2Wins: Int = 0,
    val winnerTeamId: Long? = null
) {
    val isFinished: Boolean get() = team1Wins >= 4 || team2Wins >= 4
}
