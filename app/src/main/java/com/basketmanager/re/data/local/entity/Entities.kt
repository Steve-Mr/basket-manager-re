package com.basketmanager.re.data.local.entity

data class GameSessionEntity(
    val id: Long = 0,
    val name: String,
    val currentSeason: Int = 1,
    val currentMatchday: Int = 1,
    val userTeamId: Long = 0,
    val autoLineupEnabled: Boolean = true,
    val createdAt: Long = System.currentTimeMillis(),
    val lastPlayedAt: Long = System.currentTimeMillis()
)

data class TeamEntity(
    val id: Long = 0,
    val gameId: Long = 0,
    val name: String,
    val fullName: String,
    val conference: Int,
    val division: Int,
    val salaryCap: Int,
    val colorHex: String
)

data class PlayerEntity(
    val id: Long = 0,
    val gameId: Long = 0,
    val teamId: Long? = null,
    val name: String,
    val age: Int,
    val potential: Int,
    val yearsContract: Int,
    val salary: Int,
    val loyalty: Int,
    val yearsExperience: Int,
    val positionFirst: Int,
    val positionSecond: Int,
    val skillPhysique: Int,
    val skillBlock: Int,
    val skillSteal: Int,
    val skillRebound: Int,
    val skillPass: Int,
    val skillShotInterior: Int,
    val skillShotExterior: Int,
    val skillShotFree: Int,
    val stateEnergy: Int,
    val stateForm: Int,
    val stateInjury: Int
)

data class TacticEntity(
    val id: Long = 0,
    val gameId: Long = 0,
    val teamId: Long = 0,
    val gameType: Int = 0,
    val benchImportance: Int = 3,
    val shotInteriorPercent: Int = 40,
    val shotTriplePercent: Int = 40,
    val starterPgId: Long? = null,
    val starterSgId: Long? = null,
    val starterSfId: Long? = null,
    val starterPfId: Long? = null,
    val starterCId: Long? = null,
    val reservePgId: Long? = null,
    val reserveSgId: Long? = null,
    val reserveSfId: Long? = null,
    val reservePfId: Long? = null,
    val reserveCId: Long? = null,
    val starOnePlayerId: Long? = null,
    val starTwoPlayerId: Long? = null,
    val starThreePlayerId: Long? = null
)

data class MatchEntity(
    val id: Long = 0,
    val gameId: Long = 0,
    val matchday: Int = 1,
    val teamLocalId: Long,
    val teamVisitorId: Long,
    val name: String? = null,
    val localScore: Int? = null,
    val visitorScore: Int? = null,
    val localQuarter1: Int? = null,
    val localQuarter2: Int? = null,
    val localQuarter3: Int? = null,
    val localQuarter4: Int? = null,
    val localOt: Int? = null,
    val visitorQuarter1: Int? = null,
    val visitorQuarter2: Int? = null,
    val visitorQuarter3: Int? = null,
    val visitorQuarter4: Int? = null,
    val visitorOt: Int? = null,
    val isPlayed: Boolean = false
)

data class MatchResultEntity(
    val id: Long = 0,
    val gameId: Long = 0,
    val matchId: Long = 0,
    val playerId: Long = 0,
    val playerName: String = "",
    val teamId: Long = 0,
    val matchday: Int = 1,
    val minutesPlayed: Int = 0,
    val points: Int = 0,
    val fouls: Int = 0,
    val blocks: Int = 0,
    val steals: Int = 0,
    val rebounds: Int = 0,
    val passesOk: Int = 0,
    val passesKo: Int = 0,
    val shotsFreeOk: Int = 0,
    val shotsFreeKo: Int = 0,
    val shotsInteriorOk: Int = 0,
    val shotsInteriorKo: Int = 0,
    val shotsExteriorDoubleOk: Int = 0,
    val shotsExteriorDoubleKo: Int = 0,
    val shotsExteriorTripleOk: Int = 0,
    val shotsExteriorTripleKo: Int = 0
)

data class StandingsEntity(
    val id: Long = 0,
    val gameId: Long = 0,
    val teamId: Long = 0,
    val teamName: String,
    val conference: Int,
    val division: Int,
    val gamesWon: Int = 0,
    val gamesLost: Int = 0,
    val pointsScored: Int = 0,
    val pointsAllowed: Int = 0
)

data class PlayoffSeriesEntity(
    val id: Long = 0,
    val gameId: Long = 0,
    val conference: Int?,
    val round: Int,
    val seed1: Int,
    val seed2: Int,
    val team1Id: Long,
    val team2Id: Long,
    val team1Wins: Int = 0,
    val team2Wins: Int = 0,
    val winnerTeamId: Long? = null
)

data class NewsEntity(
    val id: Long = 0,
    val gameId: Long = 0,
    val matchday: Int = 0,
    val type: String,
    val title: String,
    val body: String,
    val team1Id: Long? = null,
    val team2Id: Long? = null,
    val playerId: Long? = null,
    val createdAt: Long = System.currentTimeMillis()
)

data class DraftPickEntity(
    val id: Long = 0,
    val gameId: Long = 0,
    val originalTeamId: Long,
    val currentTeamId: Long,
    val round: Int,
    val position: Int? = null,
    val marketValue: Double = 0.0
)

data class ChallengeEntity(
    val id: Long = 0,
    val teamName: String,
    val completed: Boolean = false,
    val completedSeason: Int? = null
)
