package re.manager.basket.data.dao

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import re.manager.basket.data.entity.MatchResultEntity

@Dao
interface MatchResultDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(results: List<MatchResultEntity>)

    @Query("SELECT * FROM match_results WHERE matchId = :matchId")
    fun getResultsByMatchFlow(matchId: Int): Flow<List<MatchResultEntity>>

    @Query("SELECT * FROM match_results WHERE matchId = :matchId")
    suspend fun getResultsByMatch(matchId: Int): List<MatchResultEntity>

    @Query("SELECT * FROM match_results WHERE playerId = :playerId AND gameId = :gameId")
    fun getResultsByPlayerFlow(playerId: Int, gameId: Int): Flow<List<MatchResultEntity>>

    @Query("SELECT * FROM match_results WHERE playerId = :playerId AND gameId = :gameId")
    suspend fun getResultsByPlayer(playerId: Int, gameId: Int): List<MatchResultEntity>

    @Query("SELECT * FROM match_results WHERE gameId = :gameId AND playerId IN (SELECT id FROM players WHERE teamId = :teamId AND gameId = :gameId)")
    fun getResultsByTeamFlow(teamId: Int, gameId: Int): Flow<List<MatchResultEntity>>

    @Query("SELECT * FROM match_results WHERE gameId = :gameId")
    suspend fun getResultsByGame(gameId: Int): List<MatchResultEntity>
}
