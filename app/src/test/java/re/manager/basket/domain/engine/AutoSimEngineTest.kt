package re.manager.basket.domain.engine

import android.content.Context
import androidx.room.Room
import androidx.test.core.app.ApplicationProvider
import androidx.test.ext.junit.runners.AndroidJUnit4
import kotlinx.coroutines.runBlocking
import org.junit.After
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.GameEntity
import re.manager.basket.data.importer.RosterImporter

@RunWith(AndroidJUnit4::class)
class AutoSimEngineTest {
    private lateinit var database: AppDatabase
    private lateinit var context: Context

    @Before
    fun setup() {
        context = ApplicationProvider.getApplicationContext()
        database = Room.inMemoryDatabaseBuilder(context, AppDatabase::class.java)
            .allowMainThreadQueries()
            .build()
    }

    @After
    fun teardown() {
        database.close()
    }

    @Test
    fun testMultiSeasonSimulationStability() = runBlocking {
        // 1. Initialize a new game
        val newGame = GameEntity(
            currentMatchday = 1,
            currentSeason = 2025,
            name = "Test Stability Game"
        )
        val gameId = database.gameDao().insertAndReturnId(newGame).toInt()

        // 2. Generate initial rosters
        generateMockRosters(gameId)

        val initialPlayers = database.playerDao().getPlayersByGame(gameId)
        val initialTeams = database.teamDao().getTeamsByGame(gameId)
        val initialAverageSkill = initialPlayers.map { it.skillPhysique + it.skillBlock + it.skillSteal + it.skillRebound + it.skillPass + it.skillShotInterior + it.skillShotExterior + it.skillShotFree }.average() / 8.0
        
        println("=== INITIAL STATE ===")
        println("Players: ${initialPlayers.size}")
        println("Teams: ${initialTeams.size}")
        println("Average Skill: $initialAverageSkill")
        println("=====================")

        // 3. Run AutoSimEngine for 5 seasons
        val autoSimEngine = AutoSimEngine(database, gameId)
        autoSimEngine.simulateSeasons(5) { progressMsg ->
            println("[AutoSim] $progressMsg")
        }

        // 4. Validate Stability
        val finalPlayers = database.playerDao().getPlayersByGame(gameId)
        val finalAverageSkill = finalPlayers.map { it.skillPhysique + it.skillBlock + it.skillSteal + it.skillRebound + it.skillPass + it.skillShotInterior + it.skillShotExterior + it.skillShotFree }.average() / 8.0
        
        println("=== FINAL STATE ===")
        println("Players: ${finalPlayers.size}")
        println("Average Skill: $finalAverageSkill")
        println("===================")

        // Ensure league average skill doesn't collapse or skyrocket
        // Initial is around 60-70. After 5 years, it should remain between 55 and 85
        assertTrue("Average skill is unstable", finalAverageSkill in 55.0..85.0)

        // Ensure no team is left with empty rosters (teams should have signed free agents)
        val finalTeams = database.teamDao().getTeamsByGame(gameId)
        finalTeams.forEach { team ->
            val teamPlayers = database.playerDao().getPlayersByTeam(team.id, gameId)
            assertTrue("Team ${team.name} has too few players (${teamPlayers.size})", teamPlayers.size >= 14)
        }
    }

    private suspend fun generateMockRosters(gameId: Int) {
        val teams = mutableListOf<re.manager.basket.data.entity.TeamEntity>()
        repeat(30) { i ->
            teams.add(re.manager.basket.data.entity.TeamEntity(
                id = i + 1, gameId = gameId, name = "Team$i", fullName = "Team $i City",
                color = "#000000", conference = re.manager.basket.domain.model.Conference.EAST,
                division = re.manager.basket.domain.model.Division.ATLANTIC,
                salaryCap = 70000000
            ))
        }
        database.teamDao().insertAll(teams)

        val standings = teams.map { re.manager.basket.data.entity.LeagueEntity(teamId = it.id, gameId = gameId) }
        database.leagueDao().insertAll(standings)

        val players = mutableListOf<re.manager.basket.data.entity.PlayerEntity>()
        var playerId = 1
        teams.forEach { team ->
            // 3 players per position = 15 players per team
            re.manager.basket.domain.model.Position.entries.filter { it != re.manager.basket.domain.model.Position.NONE }.forEach { pos ->
                repeat(3) {
                    players.add(re.manager.basket.data.entity.PlayerEntity(
                        id = playerId++, name = "Player $playerId", age = kotlin.random.Random.nextInt(20, 35),
                        teamId = team.id, positionFirst = pos, positionSecond = re.manager.basket.domain.model.Position.NONE,
                        potential = kotlin.random.Random.nextInt(4, 9), salary = 2000000, yearsContract = kotlin.random.Random.nextInt(1, 5),
                        yearsExperience = 5, skillPhysique = 60, skillBlock = 60, skillSteal = 60, skillRebound = 60,
                        skillPass = 60, skillShotInterior = 60, skillShotExterior = 60, skillShotFree = 60,
                        stateEnergy = 99, stateForm = 60, stateInjury = 0, gameId = gameId
                    ))
                }
            }
        }
        database.playerDao().insertAll(players)

        // Generate initial matches
        val seasonCal = re.manager.basket.domain.generator.SeasonCalendar.generateMatches(gameId, teams).map { it.copy(season = 2025) }
        database.matchDao().insertAll(seasonCal)
        
        val draftPicks = mutableListOf<re.manager.basket.data.entity.DraftPickEntity>()
        teams.forEach { team ->
            draftPicks.add(re.manager.basket.data.entity.DraftPickEntity(gameId = gameId, originalTeamId = team.id, currentTeamId = team.id, round = 1, year = 2026))
            draftPicks.add(re.manager.basket.data.entity.DraftPickEntity(gameId = gameId, originalTeamId = team.id, currentTeamId = team.id, round = 2, year = 2026))
        }
        database.draftPickDao().insertPicks(draftPicks)
    }
}
