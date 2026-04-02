package re.manager.basket.data.dao

import androidx.room.*
import re.manager.basket.data.entity.MatchEntity

@Dao
interface MatchDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(matches: List<MatchEntity>)

    @Update
    suspend fun update(match: MatchEntity)

    @Query("SELECT * FROM matches WHERE gameId = :gameId AND (localQ1 + visitorQ1 > 0) ORDER BY matchday DESC LIMIT 10")
    suspend fun getRecentMatches(gameId: Int): List<MatchEntity>

    @Query("SELECT * FROM matches WHERE gameId = :gameId AND matchday = :matchday")
    suspend fun getMatchesByDay(gameId: Int, matchday: Int): List<MatchEntity>
}
