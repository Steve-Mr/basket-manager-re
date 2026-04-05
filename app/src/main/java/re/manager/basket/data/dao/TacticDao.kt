package re.manager.basket.data.dao

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import re.manager.basket.data.entity.TacticEntity

@Dao
interface TacticDao {
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insert(tactic: TacticEntity)

    @Update
    suspend fun update(tactic: TacticEntity)

    @Query("SELECT * FROM tactics WHERE teamId = :teamId AND gameId = :gameId")
    suspend fun getTacticForTeam(teamId: Int, gameId: Int): TacticEntity?

    @Query("SELECT * FROM tactics WHERE teamId = :teamId AND gameId = :gameId")
    fun getTacticForTeamFlow(teamId: Int, gameId: Int): Flow<TacticEntity?>
}
