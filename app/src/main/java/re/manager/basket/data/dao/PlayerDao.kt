package re.manager.basket.data.dao

import androidx.room.*
import re.manager.basket.data.entity.PlayerEntity

@Dao
interface PlayerDao {
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insertAll(players: List<PlayerEntity>)

    @Update
    suspend fun update(player: PlayerEntity)

    @Query("SELECT * FROM players WHERE teamId = :teamId")
    suspend fun getPlayersByTeam(teamId: Int): List<PlayerEntity>

    @Query("SELECT * FROM players WHERE gameId = :gameId")
    suspend fun getPlayersByGame(gameId: Int): List<PlayerEntity>
}
