package re.manager.basket.domain.model

object Constants {
    // Season Matchdays
    const val REGULAR_SEASON_DAYS = 166
    const val PLAYOFFS_DAYS = 225
    const val OFFSEASON_RENEWALS_DAYS = 230
    const val OFFSEASON_DRAFT_DAYS = 232
    const val OFFSEASON_FREE_AGENCY_DAY = 233
    const val TOTAL_SEASON_DAYS = 234

    // Match Simulation
    const val BASE_POSSESSIONS = 120
    const val OVERTIME_POSSESSIONS = 5
    const val STEAL_CHECK_PROB = 14
    const val STEAL_SKILL_MODIFIER = 0.5f
    const val BLOCK_ATTEMPT_PROB_INTERIOR = 11
    const val BLOCK_ATTEMPT_PROB_EXTERIOR = 9
    const val SHOT_MODIFIER_INTERIOR = 0.65f
    const val SHOT_MODIFIER_EXTERIOR = 0.55f
    const val SHOT_MODIFIER_TRIPLE = 0.45f
    const val REBOUND_TRIGGER_PROB = 76

    // Player Stats
    const val MIN_SKILL = 40
    const val MAX_SKILL = 99
    const val DEFAULT_ENERGY = 99
    const val DEFAULT_FORM = 50
}
