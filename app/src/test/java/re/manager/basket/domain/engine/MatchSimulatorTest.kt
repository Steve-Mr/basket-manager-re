package re.manager.basket.domain.engine

import org.junit.Assert.*
import org.junit.Test
import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TacticEntity
import re.manager.basket.domain.model.Position

class MatchSimulatorTest {

    @Test
    fun testMatchSimulator_RunsWithoutException() {
        val match = MatchEntity(
            gameId = 1,
            matchday = 1,
            teamLocalId = 1,
            teamVisitorId = 2
        )
        
        fun createDummyPlayer(id: Int, teamId: Int, pos: Position): PlayerEntity {
            return PlayerEntity(
                id = id,
                name = "Player $id",
                age = 25,
                teamId = teamId,
                positionFirst = pos,
                positionSecond = Position.NONE,
                potential = 5,
                salary = 1000000,
                yearsContract = 2,
                yearsExperience = 5,
                skillPhysique = 70,
                skillBlock = 70,
                skillSteal = 70,
                skillRebound = 70,
                skillPass = 70,
                skillShotInterior = 70,
                skillShotExterior = 70,
                skillShotFree = 70,
                stateEnergy = 100,
                stateForm = 100,
                stateInjury = 0,
                gameId = 1
            )
        }
        
        val localPlayers = listOf(
            createDummyPlayer(1, 1, Position.PG),
            createDummyPlayer(2, 1, Position.SG),
            createDummyPlayer(3, 1, Position.SF),
            createDummyPlayer(4, 1, Position.PF),
            createDummyPlayer(5, 1, Position.C),
            createDummyPlayer(6, 1, Position.PG),
            createDummyPlayer(7, 1, Position.SG),
            createDummyPlayer(8, 1, Position.SF),
            createDummyPlayer(9, 1, Position.PF),
            createDummyPlayer(10, 1, Position.C)
        )
        
        val visitorPlayers = listOf(
            createDummyPlayer(11, 2, Position.PG),
            createDummyPlayer(12, 2, Position.SG),
            createDummyPlayer(13, 2, Position.SF),
            createDummyPlayer(14, 2, Position.PF),
            createDummyPlayer(15, 2, Position.C),
            createDummyPlayer(16, 2, Position.PG),
            createDummyPlayer(17, 2, Position.SG),
            createDummyPlayer(18, 2, Position.SF),
            createDummyPlayer(19, 2, Position.PF),
            createDummyPlayer(20, 2, Position.C)
        )
        
        val localTactic = TacticEntity(
            gameId = 1,
            teamId = 1,
            titPG = 1, titSG = 2, titSF = 3, titPF = 4, titC = 5,
            resPG = 6, resSG = 7, resSF = 8, resPF = 9, resC = 10,
            gameType = 0, benchImportance = 5, shotIntPercent = 50, shotTriplePercent = 25,
            star1 = 1, star2 = 2, star3 = 3
        )
        
        val visitorTactic = TacticEntity(
            gameId = 1,
            teamId = 2,
            titPG = 11, titSG = 12, titSF = 13, titPF = 14, titC = 15,
            resPG = 16, resSG = 17, resSF = 18, resPF = 19, resC = 20,
            gameType = 0, benchImportance = 5, shotIntPercent = 50, shotTriplePercent = 25,
            star1 = 11, star2 = 12, star3 = 13
        )
        
        val simulator = MatchSimulator(
            match, localPlayers, visitorPlayers, localTactic, visitorTactic
        )
        
        val result = simulator.simulate()
        
        assertNotNull(result)
        assertEquals(20, result.playerResults.size)
        // Check if quarters exist
        assertTrue(result.match.localQ1 > 0)
        assertTrue(result.match.visitorQ1 > 0)
    }
}
