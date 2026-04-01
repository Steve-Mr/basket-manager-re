package re.manager.basket.domain.engine

import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.entity.MatchResultEntity
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
    private val rulete = Rulete(
        localTitulars = localPlayers.take(5),
        localReserves = localPlayers.drop(5).take(5),
        visitorTitulars = visitorPlayers.take(5),
        visitorReserves = visitorPlayers.drop(5).take(5)
    )

    fun simulate(): MatchFullResult {
        var localScore = 0
        var visitorScore = 0
        var possessions = 120

        repeat(possessions) { pos ->
            val isLocalAttacking = pos % 2 != 0
            val result = simulatePossession(isLocalAttacking)
            if (isLocalAttacking) localScore += result else visitorScore += result

            if (pos == possessions - 1 && localScore == visitorScore) {
                possessions += 5
            }
        }

        return MatchFullResult(
            match = match.copy(
                localQ1 = (localScore * 0.25).toInt(),
                localQ2 = (localScore * 0.25).toInt(),
                localQ3 = (localScore * 0.25).toInt(),
                localQ4 = localScore - (localScore/4 * 3),
                visitorQ1 = (visitorScore * 0.25).toInt(),
                visitorQ2 = (visitorScore * 0.25).toInt(),
                visitorQ3 = (visitorScore * 0.25).toInt(),
                visitorQ4 = visitorScore - (visitorScore/4 * 3)
            ),
            playerResults = emptyList() // To be implemented with detailed stats tracking
        )
    }

    private fun simulatePossession(isLocalAttacking: Boolean): Int {
        val attackingTactic = if (isLocalAttacking) localTactic else visitorTactic
        val benchImportance = attackingTactic.benchImportance

        // 1. Steal Check
        val defender = rulete.pickPlayer(3, !isLocalAttacking, benchImportance)
        if (Random.nextInt(100) < 14) {
            if (Random.nextInt(100) < defender.skillSteal * 0.5) return 0
        }

        // 2. Shot Selection
        val isInterior = Random.nextInt(100) < attackingTactic.shotIntPercent
        val isTriple = !isInterior && Random.nextInt(100) < attackingTactic.shotTriplePercent

        // 3. Block Check
        val blockAttemptProb = if (isInterior) 11 else 9
        if (Random.nextInt(100) < blockAttemptProb) {
            val blocker = rulete.pickPlayer(2, !isLocalAttacking, benchImportance)
            val shooter = rulete.pickPlayer(if (isInterior) 6 else 7, isLocalAttacking, benchImportance)
            if (blocker.skillBlock + getRandomGauss(0, 100) > (if (isInterior) shooter.skillShotInterior else shooter.skillShotExterior) + getRandomGauss(0, 100)) return 0
        }

        // 4. Shot Success
        val shooter = rulete.pickPlayer(if (isInterior) 6 else 7, isLocalAttacking, benchImportance)
        val shooterSkill = if (isInterior) shooter.skillShotInterior else shooter.skillShotExterior
        val modifier = if (isInterior) 0.65f else if (isTriple) 0.45f else 0.55f

        if (Random.nextInt(1, 101) <= shooterSkill * modifier) {
            return if (isTriple) 3 else 2
        }

        // 5. Rebound
        if (Random.nextInt(100) < 76) {
            val offRebounder = rulete.pickPlayer(4, isLocalAttacking, benchImportance)
            val defRebounder = rulete.pickPlayer(4, !isLocalAttacking, benchImportance)
            if (offRebounder.skillRebound + getRandomGauss(0, 100) > defRebounder.skillRebound + getRandomGauss(0, 100)) {
                return simulatePossession(isLocalAttacking)
            }
        }

        return 0
    }

    private fun getRandomGauss(min: Int, max: Int): Int {
        val rolls = listOf(Random.nextInt(min, max + 1), Random.nextInt(min, max + 1), Random.nextInt(min, max + 1)).sorted()
        return rolls[1]
    }
}

data class MatchFullResult(
    val match: MatchEntity,
    val playerResults: List<MatchResultEntity>
)
