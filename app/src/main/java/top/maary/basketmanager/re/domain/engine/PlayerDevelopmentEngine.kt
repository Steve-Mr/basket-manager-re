package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.*
import kotlin.random.Random

data class DevelopmentReport(
    val updatedPlayer: Player,
    val generatedNews: List<NewsItem>
)

object PlayerDevelopmentEngine {

    fun developPlayerAuthentic(
        player: Player,
        recentResults: List<MatchResult>,
        currentMatchday: Int,
        userTeamId: Long
    ): DevelopmentReport {
        val oldPotential = player.potential
        val oldRating = player.overallRating.toInt()

        val matchesPlayed = recentResults.size
        val minutesAvg = if (matchesPlayed == 0) 0 else recentResults.sumOf { it.minutesPlayed } / matchesPlayed
        val perAvg = if (matchesPlayed == 0) 0.0 else recentResults.sumOf { it.per } / matchesPlayed

        var loops = when {
            player.potential <= 4 && player.age < 30 -> 0
            player.potential <= 6 && player.age < 30 -> 1
            player.potential <= 8 && player.age < 30 -> 2
            player.potential <= 9 && player.age < 30 -> 4
            player.potential <= 10 && player.age < 30 -> 5
            else -> 3 // Age >= 30 defaults to 3 loops in BM15
        }

        if (player.overallRating > 90.0 && player.age < 30) loops--
        if (player.age < 21) loops++

        var curPlayer = player

        for (i in 0 until loops) {
            val randomPot = Random.nextInt(1, 11)
            if (curPlayer.age < 30 || randomPot < curPlayer.potential - 4) {
                val minVal = (curPlayer.potential * (30 - curPlayer.age)) + minutesAvg
                val maxVal = 150
                val randVal = if (minVal >= maxVal) {
                    minVal
                } else {
                    Random.nextInt(minVal, maxVal + 1)
                }

                val devRoll = perAvg.toInt() + randVal
                if (devRoll > 138 && (Random.nextInt(1, 11) >= 6 || curPlayer.overallRating < 76.0)) {
                    curPlayer = applySkillChange(curPlayer, isIncrement = true)
                }
            } else if (curPlayer.age > 30) {
                val declineMin = curPlayer.potential + minutesAvg
                val declineMax = 140
                val declineRoll = if (declineMin >= declineMax) {
                    declineMin
                } else {
                    Random.nextInt(declineMin, declineMax + 1)
                }
                if (declineRoll < 55) {
                    curPlayer = applySkillChange(curPlayer, isIncrement = false)
                }
            }
        }

        // Potential fluctuation (1 / 200 chance)
        if (Random.nextInt(1, 201) == 1) {
            val potChange = Random.nextInt(-1, 2)
            curPlayer = curPlayer.copy(potential = (curPlayer.potential + potChange).coerceIn(1, 10))
        }

        // Heavy injury & low energy regression
        if (curPlayer.stateInjury > 100 || Random.nextInt(1, (curPlayer.skillPhysique + curPlayer.stateEnergy).coerceAtLeast(2)) < 2) {
            curPlayer = applySkillChange(curPlayer, isIncrement = false)
        }

        val news = mutableListOf<NewsItem>()
        if (curPlayer.teamId == userTeamId) {
            if (curPlayer.potential != oldPotential) {
                val isImproved = curPlayer.potential > oldPotential
                val title = if (isImproved) "Potential Improved" else "Potential Declined"
                val sign = if (isImproved) "+" else ""
                val delta = curPlayer.potential - oldPotential
                val body = "${curPlayer.name} potential changed from $oldPotential/10 to ${curPlayer.potential}/10 ($sign$delta)."
                news.add(
                    NewsItem(
                        gameId = curPlayer.gameId,
                        matchday = currentMatchday,
                        type = if (isImproved) NewsType.IMPROVE else NewsType.DECLINE,
                        title = title,
                        body = body,
                        team1Id = curPlayer.teamId,
                        playerId = curPlayer.id
                    )
                )
            }
            val newRating = curPlayer.overallRating.toInt()
            if (newRating != oldRating) {
                val isImproved = newRating > oldRating
                val title = if (isImproved) "Player Improved" else "Player Declined"
                val sign = if (isImproved) "+" else ""
                val delta = newRating - oldRating
                val body = "${curPlayer.name} overall rating changed from $oldRating to $newRating ($sign$delta)."
                news.add(
                    NewsItem(
                        gameId = curPlayer.gameId,
                        matchday = currentMatchday,
                        type = if (isImproved) NewsType.IMPROVE else NewsType.DECLINE,
                        title = title,
                        body = body,
                        team1Id = curPlayer.teamId,
                        playerId = curPlayer.id
                    )
                )
            }
        }

        return DevelopmentReport(curPlayer, news)
    }

