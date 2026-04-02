package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "tactics",
    foreignKeys = [
        ForeignKey(
            entity = GameEntity::class,
            parentColumns = ["id"],
            childColumns = ["gameId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = TeamEntity::class,
            parentColumns = ["id", "gameId"],
            childColumns = ["teamId", "gameId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("gameId"), Index("teamId")]
)
data class TacticEntity(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val gameId: Int,
    val teamId: Int,
    val titPG: Int,
    val titSG: Int,
    val titSF: Int,
    val titPF: Int,
    val titC: Int,
    val resPG: Int,
    val resSG: Int,
    val resSF: Int,
    val resPF: Int,
    val resC: Int,
    val benchImportance: Int = 5,
    val gameType: Int = 0,
    val shotIntPercent: Int = 50,
    val shotTriplePercent: Int = 20,
    val star1: Int? = null,
    val star2: Int? = null,
    val star3: Int? = null
)
