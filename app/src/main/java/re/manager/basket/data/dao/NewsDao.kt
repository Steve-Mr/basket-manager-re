package re.manager.basket.data.dao

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import re.manager.basket.data.entity.NewsEntity

@Dao
interface NewsDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(news: NewsEntity)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(newsList: List<NewsEntity>)

    @Query("SELECT * FROM news WHERE gameId = :gameId ORDER BY matchday DESC, id DESC")
    fun getNewsByGameFlow(gameId: Int): Flow<List<NewsEntity>>

    @Query("SELECT * FROM news WHERE gameId = :gameId ORDER BY matchday DESC, id DESC")
    suspend fun getNewsByGame(gameId: Int): List<NewsEntity>

    @Query("SELECT * FROM news WHERE gameId = :gameId AND matchday = :matchday")
    suspend fun getNewsByDay(gameId: Int, matchday: Int): List<NewsEntity>
}
