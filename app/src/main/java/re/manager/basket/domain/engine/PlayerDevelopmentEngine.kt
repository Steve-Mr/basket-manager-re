package re.manager.basket.domain.engine

import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.MatchResultEntity
import re.manager.basket.data.entity.NewsEntity
import kotlin.random.Random

data class DevelopmentResult(
    val player: PlayerEntity,
    val news: List<NewsEntity>
)

class PlayerDevelopmentEngine {

    fun developPlayer(
        player: PlayerEntity,
        playerMatchResults: List<MatchResultEntity>,
        isUserTeam: Boolean,
        currentMatchday: Int,
        gameId: Int
    ): DevelopmentResult {
        var p = player.copy()
        val newsList = mutableListOf<NewsEntity>()
        
        val oldPotential = p.potential
        val oldRating = p.getAverageSkillAll().toInt()

        val matches = playerMatchResults.size
        val minutesAverage = if (matches == 0) 0 else playerMatchResults.sumOf { it.minutesPlayed } / matches
        val perAverage = if (matches == 0) 0.0 else playerMatchResults.sumOf { it.getPer() } / matches

        var loops = 3
        if (p.age < 30) {
            when {
                p.potential <= 4 -> loops = 0
                p.potential <= 6 -> loops = 1
                p.potential <= 8 -> loops = 2
                p.potential <= 9 -> loops = 4
                p.potential <= 10 -> loops = 5
            }
            if (p.getAverageSkillAll() > 90.0) loops--
        }
        if (p.age < 21) loops++

        for (i in 0 until loops) {
            val randomPotential = Random.nextInt(1, 11)
            if (p.age < 30 || randomPotential < p.potential - 4) {
                val baseRandomVal = (p.potential * (30 - p.age)) + minutesAverage
                val upperBound = if (150 > baseRandomVal) 150 else baseRandomVal + 1
                val randomDevelopment = perAverage.toInt() + Random.nextInt(baseRandomVal, upperBound + 1)
                
                if (randomDevelopment > 138 && (Random.nextInt(1, 11) >= 6 || p.getAverageSkillAll() < 76.0)) {
                    p = developIncrement(p)
                }
            } else if (p.age > 30) {
                val baseRandomVal = p.potential + minutesAverage
                val upperBound = if (140 > baseRandomVal) 140 else baseRandomVal + 1
                val random = Random.nextInt(baseRandomVal, upperBound + 1)
                if (random < 55) {
                    p = developDecrement(p)
                }
            }
        }

        if (Random.nextInt(1, 201) == 1) {
            val newPotential = p.potential + Random.nextInt(-1, 2)
            if (newPotential != p.potential) p = p.copy(potential = newPotential)
        }

        if (p.stateInjury > 100 || Random.nextInt(1, (p.skillPhysique + p.stateEnergy).coerceAtLeast(2)) < 2) {
            p = developDecrement(p)
        }

        if (isUserTeam) {
            if (p.potential != oldPotential) {
                val type = if (p.potential > oldPotential) "INFO" else "INFO"
                newsList.add(NewsEntity(
                    gameId = gameId,
                    matchday = currentMatchday,
                    type = type,
                    title = if (p.potential > oldPotential) "news_player_improved_potential_title" else "news_player_decline_potential_title",
                    body = p.name
                ))
            }

            val newRating = p.getAverageSkillAll().toInt()
            if (newRating != oldRating) {
                val type = if (newRating > oldRating) "INFO" else "INFO"
                newsList.add(NewsEntity(
                    gameId = gameId,
                    matchday = currentMatchday,
                    type = type,
                    title = if (newRating > oldRating) "news_player_improved_title" else "news_player_decline_title",
                    body = "${p.name}|$oldRating|$newRating"
                ))
            }
        }

        return DevelopmentResult(p, newsList)
    }

    private fun developIncrement(player: PlayerEntity): PlayerEntity = developRulete(player, true, 0)
    private fun developDecrement(player: PlayerEntity): PlayerEntity = developRulete(player, false, 0)

    private fun developRulete(player: PlayerEntity, increment: Boolean, recursivity: Int): PlayerEntity {
        val total = getSumBaseOfPositions(player, 8)
        val random = Random.nextInt(1, total + 1)
        val incVal = if (increment) 1 else -1

        var p = player
        when {
            random <= getSumBaseOfPositions(player, 1) -> {
                if (p.skillPhysique == 99 && recursivity < 3) return developRulete(player, increment, recursivity + 1)
                p = p.copy(skillPhysique = (p.skillPhysique + incVal).coerceIn(40, 99))
            }
            random <= getSumBaseOfPositions(player, 2) -> {
                if (p.skillBlock == 99 && recursivity < 3) return developRulete(player, increment, recursivity + 1)
                p = p.copy(skillBlock = (p.skillBlock + incVal).coerceIn(40, 99))
            }
            random <= getSumBaseOfPositions(player, 3) -> {
                if (p.skillSteal == 99 && recursivity < 3) return developRulete(player, increment, recursivity + 1)
                p = p.copy(skillSteal = (p.skillSteal + incVal).coerceIn(40, 99))
            }
            random <= getSumBaseOfPositions(player, 4) -> {
                if (p.skillRebound == 99 && recursivity < 3) return developRulete(player, increment, recursivity + 1)
                p = p.copy(skillRebound = (p.skillRebound + incVal).coerceIn(40, 99))
            }
            random <= getSumBaseOfPositions(player, 5) -> {
                if (p.skillPass == 99 && recursivity < 3) return developRulete(player, increment, recursivity + 1)
                p = p.copy(skillPass = (p.skillPass + incVal).coerceIn(40, 99))
            }
            random <= getSumBaseOfPositions(player, 6) -> {
                if (p.skillShotInterior == 99 && recursivity < 3) return developRulete(player, increment, recursivity + 1)
                p = p.copy(skillShotInterior = (p.skillShotInterior + incVal).coerceIn(40, 99))
            }
            random <= getSumBaseOfPositions(player, 7) -> {
                if (p.skillShotExterior == 99 && recursivity < 3) return developRulete(player, increment, recursivity + 1)
                p = p.copy(skillShotExterior = (p.skillShotExterior + incVal).coerceIn(40, 99))
            }
            random <= getSumBaseOfPositions(player, 8) -> {
                if (p.skillShotFree == 99 && recursivity < 3) return developRulete(player, increment, recursivity + 1)
                p = p.copy(skillShotFree = (p.skillShotFree + incVal).coerceIn(40, 99))
            }
        }
        return p
    }

    private fun getSumBaseOfPositions(player: PlayerEntity, numSkill: Int): Int {
        var result = 0
        val posId = player.positionFirst.id
        for (i in 1..numSkill) {
            result += PlayerEntity.getBaseOfPosition(posId, i) + 15
        }
        return result
    }

    fun evolvePlayerEndOfSeason(player: PlayerEntity): PlayerEntity {
        return player.copy(
            age = player.age + 1,
            yearsExperience = player.yearsExperience + 1,
            yearsContract = (player.yearsContract - 1).coerceAtLeast(0),
            stateEnergy = 99,
            stateInjury = 0
        )
    }

    fun shouldPlayerRetire(player: PlayerEntity): Boolean {
        if (player.age > 40) return true
        if (player.age < 25) return false

        val chance = (player.age - 25) * 2 + (if (player.getAverageSkillAll() < 60) 10 else 0)
        return Random.nextInt(0, 100) < chance
    }
}
