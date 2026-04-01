package re.manager.basket.data.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import re.manager.basket.data.entity.PlayerEntity

@Dao
interface PlayerDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(players: List<PlayerEntity>)

    @Query("SELECT * FROM players WHERE teamId = :teamId")
    suspend fun getPlayersByTeam(teamId: Int): List<PlayerEntity>
}
