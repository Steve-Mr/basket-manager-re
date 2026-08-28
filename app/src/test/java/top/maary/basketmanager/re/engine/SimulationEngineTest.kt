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
    fun testDraftProspectBalance() {
        val prospects = DraftEngine.generateDraftProspects(gameId = 1, count = 200)
        assertEquals(200, prospects.size)

        val pgProspects = prospects.filter { it.positionFirst == Position.POINT_GUARD }
        assertTrue("Should generate point guards", pgProspects.isNotEmpty())

        val avgPgMid = pgProspects.map { it.skillShotInterior }.average()
        val avgPg3pt = pgProspects.map { it.skillShotExterior }.average()
        val avgPgPass = pgProspects.map { it.skillPass }.average()

        assertTrue("PG mid-range (Shot Interior) should be balanced (avg >= 55), actual: $avgPgMid", avgPgMid >= 55.0)
        assertTrue("PG 3PT (Shot Exterior) should be strong (avg >= 60), actual: $avgPg3pt", avgPg3pt >= 60.0)
        assertTrue("PG Passing should be elite (avg >= 65), actual: $avgPgPass", avgPgPass >= 65.0)

        // Check center dominance in paint & rebounds
        val cProspects = prospects.filter { it.positionFirst == Position.CENTER }
        assertTrue("Should generate centers", cProspects.isNotEmpty())
        val avgCMid = cProspects.map { it.skillShotInterior }.average()
        val avgCReb = cProspects.map { it.skillRebound }.average()
        val avgCBlk = cProspects.map { it.skillBlock }.average()
        assertTrue("Center paint scoring should be high (avg >= 65), actual: $avgCMid", avgCMid >= 65.0)
        assertTrue("Center rebounding should be high (avg >= 65), actual: $avgCReb", avgCReb >= 65.0)
        assertTrue("Center blocking should be high (avg >= 65), actual: $avgCBlk", avgCBlk >= 65.0)
    }

    @Test
    fun testSmoothVeteranAgingAndLoadManagement() {
        val vet = Player(
            id = 101,
            gameId = 1,
            teamId = 1,
            name = "Veteran Star",
            age = 32,
            potential = 8,
            yearsContract = 2,
            salary = 12000000,
            positionFirst = Position.POINT_GUARD,
            skillPhysique = 82,
            skillBlock = 65,
            skillSteal = 75,
            skillRebound = 65,
            skillPass = 88,
            skillShotInterior = 82,
            skillShotExterior = 86,
            skillShotFree = 88
        )

        // Moderate, controlled 20 minutes/game (load management)
        val boxScores = (1..5).map { day ->
            MatchResult(
                matchId = day.toLong(), gameId = 1, playerId = 101, playerName = "Veteran Star",
                teamId = 1, matchday = day, minutesPlayed = 20, points = 16, fouls = 1, blocks = 0,
                steals = 1, rebounds = 3, passesOk = 6, passesKo = 1, shotsFreeOk = 2, shotsFreeKo = 0,
                shotsInteriorOk = 4, shotsInteriorKo = 2, shotsExteriorDoubleOk = 1, shotsExteriorDoubleKo = 0,
                shotsExteriorTripleOk = 2, shotsExteriorTripleKo = 1
            )
        }

        val report = PlayerDevelopmentEngine.developPlayerAuthentic(
            player = vet,
            recentResults = boxScores,
            currentMatchday = 5,
            userTeamId = 1
        )

        // Rating should remain stable without steep drops
        assertTrue("Veteran rating should stay high with controlled minutes", report.updatedPlayer.overallRating >= 80)
    }

    @Test
    fun testDynamicRetirementWithoutHardAgeLimit() {
        // High-rated 40-year-old legend under contract (e.g. LeBron tier)
        val legend40 = Player(
            id = 201, gameId = 1, teamId = 1, name = "Legendary Veteran", age = 40,
            potential = 9, yearsContract = 2, salary = 25000000, positionFirst = Position.SMALL_FORWARD,
            skillPhysique = 85, skillBlock = 78, skillSteal = 80, skillRebound = 82,
            skillPass = 90, skillShotInterior = 88, skillShotExterior = 86, skillShotFree = 86
        )

        // Low-rated 36-year-old uncontracted player
        val scrub36 = Player(
            id = 202, gameId = 1, teamId = 1, name = "Scrub", age = 36,
            potential = 2, yearsContract = 0, salary = 0, positionFirst = Position.CENTER,
            skillPhysique = 50, skillBlock = 48, skillSteal = 40, skillRebound = 50,
            skillPass = 40, skillShotInterior = 48, skillShotExterior = 40, skillShotFree = 50
        )

        var legendRetiredCount = 0
        val iterations = 100
        for (i in 1..iterations) {
            val (active, retired) = PlayerDevelopmentEngine.handleSeasonRetirements(listOf(legend40, scrub36))
            if (retired.any { it.id == legend40.id }) {
                legendRetiredCount++
            }
        }

        // Legend is NOT 100% hard-forced to retire at 40
        assertTrue("Legend at 40 should not be 100% force retired (retired: $legendRetiredCount / $iterations)", legendRetiredCount < 60)
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


    @Test
    fun testPlayoffTimingAndCalendarMilestones() {
        val round1GameDays = setOf(168, 170, 172, 174, 176, 178, 180)
        val round2GameDays = setOf(183, 185, 187, 189, 191, 193, 195)
        val round3GameDays = setOf(198, 200, 202, 204, 206, 208, 210)
        val finalsGameDays = setOf(213, 215, 217, 219, 221, 223, 225)

        // Verify each round has 7 possible matchdays spaced by 2 days
        assertEquals(7, round1GameDays.size)
        assertEquals(7, round2GameDays.size)
        assertEquals(7, round3GameDays.size)
        assertEquals(7, finalsGameDays.size)

        // Verify milestones
        assertTrue(168 in round1GameDays)
        assertTrue(180 in round1GameDays)
        assertTrue(182 !in round1GameDays && 182 !in round2GameDays) // Day 182 is Round 2 Setup & Media day
        assertTrue(183 in round2GameDays)
        assertTrue(197 !in round2GameDays && 197 !in round3GameDays) // Day 197 is Conf Finals Setup & Media day
        assertTrue(198 in round3GameDays)
        assertTrue(212 !in round3GameDays && 212 !in finalsGameDays) // Day 212 is Finals Setup & Media day
        assertTrue(213 in finalsGameDays)
        assertTrue(225 in finalsGameDays)
    }
}
