package com.basketmanager.re.data.local.database

import android.content.ContentValues
import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper
import com.basketmanager.re.data.local.entity.*

class BasketManagerDatabaseHelper(context: Context) : SQLiteOpenHelper(context, DATABASE_NAME, null, DATABASE_VERSION) {

    companion object {
        const val DATABASE_NAME = "basket_manager_re.db"
        const val DATABASE_VERSION = 1

        const val TABLE_GAME_SESSION = "game_session"
        const val TABLE_TEAM = "team"
        const val TABLE_PLAYER = "player"
        const val TABLE_TACTIC = "tactic"
        const val TABLE_MATCH = "matches"
        const val TABLE_MATCH_RESULT = "match_result"
        const val TABLE_STANDINGS = "standings"
        const val TABLE_PLAYOFF_SERIES = "playoff_series"
        const val TABLE_NEWS = "news"
        const val TABLE_DRAFT_PICK = "draft_pick"
        const val TABLE_CHALLENGE = "challenge"
    }

    override fun onCreate(db: SQLiteDatabase) {
        db.execSQL("""
            CREATE TABLE $TABLE_GAME_SESSION (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL,
                currentSeason INTEGER NOT NULL DEFAULT 1,
                currentMatchday INTEGER NOT NULL DEFAULT 1,
                userTeamId INTEGER NOT NULL DEFAULT 0,
                autoLineupEnabled INTEGER NOT NULL DEFAULT 1,
                createdAt INTEGER NOT NULL,
                lastPlayedAt INTEGER NOT NULL
            )
        """)

        db.execSQL("""
            CREATE TABLE $TABLE_TEAM (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                gameId INTEGER NOT NULL,
                name TEXT NOT NULL,
                fullName TEXT NOT NULL,
                conference INTEGER NOT NULL,
                division INTEGER NOT NULL,
                salaryCap INTEGER NOT NULL,
                colorHex TEXT NOT NULL
            )
        """)

        db.execSQL("""
            CREATE TABLE $TABLE_PLAYER (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                gameId INTEGER NOT NULL,
                teamId INTEGER,
                name TEXT NOT NULL,
                age INTEGER NOT NULL,
                potential INTEGER NOT NULL,
                yearsContract INTEGER NOT NULL,
                salary INTEGER NOT NULL,
                loyalty INTEGER NOT NULL DEFAULT 3,
                yearsExperience INTEGER NOT NULL DEFAULT 0,
                positionFirst INTEGER NOT NULL,
                positionSecond INTEGER NOT NULL DEFAULT 0,
                skillPhysique INTEGER NOT NULL,
                skillBlock INTEGER NOT NULL,
                skillSteal INTEGER NOT NULL,
                skillRebound INTEGER NOT NULL,
                skillPass INTEGER NOT NULL,
                skillShotInterior INTEGER NOT NULL,
                skillShotExterior INTEGER NOT NULL,
                skillShotFree INTEGER NOT NULL,
                stateEnergy INTEGER NOT NULL DEFAULT 99,
                stateForm INTEGER NOT NULL DEFAULT 50,
                stateInjury INTEGER NOT NULL DEFAULT 0
            )
        """)

        db.execSQL("""
            CREATE TABLE $TABLE_TACTIC (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                gameId INTEGER NOT NULL,
                teamId INTEGER NOT NULL,
                gameType INTEGER NOT NULL DEFAULT 0,
                benchImportance INTEGER NOT NULL DEFAULT 3,
                shotInteriorPercent INTEGER NOT NULL DEFAULT 40,
                shotTriplePercent INTEGER NOT NULL DEFAULT 40,
                starterPgId INTEGER,
                starterSgId INTEGER,
                starterSfId INTEGER,
                starterPfId INTEGER,
                starterCId INTEGER,
                reservePgId INTEGER,
                reserveSgId INTEGER,
                reserveSfId INTEGER,
                reservePfId INTEGER,
                reserveCId INTEGER,
                starOnePlayerId INTEGER,
                starTwoPlayerId INTEGER,
                starThreePlayerId INTEGER
            )
        """)

        db.execSQL("""
            CREATE TABLE $TABLE_MATCH (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                gameId INTEGER NOT NULL,
                matchday INTEGER NOT NULL,
                teamLocalId INTEGER NOT NULL,
                teamVisitorId INTEGER NOT NULL,
                name TEXT,
                localScore INTEGER,
                visitorScore INTEGER,
                localQuarter1 INTEGER,
                localQuarter2 INTEGER,
                localQuarter3 INTEGER,
                localQuarter4 INTEGER,
                localOt INTEGER,
                visitorQuarter1 INTEGER,
                visitorQuarter2 INTEGER,
                visitorQuarter3 INTEGER,
                visitorQuarter4 INTEGER,
                visitorOt INTEGER,
                isPlayed INTEGER NOT NULL DEFAULT 0
            )
        """)

        db.execSQL("""
            CREATE TABLE $TABLE_MATCH_RESULT (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                gameId INTEGER NOT NULL,
                matchId INTEGER NOT NULL,
                playerId INTEGER NOT NULL,
                playerName TEXT NOT NULL,
                teamId INTEGER NOT NULL,
                matchday INTEGER NOT NULL,
                minutesPlayed INTEGER NOT NULL DEFAULT 0,
                points INTEGER NOT NULL DEFAULT 0,
                fouls INTEGER NOT NULL DEFAULT 0,
                blocks INTEGER NOT NULL DEFAULT 0,
                steals INTEGER NOT NULL DEFAULT 0,
                rebounds INTEGER NOT NULL DEFAULT 0,
                passesOk INTEGER NOT NULL DEFAULT 0,
                passesKo INTEGER NOT NULL DEFAULT 0,
                shotsFreeOk INTEGER NOT NULL DEFAULT 0,
                shotsFreeKo INTEGER NOT NULL DEFAULT 0,
                shotsInteriorOk INTEGER NOT NULL DEFAULT 0,
                shotsInteriorKo INTEGER NOT NULL DEFAULT 0,
                shotsExteriorDoubleOk INTEGER NOT NULL DEFAULT 0,
                shotsExteriorDoubleKo INTEGER NOT NULL DEFAULT 0,
                shotsExteriorTripleOk INTEGER NOT NULL DEFAULT 0,
                shotsExteriorTripleKo INTEGER NOT NULL DEFAULT 0
            )
        """)

        db.execSQL("""
            CREATE TABLE $TABLE_STANDINGS (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                gameId INTEGER NOT NULL,
                teamId INTEGER NOT NULL,
                teamName TEXT NOT NULL,
                conference INTEGER NOT NULL,
                division INTEGER NOT NULL,
                gamesWon INTEGER NOT NULL DEFAULT 0,
                gamesLost INTEGER NOT NULL DEFAULT 0,
                pointsScored INTEGER NOT NULL DEFAULT 0,
                pointsAllowed INTEGER NOT NULL DEFAULT 0
            )
        """)

        db.execSQL("""
            CREATE TABLE $TABLE_PLAYOFF_SERIES (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                gameId INTEGER NOT NULL,
                conference INTEGER,
                round INTEGER NOT NULL,
                seed1 INTEGER NOT NULL,
                seed2 INTEGER NOT NULL,
                team1Id INTEGER NOT NULL,
                team2Id INTEGER NOT NULL,
                team1Wins INTEGER NOT NULL DEFAULT 0,
                team2Wins INTEGER NOT NULL DEFAULT 0,
                winnerTeamId INTEGER
            )
        """)

        db.execSQL("""
            CREATE TABLE $TABLE_NEWS (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                gameId INTEGER NOT NULL,
                matchday INTEGER NOT NULL,
                type TEXT NOT NULL,
                title TEXT NOT NULL,
                body TEXT NOT NULL,
                team1Id INTEGER,
                team2Id INTEGER,
                playerId INTEGER,
                createdAt INTEGER NOT NULL
            )
        """)

        db.execSQL("""
            CREATE TABLE $TABLE_DRAFT_PICK (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                gameId INTEGER NOT NULL,
                originalTeamId INTEGER NOT NULL,
                currentTeamId INTEGER NOT NULL,
                round INTEGER NOT NULL,
                position INTEGER,
                marketValue REAL NOT NULL DEFAULT 0.0
            )
        """)

        db.execSQL("""
            CREATE TABLE $TABLE_CHALLENGE (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                teamName TEXT NOT NULL UNIQUE,
                completed INTEGER NOT NULL DEFAULT 0,
                completedSeason INTEGER
            )
        """)

        // Create Indices for fast querying
        db.execSQL("CREATE INDEX idx_player_game_team ON $TABLE_PLAYER (gameId, teamId)")
        db.execSQL("CREATE INDEX idx_match_game_day ON $TABLE_MATCH (gameId, matchday)")
        db.execSQL("CREATE INDEX idx_match_result_game ON $TABLE_MATCH_RESULT (gameId, playerId)")
        db.execSQL("CREATE INDEX idx_news_game_day ON $TABLE_NEWS (gameId, matchday)")
    }

    override fun onUpgrade(db: SQLiteDatabase, oldVersion: Int, newVersion: Int) {
        db.execSQL("DROP TABLE IF EXISTS $TABLE_GAME_SESSION")
        db.execSQL("DROP TABLE IF EXISTS $TABLE_TEAM")
        db.execSQL("DROP TABLE IF EXISTS $TABLE_PLAYER")
        db.execSQL("DROP TABLE IF EXISTS $TABLE_TACTIC")
        db.execSQL("DROP TABLE IF EXISTS $TABLE_MATCH")
        db.execSQL("DROP TABLE IF EXISTS $TABLE_MATCH_RESULT")
        db.execSQL("DROP TABLE IF EXISTS $TABLE_STANDINGS")
        db.execSQL("DROP TABLE IF EXISTS $TABLE_PLAYOFF_SERIES")
        db.execSQL("DROP TABLE IF EXISTS $TABLE_NEWS")
        db.execSQL("DROP TABLE IF EXISTS $TABLE_DRAFT_PICK")
        db.execSQL("DROP TABLE IF EXISTS $TABLE_CHALLENGE")
        onCreate(db)
    }
}
