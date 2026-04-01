package re.manager.basket.data

import androidx.room.Database
import androidx.room.RoomDatabase
import re.manager.basket.data.entity.*

@Database(
    entities = [
        GameEntity::class,
        TeamEntity::class,
        PlayerEntity::class,
        LeagueEntity::class,
        MatchEntity::class,
        MatchResultEntity::class,
        TacticEntity::class
    ],
    version = 1,
    exportSchema = false
)
abstract class AppDatabase : RoomDatabase() {
    // DAO methods will be added here
}
