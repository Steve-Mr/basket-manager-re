package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.MatchResult

class MatchResultBuilder(
    val matchId: Long,
    val gameId: Long,
    val playerId: Long,
    val playerName: String,
    val teamId: Long,
    val matchday: Int,
    var minutesPlayed: Int = 0,
    var fouls: Int = 0,
    var blocks: Int = 0,
    var steals: Int = 0,
    var rebounds: Int = 0,
    var passesOk: Int = 0,
    var passesKo: Int = 0,
    var shotsFreeOk: Int = 0,
    var shotsFreeKo: Int = 0,
    var shotsInteriorOk: Int = 0,
    var shotsInteriorKo: Int = 0,
    var shotsExteriorDoubleOk: Int = 0,
    var shotsExteriorDoubleKo: Int = 0,
    var shotsExteriorTripleOk: Int = 0,
    var shotsExteriorTripleKo: Int = 0
) {
    fun calculatePoints(): Int {
        return (shotsFreeOk * 1) + (shotsInteriorOk * 2) + (shotsExteriorDoubleOk * 2) + (shotsExteriorTripleOk * 3)
    }

    fun build(): MatchResult {
        return MatchResult(
            matchId = matchId,
            gameId = gameId,
            playerId = playerId,
            playerName = playerName,
            teamId = teamId,
            matchday = matchday,
            minutesPlayed = minutesPlayed,
            points = calculatePoints(),
            fouls = fouls,
            blocks = blocks,
            steals = steals,
            rebounds = rebounds,
            passesOk = passesOk,
            passesKo = passesKo,
            shotsFreeOk = shotsFreeOk,
            shotsFreeKo = shotsFreeKo,
            shotsInteriorOk = shotsInteriorOk,
            shotsInteriorKo = shotsInteriorKo,
            shotsExteriorDoubleOk = shotsExteriorDoubleOk,
            shotsExteriorDoubleKo = shotsExteriorDoubleKo,
            shotsExteriorTripleOk = shotsExteriorTripleOk,
            shotsExteriorTripleKo = shotsExteriorTripleKo
        )
    }
}
