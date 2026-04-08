package re.manager.basket.domain.model

object Constants {
    // Season Matchdays
    const val REGULAR_SEASON_DAYS = 166
    const val PLAYOFFS_DAYS = 225
    const val OFFSEASON_RENEWALS_DAYS = 230
    const val OFFSEASON_DRAFT_DAYS = 232
    const val OFFSEASON_FREE_AGENCY_DAY = 233
    const val TOTAL_SEASON_DAYS = 234
    const val TRADE_DEADLINE_DAY = 87
    const val SEASON_FINISH_DAY = 226

    // Match Simulation
    const val BASE_POSSESSIONS = 200
    const val OVERTIME_POSSESSIONS = 20
    const val STEAL_CHECK_PROB = 14
    const val TURNOVER_CHECK_PROB = 17
    const val FOUL_CHECK_PROB = 10
    const val ASSISTANCE_CHECK_PROB = 34
    const val FOUL_ON_SHOT_PROB = 15
    const val STEAL_SKILL_MODIFIER = 0.5f
    const val TURNOVER_SKILL_MODIFIER = 0.6f
    const val BLOCK_ATTEMPT_PROB_INTERIOR = 11
    const val BLOCK_ATTEMPT_PROB_EXTERIOR = 9
    const val SHOT_MODIFIER_INTERIOR = 0.70f
    const val SHOT_MODIFIER_EXTERIOR = 0.60f
    const val SHOT_MODIFIER_TRIPLE = 0.50f
    const val REBOUND_TRIGGER_PROB = 76

    // Player Stats
    const val MIN_SKILL = 40
    const val MAX_SKILL = 99
    const val DEFAULT_ENERGY = 99
    const val DEFAULT_FORM = 50

    // Salary Cap
    const val SALARY_CAP_MIN = 55000000
    const val SALARY_CAP_MED = 70000000
    const val SALARY_CAP_MAX = 85000000
    const val SALARY_CAP_STEP = 1000000

    const val PLAYOFF_WIN_SALARY_CAP_BONUS = 2000000

    val INITIAL_SALARY_CAPS = mapOf(
        "BOS" to 80000000, "BRO" to 85000000, "NYK" to 85000000, "PHI" to 55000000, "TOR" to 75000000,
        "CHI" to 80000000, "CLE" to 70000000, "DET" to 60000000, "IND" to 75000000, "MIL" to 55000000,
        "ATL" to 65000000, "CHA" to 65000000, "MIA" to 80000000, "ORL" to 70000000, "WAS" to 70000000,
        "DAL" to 80000000, "HOU" to 80000000, "MEM" to 55000000, "NOR" to 70000000, "SAN" to 85000000,
        "DEN" to 65000000, "MIN" to 60000000, "POR" to 70000000, "OKC" to 75000000, "UTA" to 60000000,
        "GSW" to 75000000, "LAC" to 85000000, "LAL" to 85000000, "PHO" to 60000000, "SAC" to 70000000
    )

    // Injury Simulation
    const val INJURY_CHECK_PROB = 4
    const val INJURY_TYPE_MINOR_PROB = 80
    const val INJURY_TYPE_MEDIUM_PROB = 99
}
