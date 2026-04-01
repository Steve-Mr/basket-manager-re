package re.manager.basket.domain.engine

import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TacticEntity
import kotlin.random.Random

class MatchSimulator(
    private val match: MatchEntity,
    private val localPlayers: List<PlayerEntity>,
    private val visitorPlayers: List<PlayerEntity>,
    private val localTactic: TacticEntity,
    private val visitorTactic: TacticEntity
) {
    private val playerAttackModifiers = mutableMapOf<Int, Int>()
    private val playerDefenseModifiers = mutableMapOf<Int, Int>()

    fun simulate(): MatchResultData {
        calculateModifiers()

        var localScore = 0
        var visitorScore = 0
        var possessions = 120
        var overtimePointsLocal = 0
        var overtimePointsVisitor = 0

        repeat(possessions) { pos ->
            val isLocalAttacking = pos % 2 != 0
            val result = simulatePossession(isLocalAttacking)

            if (pos < 120) {
                if (isLocalAttacking) localScore += result else visitorScore += result
            } else {
                if (isLocalAttacking) overtimePointsLocal += result else overtimePointsVisitor += result
            }

            if (pos == possessions - 1 && (localScore + overtimePointsLocal) == (visitorScore + overtimePointsVisitor)) {
                possessions += 5
            }
        }

        val totalLocal = localScore + overtimePointsLocal
        val totalVisitor = visitorScore + overtimePointsVisitor

        return MatchResultData(
            match = match.copy(
                localQ1 = (localScore * 0.23).toInt(),
                localQ2 = (localScore * 0.25).toInt(),
                localQ3 = (localScore * 0.26).toInt(),
                localQ4 = localScore - ((localScore * 0.23).toInt() + (localScore * 0.25).toInt() + (localScore * 0.26).toInt()),
                localExtension = overtimePointsLocal,
                visitorQ1 = (visitorScore * 0.23).toInt(),
                visitorQ2 = (visitorScore * 0.25).toInt(),
                visitorQ3 = (visitorScore * 0.26).toInt(),
                visitorQ4 = visitorScore - ((visitorScore * 0.23).toInt() + (visitorScore * 0.25).toInt() + (visitorScore * 0.26).toInt()),
                visitorExtension = overtimePointsVisitor
            ),
            localScore = totalLocal,
            visitorScore = totalVisitor
        )
    }

    private fun simulatePossession(isLocalAttacking: Boolean): Int {
        val attackingTactic = if (isLocalAttacking) localTactic else visitorTactic
        val attackingPlayers = if (isLocalAttacking) localPlayers else visitorPlayers
        val defendingPlayers = if (isLocalAttacking) visitorPlayers else localPlayers

        // Pick active players (simplified selection for now)
        val shooter = attackingPlayers.random()
        val defender = defendingPlayers.random()

        // 1. Steal Check
        if (Random.nextInt(100) < 14) {
            val stealSkill = defender.skillSteal + (playerDefenseModifiers[defender.id] ?: 0)
            if (Random.nextInt(100) < stealSkill * 0.5) return 0
        }

        // 2. Shot Selection
        val isInterior = Random.nextInt(100) < attackingTactic.shotIntPercent
        val isTriple = !isInterior && Random.nextInt(100) < attackingTactic.shotTriplePercent

        // 3. Block Check
        val blockAttemptProb = if (isInterior) 11 else 9
        if (Random.nextInt(100) < blockAttemptProb) {
             val blockSkill = defender.skillBlock + (playerDefenseModifiers[defender.id] ?: 0)
             val shooterSkill = if (isInterior) shooter.skillShotInterior else shooter.skillShotExterior
             if (blockSkill + getRandomGauss(0, 100) > shooterSkill + getRandomGauss(0, 100)) return 0
        }

        // 4. Shot Success
        val shooterSkill = if (isInterior) shooter.skillShotInterior else shooter.skillShotExterior
        val modifier = if (isInterior) 0.65f else if (isTriple) 0.45f else 0.55f

        if (Random.nextInt(1, 101) <= shooterSkill * modifier) {
            return if (isTriple) 3 else 2
        }

        // 5. Rebounds
        if (Random.nextInt(100) < 76) {
            val offRebSkill = shooter.skillRebound // Simplified
            val defRebSkill = defender.skillRebound
            if (offRebSkill + getRandomGauss(0, 100) > defRebSkill + getRandomGauss(0, 100)) {
                return simulatePossession(isLocalAttacking)
            }
        }

        return 0
    }

    private fun calculateModifiers() {
        val localBaseMod = if (match.matchday >= 167) 2 else 1
        localPlayers.forEach { playerAttackModifiers[it.id] = localBaseMod }
        visitorPlayers.forEach { playerAttackModifiers[it.id] = 0 }
    }

    private fun getRandomGauss(min: Int, max: Int): Int {
        val rolls = listOf(
            Random.nextInt(min, max + 1),
            Random.nextInt(min, max + 1),
            Random.nextInt(min, max + 1)
        ).sorted()
        return rolls[1]
    }
}

data class MatchResultData(
    val match: MatchEntity,
    val localScore: Int,
    val visitorScore: Int
)
