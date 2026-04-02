package re.manager.basket.data.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import re.manager.basket.domain.model.Position
import kotlin.math.abs
import kotlin.math.pow

@Entity(
    tableName = "players",
    foreignKeys = [
        ForeignKey(
            entity = TeamEntity::class,
            parentColumns = ["id"],
            childColumns = ["teamId"],
            onDelete = ForeignKey.SET_NULL
        ),
        ForeignKey(
            entity = GameEntity::class,
            parentColumns = ["id"],
            childColumns = ["gameId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("teamId"), Index("gameId")]
)
data class PlayerEntity(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val name: String,
    val age: Int,
    val teamId: Int?, // Nullable for free agents
    val positionFirst: Position,
    val positionSecond: Position,
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
) {
    fun getAverageSkillAll(): Double {
        return getAverageForPosition(positionFirst, attack = true, defense = true)
    }

    fun getValue(): Double {
        return getAverageSkillAll() + (potential * 2.0) - (age / 2.0)
    }

    fun getMarketValue(): Double {
        val value = getValue()
        var marketValue = (((value - 70.0) * abs(value - 70.0)) / 4.0) -
                ((salary / 2500000.0) + ((age - 18.0).pow(2.0) / 15.0)) + 10.0

        if (age < 24 && potential > 8) {
            marketValue += potential
        }
        if (getAverageSkillAll() > 79.0) {
            marketValue += potential + 10.0
        }
        return if (marketValue < 0.0) marketValue / 4.0 else marketValue
    }

    private fun getAverageForPosition(position: Position, attack: Boolean, defense: Boolean): Double {
        var average = 0.0
        if (position == Position.NONE) return 40.0

        if (attack) {
            average += (skillPass * getBaseOfPosition(position.id, 5) +
                    skillShotInterior * getBaseOfPosition(position.id, 6) +
                    skillShotExterior * getBaseOfPosition(position.id, 7) +
                    skillShotFree * getBaseOfPosition(position.id, 8)) / getAttackDivisor(position.id).toDouble()
        }
        if (defense) {
            average += (skillPhysique * getBaseOfPosition(position.id, 1) +
                    skillBlock * getBaseOfPosition(position.id, 2) +
                    skillSteal * getBaseOfPosition(position.id, 3) +
                    skillRebound * getBaseOfPosition(position.id, 4)) / getDefenseDivisor(position.id).toDouble()
        }

        average = if (attack && defense) {
            (average / 1.5) - 19.0
        } else {
            (average / 0.75) - 19.0
        }

        return average.coerceIn(40.0, 99.0)
    }

    private fun getAttackDivisor(position: Int) =
        getBaseOfPosition(position, 5) + getBaseOfPosition(position, 6) +
        getBaseOfPosition(position, 7) + getBaseOfPosition(position, 8)

    private fun getDefenseDivisor(position: Int) =
        getBaseOfPosition(position, 1) + getBaseOfPosition(position, 2) +
        getBaseOfPosition(position, 3) + getBaseOfPosition(position, 4)

    companion object {
        fun getBaseOfPosition(position: Int, skill: Int): Int {
            return when (skill) {
                1 -> if (position == 1 || position == 2) 25 else if (position == 3) 27 else 31
                2 -> when (position) { 1 -> 10; 2 -> 15; 3 -> 27; else -> 31 }
                3 -> when (position) { 1 -> 30; 4 -> 15; 5 -> 10; else -> 27 }
                4 -> when (position) { 1 -> 20; 2 -> 20; 3 -> 27; 4 -> 31; else -> 35 }
                5 -> when (position) { 1 -> 35; 2 -> 30; 3 -> 27; else -> 18 }
                6 -> when (position) { 1 -> 15; 2 -> 25; 3 -> 28; 4 -> 33; else -> 35 }
                7 -> when (position) { 1 -> 30; 2 -> 35; 3 -> 28; 4 -> 25; else -> 15 }
                8 -> if (position == 1 || position == 2) 30 else if (position == 3) 28 else 20
                else -> 0
            }
        }
    }
}
