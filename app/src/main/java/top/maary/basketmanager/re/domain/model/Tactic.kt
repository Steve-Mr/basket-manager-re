package top.maary.basketmanager.re.domain.model

data class Tactic(
    val id: Long = 0,
    val gameId: Long = 0,
    val teamId: Long = 0,
    val gameType: Int = 0, // -2 (Conservative) .. +2 (Aggressive)
    val benchImportance: Int = 3, // 1..5
    val shotInteriorPercent: Int = 40, // 35..45
    val shotTriplePercent: Int = 40, // 35..45
    val starterPgId: Long? = null,
    val starterSgId: Long? = null,
    val starterSfId: Long? = null,
    val starterPfId: Long? = null,
    val starterCId: Long? = null,
    val reservePgId: Long? = null,
    val reserveSgId: Long? = null,
    val reserveSfId: Long? = null,
    val reservePfId: Long? = null,
    val reserveCId: Long? = null,
    val starOnePlayerId: Long? = null,
    val starTwoPlayerId: Long? = null,
    val starThreePlayerId: Long? = null
) {
    val starterIds: List<Long>
        get() = listOfNotNull(starterPgId, starterSgId, starterSfId, starterPfId, starterCId)

    val reserveIds: List<Long>
        get() = listOfNotNull(reservePgId, reserveSgId, reserveSfId, reservePfId, reserveCId)

    val rotationIds: List<Long>
        get() = starterIds + reserveIds

    val starIds: List<Long>
        get() = listOfNotNull(starOnePlayerId, starTwoPlayerId, starThreePlayerId)
}
