package com.basketmanager.re.domain.model

data class MatchResult(
    val id: Long = 0,
    val gameId: Long = 0,
    val matchId: Long = 0,
    val playerId: Long = 0,
    val playerName: String = "",
    val teamId: Long = 0,
    val matchday: Int = 1,
    val minutesPlayed: Int = 0,
    val points: Int = 0,
    val fouls: Int = 0,
    val blocks: Int = 0,
    val steals: Int = 0,
    val rebounds: Int = 0,
    val passesOk: Int = 0,
    val passesKo: Int = 0,
    val shotsFreeOk: Int = 0,
    val shotsFreeKo: Int = 0,
    val shotsInteriorOk: Int = 0,
    val shotsInteriorKo: Int = 0,
    val shotsExteriorDoubleOk: Int = 0,
    val shotsExteriorDoubleKo: Int = 0,
    val shotsExteriorTripleOk: Int = 0,
    val shotsExteriorTripleKo: Int = 0
) {
    val totalFgMade: Int get() = shotsInteriorOk + shotsExteriorDoubleOk + shotsExteriorTripleOk
    val totalFgAttempted: Int get() = totalFgMade + shotsInteriorKo + shotsExteriorDoubleKo + shotsExteriorTripleKo
    val total3PtAttempted: Int get() = shotsExteriorTripleOk + shotsExteriorTripleKo
    val totalFtAttempted: Int get() = shotsFreeOk + shotsFreeKo

    val fgPercentage: Double
        get() = if (totalFgAttempted > 0) (totalFgMade.toDouble() / totalFgAttempted) * 100.0 else 0.0

    val threePtPercentage: Double
        get() = if (total3PtAttempted > 0) (shotsExteriorTripleOk.toDouble() / total3PtAttempted) * 100.0 else 0.0

    val ftPercentage: Double
        get() = if (totalFtAttempted > 0) (shotsFreeOk.toDouble() / totalFtAttempted) * 100.0 else 0.0

    val per: Double
        get() {
            val positive = (points * 1.0) + (rebounds * 1.2) + (passesOk * 1.5) + (steals * 2.0) + (blocks * 2.0)
            val negative = (passesKo * 1.5) + (fouls * 0.5) + (shotsFreeKo * 0.8) + ((totalFgAttempted - totalFgMade) * 0.7)
            val rawPer = positive - negative
            return if (minutesPlayed > 0) {
                ((rawPer / minutesPlayed.toDouble()) * 24.0).coerceIn(-10.0, 99.0)
            } else {
                0.0
            }
        }
}
