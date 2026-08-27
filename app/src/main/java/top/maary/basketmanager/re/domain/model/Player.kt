package top.maary.basketmanager.re.domain.model

import kotlin.math.abs
import kotlin.math.roundToInt

data class Player(
    val id: Long = 0,
    val gameId: Long = 0,
    val teamId: Long? = null,
    val name: String,
    val age: Int,
    val potential: Int, // 1..10
    val yearsContract: Int,
    val salary: Int,
    val loyalty: Int = 3, // 1..5
    val yearsExperience: Int = 0,
    val positionFirst: Position,
    val positionSecond: Position = Position.NONE,
    val skillPhysique: Int, // 40..99
    val skillBlock: Int,
    val skillSteal: Int,
    val skillRebound: Int,
    val skillPass: Int,
    val skillShotInterior: Int,
    val skillShotExterior: Int,
    val skillShotFree: Int,
    val stateEnergy: Int = 99, // 0..99
    val stateForm: Int = 50, // 0..99
    val stateInjury: Int = 0 // 0 = healthy, -1 = sore, >0 = days left
) {
    val shortName: String
        get() {
            val parts = name.trim().split(" ")
            return if (parts.size >= 2) {
                "${parts[0].firstOrNull()?.uppercaseChar() ?: ""}. ${parts.drop(1).joinToString(" ")}"
            } else {
                name
            }
        }

    val isHealthy: Boolean get() = stateInjury == 0

    val attackRating: Int
        get() = calculateAverageSkill(positionFirst, attack = true, defense = false).roundToInt()

    val defenseRating: Int
        get() = calculateAverageSkill(positionFirst, attack = false, defense = true).roundToInt()

    val overallRating: Int
        get() = calculateAverageSkill(positionFirst, attack = true, defense = true).roundToInt()

    val overallRatingExact: Double
        get() = calculateAverageSkill(positionFirst, attack = true, defense = true)

    val value: Double
        get() = overallRating.toDouble() + (potential * 2.0) - (age / 2.0)

    val marketValue: Double
        get() {
            val valDiff = value - 70.0
            var mv = (((valDiff * abs(valDiff)) / 4.0) - ((salary.toDouble() / 2500000.0) + (((age - 18) * (age - 18)).toDouble() / 15.0))) + 10.0
            if (age < 24 && potential > 8) {
                mv += potential.toDouble()
            }
            if (overallRating > 79) {
                mv += (potential + 10).toDouble()
            }
            return if (mv < 0.0) mv / 4.0 else mv
        }

    fun getPositionPenalty(position: Position?): Int {
        if (position == null || position == Position.NONE || position == positionFirst) return 0
        return if (position == positionSecond) -2 else -7
    }

    fun getConditionPenalty(): Int {
        val formMod = when {
            stateForm >= 80 -> 0
            stateForm >= 60 -> -1
            stateForm >= 40 -> -2
            stateForm >= 20 -> -4
            else -> -8
        }
        val energyMod = when {
            stateEnergy >= 80 -> 0
            stateEnergy >= 60 -> -1
            stateEnergy >= 40 -> -2
            stateEnergy >= 20 -> -4
            else -> -8
        }
        return formMod + energyMod
    }

    fun getPenalty(position: Position?): Int {
        return getPositionPenalty(position) + getConditionPenalty()
    }

    fun getMatchValue(position: Position? = null): Double = calculateValuation(position)

    fun calculateValuation(position: Position? = null): Double {
        val pos = position ?: positionFirst
        val penalty = getPenalty(pos)
        return overallRating.toDouble() + (potential * 1.8) - (age / 2.5) + penalty
    }

    fun calculateAverageSkill(pos: Position, attack: Boolean, defense: Boolean): Double {
        if (pos == Position.NONE) return 50.0
        val p = pos.id
        var sum = 0.0
        if (attack) {
            val attackWeights = getBaseOfPosition(p, 5) + getBaseOfPosition(p, 6) +
                    getBaseOfPosition(p, 7) + getBaseOfPosition(p, 8)
            val attackSum = (skillPass * getBaseOfPosition(p, 5)) +
                    (skillShotInterior * getBaseOfPosition(p, 6)) +
                    (skillShotExterior * getBaseOfPosition(p, 7)) +
                    (skillShotFree * getBaseOfPosition(p, 8))
            sum += attackSum.toDouble() / attackWeights
        }
        if (defense) {
            val defenseWeights = getBaseOfPosition(p, 1) + getBaseOfPosition(p, 2) +
                    getBaseOfPosition(p, 3) + getBaseOfPosition(p, 4)
            val defenseSum = (skillPhysique * getBaseOfPosition(p, 1)) +
                    (skillBlock * getBaseOfPosition(p, 2)) +
                    (skillSteal * getBaseOfPosition(p, 3)) +
                    (skillRebound * getBaseOfPosition(p, 4))
            sum += defenseSum.toDouble() / defenseWeights
        }
        val res = if (attack && defense) {
            (sum / 1.5) - 19.0
        } else {
            (sum / 0.75) - 19.0
        }
        return res.coerceIn(40.0, 99.0)
    }

    companion object {
        fun getBaseOfPosition(pos: Int, skill: Int): Int {
            return when (skill) {
                1 -> when (pos) { // Physique (Body & Stamina)
                    1 -> 25
                    2 -> 26
                    3 -> 28
                    4 -> 32
                    else -> 34
                }
                2 -> when (pos) { // Block
                    1 -> 10
                    2 -> 14
                    3 -> 24
                    4 -> 31
                    else -> 35
                }
                3 -> when (pos) { // Steal
                    1 -> 30
                    2 -> 28
                    3 -> 25
                    4 -> 18
                    else -> 12
                }
                4 -> when (pos) { // Rebound
                    1 -> 14
                    2 -> 18
                    3 -> 26
                    4 -> 32
                    else -> 35
                }
                5 -> when (pos) { // Pass
                    1 -> 35
                    2 -> 28
                    3 -> 25
                    4 -> 18
                    else -> 16
                }
                6 -> when (pos) { // Shot Interior (2PT / Mid-range & Paint Scoring)
                    1 -> 25 // Calibrated PG mid-range & slashing
                    2 -> 27 // Calibrated SG scoring
                    3 -> 28
                    4 -> 32
                    else -> 35
                }
                7 -> when (pos) { // Shot Exterior (3PT)
                    1 -> 30
                    2 -> 33
                    3 -> 28
                    4 -> 22
                    else -> 14
                }
                8 -> when (pos) { // Free Throw
                    1 -> 30
                    2 -> 30
                    3 -> 28
                    4 -> 24
                    else -> 20
                }
                else -> 20
            }
        }
    }
}
