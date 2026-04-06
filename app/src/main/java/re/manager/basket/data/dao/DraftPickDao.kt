package re.manager.basket.data.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import kotlinx.coroutines.flow.Flow
import re.manager.basket.data.entity.DraftPickEntity

@Dao
interface DraftPickDao {
    @Query("SELECT * FROM draft_picks WHERE gameId = :gameId")
    fun getAllPicks(gameId: Int): Flow<List<DraftPickEntity>>

    @Query("SELECT * FROM draft_picks WHERE currentTeamId = :teamId AND gameId = :gameId")
    fun getPicksByTeam(teamId: Int, gameId: Int): Flow<List<DraftPickEntity>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertPicks(picks: List<DraftPickEntity>)

    @Query("DELETE FROM draft_picks WHERE gameId = :gameId")
    suspend fun deletePicksByGame(gameId: Int)
}
