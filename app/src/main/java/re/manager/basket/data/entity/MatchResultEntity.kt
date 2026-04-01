package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "match_results")
data class MatchResultEntity(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val gameId: Int,
    val matchId: Int,
    val playerId: Int,
    val matchday: Int,
    val name: String,
    val minutesPlayed: Int = 0,
    val shotsIntOk: Int = 0,
    val shotsIntKo: Int = 0,
    val shotsExt2Ok: Int = 0,
    val shotsExt2Ko: Int = 0,
    val shotsExt3Ok: Int = 0,
    val shotsExt3Ko: Int = 0,
    val shotsFreeOk: Int = 0,
    val shotsFreeKo: Int = 0,
    val rebounds: Int = 0,
    val assists: Int = 0,
    val steals: Int = 0,
    val blocks: Int = 0,
    val foulsMade: Int = 0
)
