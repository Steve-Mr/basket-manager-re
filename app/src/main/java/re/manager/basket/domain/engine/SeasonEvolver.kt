package re.manager.basket.domain.engine

import re.manager.basket.data.entity.PlayerEntity
import kotlin.random.Random

class SeasonEvolver {

    fun evolvePlayersForNewSeason(players: List<PlayerEntity>): List<PlayerEntity> {
        return players.mapNotNull { player ->
            // 1. Check for retirement
            val retirementChance = if (player.age > 33) (player.age - 33) * 15 else 0
            if (Random.nextInt(100) < retirementChance) return@mapNotNull null

            // 2. Age and Contract
            val newAge = player.age + 1
            val newContract = (player.yearsContract - 1).coerceAtLeast(0)

            // 3. Skill progression based on potential
            val growth = if (player.age < 27) {
                Random.nextInt(0, player.potential.coerceAtLeast(1))
            } else {
                Random.nextInt(-3, 2)
            }

            player.copy(
                age = newAge,
                yearsContract = newContract,
                skillPhysique = (player.skillPhysique + growth).coerceIn(40, 99),
                skillShotInterior = (player.skillShotInterior + growth).coerceIn(40, 99),
                yearsExperience = player.yearsExperience + 1,
                stateEnergy = 99,
                stateForm = 50
            )
        }
    }
}
