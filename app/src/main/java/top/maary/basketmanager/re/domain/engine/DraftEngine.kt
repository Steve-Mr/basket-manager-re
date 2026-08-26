package top.maary.basketmanager.re.domain.engine

import top.maary.basketmanager.re.domain.model.*
import kotlin.random.Random

object DraftEngine {

    fun generateDraftProspects(gameId: Long, count: Int = 90): List<Player> {
        val prospects = mutableListOf<Player>()
        for (i in 0 until count) {
            val isSpecial = (i < 2 && Random.nextInt(25) == 0)
            val pos1 = Position.fromId(Random.nextInt(1, 6))
            val pos2 = if (Random.nextInt(5) < 2) {
                when (pos1) {
                    Position.POINT_GUARD -> Position.SHOOTING_GUARD
                    Position.SHOOTING_GUARD -> if (Random.nextBoolean()) Position.POINT_GUARD else Position.SMALL_FORWARD
                    Position.SMALL_FORWARD -> if (Random.nextBoolean()) Position.SHOOTING_GUARD else Position.POWER_FORWARD
                    Position.POWER_FORWARD -> if (Random.nextBoolean()) Position.SMALL_FORWARD else Position.CENTER
                    Position.CENTER -> Position.POWER_FORWARD
                    else -> Position.NONE
                }
            } else Position.NONE

            val potential = if (isSpecial) 10 else Random.nextInt(3, 10)
            val age = if (isSpecial) 19 else Random.nextInt(19, 23)
            val baseBonus = if (isSpecial) 15 else (potential * 2)

            val name = if (isSpecial) {
                getSpecialProspectName(pos1)
            } else {
                ProceduralNames.getRandomFullName()
            }

            fun genSkill(skillType: Int): Int {
                val base = Player.getBaseOfPosition(pos1.id, skillType)
                return (base + baseBonus + Random.nextInt(15, 30)).coerceIn(40, 95)
            }

            prospects.add(
                Player(
                    id = 0,
                    gameId = gameId,
                    teamId = null, // In draft pool
                    name = name,
                    age = age,
                    potential = potential,
                    yearsContract = 0,
                    salary = 0,
                    loyalty = Random.nextInt(1, 6),
                    yearsExperience = 0,
                    positionFirst = pos1,
                    positionSecond = pos2,
                    skillPhysique = genSkill(1),
                    skillBlock = genSkill(2),
                    skillSteal = genSkill(3),
                    skillRebound = genSkill(4),
                    skillPass = genSkill(5),
                    skillShotInterior = genSkill(6),
                    skillShotExterior = genSkill(7),
                    skillShotFree = genSkill(8),
                    stateEnergy = 99,
                    stateForm = Random.nextInt(40, 75),
                    stateInjury = 0
                )
            )
        }
        return prospects.sortedByDescending { it.overallRating }
    }

    fun calculateRookieSalary(round: Int, pick: Int): Pair<Int, Int> {
        // Returns Pair(Salary, YearsContract)
        if (round == 1) {
            val salary = when (pick) {
                1 -> 6_000_000
                2 -> 5_500_000
                3 -> 4_500_000
                4 -> 4_250_000
                5 -> 4_000_000
                6 -> 3_750_000
                7 -> 3_500_000
                8 -> 3_250_000
                9 -> 3_000_000
                10 -> 2_750_000
                11 -> 2_500_000
                12 -> 2_250_000
                13 -> 2_000_000
                14 -> 1_800_000
                15 -> 1_600_000
                16 -> 1_400_000
                17 -> 1_200_000
                18 -> 1_000_000
                19 -> 950_000
                20 -> 900_000
                21 -> 850_000
                22 -> 800_000
                23 -> 750_000
                24 -> 700_000
                25 -> 650_000
                26 -> 600_000
                27 -> 550_000
                28 -> 500_000
                29 -> 450_000
                else -> 400_000
            }
            return salary to 4
        } else {
            val salary = (305_000 - (pick * 5_000)).coerceAtLeast(150_000)
            return salary to Random.nextInt(2, 4)
        }
    }

    private fun getSpecialProspectName(pos: Position): String {
        return when (pos) {
            Position.POINT_GUARD -> listOf("Magic Johnson", "Allen Iverson", "John Stockton", "Isiah Thomas").random()
            Position.SHOOTING_GUARD -> listOf("Michael Jordan", "Kobe Bryant", "Dwyane Wade", "Reggie Miller").random()
            Position.SMALL_FORWARD -> listOf("Larry Bird", "Scottie Pippen", "Julius Erving", "Dominique Wilkins").random()
            Position.POWER_FORWARD -> listOf("Charles Barkley", "Karl Malone", "Kevin McHale", "Tim Duncan").random()
            Position.CENTER -> listOf("Shaquille O'Neal", "Hakeem Olajuwon", "Wilt Chamberlain", "Kareem Abdul-Jabbar").random()
            else -> ProceduralNames.getRandomFullName()
        }
    }
}
