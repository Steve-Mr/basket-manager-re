package re.manager.basket.data.dao

import androidx.room.*
import re.manager.basket.data.entity.PlayoffEntity

@Dao
interface PlayoffDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(playoffs: List<PlayoffEntity>)

    @Update
    suspend fun update(playoff: PlayoffEntity)

    @Query("SELECT * FROM playoffs WHERE gameId = :gameId")
    suspend fun getPlayoffsByGame(gameId: Int): List<PlayoffEntity>

    @Query("DELETE FROM playoffs WHERE gameId = :gameId")
    suspend fun deleteByGame(gameId: Int)
}
