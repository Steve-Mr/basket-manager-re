package re.manager.basket.domain.engine

import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.TeamEntity
import re.manager.basket.domain.model.Position
import kotlin.random.Random

class OffseasonManager {

    companion object {
        const val SALARY_MIN = 1000000
    }

    fun generateDraftPlayers(count: Int = 90): List<PlayerEntity> {
        val players = mutableListOf<PlayerEntity>()
        for (i in 0 until count) {
            players.add(createDraftPlayer(i < 2))
        }
        return players
    }

    private fun createDraftPlayer(special: Boolean): PlayerEntity {
        var potential = getRandomPotential()
        var posFirst = Random.nextInt(1, 6)
        var age = Random.nextInt(18, 24)

        if (age > 18 && potential > 6) {
            age--
        }

        var specialBono = 0
        var name = "Rookie ${Random.nextInt(1000, 9999)}"
        var posSecond = calculatePositionSecond(potential, posFirst)

        if (special) {
            potential = Random.nextInt(1, 4)
            if (Random.nextInt(1, 51) == 1) {
                specialBono = 2
                potential = 10
                posSecond = 0
                age = 18
                val randomSpecial = Random.nextInt(1, 21)
                name = getSpecialPlayerName(randomSpecial)
                posFirst = getSpecialPlayerPosition(randomSpecial)
            }
        }

        val baseSkill = Random.nextInt(0, 11)
        val pos = posFirst

        val physique = PlayerEntity.getBaseOfPosition(pos, 1) + baseSkill + potential + Random.nextInt(15, 33) + specialBono
        val block = PlayerEntity.getBaseOfPosition(pos, 2) + baseSkill + potential + Random.nextInt(15, 33) + specialBono
        val steal = PlayerEntity.getBaseOfPosition(pos, 3) + baseSkill + potential + Random.nextInt(15, 33) + specialBono
        val rebound = PlayerEntity.getBaseOfPosition(pos, 4) + baseSkill + potential + Random.nextInt(15, 33) + specialBono
        val pass = PlayerEntity.getBaseOfPosition(pos, 5) + baseSkill + potential + Random.nextInt(15, 33) + specialBono
        val shotInt = PlayerEntity.getBaseOfPosition(pos, 6) + baseSkill + potential + Random.nextInt(15, 33) + specialBono
        val shotExt = PlayerEntity.getBaseOfPosition(pos, 7) + baseSkill + potential + Random.nextInt(15, 33) + specialBono
        val shotFree = PlayerEntity.getBaseOfPosition(pos, 8) + baseSkill + potential + Random.nextInt(15, 33) + specialBono

        return PlayerEntity(
            name = name,
            age = age,
            teamId = null,
            positionFirst = Position.fromId(posFirst) ?: Position.NONE,
            positionSecond = Position.fromId(posSecond) ?: Position.NONE,
            potential = potential,
            salary = 0,
            yearsContract = 0,
            yearsExperience = 0,
            skillPhysique = physique,
            skillBlock = block,
            skillSteal = steal,
            skillRebound = rebound,
            skillPass = pass,
            skillShotInterior = shotInt,
            skillShotExterior = shotExt,
            skillShotFree = shotFree,
            stateEnergy = 99,
            stateForm = Random.nextInt(30, 71),
            stateInjury = 0,
            gameId = -1
        )
    }

    private fun getRandomPotential(): Int {
        val rand = Random.nextInt(0, 100)
        return when {
            rand < 20 -> 1
            rand < 40 -> 2
            rand < 60 -> 3
            rand < 75 -> 4
            rand < 85 -> 5
            rand < 92 -> 6
            rand < 96 -> 7
            rand < 98 -> 8
            rand < 99 -> 9
            else -> 10
        }
    }

    private fun calculatePositionSecond(potential: Int, posFirst: Int): Int {
        var aux = Random.nextInt(1, 6)
        if (potential > 8) {
            aux--
        }
        if (aux >= 3) return 0
        if (posFirst == 1) return 2
        if (posFirst == 5) return 4
        var random = Random.nextInt(1, 3)
        if (random == 2) random = -1
        return posFirst + random
    }

