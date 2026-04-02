package re.manager.basket.data.dao

import androidx.room.*
import re.manager.basket.data.entity.TeamEntity

@Dao
interface TeamDao {
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insertAll(teams: List<TeamEntity>)

    @Update
    suspend fun updateAll(teams: List<TeamEntity>)

    @Update
    suspend fun update(team: TeamEntity)

    @Query("SELECT * FROM teams WHERE gameId = :gameId")
    suspend fun getTeamsByGame(gameId: Int): List<TeamEntity>

    @Query("SELECT COUNT(*) FROM teams")
    suspend fun getCount(): Int

    @Query("SELECT * FROM teams WHERE id = :teamId AND gameId = :gameId")
    suspend fun getTeamById(teamId: Int, gameId: Int): TeamEntity?
}
