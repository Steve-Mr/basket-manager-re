package com.basketmanager.re.engine

import com.basketmanager.re.domain.engine.*
import com.basketmanager.re.domain.model.*
import org.junit.Assert.*
import org.junit.Test

class SimulationEngineTest {

    @Test
    fun testPlayerRatingAndMarketValue() {
        val player = Player(
            id = 1,
            gameId = 1,
            teamId = 1,
            name = "LeBron James",
            age = 30,
            potential = 9,
            yearsContract = 3,
            salary = 20_000_000,
            loyalty = 5,
            yearsExperience = 11,
            positionFirst = Position.SMALL_FORWARD,
            positionSecond = Position.POWER_FORWARD,
            skillPhysique = 95,
            skillBlock = 80,
            skillSteal = 85,
            skillRebound = 88,
            skillPass = 92,
            skillShotInterior = 94,
            skillShotExterior = 86,
            skillShotFree = 75
        )

        val overall = player.overallRating
        val attack = player.attackRating
        val defense = player.defenseRating
        val marketVal = player.marketValue

        assertTrue("Overall rating should be high for elite player", overall > 80.0)
        assertTrue("Attack rating should be high", attack > 80.0)
        assertTrue("Defense rating should be high", defense > 80.0)
        assertTrue("Market value should be positive", marketVal > 0.0)
        assertEquals("L. James", player.shortName)
    }

    @Test
    fun testDraftProspectGeneration() {
        val prospects = DraftEngine.generateDraftProspects(gameId = 1, count = 90)
        assertEquals(90, prospects.size)
        prospects.forEach { p ->
            assertTrue("Prospect rating in valid bounds", p.overallRating in 40.0..99.0)
            assertTrue("Prospect age in valid bounds", p.age in 18..24)
            assertTrue("Prospect potential in valid bounds", p.potential in 1..10)
        }
    }

    @Test
    fun testLineupOptimizer() {
        val players = (1..15).map { i ->
            val pos = Position.fromId((i % 5) + 1)
            Player(
                id = i.toLong(),
                gameId = 1,
                teamId = 1,
                name = "Player $i",
                age = 22 + (i % 8),
                potential = 6,
                yearsContract = 2,
                salary = 2_000_000,
                positionFirst = pos,
                skillPhysique = 70 + (i % 20),
                skillBlock = 65,
                skillSteal = 65,
                skillRebound = 65,
                skillPass = 65,
                skillShotInterior = 65,
                skillShotExterior = 65,
                skillShotFree = 70
            )
        }

        val tactic = Tactic(id = 1, gameId = 1, teamId = 1)
        val optimized = LineupOptimizer.optimizeLineup(players, tactic)

        assertNotNull(optimized.starterPgId)
        assertNotNull(optimized.starterSgId)
        assertNotNull(optimized.starterSfId)
        assertNotNull(optimized.starterPfId)
        assertNotNull(optimized.starterCId)
        assertEquals(5, optimized.starterIds.size)
        assertEquals(5, optimized.reserveIds.size)
        assertEquals(3, optimized.starIds.size)
    }

    @Test
    fun testMatchSimulationEngine() {
        val team1 = Team(id = 1, gameId = 1, name = "BOS", conference = Conference.EAST, division = Division.E1_ATLANTIC, salaryCap = 80_000_000)
        val team2 = Team(id = 2, gameId = 1, name = "LAL", conference = Conference.WEST, division = Division.W3_PACIFIC, salaryCap = 80_000_000)

        fun createSquad(teamId: Long): List<Player> {
            return (1..12).map { i ->
                val pos = Position.fromId((i % 5) + 1)
                Player(
                    id = (teamId * 100 + i),
                    gameId = 1,
                    teamId = teamId,
                    name = "Team${teamId} Player$i",
                    age = 25,
                    potential = 7,
                    yearsContract = 2,
                    salary = 3_000_000,
                    positionFirst = pos,
                    skillPhysique = 75,
                    skillBlock = 70,
                    skillSteal = 70,
                    skillRebound = 70,
                    skillPass = 75,
                    skillShotInterior = 75,
                    skillShotExterior = 75,
                    skillShotFree = 78
                )
            }
        }

        val squad1 = createSquad(1)
        val squad2 = createSquad(2)

        val tactic1 = LineupOptimizer.optimizeLineup(squad1, Tactic(id = 1, gameId = 1, teamId = 1))
        val tactic2 = LineupOptimizer.optimizeLineup(squad2, Tactic(id = 2, gameId = 1, teamId = 2))

        val match = Match(id = 1, gameId = 1, matchday = 1, teamLocalId = 1, teamVisitorId = 2)

        val result = MatchSimulationEngine.simulateMatch(
            match = match,
            localTeam = team1,
            visitorTeam = team2,
            localPlayers = squad1,
            visitorPlayers = squad2,
            localTactic = tactic1,
            visitorTactic = tactic2,
            userTeamId = 1
        )

        assertTrue(result.match.isPlayed)
        assertNotNull(result.match.localScore)
        assertNotNull(result.match.visitorScore)
        assertTrue("Game should have realistic points", result.match.localScore!! > 60)
        assertTrue("Game should have realistic points", result.match.visitorScore!! > 60)
        assertTrue("Player box scores should be populated", result.playerResults.isNotEmpty())
    }

    @Test
    fun testTradeEvaluationEngine() {
        val teamA = Team(id = 1, gameId = 1, name = "BOS", conference = Conference.EAST, division = Division.E1_ATLANTIC, salaryCap = 80_000_000)
        val teamB = Team(id = 2, gameId = 1, name = "GSW", conference = Conference.WEST, division = Division.W3_PACIFIC, salaryCap = 80_000_000)

        val playerA = Player(
            id = 101, gameId = 1, teamId = 1, name = "Star A", age = 26, potential = 8, yearsContract = 2, salary = 15_000_000,
            positionFirst = Position.POINT_GUARD, skillPhysique = 85, skillBlock = 70, skillSteal = 80, skillRebound = 70,
            skillPass = 90, skillShotInterior = 85, skillShotExterior = 90, skillShotFree = 85
        )
        val playerB = Player(
            id = 201, gameId = 1, teamId = 2, name = "Star B", age = 27, potential = 8, yearsContract = 2, salary = 15_000_000,
            positionFirst = Position.SHOOTING_GUARD, skillPhysique = 85, skillBlock = 70, skillSteal = 80, skillRebound = 70,
            skillPass = 85, skillShotInterior = 85, skillShotExterior = 92, skillShotFree = 88
        )

        val rosterA = (1..14).map { playerA.copy(id = 100L + it, salary = 3_000_000) }
        val rosterB = (1..14).map { playerB.copy(id = 200L + it, salary = 3_000_000) }

        val tradeEval = TradeEvaluationEngine.evaluateTrade(
            teamA = teamA,
            teamB = teamB,
            teamAPlayers = listOf(playerA),
            teamBPlayers = listOf(playerB),
            teamADraftPicks = emptyList(),
            teamBDraftPicks = emptyList(),
            teamARoster = rosterA,
            teamBRoster = rosterB
        )

        assertTrue("Even trade should be accepted", tradeEval.isAccepted)
    }
}
