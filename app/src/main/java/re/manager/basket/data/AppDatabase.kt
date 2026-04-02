package re.manager.basket.data

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import re.manager.basket.data.dao.*
import re.manager.basket.data.entity.*

@Database(
    entities = [
        GameEntity::class,
        TeamEntity::class,
        PlayerEntity::class,
        LeagueEntity::class,
        MatchEntity::class,
        MatchResultEntity::class,
        TacticEntity::class,
        NewsEntity::class
    ],
    version = 3,
    exportSchema = true
)
@TypeConverters(Converters::class)
abstract class AppDatabase : RoomDatabase() {
    abstract fun gameDao(): GameDao
    abstract fun teamDao(): TeamDao
    abstract fun playerDao(): PlayerDao
    abstract fun leagueDao(): LeagueDao
    abstract fun matchDao(): MatchDao
    abstract fun matchResultDao(): MatchResultDao
    abstract fun newsDao(): NewsDao
    abstract fun tacticDao(): TacticDao

    companion object {
        @Volatile
        private var INSTANCE: AppDatabase? = null

        fun getDatabase(context: Context): AppDatabase {
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    AppDatabase::class.java,
                    "basket_manager_db"
                ).fallbackToDestructiveMigration()
                    .build()
                INSTANCE = instance
                instance
            }
        }
    }
}
