package re.manager.basket.domain.engine

import re.manager.basket.data.entity.PlayerEntity
import kotlin.random.Random

class StateEvolver {

    fun evolvePlayerAfterMatch(player: PlayerEntity, isStarter: Boolean, isReserve: Boolean, benchImportance: Int, bono: Int): PlayerEntity {
        var newForm = player.stateForm + bono
        var newEnergy = player.stateEnergy

        if (isStarter) {
            newForm += Random.nextInt(6 - benchImportance, 11 - benchImportance + 1)
            newEnergy -= Random.nextInt(7 - benchImportance, 12 - benchImportance + 1)
        } else if (isReserve) {
            newForm += Random.nextInt(benchImportance - 5, benchImportance + 1)
            newEnergy -= Random.nextInt(benchImportance - 2, benchImportance + 3 + 1)
        } else {
            newForm -= Random.nextInt(-1, (player.stateForm / 10).coerceAtLeast(0) + 1)
            newEnergy += Random.nextInt(1, ((100 - player.stateEnergy) / 4).coerceAtLeast(1) + 1)
        }

        return player.copy(
            stateForm = newForm.coerceIn(0, 100),
            stateEnergy = newEnergy.coerceIn(0, 100)
        )
    }

    fun evolveAllPlayersDaily(players: List<PlayerEntity>): List<PlayerEntity> {
        return players.map { player ->
            var newInjury = player.stateInjury
            var newForm = player.stateForm
            var newEnergy = player.stateEnergy

            if (newInjury > 0) {
                newInjury -= 1
                newForm -= Random.nextInt(0, 4)
            } else if (newInjury < 0) {
                newInjury = 0
            }

            newForm += Random.nextInt(-17, 16) + Random.nextInt(0, ((100 - newForm) / 20).coerceAtLeast(0) + 1)
            newEnergy += Random.nextInt(-3, 9) + Random.nextInt(0, ((100 - newEnergy) / 20).coerceAtLeast(0) + 1)

            player.copy(
                stateInjury = newInjury,
                stateForm = newForm.coerceIn(0, 100),
                stateEnergy = newEnergy.coerceIn(0, 100)
            )
        }
    }

    fun evolvePlayerEndOfSeason(player: PlayerEntity): PlayerEntity {
        // Age, Potential based growth/decline
        val age = player.age
        val potential = player.potential

        // Growth factor: 18-28 usually grows, 32+ usually declines
        val skillDelta = when {
            age < 24 -> Random.nextInt(1, potential + 1)
            age < 28 -> Random.nextInt(0, (potential / 2) + 1)
            age > 32 -> -Random.nextInt(1, (age - 30).coerceAtMost(5) + 1)
            else -> Random.nextInt(-1, 2)
        }

        return player.copy(
            age = age + 1,
            yearsExperience = player.yearsExperience + 1,
            yearsContract = (player.yearsContract - 1).coerceAtLeast(0),
            skillPhysique = (player.skillPhysique + skillDelta).coerceIn(40, 99),
            skillBlock = (player.skillBlock + skillDelta).coerceIn(40, 99),
            skillSteal = (player.skillSteal + skillDelta).coerceIn(40, 99),
            skillRebound = (player.skillRebound + skillDelta).coerceIn(40, 99),
            skillPass = (player.skillPass + skillDelta).coerceIn(40, 99),
            skillShotInterior = (player.skillShotInterior + skillDelta).coerceIn(40, 99),
            skillShotExterior = (player.skillShotExterior + skillDelta).coerceIn(40, 99),
            skillShotFree = (player.skillShotFree + skillDelta).coerceIn(40, 99),
            stateEnergy = 99,
            stateInjury = 0
        )
    }

    fun shouldPlayerRetire(player: PlayerEntity): Boolean {
        if (player.age > 40) return true
        if (player.age < 25) return false

        // Base retirement chance: 5% at 30, increases with age
        val chance = (player.age - 25) * 2 + (if (player.getAverageSkillAll() < 60) 10 else 0)
        return Random.nextInt(0, 100) < chance
    }
}
