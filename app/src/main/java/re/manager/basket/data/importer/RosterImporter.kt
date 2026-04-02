package re.manager.basket.data.importer

import android.content.Context
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.*
import androidx.room.withTransaction
import re.manager.basket.domain.generator.SeasonCalendar
import re.manager.basket.domain.model.Conference
import re.manager.basket.domain.model.Division
import re.manager.basket.domain.model.Position
import java.io.BufferedReader
import java.io.InputStreamReader

class RosterImporter(private val context: Context, private val database: AppDatabase) {

    suspend fun importFromAssets(gameId: Int) {
        database.withTransaction {
            val players = mutableListOf<PlayerEntity>()
            val teams = mutableListOf<TeamEntity>()

            // 1. Initialize 30 Teams
            val teamNames = listOf(
                "BOS", "BRO", "NYK", "PHI", "TOR", "CHI", "CLE", "DET", "IND", "MIL",
                "ATL", "CHA", "MIA", "ORL", "WAS", "DAL", "HOU", "MEM", "NOR", "SAN",
                "DEN", "MIN", "POR", "OKC", "UTA", "GSW", "LAC", "LAL", "PHO", "SAC"
            )

            teamNames.forEachIndexed { index, name ->
                val conference = if (index < 15) Conference.EAST else Conference.WEST
                val division = Division.fromId(index / 5 + 1)

                teams.add(
                    TeamEntity(
                        id = index + 1,
                        name = name,
                        fullName = "Team $name",
                        color = "#FFFFFF",
                        conference = conference,
                        division = division,
                        salaryCap = 60000000,
                        gameId = gameId
                    )
                )
            }
            database.teamDao().insertAll(teams)

            // 2. Import Players from CSV
            context.assets.open("rosters.csv").use { inputStream ->
                val reader = BufferedReader(InputStreamReader(inputStream))
                val header = reader.readLine() ?: return@use
                val columns = header.split(";")

                reader.forEachLine { line ->
                    val values = line.split(";")
                    if (values.size >= columns.size) {
                        val data = columns.zip(values).toMap()
                        val teamName = data["team"] ?: "0"
                        val teamIdx = teamNames.indexOf(teamName)
                        val teamId = if (teamIdx != -1) teamIdx + 1 else null // team=0 becomes null (free agent)

                        players.add(
                            PlayerEntity(
                                name = data["name"] ?: "Unknown",
                                age = data["age"]?.toIntOrNull() ?: 20,
                                teamId = teamId,
                                positionFirst = Position.fromId(data["positionFirst"]?.toIntOrNull() ?: 1),
                                positionSecond = Position.fromId(data["positionSecond"]?.toIntOrNull() ?: 0),
                                potential = data["potential"]?.toIntOrNull() ?: 5,
                                salary = data["salary"]?.toIntOrNull() ?: 0,
                                yearsContract = data["yearsContract"]?.toIntOrNull() ?: 1,
                                yearsExperience = data["yearsExperience"]?.toIntOrNull() ?: 0,
                                skillPhysique = data["skillPhysique"]?.toIntOrNull() ?: 50,
                                skillBlock = data["skillBlock"]?.toIntOrNull() ?: 50,
                                skillSteal = data["skillSteal"]?.toIntOrNull() ?: 50,
                                skillRebound = data["skillRebound"]?.toIntOrNull() ?: 50,
                                skillPass = data["skillPass"]?.toIntOrNull() ?: 50,
                                skillShotInterior = data["skillShotInterior"]?.toIntOrNull() ?: 50,
                                skillShotExterior = data["skillShotExterior"]?.toIntOrNull() ?: 50,
                                skillShotFree = data["skillShotFree"]?.toIntOrNull() ?: 50,
                                stateEnergy = 99,
                                stateForm = 50,
                                stateInjury = 0,
                                gameId = gameId
                            )
                        )
                    }
                }
            }
            database.playerDao().insertAll(players)

            // 3. Generate Calendar
            val matches = SeasonCalendar.generateMatches(gameId)
            database.matchDao().insertAll(matches)

            // 4. Initialize Tactics for each team
            teams.forEach { team ->
                database.tacticDao().insert(
                    TacticEntity(
                        gameId = gameId,
                        teamId = team.id,
                        titPG = 0, titSG = 0, titSF = 0, titPF = 0, titC = 0,
                        resPG = 0, resSG = 0, resSF = 0, resPF = 0, resC = 0
                    )
                )
            }

            // 5. Initialize Leagues for standings
            teams.forEach { team ->
                database.leagueDao().insert(
                    LeagueEntity(
                        gameId = gameId,
                        teamId = team.id
                    )
                )
            }
        }
    }
}
