package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "matches")
data class MatchEntity(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val gameId: Int,
    val matchday: Int,
    val teamLocalId: Int,
    val teamVisitorId: Int,
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
