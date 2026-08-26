package top.maary.basketmanager.re.domain.model

data class NewsItem(
    val id: Long = 0,
    val gameId: Long = 0,
    val matchday: Int = 0,
    val type: NewsType = NewsType.INFO,
    val title: String,
    val body: String,
    val team1Id: Long? = null,
    val team2Id: Long? = null,
    val playerId: Long? = null,
    val createdAt: Long = System.currentTimeMillis()
)
