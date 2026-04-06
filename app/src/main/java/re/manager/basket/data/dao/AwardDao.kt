package re.manager.basket.data.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import kotlinx.coroutines.flow.Flow
import re.manager.basket.data.entity.AwardEntity

@Dao
interface AwardDao {
    @Query("SELECT * FROM awards WHERE gameId = :gameId ORDER BY season DESC")
    fun getAllAwards(gameId: Int): Flow<List<AwardEntity>>

    @Query("SELECT * FROM awards WHERE playerId = :playerId AND gameId = :gameId ORDER BY season DESC")
    fun getAwardsByPlayer(playerId: Int, gameId: Int): Flow<List<AwardEntity>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAward(award: AwardEntity)

    @Query("DELETE FROM awards WHERE gameId = :gameId")
    suspend fun deleteAwardsByGame(gameId: Int)
}
