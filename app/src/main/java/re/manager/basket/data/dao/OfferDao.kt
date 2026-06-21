package re.manager.basket.data.dao

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import re.manager.basket.data.entity.OfferEntity

@Dao
interface OfferDao {
    @Insert
    suspend fun insert(offer: OfferEntity)

    @Update
    suspend fun update(offer: OfferEntity)

    @Delete
    suspend fun delete(offer: OfferEntity)

    @Query("SELECT * FROM offers WHERE gameId = :gameId")
    fun getOffersByGameFlow(gameId: Int): Flow<List<OfferEntity>>

    @Query("SELECT * FROM offers WHERE gameId = :gameId AND responseDay <= :currentDay")
    suspend fun getPendingOffersToProcess(gameId: Int, currentDay: Int): List<OfferEntity>

    @Query("SELECT * FROM offers WHERE gameId = :gameId AND playerId = :playerId LIMIT 1")
    suspend fun getOfferForPlayer(gameId: Int, playerId: Int): OfferEntity?

    @Query("SELECT * FROM offers WHERE gameId = :gameId AND playerId = :playerId")
    suspend fun getOffersForPlayerAll(gameId: Int, playerId: Int): List<OfferEntity>
}
