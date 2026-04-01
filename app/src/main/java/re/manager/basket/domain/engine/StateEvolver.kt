package re.manager.basket.domain.engine

import re.manager.basket.data.entity.PlayerEntity
import kotlin.random.Random

class StateEvolver {

    fun evolvePlayerAfterMatch(player: PlayerEntity, isStarter: Boolean, benchImportance: Int): PlayerEntity {
        var newForm = player.stateForm
        var newEnergy = player.stateEnergy

        if (isStarter) {
            newForm += Random.nextInt(6 - benchImportance, 11 - benchImportance + 1)
            newEnergy -= Random.nextInt(7 - benchImportance, 12 - benchImportance + 1)
        } else {
            newForm += Random.nextInt(benchImportance - 5, benchImportance + 1)
            newEnergy -= Random.nextInt(benchImportance - 2, benchImportance + 3 + 1)
        }

        return player.copy(
            stateForm = newForm.coerceIn(20, 99),
            stateEnergy = newEnergy.coerceIn(20, 99)
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

            newForm += Random.nextInt(-17, 16) + Random.nextInt(0, (100 - newForm) / 20 + 1)
            newEnergy += Random.nextInt(-3, 9) + Random.nextInt(0, (100 - newEnergy) / 20 + 1)

            player.copy(
                stateInjury = newInjury,
                stateForm = newForm.coerceIn(20, 99),
                stateEnergy = newEnergy.coerceIn(20, 99)
            )
        }
    }
}
