package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import re.manager.basket.domain.model.Conference
import re.manager.basket.domain.model.Division

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
    val conference: Conference,
    val division: Division,
    val salaryCap: Int,
    val gameId: Int
) {
    fun addSalaryCap(amount: Int): TeamEntity {
        val newCap = (salaryCap + amount).coerceIn(
            re.manager.basket.domain.model.Constants.SALARY_CAP_MIN,
            re.manager.basket.domain.model.Constants.SALARY_CAP_MAX
        )
        return copy(salaryCap = newCap)
    }
}
