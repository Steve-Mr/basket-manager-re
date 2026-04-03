package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "match_results",
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
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
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

        val per = (((steals.toInt() * 54) + (shotsExt3Ok.toInt() * 52) +
                   ((shotsIntOk.toInt() + shotsExt2Ok.toInt()) * 85) +
                   (shotsFreeOk.toInt() * 47) + (blocks.toInt() * 39) +
                   (passesOk.toInt() * 35) + (rebounds.toInt() * 27)) -
                   (foulsMade.toInt() * 17) - (shotsFreeKo.toInt() * 20) -
                   ((shotsIntKo.toInt() + shotsExt2Ko.toInt()) * 39) -
                   (shotsExt3Ko.toInt() * 39) - (passesKo.toInt() * 54)).toDouble() / minutesPlayed

        return Math.round(per * 100.0) / 100.0
    }
}
