package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "awards",
    foreignKeys = [
        ForeignKey(
            entity = GameEntity::class,
            parentColumns = ["id"],
            childColumns = ["gameId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = PlayerEntity::class,
            parentColumns = ["id"],
            childColumns = ["playerId"],
            onDelete = ForeignKey.SET_NULL
        ),
        ForeignKey(
            entity = TeamEntity::class,
            parentColumns = ["id", "gameId"],
            childColumns = ["teamId", "gameId"],
            onDelete = ForeignKey.SET_NULL
        )
    ],
    indices = [
        Index("gameId"),
        Index("playerId"),
        Index("teamId", "gameId")
    ]
)
data class AwardEntity(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val gameId: Int,
    val season: Int,
    val type: AwardType,
    val playerId: Int? = null, // Set for MVP, ROY
    val teamId: Int? = null,   // Set for Champion
    val value: String? = null  // Score or info (e.g., PER)
)

enum class AwardType {
    MVP,
    ROY,
    CHAMPION
}
