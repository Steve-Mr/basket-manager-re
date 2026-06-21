package re.manager.basket.domain.engine

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TeamEntity
import re.manager.basket.domain.model.Position

class OffseasonManagerTest {

    @Test
    fun testGenerateDraftPlayers() {
        val manager = OffseasonManager()
        val rookies = manager.generateDraftPlayers(90)

        assertEquals(90, rookies.size)
        
        val validAges = 18..24
        assertTrue("Rookies should have valid ages", rookies.all { it.age in validAges })
        
        // Potential should be between 1 and 10
        assertTrue("Rookies should have valid potential", rookies.all { it.potential in 1..10 })
        
        // Ensure salaries and contracts are zero
        assertTrue("Rookies should have no salary initially", rookies.all { it.salary == 0 && it.yearsContract == 0 })
    }

    @Test
    fun testApplyDraftSalary() {
        val manager = OffseasonManager()
        val rookie = manager.generateDraftPlayers(1).first()

        val round1Pick1 = manager.applyDraftSalary(rookie, 1, 1)
        assertEquals(4, round1Pick1.yearsContract)
        assertEquals(6000000, round1Pick1.salary)

        val round2Pick1 = manager.applyDraftSalary(rookie, 2, 1)
        assertTrue(round2Pick1.yearsContract in 2..3)
        assertEquals(300000, round2Pick1.salary) // 305000 - 5000
    }

    @Test
    fun testManageCpuRenewals() {
        val manager = OffseasonManager()
        val player = PlayerEntity(
            id = 1,
            name = "Test Expiring",
            age = 35, // High age to force renewal if skill is > 80
            teamId = 1,
            positionFirst = Position.PG,
            positionSecond = Position.NONE,
            potential = 8,
            salary = 5000000,
            yearsContract = 0,
            yearsExperience = 10,
            skillPhysique = 90, skillBlock = 90, skillSteal = 90, skillRebound = 90,
            skillPass = 90, skillShotInterior = 90, skillShotExterior = 90, skillShotFree = 90,
            stateEnergy = 99, stateForm = 99, stateInjury = 0, gameId = 1
        )
        
        // Single player in team, isUnique = true, should be renewed
        var renewed = false
        var iterations = 0
        while (!renewed && iterations < 20) {
            val result = manager.manageCpuRenewals(player, listOf(player))
            if (result?.yearsContract ?: 0 > 0) renewed = true
            iterations++
        }
        
        // At least sometimes it should renew given 20 iterations
        assertTrue("Player should eventually renew in 20 tries", renewed)
    }

    @Test
    fun testManageCpuFreeAgency() {
        val manager = OffseasonManager()
        val team = TeamEntity(id = 1, gameId = 1, name = "Test", fullName = "Test City", color = "#000000", conference = re.manager.basket.domain.model.Conference.EAST, division = re.manager.basket.domain.model.Division.ATLANTIC, salaryCap = 80000000)
        
        // 13 players means team is lacking players (min is 14 or 15)
        val teamPlayers = mutableListOf<PlayerEntity>()
        repeat(13) { i ->
            teamPlayers.add(PlayerEntity(
                id = i + 1, name = "Player", age = 20, teamId = 1, positionFirst = Position.PG,
                positionSecond = Position.NONE, potential = 5, salary = 1000000, yearsContract = 1,
                yearsExperience = 1, skillPhysique = 50, skillBlock = 50, skillSteal = 50,
                skillRebound = 50, skillPass = 50, skillShotInterior = 50, skillShotExterior = 50,
                skillShotFree = 50, stateEnergy = 99, stateForm = 99, stateInjury = 0, gameId = 1
            ))
        }

        val freeAgent = PlayerEntity(
            id = 100, name = "Free Agent", age = 25, teamId = null, positionFirst = Position.C,
            positionSecond = Position.NONE, potential = 5, salary = 2000000, yearsContract = 0,
            yearsExperience = 5, skillPhysique = 80, skillBlock = 80, skillSteal = 80,
            skillRebound = 80, skillPass = 80, skillShotInterior = 80, skillShotExterior = 80,
            skillShotFree = 80, stateEnergy = 99, stateForm = 99, stateInjury = 0, gameId = 1
        )

        val signedPlayer = manager.manageCpuFreeAgency(team, teamPlayers, listOf(freeAgent))
        
        assertNotNull("Team should have signed a free agent or created a secondary player", signedPlayer)
        if (signedPlayer?.id == freeAgent.id) {
            assertEquals("Free agent should be assigned to team", team.id, signedPlayer?.teamId)
            assertTrue("Free agent should have years contract > 0", (signedPlayer?.yearsContract ?: 0) > 0)
        } else {
            // It created a secondary player
            assertEquals(0, signedPlayer?.id)
            assertEquals(team.id, signedPlayer?.teamId)
        }
    }
}
