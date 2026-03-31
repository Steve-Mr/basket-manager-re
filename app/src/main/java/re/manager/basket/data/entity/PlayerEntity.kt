package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "players")
data class PlayerEntity(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val name: String,
    val age: Int,
    val teamId: Int,
    val positionFirst: Int,
    val positionSecond: Int,
    val potential: Int,
    val salary: Int,
    val yearsContract: Int,
    val yearsExperience: Int,
    val skillPhysique: Int,
    val skillBlock: Int,
    val skillSteal: Int,
    val skillRebound: Int,
    val skillPass: Int,
    val skillShotInterior: Int,
    val skillShotExterior: Int,
    val skillShotFree: Int,
    val stateEnergy: Int,
    val stateForm: Int,
    val stateInjury: Int,
    val gameId: Int
)
