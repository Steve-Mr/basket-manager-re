package re.manager.basket.data.dao

import androidx.room.*
import re.manager.basket.data.entity.MatchResultEntity

@Dao
interface MatchResultDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(results: List<MatchResultEntity>)

    @Query("SELECT * FROM match_results WHERE matchId = :matchId")
    suspend fun getResultsByMatch(matchId: Int): List<MatchResultEntity>

    @Query("SELECT * FROM match_results WHERE playerId = :playerId AND gameId = :gameId")
    suspend fun getResultsByPlayer(playerId: Int, gameId: Int): List<MatchResultEntity>
}