    private fun applySkillChange(player: Player, isIncrement: Boolean): Player {
        val posId = player.positionFirst.id
        // In BM15: weights are getBaseOfPosition(posId, skillType) + 15
        val weights = (1..8).map { skillType -> Player.getBaseOfPosition(posId, skillType) + 15 }
        val total = weights.sum()
        var roll = Random.nextInt(total) + 1
        var chosenSkill = 1
        for (i in weights.indices) {
            roll -= weights[i]
            if (roll <= 0) {
                chosenSkill = i + 1
                break
            }
        }

        val delta = if (isIncrement) 1 else -1

        return when (chosenSkill) {
            1 -> player.copy(skillPhysique = (player.skillPhysique + delta).coerceIn(40, 99))
            2 -> player.copy(skillBlock = (player.skillBlock + delta).coerceIn(40, 99))
            3 -> player.copy(skillSteal = (player.skillSteal + delta).coerceIn(40, 99))
            4 -> player.copy(skillRebound = (player.skillRebound + delta).coerceIn(40, 99))
            5 -> player.copy(skillPass = (player.skillPass + delta).coerceIn(40, 99))
            6 -> player.copy(skillShotInterior = (player.skillShotInterior + delta).coerceIn(40, 99))
            7 -> player.copy(skillShotExterior = (player.skillShotExterior + delta).coerceIn(40, 99))
            8 -> player.copy(skillShotFree = (player.skillShotFree + delta).coerceIn(40, 99))
            else -> player
        }
    }

    fun handleSeasonRetirements(players: List<Player>): Pair<List<Player>, List<Player>> {
        val active = mutableListOf<Player>()
        val retired = mutableListOf<Player>()

        for (player in players) {
            val age = player.age + 1
            val contract = (player.yearsContract - 1).coerceAtLeast(0)
            val ovr = player.overallRating

            val shouldRetire = when {
                ovr < 55 -> true // Unplayable in the league
                age < 33 -> false
                age in 33..36 -> {
                    if (contract > 0 && ovr >= 70) false
                    else if (ovr < 65) Random.nextInt(100) < 30
                    else false
                }
                age in 37..39 -> {
                    when {
                        ovr >= 82 -> Random.nextInt(100) < 10 // Active elite superstar (e.g. LeBron tier)
                        ovr >= 74 -> if (contract > 0) false else Random.nextInt(100) < 25
                        ovr >= 65 -> Random.nextInt(100) < 50
                        else -> Random.nextInt(100) < 80
                    }
                }
                else -> { // age >= 40 (NO HARD LIMIT! Capability, contract, and health driven)
                    when {
                        ovr >= 82 -> Random.nextInt(100) < 15 // 40+ legends can keep playing!
                        ovr >= 75 -> if (contract > 0) Random.nextInt(100) < 20 else Random.nextInt(100) < 45
                        ovr >= 68 -> Random.nextInt(100) < 70
                        else -> true
                    }
                }
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
