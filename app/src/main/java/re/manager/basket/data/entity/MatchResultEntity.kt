package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import re.manager.basket.util.MathUtils.toOriginalInt

@Entity(
    tableName = "match_results",
    primaryKeys = ["matchId", "playerId"],
    foreignKeys = [
        ForeignKey(
            entity = GameEntity::class,
            parentColumns = ["id"],
            childColumns = ["gameId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = MatchEntity::class,
            parentColumns = ["id"],
            childColumns = ["matchId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = PlayerEntity::class,
            parentColumns = ["id"],
            childColumns = ["playerId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("gameId"), Index("matchId"), Index("playerId")]
)
data class MatchResultEntity(
    val gameId: Int,
    val matchId: Int,
    val matchday: Int,
    val playerId: Int,
    val name: String,
    val minutesPlayed: Int = 0,
    val points: Int = 0, // Points are still calculated as Int for final display
    val rebounds: Double = 0.0,
    val assists: Double = 0.0,
    val blocks: Double = 0.0,
    val steals: Double = 0.0,
    val foulsMade: Double = 0.0,
    val shotsIntOk: Double = 0.0,
    val shotsIntKo: Double = 0.0,
    val shotsExt2Ok: Double = 0.0,
    val shotsExt2Ko: Double = 0.0,
    val shotsExt3Ok: Double = 0.0,
    val shotsExt3Ko: Double = 0.0,
    val shotsFreeOk: Double = 0.0,
    val shotsFreeKo: Double = 0.0,
    val passesOk: Double = 0.0,
    val passesKo: Double = 0.0
) {
    fun getPer(): Double {
        if (minutesPlayed == 0) return -100.0

        val per = (((steals.toOriginalInt() * 54) + (shotsExt3Ok.toOriginalInt() * 52) +
                   ((shotsIntOk.toOriginalInt() + shotsExt2Ok.toOriginalInt()) * 85) +
                   (shotsFreeOk.toOriginalInt() * 47) + (blocks.toOriginalInt() * 39) +
                   (passesOk.toOriginalInt() * 35) + (rebounds.toOriginalInt() * 27)) -
                   (foulsMade.toOriginalInt() * 17) - (shotsFreeKo.toOriginalInt() * 20) -
                   ((shotsIntKo.toOriginalInt() + shotsExt2Ko.toOriginalInt()) * 39) -
                   (shotsExt3Ko.toOriginalInt() * 39) - (passesKo.toOriginalInt() * 54)).toDouble() / minutesPlayed

        return Math.round(per * 100.0) / 100.0
    }
}
