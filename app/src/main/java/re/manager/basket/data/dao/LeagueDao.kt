package re.manager.basket.data.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import re.manager.basket.data.entity.LeagueEntity

@Dao
interface LeagueDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(leagues: List<LeagueEntity>)

    @Query("SELECT * FROM leagues WHERE gameId = :gameId ORDER BY gamesWon DESC, (pointsScored - pointsAllowed) DESC")
    suspend fun getStandings(gameId: Int): List<LeagueEntity>
}
