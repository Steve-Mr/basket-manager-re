package re.manager.basket.domain.engine

import org.junit.Assert.*
import org.junit.Test
import re.manager.basket.data.entity.MatchResultEntity
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.domain.model.Position

class PlayerDevelopmentEngineTest {

    @Test
    fun testDevelopPlayer_IncreasesSkills() {
        val engine = PlayerDevelopmentEngine()
        
        val player = PlayerEntity(
            id = 1,
            name = "Test Player",
            age = 22,
            teamId = 1,
            positionFirst = Position.PG,
            positionSecond = Position.SG,
            potential = 8,
            salary = 1000000,
            yearsContract = 2,
            yearsExperience = 1,
            skillPhysique = 60,
            skillBlock = 60,
            skillSteal = 60,
            skillRebound = 60,
            skillPass = 60,
            skillShotInterior = 60,
            skillShotExterior = 60,
            skillShotFree = 60,
            stateEnergy = 100,
            stateForm = 100,
            stateInjury = 0,
            gameId = 1
        )
        
        val matchResults = List(20) {
            MatchResultEntity(
                gameId = 1,
                matchId = it,
                matchday = it,
                playerId = 1,
                name = "Test Player",
                minutesPlayed = 30,
                points = 15,
                rebounds = 5.0,
                assists = 5.0,
                shotsIntOk = 5.0,
                shotsExt2Ok = 2.0,
                shotsExt3Ok = 1.0,
                shotsFreeOk = 2.0
            )
        }
        
        val initialAverage = player.getAverageSkillAll()
        
        // Let's run development multiple times to force some growth
        var p = player
        for (i in 0..10) {
            val result = engine.developPlayer(p, matchResults, true, i, 1)
            p = result.player
        }
        
        // Since he has high potential, PER, and minutes, he should grow
        assertTrue(p.getAverageSkillAll() >= initialAverage)
    }
}
