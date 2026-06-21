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

    // evolvePlayerEndOfSeason and shouldPlayerRetire logic will be handled by PlayerDevelopmentEngine.kt
}
