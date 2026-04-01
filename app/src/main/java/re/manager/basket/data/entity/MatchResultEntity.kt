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
    val points: Int = 0,
    val rebounds: Int = 0,
    val blocks: Int = 0,
    val steals: Int = 0,
    val foulsMade: Int = 0,
    val shotsIntOk: Int = 0,
    val shotsIntKo: Int = 0,
    val shotsExt2Ok: Int = 0,
    val shotsExt2Ko: Int = 0,
    val shotsExt3Ok: Int = 0,
    val shotsExt3Ko: Int = 0,
    val shotsFreeOk: Int = 0,
    val shotsFreeKo: Int = 0,
    val passesOk: Int = 0,
    val passesKo: Int = 0
)
