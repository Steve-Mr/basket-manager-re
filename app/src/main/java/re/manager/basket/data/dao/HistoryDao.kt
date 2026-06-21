package re.manager.basket.data.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.Query
import androidx.room.Update
import kotlinx.coroutines.flow.Flow
import re.manager.basket.data.entity.HistoryEntity

@Dao
interface HistoryDao {
    @Insert
    suspend fun insert(history: HistoryEntity)

    @Update
    suspend fun update(history: HistoryEntity)

    @Query("SELECT * FROM history WHERE gameId = :gameId ORDER BY season DESC")
    fun getHistoryByGameFlow(gameId: Int): Flow<List<HistoryEntity>>

    @Query("SELECT * FROM history WHERE gameId = :gameId AND season = :season")
    suspend fun getHistoryBySeason(gameId: Int, season: Int): HistoryEntity?
}
