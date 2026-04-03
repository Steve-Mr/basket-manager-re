package re.manager.basket.data.dao

import androidx.room.*
import re.manager.basket.data.entity.MatchEntity

@Dao
interface MatchDao {
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insertAll(matches: List<MatchEntity>)

    @Update
    suspend fun update(match: MatchEntity)

    @Query("SELECT * FROM matches WHERE gameId = :gameId AND (localQ1 + visitorQ1 > 0) ORDER BY matchday DESC LIMIT 10")
    fun getRecentMatchesFlow(gameId: Int): Flow<List<MatchEntity>>

    @Query("SELECT * FROM matches WHERE gameId = :gameId AND (localQ1 + visitorQ1 > 0) ORDER BY matchday DESC LIMIT 10")
    suspend fun getRecentMatches(gameId: Int): List<MatchEntity>

    @Query("SELECT * FROM matches WHERE gameId = :gameId AND matchday = :matchday")
    suspend fun getMatchesByDay(gameId: Int, matchday: Int): List<MatchEntity>

    @Query("SELECT * FROM matches WHERE id = :matchId")
    fun getMatchByIdFlow(matchId: Int): Flow<MatchEntity?>

    @Query("SELECT * FROM matches WHERE gameId = :gameId AND matchday >= :currentDay AND (teamLocalId = :teamId OR teamVisitorId = :teamId) AND (localQ1 + visitorQ1 = 0) ORDER BY matchday ASC LIMIT 1")
    suspend fun getNextMatchForTeam(gameId: Int, teamId: Int, currentDay: Int): MatchEntity?

    @Query("SELECT * FROM matches WHERE gameId = :gameId ORDER BY matchday ASC")
    fun getAllMatchesForGameFlow(gameId: Int): Flow<List<MatchEntity>>

    @Query("SELECT * FROM matches WHERE gameId = :gameId ORDER BY matchday ASC")
    suspend fun getAllMatchesForGame(gameId: Int): List<MatchEntity>

    @Delete
    suspend fun delete(match: MatchEntity)

    @Delete
    suspend fun deleteMatches(matches: List<MatchEntity>)
}
