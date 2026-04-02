package re.manager.basket.ui.viewmodel

import re.manager.basket.data.entity.PlayerEntity

data class PlayerUiState(
    val id: Int,
    val name: String,
    val age: Int,
    val avgSkill: Int,
    val potential: Int,
    val totalValue: Int,
    val marketValue: Int,
    val isStarter: Boolean,
    val hasContract: Boolean,
    val form: Int,
    val energy: Int,
    val starIcon: String,
    val originalEntity: PlayerEntity
)

fun PlayerEntity.toUiState(isStarter: Boolean = false): PlayerUiState {
    val starIcon = when {
        potential >= 9 -> "star6"
        potential >= 7 -> "star5"
        potential >= 5 -> "star4"
        potential >= 3 -> "star3"
        potential >= 1 -> "star2"
        else -> "star1"
    }

    return PlayerUiState(
        id = id,
        name = name,
        age = age,
        avgSkill = getAverageSkillAll().toInt(),
        potential = potential,
        totalValue = getValue().toInt(),
        marketValue = getMarketValue().toInt(),
        isStarter = isStarter,
        hasContract = yearsContract > 0,
        form = stateForm,
        energy = stateEnergy,
        starIcon = starIcon,
        originalEntity = this
    )
}
