package re.manager.basket.domain.engine

import re.manager.basket.data.entity.GameEntity

class SeasonManager(private val game: GameEntity) {

    enum class SeasonPhase {
        REGULAR_SEASON,
        PLAYOFFS,
        OFFSEASON_RENEWALS,
        OFFSEASON_DRAFT,
        OFFSEASON_FREE_AGENCY,
        NEW_SEASON_PREP
    }

    fun getCurrentPhase(): SeasonPhase {
        return when (game.currentMatchday) {
            in 0..166 -> SeasonPhase.REGULAR_SEASON
            in 167..225 -> SeasonPhase.PLAYOFFS
            in 226..230 -> SeasonPhase.OFFSEASON_RENEWALS
            in 231..232 -> SeasonPhase.OFFSEASON_DRAFT
            233 -> SeasonPhase.OFFSEASON_FREE_AGENCY
            else -> SeasonPhase.NEW_SEASON_PREP
        }
    }

    fun getNextMatchday(): Int {
        return if (game.currentMatchday >= 234) 0 else game.currentMatchday + 1
    }
}
