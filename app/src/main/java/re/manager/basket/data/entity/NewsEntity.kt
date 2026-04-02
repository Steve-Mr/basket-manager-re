package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "news",
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
data class NewsEntity(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val gameId: Int,
    val matchday: Int,
    val title: String,
    val body: String,
    val type: String = "INFO" // INFO, MATCH, INJURY, TROPHY
)
