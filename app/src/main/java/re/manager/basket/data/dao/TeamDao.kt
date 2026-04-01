package re.manager.basket.data.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import re.manager.basket.data.entity.TeamEntity

@Dao
interface TeamDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(teams: List<TeamEntity>)

    @Query("SELECT * FROM teams WHERE gameId = :gameId")
    suspend fun getTeamsByGame(gameId: Int): List<TeamEntity>

    @Query("SELECT COUNT(*) FROM teams")
    suspend fun getCount(): Int
}