    private fun getSpecialPlayerName(id: Int): String {
        return when (id) {
            1 -> "Spud Webb"
            2 -> "Magic Johnson"
            3 -> "Allen Iverson"
            4 -> "Oscar Robertson"
            5 -> "John Stockton"
            6 -> "Pete Maravich"
            7 -> "Isiah Thomas"
            8 -> "Michael Jordan"
            9 -> "Larry Bird"
            10 -> "Scottie Pippen"
            11 -> "Len Bias"
            12 -> "Julius Erving"
            13 -> "Dominique Wilkins"
            14 -> "Charles Barkley"
            15 -> "Karl Malone"
            16 -> "Kevin McHale"
            17 -> "Shaquille O'Neal"
            18 -> "Wilt Chamberlain"
            19 -> "Hakeem Olajuwon"
            20 -> "Kareem Abdul-Jabbar"
            else -> "Legendary Rookie"
        }
    }

    private fun getSpecialPlayerPosition(id: Int): Int {
        return when (id) {
            in 1..7 -> 1
            8 -> 2
            in 9..13 -> 3
            in 14..16 -> 4
            in 17..20 -> 5
            else -> 1
        }
    }

    fun applyDraftSalary(player: PlayerEntity, round: Int, pick: Int): PlayerEntity {
        var salary = 0
        var years = 0
        if (round == 1) {
            years = 4
            salary = when (pick) {
                1 -> 6000000
                2 -> 5500000
                3 -> 4500000
                4 -> 4250000
                5 -> 4000000
                6 -> 3750000
                7 -> 3500000
                8 -> 3250000
                9 -> 3000000
                10 -> 2750000
                11 -> 2500000
                12 -> 2250000
                13 -> 2000000
                14 -> 1800000
                15 -> 1600000
                16 -> 1400000
                17 -> 1200000
                18 -> SALARY_MIN
                19 -> 950000
                20 -> 900000
                21 -> 850000
                22 -> 800000
                23 -> 750000
                24 -> 700000
                25 -> 650000
                26 -> 600000
                27 -> 550000
                28 -> 500000
                29 -> 450000
                30 -> 400000
                else -> 400000
            }
        } else {
            years = Random.nextInt(2, 4)
            salary = 305000 - (pick * 5000)
        }
        return player.copy(salary = salary, yearsContract = years)
    }

    fun manageCpuFreeAgency(team: TeamEntity, teamPlayers: List<PlayerEntity>, allFreeAgents: List<PlayerEntity>): PlayerEntity? {
        val minPlayers = Random.nextInt(14, 16)
        val maxPlayers = 20 - Random.nextInt(0, 3)
        val curPlayers = teamPlayers.size
        
        val posCount = IntArray(6) { 0 }
        teamPlayers.forEach { posCount[it.positionFirst.id]++ }
        val fewPlayers = (1..5).any { posCount[it] < 3 }

        if (curPlayers >= minPlayers && !fewPlayers) {
            return null
        }

        if ((curPlayers < minPlayers || fewPlayers) && curPlayers <= maxPlayers) {
            val worstPos = getWeakerPositionOfTeam(posCount)
            val teamSalary = teamPlayers.sumOf { it.salary }
            val salaryAvailable = team.salaryCap - teamSalary

            val sortedAgents = allFreeAgents.sortedByDescending { it.getAverageSkillAll() }
            for (player in sortedAgents) {
                val isCorrectPos = player.positionFirst.id == worstPos || player.positionSecond.id == worstPos
                if (isCorrectPos && (salaryAvailable > player.salary || player.salary < 1000000)) {
                    val years = when {
                        player.age <= 25 -> Random.nextInt(2, 5)
                        player.age <= 30 -> Random.nextInt(1, 5)
                        player.age <= 34 -> Random.nextInt(1, 4)
                        else -> Random.nextInt(1, 3)
                    }
                    val variation = Random.nextInt(-15, 16)
                    val newSalary = ((player.salary + (player.salary * variation) / 100) / 1000) * 1000

                    return player.copy(
                        teamId = team.id,
                        yearsContract = years,
                        salary = newSalary
                    )
                }
            }
            return createSecondaryPlayer(team, worstPos)
        }
        return null
    }

