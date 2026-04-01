package re.manager.basket.domain.engine

import re.manager.basket.data.entity.PlayerEntity
import kotlin.random.Random

class Rulete(
    private val localTitulars: List<PlayerEntity>,
    private val localReserves: List<PlayerEntity>,
    private val visitorTitulars: List<PlayerEntity>,
    private val visitorReserves: List<PlayerEntity>
) {
    fun pickPlayer(skillIndex: Int, isLocal: Boolean, benchImportance: Int): PlayerEntity {
        // Bench importance check (original logic: 6 - benchImportance)
        val chanceOfTitular = 6 - benchImportance
        val list = if (Random.nextInt(0, chanceOfTitular + 1) < chanceOfTitular) {
            if (isLocal) localTitulars else visitorTitulars
        } else {
            if (isLocal) localReserves else visitorReserves
        }

        if (list.isEmpty()) return localTitulars.first() // Fallback

        val weights = list.map { calculateWeight(it, skillIndex) }
        val totalWeight = weights.sum()
        if (totalWeight <= 0) return list.random()

        var randomVal = Random.nextInt(1, totalWeight + 1)
        for (i in list.indices) {
            randomVal -= weights[i]
            if (randomVal <= 0) return list[i]
        }
        return list.last()
    }

    private fun calculateWeight(player: PlayerEntity, skillIndex: Int): Int {
        // Implementation of original getTotalRulete logic
        // skillIndex mapping: 0-Minutes, 1-Physique, 2-Block, 3-Steal, 4-Rebound, 5-Pass, 6-IntShot, 7-ExtShot, 8-FreeShot
        val minutes = 30 // Placeholder for real minutes tracking
        return when (skillIndex) {
            0 -> minutes
            1 -> player.skillPhysique * minutes
            2 -> player.skillBlock * minutes
            3 -> player.skillSteal * minutes
            4 -> player.skillRebound * minutes
            5 -> player.skillPass * minutes
            6 -> player.skillShotInterior * (minutes + 5) // Bonus for stars (simplified)
            7 -> player.skillShotExterior * (minutes + 5)
            8 -> player.skillShotFree * (minutes + 5)
            else -> 1
        }
    }
}
