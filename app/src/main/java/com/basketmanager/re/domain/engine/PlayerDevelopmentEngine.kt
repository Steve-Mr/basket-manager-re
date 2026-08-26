package com.basketmanager.re.domain.engine

import com.basketmanager.re.domain.model.Player
import kotlin.random.Random

object PlayerDevelopmentEngine {

    fun developPlayer(player: Player): Player {
        val age = player.age
        val potential = player.potential

        var physique = player.skillPhysique
        var block = player.skillBlock
        var steal = player.skillSteal
        var rebound = player.skillRebound
        var pass = player.skillPass
        var shotInt = player.skillShotInterior
        var shotExt = player.skillShotExterior
        var shotFre = player.skillShotFree
        var newPotential = potential

        if (age <= 24) {
            // High growth phase
            val growthPoints = when {
                potential >= 9 -> Random.nextInt(2, 5)
                potential >= 7 -> Random.nextInt(1, 4)
                potential >= 5 -> Random.nextInt(1, 3)
                else -> Random.nextInt(0, 2)
            }
            repeat(growthPoints) {
                when (Random.nextInt(8)) {
                    0 -> physique = (physique + 1).coerceAtMost(99)
                    1 -> block = (block + 1).coerceAtMost(99)
                    2 -> steal = (steal + 1).coerceAtMost(99)
                    3 -> rebound = (rebound + 1).coerceAtMost(99)
                    4 -> pass = (pass + 1).coerceAtMost(99)
                    5 -> shotInt = (shotInt + 1).coerceAtMost(99)
                    6 -> shotExt = (shotExt + 1).coerceAtMost(99)
                    7 -> shotFre = (shotFre + 1).coerceAtMost(99)
                }
            }
            // Occasional breakout potential change
            if (Random.nextInt(50) == 0) {
                newPotential = (potential + Random.nextInt(-1, 2)).coerceIn(1, 10)
            }
        } else if (age >= 32) {
            // Decline phase for physical skills
            val declinePoints = when {
                age >= 37 -> Random.nextInt(2, 4)
                age >= 34 -> Random.nextInt(1, 3)
                else -> Random.nextInt(0, 2)
            }
            repeat(declinePoints) {
                when (Random.nextInt(4)) {
                    0 -> physique = (physique - 1).coerceAtLeast(40)
                    1 -> block = (block - 1).coerceAtLeast(40)
                    2 -> steal = (steal - 1).coerceAtLeast(40)
                    3 -> rebound = (rebound - 1).coerceAtLeast(40)
                }
            }
        }

        return player.copy(
            potential = newPotential,
            skillPhysique = physique,
            skillBlock = block,
            skillSteal = steal,
            skillRebound = rebound,
            skillPass = pass,
            skillShotInterior = shotInt,
            skillShotExterior = shotExt,
            skillShotFree = shotFre
        )
    }

    fun handleSeasonRetirements(players: List<Player>): Pair<List<Player>, List<Player>> {
        // Returns Pair(ActivePlayers, RetiredPlayers)
        val active = mutableListOf<Player>()
        val retired = mutableListOf<Player>()

        for (player in players) {
            val age = player.age + 1
            val contract = (player.yearsContract - 1).coerceAtLeast(0)
            val shouldRetire = when {
                age >= 40 -> true
                age >= 36 -> Random.nextInt(100) < 55
                age >= 33 -> Random.nextInt(100) < 20
                else -> false
            }

            if (shouldRetire) {
                retired.add(player.copy(age = age, yearsContract = 0))
            } else {
                active.add(
                    player.copy(
                        age = age,
                        yearsContract = contract,
                        yearsExperience = player.yearsExperience + 1,
                        stateEnergy = 99,
                        stateForm = Random.nextInt(40, 70),
                        stateInjury = 0
                    )
                )
            }
        }
        return active to retired
    }
}
