package top.maary.basketmanager.re.engine

import org.junit.Assert.*
import org.junit.Test
import top.maary.basketmanager.re.domain.engine.*
import top.maary.basketmanager.re.domain.model.*

class SimulationEngineTest {

    @Test
    fun testRosterParserAuthentic() {
        val csv = """
            age;name;positionFirst;positionSecond;potential;salary;skillBlock;skillPass;skillPhysique;skillRebound;skillShotExterior;skillShotFree;skillShotInterior;skillSteal;team;yearsContract;yearsExperience
            26;Damon Lillard;1;0;8;3203000;47;84;95;55;93;89;83;65;POR;3;124
            30;Kerry Bryant;2;3;9;25000000;50;82;88;60;94;90;92;75;LAL;2;120
            22;Free Rookie;3;0;7;0;50;50;70;60;65;70;60;55;0;0;0
        """.trimIndent()

        val parsed = RosterParser.parseRostersCsv(csv.byteInputStream())
        assertEquals(3, parsed.size)
        assertEquals("Damon Lillard", parsed[0].player.name)
        assertEquals("POR", parsed[0].teamCode)
        assertEquals(Position.POINT_GUARD, parsed[0].player.positionFirst)
        assertTrue(parsed[0].player.overallRating >= 80)
        assertEquals("LAL", parsed[1].teamCode)
        assertEquals("0", parsed[2].teamCode)
    }

    @Test
    fun testLineupOptimizer() {
        val players = (1..15).map { i ->
            Player(
                id = i.toLong(),
                gameId = 1,
                teamId = 1,
                name = "Player $i",
                age = 22 + i,
                potential = 5,
                yearsContract = 2,
                salary = 2000000,
                positionFirst = Position.fromId((i % 5) + 1),
                skillPhysique = 70 + (i % 20),
                skillBlock = 60,
                skillSteal = 60,
                skillRebound = 60,
                skillPass = 65,
                skillShotInterior = 70,
                skillShotExterior = 70,
                skillShotFree = 75
            )
        }

        val initialTactic = Tactic(id = 1, gameId = 1, teamId = 1)
        val optimized = LineupOptimizer.optimizeLineup(players, initialTactic)

        assertNotNull(optimized.starterPgId)
        assertNotNull(optimized.starterSgId)
        assertNotNull(optimized.starterSfId)
        assertNotNull(optimized.starterPfId)
        assertNotNull(optimized.starterCId)
        assertNotNull(optimized.starOnePlayerId)
    }

    @Test
    fun testMatchSimulationEngine() {
        fun createSquad(teamId: Long, prefix: String): List<Player> {
            return (1..12).map { i ->
                val pos = Position.fromId((i % 5) + 1)
                Player(
                    id = teamId * 100 + i,
                    gameId = 1,
                    teamId = teamId,
                    name = "$prefix Player $i",
                    age = 24,
                    potential = 7,
                    yearsContract = 2,
                    salary = 5000000,
                    positionFirst = pos,
                    skillPhysique = 80,
                    skillBlock = 70,
                    skillSteal = 70,
                    skillRebound = 75,
                    skillPass = 80,
                    skillShotInterior = 80,
                    skillShotExterior = 80,
                    skillShotFree = 80,
                    stateEnergy = 99,
                    stateForm = 75,
                    stateInjury = 0
                )
            }
        }

        val squad1 = createSquad(1, "BOS")
        val squad2 = createSquad(2, "NYK")

        val team1 = Team(id = 1, gameId = 1, name = "BOS", conference = Conference.EAST, division = Division.E1_ATLANTIC, salaryCap = 70000000)
        val team2 = Team(id = 2, gameId = 1, name = "NYK", conference = Conference.EAST, division = Division.E1_ATLANTIC, salaryCap = 70000000)

        val tactic1 = LineupOptimizer.optimizeLineup(squad1, Tactic(teamId = 1))
        val tactic2 = LineupOptimizer.optimizeLineup(squad2, Tactic(teamId = 2))

        val match = Match(
            id = 1,
            gameId = 1,
            matchday = 1,
            teamLocalId = 1,
            teamVisitorId = 2
        )

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
        assertTrue("Game should have realistic NBA points (> 60)", result.match.localScore!! > 60)
        assertTrue("Game should have realistic NBA points (> 60)", result.match.visitorScore!! > 60)
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
            salary = 3000000,
            positionFirst = Position.POINT_GUARD,
            skillPhysique = 70,
            skillBlock = 50,
            skillSteal = 60,
            skillRebound = 55,
            skillPass = 75,
            skillShotInterior = 70,
            skillShotExterior = 75,
            skillShotFree = 75
        )

        val dummyBoxScores = (1..10).map { day ->
            MatchResult(
                matchId = day.toLong(),
                gameId = 1,
                playerId = 1,
                playerName = "Young Star",
                teamId = 1,
                matchday = day,
                minutesPlayed = 35,
                points = 22,
                fouls = 2,
                blocks = 1,
                steals = 2,
                rebounds = 5,
                passesOk = 8,
                passesKo = 2,
                shotsFreeOk = 4,
                shotsFreeKo = 1,
                shotsInteriorOk = 6,
                shotsInteriorKo = 3,
                shotsExteriorDoubleOk = 1,
                shotsExteriorDoubleKo = 1,
                shotsExteriorTripleOk = 2,
                shotsExteriorTripleKo = 2
            )
        }

        val devResult = PlayerDevelopmentEngine.developPlayerAuthentic(
            player = player,
            recentResults = dummyBoxScores,
            currentMatchday = 10,
            userTeamId = 1
        )

        assertNotNull(devResult.updatedPlayer)
    }

    @Test
    fun testTradeEvaluation() {
        val teamA = Team(id = 1, gameId = 1, name = "BOS", conference = Conference.EAST, division = Division.E1_ATLANTIC, salaryCap = 70000000)
        val teamB = Team(id = 2, gameId = 1, name = "LAL", conference = Conference.WEST, division = Division.W3_PACIFIC, salaryCap = 70000000)

        val star = Player(
            id = 10, gameId = 1, teamId = 1, name = "Star Player", age = 25, potential = 9,
            yearsContract = 3, salary = 15000000, positionFirst = Position.POINT_GUARD,
            skillPhysique = 90, skillBlock = 80, skillSteal = 85, skillRebound = 80,
            skillPass = 92, skillShotInterior = 90, skillShotExterior = 92, skillShotFree = 90
        )
        val scrub = Player(
            id = 20, gameId = 1, teamId = 2, name = "Bench Player", age = 34, potential = 2,
            yearsContract = 1, salary = 2000000, positionFirst = Position.CENTER,
            skillPhysique = 50, skillBlock = 50, skillSteal = 40, skillRebound = 50,
            skillPass = 40, skillShotInterior = 45, skillShotExterior = 40, skillShotFree = 50
        )

        val unfairResult = TradeEvaluationEngine.evaluateTrade(
            teamA = teamA,
            teamB = teamB,
            teamAPlayers = listOf(scrub),
            teamBPlayers = listOf(star),
            teamADraftPicks = emptyList(),
            teamBDraftPicks = emptyList(),
            teamARoster = listOf(scrub),
            teamBRoster = listOf(star)
        )

        assertFalse(unfairResult.isAccepted)
    }
}
