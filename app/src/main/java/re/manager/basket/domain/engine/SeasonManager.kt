package re.manager.basket.domain.engine

import re.manager.basket.data.entity.GameEntity
import re.manager.basket.domain.model.Constants
import re.manager.basket.domain.model.SeasonPhase

class SeasonManager(private val game: GameEntity) {

    fun getCurrentPhase(): SeasonPhase {
        return when (game.currentMatchday) {
            in 0..Constants.REGULAR_SEASON_DAYS -> SeasonPhase.REGULAR_SEASON
            in (Constants.REGULAR_SEASON_DAYS + 1)..Constants.PLAYOFFS_DAYS -> SeasonPhase.PLAYOFFS
            in (Constants.PLAYOFFS_DAYS + 1)..Constants.OFFSEASON_RENEWALS_DAYS -> SeasonPhase.OFFSEASON_RENEWALS
            in (Constants.OFFSEASON_RENEWALS_DAYS + 1)..Constants.OFFSEASON_DRAFT_DAYS -> SeasonPhase.OFFSEASON_DRAFT
            Constants.OFFSEASON_FREE_AGENCY_DAY -> SeasonPhase.OFFSEASON_FREE_AGENCY
            else -> SeasonPhase.NEW_SEASON_PREP
        }
    }

    fun getNextMatchday(): Int {
        return if (game.currentMatchday >= Constants.TOTAL_SEASON_DAYS) 0 else game.currentMatchday + 1
    }
}
