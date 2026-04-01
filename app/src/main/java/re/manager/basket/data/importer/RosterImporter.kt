package re.manager.basket.data.importer

import android.content.Context
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TeamEntity
import java.io.BufferedReader
import java.io.InputStreamReader

class RosterImporter(private val context: Context, private val database: AppDatabase) {

    suspend fun importFromAssets(gameId: Int) {
        val players = mutableListOf<PlayerEntity>()
        val teams = mutableMapOf<String, Int>()

        // Original game has 30 teams. In a real scenario, we'd initialize these first.
        // For the purpose of this importer, we'll map team names to IDs.

        context.assets.open("rosters.csv").use { inputStream ->
            val reader = BufferedReader(InputStreamReader(inputStream))
            val header = reader.readLine() ?: return
            val columns = header.split(";")

            reader.forEachLine { line ->
                val values = line.split(";")
                if (values.size >= columns.size) {
                    val data = columns.zip(values).toMap()

                    val teamName = data["team"] ?: "Free Agent"
                    val teamId = when(teamName) {
                        "ATL" -> 11; "BOS" -> 1; "BRO" -> 2; "CHA" -> 12; "CHI" -> 6
                        "CLE" -> 7; "DAL" -> 16; "DEN" -> 21; "DET" -> 8; "GSW" -> 26
                        "HOU" -> 17; "IND" -> 9; "LAC" -> 27; "LAL" -> 28; "MEM" -> 18
                        "MIA" -> 13; "MIL" -> 10; "MIN" -> 22; "NOR" -> 19; "NYK" -> 3
                        "OKC" -> 24; "ORL" -> 14; "PHI" -> 4; "PHO" -> 29; "POR" -> 23
                        "SAC" -> 30; "SAN" -> 20; "TOR" -> 5; "UTA" -> 25; "WAS" -> 15
                        else -> 0
                    }

                    val player = PlayerEntity(
                        name = data["name"] ?: "Unknown",
                        age = data["age"]?.toIntOrNull() ?: 20,
                        teamId = teamId,
                        positionFirst = data["positionFirst"]?.toIntOrNull() ?: 1,
                        positionSecond = data["positionSecond"]?.toIntOrNull() ?: 0,
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
                    players.add(player)
                }
            }
        }
        database.playerDao().insertAll(players)
    }
}
