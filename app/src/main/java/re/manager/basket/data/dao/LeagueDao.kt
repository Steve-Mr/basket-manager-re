package re.manager.basket.data.dao

import androidx.room.*
import re.manager.basket.data.entity.LeagueEntity

@Dao
interface LeagueDao {
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insert(league: LeagueEntity)

    @Update
    suspend fun update(league: LeagueEntity)

    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insertAll(leagues: List<LeagueEntity>)

    @Query("SELECT * FROM leagues WHERE gameId = :gameId ORDER BY gamesWon DESC, (pointsScored - pointsAllowed) DESC")
    suspend fun getStandings(gameId: Int): List<LeagueEntity>

    @Query("SELECT * FROM leagues WHERE teamId = :teamId AND gameId = :gameId")
    suspend fun getLeagueForTeam(teamId: Int, gameId: Int): LeagueEntity?
}
