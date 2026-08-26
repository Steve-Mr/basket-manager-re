package top.maary.basketmanager.re.domain.model

data class Match(
    val id: Long = 0,
    val gameId: Long = 0,
    val matchday: Int = 1,
    val teamLocalId: Long,
    val teamVisitorId: Long,
    val name: String? = null,
    val localScore: Int? = null,
    val visitorScore: Int? = null,
    val localQuarter1: Int? = null,
    val localQuarter2: Int? = null,
    val localQuarter3: Int? = null,
    val localQuarter4: Int? = null,
    val localOt: Int? = null,
    val visitorQuarter1: Int? = null,
    val visitorQuarter2: Int? = null,
    val visitorQuarter3: Int? = null,
    val visitorQuarter4: Int? = null,
    val visitorOt: Int? = null,
    val isPlayed: Boolean = false
) {
    val winnerTeamId: Long?
        get() = when {
            localScore == null || visitorScore == null -> null
            localScore > visitorScore -> teamLocalId
            visitorScore > localScore -> teamVisitorId
            else -> null
        }
}
