package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "teams",
    foreignKeys = [
        ForeignKey(
            entity = GameEntity::class,
            parentColumns = ["id"],
            childColumns = ["gameId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("gameId")]
)
data class TeamEntity(
    @PrimaryKey val id: Int,
    val name: String,
    val fullName: String,
    val color: String,
    val conference: Int,
    val division: Int,
    val salaryCap: Int,
    val gameId: Int
)
