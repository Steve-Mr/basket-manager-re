package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "games")
data class GameEntity(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val currentMatchday: Int,
    val currentSeason: Int,
    val name: String,
    val userTeamId: Int? = null
)
