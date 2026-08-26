package com.basketmanager.re.domain.model

data class DraftPick(
    val id: Long = 0,
    val gameId: Long = 0,
    val originalTeamId: Long,
    val currentTeamId: Long,
    val round: Int, // 1 or 2
    val position: Int? = null,
    val marketValue: Double = 0.0
)

data class TradeProposal(
    val teamAId: Long,
    val teamBId: Long,
    val teamAPlayerIds: List<Long> = emptyList(),
    val teamBPlayerIds: List<Long> = emptyList(),
    val teamADraftPickIds: List<Long> = emptyList(),
    val teamBDraftPickIds: List<Long> = emptyList()
)

data class GameSession(
    val id: Long = 0,
    val name: String,
    val currentSeason: Int = 1,
    val currentMatchday: Int = 1,
    val userTeamId: Long = 0,
    val autoLineupEnabled: Boolean = true,
    val createdAt: Long = System.currentTimeMillis(),
    val lastPlayedAt: Long = System.currentTimeMillis()
)

data class ChallengeAchievement(
    val id: Long = 0,
    val teamName: String,
    val completed: Boolean = false,
    val completedSeason: Int? = null
)
