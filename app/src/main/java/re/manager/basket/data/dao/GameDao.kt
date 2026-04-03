package re.manager.basket.data.dao

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import re.manager.basket.data.entity.GameEntity

@Dao
interface GameDao {
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insert(game: GameEntity)

    @Update
    suspend fun update(game: GameEntity)

    @Query("SELECT * FROM games WHERE id = :id")
    suspend fun getGameById(id: Int): GameEntity?

    @Query("SELECT * FROM games WHERE id = :id")
    fun getGameByIdFlow(id: Int): Flow<GameEntity?>

    @Query("SELECT * FROM games ORDER BY id DESC")
    suspend fun getAllGames(): List<GameEntity>

    @Query("SELECT COUNT(*) FROM games")
    suspend fun getCount(): Int

    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insertAndReturnId(game: GameEntity): Long
}
