package re.manager.basket.data.dao

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import re.manager.basket.data.entity.PlayerEntity

@Dao
interface PlayerDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(players: List<PlayerEntity>)

    @Update
    suspend fun update(player: PlayerEntity)

    @Update
    suspend fun updateAll(players: List<PlayerEntity>)

    @Query("SELECT * FROM players WHERE teamId = :teamId AND gameId = :gameId")
    fun getPlayersByTeamFlow(teamId: Int, gameId: Int): Flow<List<PlayerEntity>>

    @Query("SELECT * FROM players WHERE teamId = :teamId AND gameId = :gameId")
    suspend fun getPlayersByTeam(teamId: Int, gameId: Int): List<PlayerEntity>

    @Query("SELECT * FROM players WHERE gameId = :gameId")
    suspend fun getPlayersByGame(gameId: Int): List<PlayerEntity>

    @Query("SELECT * FROM players WHERE id = :playerId AND gameId = :gameId")
    fun getPlayerByIdFlow(playerId: Int, gameId: Int): Flow<PlayerEntity?>
}
