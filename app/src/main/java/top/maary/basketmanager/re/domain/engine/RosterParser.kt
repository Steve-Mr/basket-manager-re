package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.Player
import top.maary.basketmanager.re.domain.model.Position
import java.io.InputStream
import kotlin.random.Random

object RosterParser {

    fun parseRostersCsv(inputStream: InputStream, gameId: Long = 0): List<Player> {
        val players = mutableListOf<Player>()
        val lines = inputStream.bufferedReader().readLines()
        if (lines.isEmpty()) return players

        val header = lines[0].split(";").map { it.trim() }
        val nameIdx = header.indexOf("name")
        val ageIdx = header.indexOf("age")
        val contractIdx = header.indexOf("yearsContract")
        val salaryIdx = header.indexOf("salary")
        val pos1Idx = header.indexOf("positionFirst")
        val pos2Idx = header.indexOf("positionSecond")
        val potIdx = header.indexOf("potential")
        val expIdx = header.indexOf("yearsExperience")
        val physIdx = header.indexOf("skillPhysique")
        val blkIdx = header.indexOf("skillBlock")
        val stlIdx = header.indexOf("skillSteal")
        val rebIdx = header.indexOf("skillRebound")
        val passIdx = header.indexOf("skillPass")
        val shotIntIdx = header.indexOf("skillShotInterior")
        val shotExtIdx = header.indexOf("skillShotExterior")
        val shotFreIdx = header.indexOf("skillShotFree")
        val teamIdx = header.indexOf("team")

        for (i in 1 until lines.size) {
            val line = lines[i].trim()
            if (line.isEmpty()) continue
            val tokens = line.split(";")
            if (tokens.size < header.size) continue

            try {
                val name = tokens.getOrNull(nameIdx) ?: "Player $i"
                val age = tokens.getOrNull(ageIdx)?.toIntOrNull() ?: 24
                val yearsContract = tokens.getOrNull(contractIdx)?.toIntOrNull() ?: 1
                val salary = tokens.getOrNull(salaryIdx)?.toIntOrNull() ?: 1_000_000
                val pos1 = Position.fromId(tokens.getOrNull(pos1Idx)?.toIntOrNull() ?: 1)
                val pos2 = Position.fromId(tokens.getOrNull(pos2Idx)?.toIntOrNull() ?: 0)
                val potential = tokens.getOrNull(potIdx)?.toIntOrNull() ?: 5
                val experience = tokens.getOrNull(expIdx)?.toIntOrNull() ?: 0
                val physique = tokens.getOrNull(physIdx)?.toIntOrNull() ?: 60
                val block = tokens.getOrNull(blkIdx)?.toIntOrNull() ?: 50
                val steal = tokens.getOrNull(stlIdx)?.toIntOrNull() ?: 50
                val rebound = tokens.getOrNull(rebIdx)?.toIntOrNull() ?: 50
                val pass = tokens.getOrNull(passIdx)?.toIntOrNull() ?: 50
                val shotInt = tokens.getOrNull(shotIntIdx)?.toIntOrNull() ?: 50
                val shotExt = tokens.getOrNull(shotExtIdx)?.toIntOrNull() ?: 50
                val shotFre = tokens.getOrNull(shotFreIdx)?.toIntOrNull() ?: 50

                val player = Player(
                    id = 0,
                    gameId = gameId,
                    teamId = null, // Will be linked via team abbreviation in repository
                    name = name,
                    age = age,
                    potential = potential,
                    yearsContract = yearsContract,
                    salary = salary,
                    loyalty = Random.nextInt(1, 6),
                    yearsExperience = experience,
                    positionFirst = pos1,
                    positionSecond = pos2,
                    skillPhysique = physique,
                    skillBlock = block,
                    skillSteal = steal,
                    skillRebound = rebound,
                    skillPass = pass,
                    skillShotInterior = shotInt,
                    skillShotExterior = shotExt,
                    skillShotFree = shotFre,
                    stateEnergy = 99,
                    stateForm = Random.nextInt(40, 75),
                    stateInjury = 0
                )
                players.add(player)
            } catch (_: Exception) {
                // Ignore malformed rows gracefully
            }
        }
        return players
    }
}
