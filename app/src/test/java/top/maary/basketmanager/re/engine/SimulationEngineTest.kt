package top.maary.basketmanager.re.engine

import top.maary.basketmanager.re.domain.engine.*
import top.maary.basketmanager.re.domain.model.*
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
        assertTrue("Game should have realistic points", result.match.localScore!! > 40)
        assertTrue("Game should have realistic points", result.match.visitorScore!! > 40)
        assertTrue("Player box scores should be populated", result.playerResults.isNotEmpty())
    }

    @Test
    fun testAuthenticPlayerDevelopment() {
        val player = Player(
            id = 1,
            gameId = 1,
            teamId = 1,
            name = "Young Star",
            age = 20,
            potential = 9,
            yearsContract = 3,
            salary = 3_000_000,
            positionFirst = Position.POINT_GUARD,
            skillPhysique = 75,
            skillBlock = 60,
            skillSteal = 70,
            skillRebound = 65,
            skillPass = 80,
            skillShotInterior = 75,
            skillShotExterior = 78,
            skillShotFree = 80
        )

        val dummyBoxScores = listOf(
            MatchResult(matchId = 1, gameId = 1, playerId = 1, playerName = "Young Star", teamId = 1, matchday = 1, minutesPlayed = 32, points = 25, rebounds = 5, passesOk = 8)
        )

        val report = PlayerDevelopmentEngine.developPlayerAuthentic(player, dummyBoxScores, currentMatchday = 1, userTeamId = 1)
        assertNotNull(report.updatedPlayer)
        assertTrue("Rating should be within valid bounds", report.updatedPlayer.overallRating in 40.0..99.0)
    }
}
