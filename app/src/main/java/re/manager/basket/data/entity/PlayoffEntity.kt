package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "playoffs",
    foreignKeys = [
        ForeignKey(
            entity = TeamEntity::class,
            parentColumns = ["id", "gameId"],
            childColumns = ["teamId", "gameId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = GameEntity::class,
            parentColumns = ["id"],
            childColumns = ["gameId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("gameId"), Index("teamId", "gameId")]
)
data class PlayoffEntity(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val gameId: Int,
    val teamId: Int,
    val position: Int, // 1-8 seeding
    val gamesWon: Int = 0,
    val pointsScored: Int = 0,
    val pointsDiff: Int = 0,
    val seriesGamesWon: Int = 0 // Total games won in current series? No, original seems to track total playoff wins to detect round completion
)
