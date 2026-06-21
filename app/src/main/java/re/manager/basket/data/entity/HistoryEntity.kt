package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "history",
    foreignKeys = [
        ForeignKey(
            entity = GameEntity::class,
            parentColumns = ["id"],
            childColumns = ["gameId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("gameId"), Index("season", "gameId", unique = true)]
)
data class HistoryEntity(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val gameId: Int,
    val season: Int,
    val championTeamId: Int? = null,
    val runnerUpTeamId: Int? = null,
    val mvpPlayerId: Int? = null,
    val rookieOfYearPlayerId: Int? = null,
    val defensivePlayerOfYearId: Int? = null,
    val sixthManOfYearId: Int? = null
)
