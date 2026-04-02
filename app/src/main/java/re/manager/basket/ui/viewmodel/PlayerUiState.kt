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
    val originalEntity: PlayerEntity
)

fun PlayerEntity.toUiState(isStarter: Boolean = false): PlayerUiState {
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
        originalEntity = this
    )
}
