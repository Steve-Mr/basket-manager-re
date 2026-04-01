package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "leagues")
data class LeagueEntity(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val gameId: Int,
    val teamId: Int,
    val gamesWon: Int = 0,
    val gamesLost: Int = 0,
    val pointsScored: Int = 0,
    val pointsAllowed: Int = 0
)
