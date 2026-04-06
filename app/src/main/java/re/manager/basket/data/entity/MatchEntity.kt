package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "matches",
    foreignKeys = [
        ForeignKey(
            entity = TeamEntity::class,
            parentColumns = ["id", "gameId"],
            childColumns = ["teamLocalId", "gameId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = TeamEntity::class,
            parentColumns = ["id", "gameId"],
            childColumns = ["teamVisitorId", "gameId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = GameEntity::class,
            parentColumns = ["id"],
            childColumns = ["gameId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index("gameId"),
        Index("teamLocalId", "gameId"),
        Index("teamVisitorId", "gameId")
    ]
)
data class MatchEntity(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val gameId: Int,
    val matchday: Int,
    val teamLocalId: Int,
    val teamVisitorId: Int,
    val season: Int = 0,
    val name: String? = null,
    val localQ1: Int = 0,
    val localQ2: Int = 0,
    val localQ3: Int = 0,
    val localQ4: Int = 0,
    val localExtension: Int = 0,
    val visitorQ1: Int = 0,
    val visitorQ2: Int = 0,
    val visitorQ3: Int = 0,
    val visitorQ4: Int = 0,
    val visitorExtension: Int = 0
)