    private fun getWeakerPositionOfTeam(posCount: IntArray): Int {
        if (Random.nextInt(0, 2) == 0) {
            if (posCount[1] < 3) return 1
            if (posCount[2] < 3) return 2
            if (posCount[3] < 3) return 3
            if (posCount[4] < 3) return 4
            if (posCount[5] < 3) return 5
        } else {
            if (posCount[5] < 3) return 5
            if (posCount[1] < 3) return 4
            if (posCount[3] < 3) return 3
            if (posCount[2] < 3) return 2
            if (posCount[1] < 3) return 1
        }
        
        var minCount = Int.MAX_VALUE
        var worstPos = 1
        for (i in 1..5) {
            if (posCount[i] < minCount) {
                minCount = posCount[i]
                worstPos = i
            }
        }
        return worstPos
    }

    private fun createSecondaryPlayer(team: TeamEntity, position: Int): PlayerEntity {
        val pos = position
        val potential = 5
        
        val physique = PlayerEntity.getBaseOfPosition(pos, 1) + (potential * 2) + Random.nextInt(10, 31)
        val block = PlayerEntity.getBaseOfPosition(pos, 2) + (potential * 2) + Random.nextInt(10, 31)
        val steal = PlayerEntity.getBaseOfPosition(pos, 3) + (potential * 2) + Random.nextInt(10, 31)
        val rebound = PlayerEntity.getBaseOfPosition(pos, 4) + (potential * 2) + Random.nextInt(10, 31)
        val pass = PlayerEntity.getBaseOfPosition(pos, 5) + (potential * 2) + Random.nextInt(10, 31)
        val shotInt = PlayerEntity.getBaseOfPosition(pos, 6) + (potential * 2) + Random.nextInt(10, 31)
        val shotExt = PlayerEntity.getBaseOfPosition(pos, 7) + (potential * 2) + Random.nextInt(10, 31)
        val shotFree = PlayerEntity.getBaseOfPosition(pos, 8) + (potential * 2) + Random.nextInt(10, 31)

        return PlayerEntity(
            name = "Rookie ${Random.nextInt(1000, 9999)}",
            age = Random.nextInt(19, 24),
            teamId = team.id,
            positionFirst = Position.fromId(pos) ?: Position.NONE,
            positionSecond = Position.NONE,
            potential = potential,
            salary = 500000,
            yearsContract = Random.nextInt(1, 3),
            yearsExperience = 0,
            skillPhysique = physique,
            skillBlock = block,
            skillSteal = steal,
            skillRebound = rebound,
            skillPass = pass,
            skillShotInterior = shotInt,
            skillShotExterior = shotExt,
            skillShotFree = shotFree,
            stateEnergy = 99,
            stateForm = Random.nextInt(30, 71),
            stateInjury = 0,
            gameId = team.gameId
        )
    }

    fun manageCpuRenewals(player: PlayerEntity, teamPlayers: List<PlayerEntity>): PlayerEntity? {
        if (player.yearsContract > 0 || player.teamId == null) return null
        
        val posId = player.positionFirst.id
        val playersInPos = teamPlayers.filter { it.positionFirst.id == posId }
        val isBest = playersInPos.maxByOrNull { it.getAverageSkillAll() }?.id == player.id
        val isUnique = playersInPos.size == 1

        val shouldRenew = isBest || isUnique || (player.age < 24 && player.potential > 7 && teamPlayers.size < 14) || (player.age > 33 && player.getAverageSkillAll() > 80.0)

        if (shouldRenew) {
            val offerPosition = Random.nextInt(0, 3)
            var renew = Random.nextInt(0, 11) < (offerPosition + 3)
            if (!renew) {
                val offerPosition2 = Random.nextInt(2, 5)
                renew = Random.nextInt(0, 11) < (offerPosition2 + 3)
            }
            if (renew) {
                val years = when {
                    player.age <= 25 -> Random.nextInt(2, 5)
                    player.age <= 30 -> Random.nextInt(1, 5)
                    player.age <= 34 -> Random.nextInt(1, 4)
                    else -> Random.nextInt(1, 3)
                }
                val variation = Random.nextInt(-15, 16)
                val newSalary = ((player.salary + (player.salary * variation) / 100) / 1000) * 1000

                return player.copy(
                    yearsContract = years,
                    salary = newSalary
                )
            }
        }
        return player.copy(teamId = null, salary = 0)
    }
}
