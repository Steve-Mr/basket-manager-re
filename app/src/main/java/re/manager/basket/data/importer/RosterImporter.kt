package re.manager.basket.data.importer

import android.content.Context
import android.util.Log
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
        Log.d("RosterImporter", "Starting import process for gameId: $gameId")
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
                val teamId = index + 1

                teams.add(
                    TeamEntity(
                        id = teamId,
                        name = name,
                        fullName = "Team $name",
                        color = "#FFFFFF",
                        conference = conference,
                        division = division,
                        salaryCap = re.manager.basket.domain.model.Constants.INITIAL_SALARY_CAPS[name] ?: 70000000,
                        gameId = gameId
                    )
                )
            }
            database.teamDao().insertAll(teams)
            Log.d("RosterImporter", "Initialized 30 teams")

            // 2. Import Players from CSV
            context.assets.open("rosters.csv").use { inputStream ->
                // Using ISO-8859-1 as original Java apps often used this for simple CSVs, or just default to UTF-8
                val reader = BufferedReader(InputStreamReader(inputStream, Charsets.UTF_8))

                // Original file uses ";" as delimiter. Let's handle potential lack of newlines by reading char by char if needed,
                // but first try standard line reading since the user confirmed the file is correct.
                val header = reader.readLine() ?: return@use
                Log.d("RosterImporter", "CSV Header: $header")
                val columns = header.split(";")

                var rowCount = 0
                reader.forEachLine { line ->
                    if (line.isBlank()) return@forEachLine
                    val values = line.split(";")

                    if (values.size >= columns.size) {
                        val data = columns.zip(values).toMap()
                        val teamName = data["team"]?.trim() ?: "0"

                        // Map team name to ID (BOS -> 1, etc.)
                        val teamIdx = teamNames.indexOf(teamName)
                        val teamId = if (teamIdx != -1) teamIdx + 1 else null

                        rowCount++
                        if (rowCount % 100 == 0) Log.d("RosterImporter", "Parsed $rowCount players...")

                        players.add(
                            PlayerEntity(
                                name = data["name"]?.trim() ?: "Unknown",
                                age = data["age"]?.trim()?.toIntOrNull() ?: 20,
                                teamId = teamId,
                                positionFirst = Position.fromId(data["positionFirst"]?.trim()?.toIntOrNull() ?: 1),
                                positionSecond = Position.fromId(data["positionSecond"]?.trim()?.toIntOrNull() ?: 0),
                                potential = data["potential"]?.trim()?.toIntOrNull() ?: 5,
                                salary = data["salary"]?.trim()?.toIntOrNull() ?: 0,
                                yearsContract = data["yearsContract"]?.trim()?.toIntOrNull() ?: 1,
                                yearsExperience = data["yearsExperience"]?.trim()?.toIntOrNull() ?: 0,
                                skillPhysique = data["skillPhysique"]?.trim()?.toIntOrNull() ?: 50,
                                skillBlock = data["skillBlock"]?.trim()?.toIntOrNull() ?: 50,
                                skillSteal = data["skillSteal"]?.trim()?.toIntOrNull() ?: 50,
                                skillRebound = data["skillRebound"]?.trim()?.toIntOrNull() ?: 50,
                                skillPass = data["skillPass"]?.trim()?.toIntOrNull() ?: 50,
                                skillShotInterior = data["skillShotInterior"]?.trim()?.toIntOrNull() ?: 50,
                                skillShotExterior = data["skillShotExterior"]?.trim()?.toIntOrNull() ?: 50,
                                skillShotFree = data["skillShotFree"]?.trim()?.toIntOrNull() ?: 50,
                                stateEnergy = 99,
                                stateForm = (30..70).random(), // Match original getRandomValue(30, 70)
                                stateInjury = 0,
                                gameId = gameId
                            )
                        )
                    }
                }
            }
            database.playerDao().insertAll(players)
            Log.d("RosterImporter", "Inserted ${players.size} players into database")

            // 3. Generate Calendar
            val matches = SeasonCalendar.generateMatches(gameId)
            database.matchDao().insertAll(matches)
            Log.d("RosterImporter", "Generated ${matches.size} matches")

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
            Log.d("RosterImporter", "Initialized leagues and tactics. Import complete.")
        }
    }
}
