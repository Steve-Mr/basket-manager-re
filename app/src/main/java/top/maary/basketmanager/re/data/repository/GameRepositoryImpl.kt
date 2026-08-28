package top.maary.basketmanager.re.data.repository

import top.maary.basketmanager.re.domain.engine.ContractEngine

import android.content.ContentValues
import android.content.Context
import android.database.Cursor
import top.maary.basketmanager.re.data.local.database.BasketManagerDatabaseHelper
import top.maary.basketmanager.re.data.local.database.BasketManagerDatabaseHelper.Companion as DB
import top.maary.basketmanager.re.data.local.database.toDomain
import top.maary.basketmanager.re.data.local.database.toEntity
import top.maary.basketmanager.re.data.local.entity.*
import top.maary.basketmanager.re.domain.engine.*
import top.maary.basketmanager.re.domain.model.*
import top.maary.basketmanager.re.domain.repository.GameRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.InputStream
import kotlin.random.Random

class GameRepositoryImpl(private val context: Context) : GameRepository {

    private val dbHelper = BasketManagerDatabaseHelper(context)

    // ==========================================
    // Game Sessions
    // ==========================================

    override suspend fun getAllGames(): List<GameSession> = withContext(Dispatchers.IO) {
        val list = mutableListOf<GameSession>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_GAME_SESSION} ORDER BY lastPlayedAt DESC", null)
        cursor.use { c ->
            while (c.moveToNext()) {
                list.add(cursorToGameSession(c))
            }
        }
        list
    }

    override suspend fun getGame(gameId: Long): GameSession? = withContext(Dispatchers.IO) {
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_GAME_SESSION} WHERE id = ?", arrayOf(gameId.toString()))
        cursor.use { c ->
            if (c.moveToFirst()) cursorToGameSession(c) else null
        }
    }

    override suspend fun createNewGame(name: String, userTeamName: String, rosterStream: InputStream): GameSession = withContext(Dispatchers.IO) {
        val db = dbHelper.writableDatabase
        db.beginTransaction()
        try {
            // 1. Create Game Session
            val gameValues = ContentValues().apply {
                put("name", name)
                put("currentSeason", 1)
                put("currentMatchday", 1)
                put("userTeamId", 0)
                put("autoLineupEnabled", 1)
                put("createdAt", System.currentTimeMillis())
                put("lastPlayedAt", System.currentTimeMillis())
            }
            val gameId = db.insert(DB.TABLE_GAME_SESSION, null, gameValues)

            // 2. Create 30 Teams
            val teamNames = listOf(
                // East Atlantic
                "BOS" to Division.E1_ATLANTIC, "BRO" to Division.E1_ATLANTIC, "NYK" to Division.E1_ATLANTIC, "PHI" to Division.E1_ATLANTIC, "TOR" to Division.E1_ATLANTIC,
                // East Central
                "CHI" to Division.E2_CENTRAL, "CLE" to Division.E2_CENTRAL, "DET" to Division.E2_CENTRAL, "IND" to Division.E2_CENTRAL, "MIL" to Division.E2_CENTRAL,
                // East Southeast
                "ATL" to Division.E3_SOUTHEAST, "CHA" to Division.E3_SOUTHEAST, "MIA" to Division.E3_SOUTHEAST, "ORL" to Division.E3_SOUTHEAST, "WAS" to Division.E3_SOUTHEAST,
                // West Southwest
                "DAL" to Division.W1_SOUTHWEST, "HOU" to Division.W1_SOUTHWEST, "MEM" to Division.W1_SOUTHWEST, "NOR" to Division.W1_SOUTHWEST, "SAN" to Division.W1_SOUTHWEST,
                // West Northwest
                "DEN" to Division.W2_NORTHWEST, "MIN" to Division.W2_NORTHWEST, "POR" to Division.W2_NORTHWEST, "OKC" to Division.W2_NORTHWEST, "UTA" to Division.W2_NORTHWEST,
                // West Pacific
                "GSW" to Division.W3_PACIFIC, "LAC" to Division.W3_PACIFIC, "LAL" to Division.W3_PACIFIC, "PHO" to Division.W3_PACIFIC, "SAC" to Division.W3_PACIFIC
            )

            var userTeamId = 0L
            val createdTeams = mutableListOf<Team>()

            teamNames.forEach { (tName, div) ->
                val cap = Team.getDefaultSalaryCap(tName)
                val color = Team.getTeamColor(tName)
                val teamValues = ContentValues().apply {
                    put("gameId", gameId)
                    put("name", tName)
                    put("fullName", tName)
                    put("conference", div.conference.id)
                    put("division", div.id)
                    put("salaryCap", cap)
                    put("colorHex", color)
                }
                val tId = db.insert(DB.TABLE_TEAM, null, teamValues)
                val teamObj = Team(id = tId, gameId = gameId, name = tName, conference = div.conference, division = div, salaryCap = cap, colorHex = color)
                createdTeams.add(teamObj)

                if (tName.equals(userTeamName, ignoreCase = true)) {
                    userTeamId = tId
                }

                // Initial Standings row
                val stdValues = ContentValues().apply {
                    put("gameId", gameId)
                    put("teamId", tId)
                    put("teamName", tName)
                    put("conference", div.conference.id)
                    put("division", div.id)
                    put("gamesWon", 0)
                    put("gamesLost", 0)
                    put("pointsScored", 0)
                    put("pointsAllowed", 0)
                }
                db.insert(DB.TABLE_STANDINGS, null, stdValues)

                // Initial Draft Picks (Round 1 & Round 2)
                val dp1 = ContentValues().apply {
                    put("gameId", gameId)
                    put("originalTeamId", tId)
                    put("currentTeamId", tId)
                    put("round", 1)
                    put("marketValue", 25.0)
                }
                db.insert(DB.TABLE_DRAFT_PICK, null, dp1)

                val dp2 = ContentValues().apply {
                    put("gameId", gameId)
                    put("originalTeamId", tId)
                    put("currentTeamId", tId)
                    put("round", 2)
                    put("marketValue", 8.0)
                }
                db.insert(DB.TABLE_DRAFT_PICK, null, dp2)
            }

            // Update user team ID in session
            val updateGame = ContentValues().apply { put("userTeamId", userTeamId) }
            db.update(DB.TABLE_GAME_SESSION, updateGame, "id = ?", arrayOf(gameId.toString()))

            // 3. Load and Insert Players from CSV with exact team codes
            val rawPlayers = RosterParser.parseRostersCsv(rosterStream, gameId)
            rawPlayers.forEach { parsed ->
                val matchedTeam = createdTeams.find { it.name.equals(parsed.teamCode, ignoreCase = true) }
                val assignedTeamId = if (parsed.teamCode == "0" || matchedTeam == null) null else matchedTeam.id
                val playerEntity = parsed.player.copy(gameId = gameId, teamId = assignedTeamId).toEntity()
                insertPlayerDirect(db, playerEntity)
            }

            // 4. Initialize Tactics for each team with Lineup Optimization
            createdTeams.forEach { t ->
                val teamPlayers = getTeamPlayersDirect(db, t.id)
                val initTactic = Tactic(id = 0, gameId = gameId, teamId = t.id)
                val optTactic = LineupOptimizer.optimizeLineup(teamPlayers, initTactic)
                insertTacticDirect(db, optTactic.toEntity())
            }

            // 5. Generate Regular Season Schedule (82 games)
            val schedule = SeasonCalendarEngine.generateSeasonSchedule(gameId, createdTeams)
            schedule.forEach { m ->
                insertMatchDirect(db, m.toEntity())
            }

            // 6. First Welcome News
            val welcomeNews = NewsItem(
                gameId = gameId,
                matchday = 0,
                type = NewsType.INFO,
                title = "Welcome to Basket Manager!",
                body = "You have taken charge of your franchise. Set your tactics, lineup, and lead your team to the Championship!",
                team1Id = userTeamId
            )
            insertNewsDirect(db, welcomeNews.toEntity())

            db.setTransactionSuccessful()

            GameSession(
                id = gameId,
                name = name,
                currentSeason = 1,
                currentMatchday = 1,
                userTeamId = userTeamId,
                autoLineupEnabled = true
            )
        } finally {
            db.endTransaction()
        }
    }

    override suspend fun deleteGame(gameId: Long) = withContext(Dispatchers.IO) {
        val db = dbHelper.writableDatabase
        db.beginTransaction()
        try {
            db.delete(DB.TABLE_GAME_SESSION, "id = ?", arrayOf(gameId.toString()))
            db.delete(DB.TABLE_TEAM, "gameId = ?", arrayOf(gameId.toString()))
            db.delete(DB.TABLE_PLAYER, "gameId = ?", arrayOf(gameId.toString()))
            db.delete(DB.TABLE_TACTIC, "gameId = ?", arrayOf(gameId.toString()))
            db.delete(DB.TABLE_MATCH, "gameId = ?", arrayOf(gameId.toString()))
            db.delete(DB.TABLE_MATCH_RESULT, "gameId = ?", arrayOf(gameId.toString()))
            db.delete(DB.TABLE_STANDINGS, "gameId = ?", arrayOf(gameId.toString()))
            db.delete(DB.TABLE_PLAYOFF_SERIES, "gameId = ?", arrayOf(gameId.toString()))
            db.delete(DB.TABLE_NEWS, "gameId = ?", arrayOf(gameId.toString()))
            db.delete(DB.TABLE_DRAFT_PICK, "gameId = ?", arrayOf(gameId.toString()))
            db.setTransactionSuccessful()
        } finally {
            db.endTransaction()
        }
    }

    override suspend fun updateGame(game: GameSession): Unit = withContext(Dispatchers.IO) {
        val db = dbHelper.writableDatabase
        val cv = ContentValues().apply {
            put("name", game.name)
            put("currentSeason", game.currentSeason)
            put("currentMatchday", game.currentMatchday)
            put("userTeamId", game.userTeamId)
            put("autoLineupEnabled", if (game.autoLineupEnabled) 1 else 0)
            put("lastPlayedAt", System.currentTimeMillis())
        }
        db.update(DB.TABLE_GAME_SESSION, cv, "id = ?", arrayOf(game.id.toString()))
    }

    // ==========================================
    // Teams
    // ==========================================

    override suspend fun getTeams(gameId: Long): List<Team> = withContext(Dispatchers.IO) {
        val list = mutableListOf<Team>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_TEAM} WHERE gameId = ? ORDER BY id ASC", arrayOf(gameId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                list.add(cursorToTeam(c).toDomain())
            }
        }
        list
    }

    override suspend fun getTeam(teamId: Long): Team? = withContext(Dispatchers.IO) {
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_TEAM} WHERE id = ?", arrayOf(teamId.toString()))
        cursor.use { c ->
            if (c.moveToFirst()) cursorToTeam(c).toDomain() else null
        }
    }

    override suspend fun updateTeam(team: Team): Unit = withContext(Dispatchers.IO) {
        val db = dbHelper.writableDatabase
        val cv = ContentValues().apply {
            put("salaryCap", team.salaryCap)
        }
        db.update(DB.TABLE_TEAM, cv, "id = ?", arrayOf(team.id.toString()))
    }

    // ==========================================
    // Players
    // ==========================================

    override suspend fun getPlayers(gameId: Long): List<Player> = withContext(Dispatchers.IO) {
        val list = mutableListOf<Player>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_PLAYER} WHERE gameId = ?", arrayOf(gameId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                list.add(cursorToPlayer(c).toDomain())
            }
        }
        list
    }

    override suspend fun getTeamPlayers(teamId: Long): List<Player> = withContext(Dispatchers.IO) {
        val db = dbHelper.readableDatabase
        getTeamPlayersDirect(db, teamId)
    }

    override suspend fun getFreeAgents(gameId: Long): List<Player> = withContext(Dispatchers.IO) {
        val list = mutableListOf<Player>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_PLAYER} WHERE gameId = ? AND (teamId IS NULL OR teamId = 0)", arrayOf(gameId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                list.add(cursorToPlayer(c).toDomain())
            }
        }
        list
    }

    override suspend fun getPlayer(playerId: Long): Player? = withContext(Dispatchers.IO) {
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_PLAYER} WHERE id = ?", arrayOf(playerId.toString()))
        cursor.use { c ->
            if (c.moveToFirst()) cursorToPlayer(c).toDomain() else null
        }
    }

    override suspend fun updatePlayer(player: Player): Unit = withContext(Dispatchers.IO) {
        val db = dbHelper.writableDatabase
        db.update(DB.TABLE_PLAYER, playerToContentValues(player.toEntity()), "id = ?", arrayOf(player.id.toString()))
    }

    override suspend fun updatePlayers(players: List<Player>): Unit = withContext(Dispatchers.IO) {
        val db = dbHelper.writableDatabase
        db.beginTransaction()
        try {
            players.forEach { p ->
                db.update(DB.TABLE_PLAYER, playerToContentValues(p.toEntity()), "id = ?", arrayOf(p.id.toString()))
            }
            db.setTransactionSuccessful()
        } finally {
            db.endTransaction()
        }
    }

    // ==========================================
    // Tactics
    // ==========================================

    override suspend fun getTactic(teamId: Long): Tactic? = withContext(Dispatchers.IO) {
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_TACTIC} WHERE teamId = ?", arrayOf(teamId.toString()))
        cursor.use { c ->
            if (c.moveToFirst()) cursorToTactic(c).toDomain() else null
        }
    }

    override suspend fun updateTactic(tactic: Tactic): Unit = withContext(Dispatchers.IO) {
        val db = dbHelper.writableDatabase
        db.update(DB.TABLE_TACTIC, tacticToContentValues(tactic.toEntity()), "id = ?", arrayOf(tactic.id.toString()))
    }

    override suspend fun autoOptimizeLineup(teamId: Long): Tactic = withContext(Dispatchers.IO) {
        val db = dbHelper.writableDatabase
        val teamPlayers = getTeamPlayersDirect(db, teamId)
        val currentTactic = getTactic(teamId) ?: Tactic(id = 0, teamId = teamId)
        val optimized = LineupOptimizer.optimizeLineup(teamPlayers, currentTactic)
        if (optimized.id > 0) {
            db.update(DB.TABLE_TACTIC, tacticToContentValues(optimized.toEntity()), "id = ?", arrayOf(optimized.id.toString()))
        } else {
            val newId = db.insert(DB.TABLE_TACTIC, null, tacticToContentValues(optimized.toEntity()))
            return@withContext optimized.copy(id = newId)
        }
        optimized
    }

    // ==========================================
    // Matches & Statistics
    // ==========================================

    override suspend fun getMatchesForDay(gameId: Long, matchday: Int): List<Match> = withContext(Dispatchers.IO) {
        val list = mutableListOf<Match>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_MATCH} WHERE gameId = ? AND matchday = ?", arrayOf(gameId.toString(), matchday.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                list.add(cursorToMatch(c).toDomain())
            }
        }
        list
    }

    override suspend fun getTeamMatches(gameId: Long, teamId: Long): List<Match> = withContext(Dispatchers.IO) {
        val list = mutableListOf<Match>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_MATCH} WHERE gameId = ? AND (teamLocalId = ? OR teamVisitorId = ?) ORDER BY matchday ASC", arrayOf(gameId.toString(), teamId.toString(), teamId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                list.add(cursorToMatch(c).toDomain())
            }
        }
        list
    }

    override suspend fun getMatch(matchId: Long): Match? = withContext(Dispatchers.IO) {
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_MATCH} WHERE id = ?", arrayOf(matchId.toString()))
        cursor.use { c ->
            if (c.moveToFirst()) cursorToMatch(c).toDomain() else null
        }
    }

    override suspend fun getMatchResults(matchId: Long): List<MatchResult> = withContext(Dispatchers.IO) {
        val list = mutableListOf<MatchResult>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_MATCH_RESULT} WHERE matchId = ?", arrayOf(matchId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                list.add(cursorToMatchResult(c).toDomain())
            }
        }
        list
    }

    override suspend fun getPlayerCareerStats(gameId: Long, playerId: Long): List<MatchResult> = withContext(Dispatchers.IO) {
        val list = mutableListOf<MatchResult>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_MATCH_RESULT} WHERE gameId = ? AND playerId = ? ORDER BY matchday ASC", arrayOf(gameId.toString(), playerId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                list.add(cursorToMatchResult(c).toDomain())
            }
        }
        list
    }

    override suspend fun getAllPlayerStats(gameId: Long): Map<Long, List<MatchResult>> = withContext(Dispatchers.IO) {
        val map = mutableMapOf<Long, MutableList<MatchResult>>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_MATCH_RESULT} WHERE gameId = ?", arrayOf(gameId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                val res = cursorToMatchResult(c).toDomain()
                map.getOrPut(res.playerId) { mutableListOf() }.add(res)
            }
        }
        map
    }

    override suspend fun getAllPlayerRegularStats(gameId: Long): Map<Long, List<MatchResult>> = withContext(Dispatchers.IO) {
        val map = mutableMapOf<Long, MutableList<MatchResult>>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_MATCH_RESULT} WHERE gameId = ? AND matchday <= 166", arrayOf(gameId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                val res = cursorToMatchResult(c).toDomain()
                map.getOrPut(res.playerId) { mutableListOf() }.add(res)
            }
        }
        map
    }

    override suspend fun getAllPlayerPlayoffStats(gameId: Long): Map<Long, List<MatchResult>> = withContext(Dispatchers.IO) {
        val map = mutableMapOf<Long, MutableList<MatchResult>>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_MATCH_RESULT} WHERE gameId = ? AND matchday > 166", arrayOf(gameId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                val res = cursorToMatchResult(c).toDomain()
                map.getOrPut(res.playerId) { mutableListOf() }.add(res)
            }
        }
        map
    }

    // ==========================================
    // Standings & Playoffs
    // ==========================================

    override suspend fun getStandings(gameId: Long): List<StandingsItem> = withContext(Dispatchers.IO) {
        val list = mutableListOf<StandingsItem>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_STANDINGS} WHERE gameId = ? ORDER BY gamesWon DESC, (pointsScored - pointsAllowed) DESC", arrayOf(gameId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                list.add(cursorToStandings(c).toDomain())
            }
        }
        list
    }

    override suspend fun getPlayoffSeries(gameId: Long): List<PlayoffSeries> = withContext(Dispatchers.IO) {
        val list = mutableListOf<PlayoffSeries>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_PLAYOFF_SERIES} WHERE gameId = ? ORDER BY round ASC, id ASC", arrayOf(gameId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                list.add(
                    PlayoffSeries(
                        id = c.getLong(c.getColumnIndexOrThrow("id")),
                        gameId = c.getLong(c.getColumnIndexOrThrow("gameId")),
                        conference = if (c.isNull(c.getColumnIndexOrThrow("conference"))) null else Conference.fromId(c.getInt(c.getColumnIndexOrThrow("conference"))),
                        round = c.getInt(c.getColumnIndexOrThrow("round")),
                        seed1 = c.getInt(c.getColumnIndexOrThrow("seed1")),
                        seed2 = c.getInt(c.getColumnIndexOrThrow("seed2")),
                        team1Id = c.getLong(c.getColumnIndexOrThrow("team1Id")),
                        team2Id = c.getLong(c.getColumnIndexOrThrow("team2Id")),
                        team1Wins = c.getInt(c.getColumnIndexOrThrow("team1Wins")),
                        team2Wins = c.getInt(c.getColumnIndexOrThrow("team2Wins")),
                        winnerTeamId = if (c.isNull(c.getColumnIndexOrThrow("winnerTeamId"))) null else c.getLong(c.getColumnIndexOrThrow("winnerTeamId"))
                    )
                )
            }
        }
        list
    }

    // ==========================================
    // News, Draft, Trade, Free Agency
    // ==========================================

    override suspend fun getNews(gameId: Long): List<NewsItem> = withContext(Dispatchers.IO) {
        val list = mutableListOf<NewsItem>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_NEWS} WHERE gameId = ? ORDER BY matchday DESC, id DESC", arrayOf(gameId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                list.add(cursorToNews(c).toDomain())
            }
        }
        list
    }

    override suspend fun addNews(newsItem: NewsItem): Unit = withContext(Dispatchers.IO) {
        val db = dbHelper.writableDatabase
        insertNewsDirect(db, newsItem.toEntity())
    }

    override suspend fun getDraftPicks(gameId: Long): List<DraftPick> = withContext(Dispatchers.IO) {
        val list = mutableListOf<DraftPick>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_DRAFT_PICK} WHERE gameId = ? ORDER BY round ASC, CASE WHEN position IS NULL OR position = 0 THEN 999 ELSE position END ASC, id ASC", arrayOf(gameId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                list.add(cursorToDraftPick(c).toDomain())
            }
        }
        list
    }

    override suspend fun ensureDraftInitialized(gameId: Long): Unit = withContext(Dispatchers.IO) {
        val db = dbHelper.writableDatabase
        val existingPicks = getDraftPicks(gameId)
        val standings = getStandings(gameId)
        val draftOrder = DraftEngine.calculateDraftOrder(standings)

        val countCursor = db.rawQuery("SELECT COUNT(*) FROM ${DB.TABLE_NEWS} WHERE gameId = ? AND title LIKE 'Draft Pick:%'", arrayOf(gameId.toString()))
        val alreadyDraftedCount = countCursor.use { if (it.moveToFirst()) it.getInt(0) else 0 }

        if (existingPicks.isEmpty() && alreadyDraftedCount == 0) {
            // First time draft setup: Insert Round 1 & Round 2 picks
            draftOrder.forEachIndexed { index, teamId ->
                val pos = index + 1
                val dp1 = ContentValues().apply {
                    put("gameId", gameId)
                    put("originalTeamId", teamId)
                    put("currentTeamId", teamId)
                    put("round", 1)
                    put("position", pos)
                    put("marketValue", 25.0)
                }
                db.insert(DB.TABLE_DRAFT_PICK, null, dp1)

                val dp2 = ContentValues().apply {
                    put("gameId", gameId)
                    put("originalTeamId", teamId)
                    put("currentTeamId", teamId)
                    put("round", 2)
                    put("position", pos)
                    put("marketValue", 8.0)
                }
                db.insert(DB.TABLE_DRAFT_PICK, null, dp2)
            }
        } else if (existingPicks.any { it.position == null || it.position == 0 }) {
            // Assign positions according to draft order
            draftOrder.forEachIndexed { index, teamId ->
                val pickPos = index + 1
                db.execSQL(
                    "UPDATE ${DB.TABLE_DRAFT_PICK} SET position = ? WHERE gameId = ? AND round = 1 AND originalTeamId = ?",
                    arrayOf(pickPos, gameId, teamId)
                )
                db.execSQL(
                    "UPDATE ${DB.TABLE_DRAFT_PICK} SET position = ? WHERE gameId = ? AND round = 2 AND originalTeamId = ?",
                    arrayOf(pickPos, gameId, teamId)
                )
            }
        }

        val prospects = getDraftProspects(gameId)
        if (prospects.isEmpty()) {
            val newProspects = DraftEngine.generateDraftProspects(gameId, 90)
            newProspects.forEach { p -> insertPlayerDirect(db, p.toEntity()) }
        }
    }

    override suspend fun getDraftProspects(gameId: Long): List<Player> = withContext(Dispatchers.IO) {
        val list = mutableListOf<Player>()
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_PLAYER} WHERE gameId = ? AND (teamId IS NULL OR teamId = 0) AND yearsContract = 0", arrayOf(gameId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                list.add(cursorToPlayer(c).toDomain())
            }
        }
        list.sortedByDescending { it.overallRating }
    }

    override suspend fun executeTrade(proposal: TradeProposal): TradeEvaluationResult = withContext(Dispatchers.IO) {
        val teamA = getTeam(proposal.teamAId)!!
        val teamB = getTeam(proposal.teamBId)!!
        val teamAPlayers = proposal.teamAPlayerIds.mapNotNull { getPlayer(it) }
        val teamBPlayers = proposal.teamBPlayerIds.mapNotNull { getPlayer(it) }
        val allPicks = getDraftPicks(teamA.gameId)
        val teamADraftPicks = allPicks.filter { proposal.teamADraftPickIds.contains(it.id) }
        val teamBDraftPicks = allPicks.filter { proposal.teamBDraftPickIds.contains(it.id) }
        val teamARoster = getTeamPlayers(teamA.id)
        val teamBRoster = getTeamPlayers(teamB.id)

        val eval = TradeEvaluationEngine.evaluateTrade(
            teamA, teamB, teamAPlayers, teamBPlayers, teamADraftPicks, teamBDraftPicks, teamARoster, teamBRoster
        )

        if (eval.isAccepted) {
            val db = dbHelper.writableDatabase
            db.beginTransaction()
            try {
                teamAPlayers.forEach { p ->
                    db.execSQL("UPDATE ${DB.TABLE_PLAYER} SET teamId = ? WHERE id = ?", arrayOf(teamB.id, p.id))
                }
                teamBPlayers.forEach { p ->
                    db.execSQL("UPDATE ${DB.TABLE_PLAYER} SET teamId = ? WHERE id = ?", arrayOf(teamA.id, p.id))
                }
                teamADraftPicks.forEach { dp ->
                    db.execSQL("UPDATE ${DB.TABLE_DRAFT_PICK} SET currentTeamId = ? WHERE id = ?", arrayOf(teamB.id, dp.id))
                }
                teamBDraftPicks.forEach { dp ->
                    db.execSQL("UPDATE ${DB.TABLE_DRAFT_PICK} SET currentTeamId = ? WHERE id = ?", arrayOf(teamA.id, dp.id))
                }

                val news = NewsItem(
                    gameId = teamA.gameId,
                    type = NewsType.TRADE,
                    title = "Trade Completed!",
                    body = "${teamA.name} and ${teamB.name} have agreed on a trade involving ${teamAPlayers.size + teamADraftPicks.size} assets from ${teamA.name} and ${teamBPlayers.size + teamBDraftPicks.size} assets from ${teamB.name}.",
                    team1Id = teamA.id,
                    team2Id = teamB.id
                )
                insertNewsDirect(db, news.toEntity())
                db.setTransactionSuccessful()
            } finally {
                db.endTransaction()
            }
        }
        eval
    }

    override suspend fun signFreeAgent(playerId: Long, teamId: Long, salary: Int, years: Int): Boolean = withContext(Dispatchers.IO) {
        val player = getPlayer(playerId) ?: return@withContext false
        val team = getTeam(teamId) ?: return@withContext false
        val roster = getTeamPlayers(teamId)
        val payroll = roster.sumOf { it.salary }

        if (roster.size >= 20 || (payroll + salary) > team.salaryCap) {
            return@withContext false
        }

        val db = dbHelper.writableDatabase
        val cv = ContentValues().apply {
            put("teamId", teamId)
            put("salary", salary)
            put("yearsContract", years)
        }
        db.update(DB.TABLE_PLAYER, cv, "id = ?", arrayOf(playerId.toString()))

        val news = NewsItem(
            gameId = team.gameId,
            type = NewsType.INFO,
            title = "Free Agent Signed",
            body = "${team.name} signed ${player.name} to a $years-year, $${salary / 1_000_000.0}M deal.",
            team1Id = teamId,
            playerId = playerId
        )
        insertNewsDirect(db, news.toEntity())
        true
    }

    override suspend fun extendContract(playerId: Long, years: Int, salary: Int): Boolean = withContext(Dispatchers.IO) {
        val db = dbHelper.writableDatabase
        val cv = ContentValues().apply {
            put("yearsContract", years)
            put("salary", salary)
        }
        val count = db.update(DB.TABLE_PLAYER, cv, "id = ?", arrayOf(playerId.toString()))
        count > 0
    }

    override suspend fun selectDraftPick(prospectId: Long, pickId: Long): Boolean = withContext(Dispatchers.IO) {
        val db = dbHelper.writableDatabase
        val pickCursor = db.rawQuery("SELECT * FROM ${DB.TABLE_DRAFT_PICK} WHERE id = ?", arrayOf(pickId.toString()))
        var teamId = 0L
        var round = 1
        var pickPos = 1
        var gameId = 0L
        pickCursor.use { c ->
            if (c.moveToFirst()) {
                teamId = c.getLong(c.getColumnIndexOrThrow("currentTeamId"))
                round = c.getInt(c.getColumnIndexOrThrow("round"))
                pickPos = c.getInt(c.getColumnIndexOrThrow("position"))
                gameId = c.getLong(c.getColumnIndexOrThrow("gameId"))
            }
        }
        if (teamId == 0L) return@withContext false

        val player = getPlayer(prospectId) ?: return@withContext false
        val team = getTeam(teamId) ?: return@withContext false

        val (salary, years) = DraftEngine.calculateRookieSalary(round, pickPos)
        val cv = ContentValues().apply {
            put("teamId", teamId)
            put("salary", salary)
            put("yearsContract", years)
        }
        db.update(DB.TABLE_PLAYER, cv, "id = ?", arrayOf(prospectId.toString()))
        db.delete(DB.TABLE_DRAFT_PICK, "id = ?", arrayOf(pickId.toString()))

        val news = NewsItem(
            gameId = gameId,
            matchday = 230,
            type = NewsType.TRADE,
            title = "Draft Pick: ${team.name}",
            body = "${team.name} selected ${player.name} (${player.positionFirst.shortName}, Rating: ${player.overallRating}) with Pick #$pickPos in Round $round ($${salary / 1_000_000.0}M/yr for $years yrs).",
            team1Id = teamId,
            playerId = player.id
        )
        insertNewsDirect(db, news.toEntity())
        true
    }

    override suspend fun executeCpuDraftPick(gameId: Long, pickId: Long): Player? = withContext(Dispatchers.IO) {
        val db = dbHelper.readableDatabase
        val pickCursor = db.rawQuery("SELECT * FROM ${DB.TABLE_DRAFT_PICK} WHERE id = ?", arrayOf(pickId.toString()))
        var teamId = 0L
        var round = 1
        var pickPos = 1
        pickCursor.use { c ->
            if (c.moveToFirst()) {
                teamId = c.getLong(c.getColumnIndexOrThrow("currentTeamId"))
                round = c.getInt(c.getColumnIndexOrThrow("round"))
                pickPos = c.getInt(c.getColumnIndexOrThrow("position"))
            }
        }
        if (teamId == 0L) return@withContext null

        val availableProspects = getDraftProspects(gameId)
        if (availableProspects.isEmpty()) return@withContext null

        val roster = getTeamPlayers(teamId)
        val selected = DraftEngine.cpuSelectProspect(roster, availableProspects, pickPos)

        val success = selectDraftPick(selected.id, pickId)
        if (success) selected else null
    }

    override suspend fun simulateDraftUntilUser(gameId: Long, userTeamId: Long): List<Pair<DraftPick, Player>> = withContext(Dispatchers.IO) {
        val executed = mutableListOf<Pair<DraftPick, Player>>()
        while (true) {
            val remainingPicks = getDraftPicks(gameId)
            if (remainingPicks.isEmpty()) break
            val nextPick = remainingPicks.first()
            if (nextPick.currentTeamId == userTeamId) {
                // Stop! User is on the clock
                break
            }
            val player = executeCpuDraftPick(gameId, nextPick.id)
            if (player != null) {
                executed.add(Pair(nextPick, player))
            } else {
                break
            }
        }
        executed
    }

    // ==========================================
    // Authentic Day Advancement & Multi-Season Loop
    // ==========================================

    override suspend fun advanceMatchday(gameId: Long): GameSession = withContext(Dispatchers.IO) {
        val game = getGame(gameId) ?: throw IllegalStateException("Game not found")
        val currentDay = game.currentMatchday

        val db = dbHelper.writableDatabase
        db.beginTransaction()
        try {
            // 1. Daily Player State Evolution
            val allPlayers = getPlayers(gameId)
            allPlayers.forEach { p ->
                var newInjury = p.stateInjury
                var newForm = p.stateForm
                var newEnergy = p.stateEnergy

                if (newInjury > 0) {
                    newInjury--
                    newForm = (newForm - Random.nextInt(0, 4)).coerceIn(30, 99)
                    if (newInjury == 0 && p.teamId == game.userTeamId) {
                        val recNews = NewsItem(
                            gameId = gameId,
                            matchday = currentDay,
                            type = NewsType.RECOVERY,
                            title = "Medical Clearance: ${p.shortName}",
                            body = "${p.name} has fully recovered from injury and is cleared to play.",
                            team1Id = p.teamId,
                            playerId = p.id
                        )
                        insertNewsDirect(db, recNews.toEntity())
                    }
                } else {
                    newForm = (newForm + Random.nextInt(-17, 16) + ((100 - newForm) / 20)).coerceIn(30, 99)
                    newEnergy = (newEnergy + Random.nextInt(-3, 9) + ((100 - newEnergy) / 20)).coerceIn(20, 99)
                }

                if (newInjury != p.stateInjury || newForm != p.stateForm || newEnergy != p.stateEnergy) {
                    db.execSQL("UPDATE ${DB.TABLE_PLAYER} SET stateInjury = ?, stateForm = ?, stateEnergy = ? WHERE id = ?", arrayOf(newInjury, newForm, newEnergy, p.id))
                }
            }

            // 2. Player Development Tick
            val devCandidates = allPlayers.filter { (it.id % 10) == (currentDay.toLong() % 10) }
            val statsMap = getAllPlayerStats(gameId)
            devCandidates.forEach { p ->
                val recentBoxScores = statsMap[p.id]?.takeLast(10) ?: emptyList()
                val devReport = PlayerDevelopmentEngine.developPlayerAuthentic(p, recentBoxScores, currentDay, game.userTeamId)
                db.update(DB.TABLE_PLAYER, playerToContentValues(devReport.updatedPlayer.toEntity()), "id = ?", arrayOf(p.id.toString()))
                devReport.generatedNews.forEach { n -> insertNewsDirect(db, n.toEntity()) }
            }

            when {
                // Regular season matchdays 1..166
                currentDay <= 166 -> {
                    val matches = getMatchesForDay(gameId, currentDay)
                    val teams = getTeams(gameId)
                    val teamMap = teams.associateBy { it.id }

                    matches.forEach { match ->
                        val localTeam = teamMap[match.teamLocalId] ?: return@forEach
                        val visitorTeam = teamMap[match.teamVisitorId] ?: return@forEach
                        val localPlayers = getTeamPlayersDirect(db, localTeam.id)
                        val visitorPlayers = getTeamPlayersDirect(db, visitorTeam.id)

                        // Respect user's autoLineup setting
                        val localTactic = if (localTeam.id == game.userTeamId && !game.autoLineupEnabled) {
                            getTactic(localTeam.id) ?: LineupOptimizer.optimizeLineup(localPlayers, Tactic(teamId = localTeam.id))
                        } else {
                            LineupOptimizer.optimizeLineup(localPlayers, getTactic(localTeam.id) ?: Tactic(teamId = localTeam.id))
                        }

                        val visitorTactic = if (visitorTeam.id == game.userTeamId && !game.autoLineupEnabled) {
                            getTactic(visitorTeam.id) ?: LineupOptimizer.optimizeLineup(visitorPlayers, Tactic(teamId = visitorTeam.id))
                        } else {
                            LineupOptimizer.optimizeLineup(visitorPlayers, getTactic(visitorTeam.id) ?: Tactic(teamId = visitorTeam.id))
                        }

                        val simResult = MatchSimulationEngine.simulateMatch(
                            match = match,
                            localTeam = localTeam,
                            visitorTeam = visitorTeam,
                            localPlayers = localPlayers,
                            visitorPlayers = visitorPlayers,
                            localTactic = localTactic,
                            visitorTactic = visitorTactic,
                            isPlayoffs = false,
                            userTeamId = game.userTeamId
                        )

                        updateMatchDirect(db, simResult.match.toEntity())
                        simResult.playerResults.forEach { pr -> insertMatchResultDirect(db, pr.toEntity()) }
                        simResult.updatedPlayers.forEach { p ->
                            db.update(DB.TABLE_PLAYER, playerToContentValues(p.toEntity()), "id = ?", arrayOf(p.id.toString()))
                        }
                        simResult.generatedNews.forEach { n -> insertNewsDirect(db, n.toEntity()) }

                        val localWon = (simResult.match.localScore ?: 0) > (simResult.match.visitorScore ?: 0)
                        updateStandingsAfterMatch(db, gameId, localTeam.id, localWon, simResult.match.localScore ?: 0, simResult.match.visitorScore ?: 0)
                        updateStandingsAfterMatch(db, gameId, visitorTeam.id, !localWon, simResult.match.visitorScore ?: 0, simResult.match.localScore ?: 0)
                    }

                    // On matchday 166 completion -> Lock Playoff Seeds on Day 167
                    if (currentDay == 166) {
                        val standings = getStandings(gameId)
                        val east = standings.filter { it.conference == Conference.EAST }.sortedByDescending { it.gamesWon }
                        val west = standings.filter { it.conference == Conference.WEST }.sortedByDescending { it.gamesWon }
                        val seriesList = PlayoffsEngine.generatePlayoffFirstRound(gameId, east, west)
                        seriesList.forEach { s -> insertPlayoffSeriesDirect(db, s) }

                        val playoffNews = NewsItem(
                            gameId = gameId,
                            matchday = currentDay,
                            type = NewsType.PLAYOFFS,
                            title = "Playoff Field Set!",
                            body = "The regular season has concluded. The top 8 teams in each conference have secured their playoff berths."
                        )
                        insertNewsDirect(db, playoffNews.toEntity())

                        // End-of-Regular-Season Official Awards: MVP & ROY
                        val allPlayers = getPlayers(gameId)
                        val teams = getTeams(gameId).associateBy { it.id }
                        val regularStats = getAllPlayerRegularStats(gameId)

                        AwardsEngine.calculateMvpPodium(allPlayers, teams, regularStats)?.let { mvpNews ->
                            insertNewsDirect(db, mvpNews.toEntity())
                        }
                        AwardsEngine.calculateRoyPodium(allPlayers, teams, regularStats)?.let { royNews ->
                            insertNewsDirect(db, royNews.toEntity())
                        }
                    }
                }

                // Playoffs Progression: Matchdays 167..225 (Authentic BM15 15-Day Round Windows & 2-Day Match Interval)
                currentDay in 167..225 -> {
                    val seriesList = getPlayoffSeries(gameId)
                    val teams = getTeams(gameId)
                    val teamMap = teams.associateBy { it.id }

                    // 1. Official Round Creation Milestones
                    if (currentDay == 182) {
                        val round1 = seriesList.filter { it.round == 1 }
                        val round2Existing = seriesList.filter { it.round == 2 }
                        if (round1.size == 8 && round1.all { it.winnerTeamId != null } && round2Existing.isEmpty()) {
                            val semis = PlayoffsEngine.generateConferenceSemifinals(gameId, round1)
                            semis.forEach { insertPlayoffSeriesDirect(db, it) }
                            val news = NewsItem(
                                gameId = gameId,
                                matchday = currentDay,
                                type = NewsType.PLAYOFFS,
                                title = "Playoffs: Conference Semifinals Set!",
                                body = "The First Round has concluded. 8 franchises advance to the Conference Semifinals."
                            )
                            insertNewsDirect(db, news.toEntity())
                        }
                    } else if (currentDay == 197) {
                        val round2 = seriesList.filter { it.round == 2 }
                        val round3Existing = seriesList.filter { it.round == 3 }
                        if (round2.size == 4 && round2.all { it.winnerTeamId != null } && round3Existing.isEmpty()) {
                            val confFinals = PlayoffsEngine.generateConferenceFinals(gameId, round2)
                            confFinals.forEach { insertPlayoffSeriesDirect(db, it) }
                            val news = NewsItem(
                                gameId = gameId,
                                matchday = currentDay,
                                type = NewsType.PLAYOFFS,
                                title = "Playoffs: Conference Finals Set!",
                                body = "The Final Four contenders are set for the Eastern & Western Conference Finals."
                            )
                            insertNewsDirect(db, news.toEntity())
                        }
                    } else if (currentDay == 212) {
                        val round3 = seriesList.filter { it.round == 3 }
                        val finalsExisting = seriesList.find { it.round == 4 }
                        if (round3.size == 2 && round3.all { it.winnerTeamId != null } && finalsExisting == null) {
                            val nbaFinals = PlayoffsEngine.generateNbaFinals(gameId, round3)
                            if (nbaFinals != null) {
                                insertPlayoffSeriesDirect(db, nbaFinals)
                                val t1 = teamMap[nbaFinals.team1Id]
                                val t2 = teamMap[nbaFinals.team2Id]
                                val news = NewsItem(
                                    gameId = gameId,
                                    matchday = currentDay,
                                    type = NewsType.PLAYOFFS,
                                    title = "World Finals Matchup: ${t1?.name} vs ${t2?.name}!",
                                    body = "The battle for the World Championship trophy begins!"
                                )
                                insertNewsDirect(db, news.toEntity())
                            }
                        }
                    }

                    // 2. Official Matchdays per Round (Every 2 Days)
                    val round1GameDays = setOf(168, 170, 172, 174, 176, 178, 180)
                    val round2GameDays = setOf(183, 185, 187, 189, 191, 193, 195)
                    val round3GameDays = setOf(198, 200, 202, 204, 206, 208, 210)
                    val finalsGameDays = setOf(213, 215, 217, 219, 221, 223, 225)

                    val targetRoundForToday = when (currentDay) {
                        in round1GameDays -> 1
                        in round2GameDays -> 2
                        in round3GameDays -> 3
                        in finalsGameDays -> 4
                        else -> null // Rest / Off day between playoff games
                    }

                    if (targetRoundForToday != null) {
                        val updatedSeriesList = getPlayoffSeries(gameId)
                        val activeRoundSeries = updatedSeriesList.filter { it.round == targetRoundForToday && it.winnerTeamId == null }

                        activeRoundSeries.forEach { series ->
                            val gamesPlayed = series.team1Wins + series.team2Wins
                            val (homeId, awayId) = PlayoffsEngine.determinePlayoffHomeTeam(series, gamesPlayed)

                            val localTeam = teamMap[homeId] ?: return@forEach
                            val visitorTeam = teamMap[awayId] ?: return@forEach
                            val localPlayers = getTeamPlayersDirect(db, localTeam.id)
                            val visitorPlayers = getTeamPlayersDirect(db, visitorTeam.id)

                            val localTactic = if (localTeam.id == game.userTeamId && !game.autoLineupEnabled) {
                                getTactic(localTeam.id) ?: LineupOptimizer.optimizeLineup(localPlayers, Tactic(teamId = localTeam.id))
                            } else {
                                LineupOptimizer.optimizeLineup(localPlayers, getTactic(localTeam.id) ?: Tactic(teamId = localTeam.id))
                            }

                            val visitorTactic = if (visitorTeam.id == game.userTeamId && !game.autoLineupEnabled) {
                                getTactic(visitorTeam.id) ?: LineupOptimizer.optimizeLineup(visitorPlayers, Tactic(teamId = visitorTeam.id))
                            } else {
                                LineupOptimizer.optimizeLineup(visitorPlayers, getTactic(visitorTeam.id) ?: Tactic(teamId = visitorTeam.id))
                            }

                            val match = Match(
                                id = 0,
                                gameId = gameId,
                                matchday = currentDay,
                                teamLocalId = homeId,
                                teamVisitorId = awayId,
                                name = when (series.round) {
                                    1 -> "Playoffs R1 G${gamesPlayed + 1}"
                                    2 -> "Playoffs Semis G${gamesPlayed + 1}"
                                    3 -> "Conf Finals G${gamesPlayed + 1}"
                                    else -> "World Finals G${gamesPlayed + 1}"
                                },
                                isPlayed = false
                            )

                            val simResult = MatchSimulationEngine.simulateMatch(
                                match = match,
                                localTeam = localTeam,
                                visitorTeam = visitorTeam,
                                localPlayers = localPlayers,
                                visitorPlayers = visitorPlayers,
                                localTactic = localTactic,
                                visitorTactic = visitorTactic,
                                isPlayoffs = true,
                                userTeamId = game.userTeamId
                            )

                            val insertedMatchId = insertMatchDirect(db, simResult.match.toEntity())
                            simResult.playerResults.forEach { pr ->
                                insertMatchResultDirect(db, pr.copy(matchId = insertedMatchId).toEntity())
                            }
                            simResult.updatedPlayers.forEach { p ->
                                db.update(DB.TABLE_PLAYER, playerToContentValues(p.toEntity()), "id = ?", arrayOf(p.id.toString()))
                            }
                            simResult.generatedNews.filter { match.teamLocalId == game.userTeamId || match.teamVisitorId == game.userTeamId }.forEach { n ->
                                insertNewsDirect(db, n.toEntity())
                            }

                            val winnerTeamId = if ((simResult.match.localScore ?: 0) > (simResult.match.visitorScore ?: 0)) homeId else awayId
                            val updatedSeries = PlayoffsEngine.updateSeriesAfterMatch(series, winnerTeamId)
                            db.update(DB.TABLE_PLAYOFF_SERIES, playoffSeriesToContentValues(updatedSeries), "id = ?", arrayOf(series.id.toString()))

                            // Announcement for all playoff series conclusions across the league
                            if (updatedSeries.winnerTeamId != null && series.winnerTeamId == null) {
                                val winnerTeam = teamMap[updatedSeries.winnerTeamId]
                                val loserTeamId = if (updatedSeries.winnerTeamId == updatedSeries.team1Id) updatedSeries.team2Id else updatedSeries.team1Id
                                val loserTeam = teamMap[loserTeamId]
                                val winCount = if (updatedSeries.winnerTeamId == updatedSeries.team1Id) updatedSeries.team1Wins else updatedSeries.team2Wins
                                val lossCount = if (updatedSeries.winnerTeamId == updatedSeries.team1Id) updatedSeries.team2Wins else updatedSeries.team1Wins

                                val (roundName, nextStage) = when (updatedSeries.round) {
                                    1 -> Pair("First Round", "Conference Semifinals")
                                    2 -> Pair("Conference Semifinals", "Conference Finals")
                                    3 -> Pair("Conference Finals", "World Finals")
                                    else -> Pair("World Finals", "World Championship")
                                }

                                if (updatedSeries.round < 4) {
                                    val seriesNews = NewsItem(
                                        gameId = gameId,
                                        matchday = currentDay,
                                        type = NewsType.PLAYOFFS,
                                        title = "Playoffs: ${winnerTeam?.name} Advances! 👑",
                                        body = "${winnerTeam?.name} eliminates ${loserTeam?.name} ($winCount-$lossCount) in the $roundName and advances to the $nextStage.",
                                        team1Id = winnerTeam?.id,
                                        team2Id = loserTeam?.id
                                    )
                                    insertNewsDirect(db, seriesNews.toEntity())
                                } else {
                                    val champTeam = winnerTeam
                                    val countCursor = db.rawQuery(
                                        "SELECT COUNT(*) FROM " + DB.TABLE_NEWS + " WHERE gameId = ? AND title LIKE '%WORLD CHAMPIONS%'",
                                        arrayOf(gameId.toString())
                                    )
                                    val alreadyAnnounced = countCursor.use { if (it.moveToFirst()) it.getInt(0) > 0 else false }
                                    if (!alreadyAnnounced) {
                                        if (champTeam != null) {
                                            db.execSQL("UPDATE ${DB.TABLE_CHALLENGE} SET completed = 1, completedSeason = ${game.currentSeason} WHERE teamName = ?", arrayOf(champTeam.name))
                                        }
                                        val champNews = NewsItem(
                                            gameId = gameId,
                                            matchday = currentDay,
                                            type = NewsType.TROPHY,
                                            title = "🏆 WORLD CHAMPIONS: ${champTeam?.name}!",
                                            body = "${champTeam?.name} defeats ${loserTeam?.name} ($winCount-$lossCount) to capture the World Championship in Season ${game.currentSeason}!",
                                            team1Id = champTeam?.id,
                                            team2Id = loserTeam?.id
                                        )
                                        insertNewsDirect(db, champNews.toEntity())
                                    }
                                }
                            }
                        }
                    } else {
                        // Rest / Recovery Day: Restore player physique energy towards 99
                        val allPlayers = getPlayers(gameId)
                        allPlayers.forEach { p ->
                            if (p.skillPhysique < 99) {
                                val recoveredEnergy = (p.skillPhysique + 4).coerceAtMost(99)
                                db.execSQL("UPDATE ${DB.TABLE_PLAYER} SET skillPhysique = ? WHERE id = ?", arrayOf(recoveredEnergy, p.id))
                            }
                        }
                    }
                }

                // Season Finish & Player Aging / Retirements (Matchday 226)
                currentDay == 226 -> {
                    val (active, retired) = PlayerDevelopmentEngine.handleSeasonRetirements(allPlayers)
                    active.forEach { p ->
                        db.update(DB.TABLE_PLAYER, playerToContentValues(p.toEntity()), "id = ?", arrayOf(p.id.toString()))
                    }
                    retired.forEach { r ->
                        db.delete(DB.TABLE_PLAYER, "id = ?", arrayOf(r.id.toString()))
                    }
                    val news = NewsItem(
                        gameId = gameId,
                        matchday = currentDay,
                        type = NewsType.INFO,
                        title = "Season Concluded",
                        body = "${retired.size} veteran players retired from the league. Contract years decremented."
                    )
                    insertNewsDirect(db, news.toEntity())
                }

                // Contract Renewals & Authentic BM15 Salary Cap Performance Adjustments (Matchday 227..229)
                currentDay == 227 -> {
                    val standings = getStandings(gameId)
                    val seriesList = getPlayoffSeries(gameId)
                    val adjustments = FinanceEngine.calculateSalaryCapAdjustments(standings, seriesList)

                    adjustments.forEach { (tId, adj) ->
                        db.execSQL(
                            "UPDATE ${DB.TABLE_TEAM} SET salaryCap = MIN(${FinanceEngine.SALARY_CAP_MAX}, MAX(${FinanceEngine.SALARY_CAP_MIN}, salaryCap + ?)) WHERE id = ?",
                            arrayOf(adj.deltaSalaryCap, tId)
                        )
                    }

                    val userAdj = adjustments[game.userTeamId]
                    val updatedUserTeam = getTeam(game.userTeamId)
                    if (userAdj != null && updatedUserTeam != null) {
                        val sign = if (userAdj.deltaSalaryCap >= 0) "+" else "-"
                        val absVal = kotlin.math.abs(userAdj.deltaSalaryCap) / 1_000_000.0
                        val capNews = NewsItem(
                            gameId = gameId,
                            matchday = currentDay,
                            type = NewsType.INFO,
                            title = "New Salary Cap: $${String.format("%.1f", updatedUserTeam.salaryCap / 1_000_000.0)}M ($sign$${String.format("%.1f", absVal)}M)",
                            body = "Based on last season's achievements, your franchise salary cap was adjusted by $sign$${String.format("%.1f", absVal)}M.\n\nKey Performance Factors:\n• " + userAdj.breakdownReasons.joinToString("\n• "),
                            team1Id = game.userTeamId
                        )
                        insertNewsDirect(db, capNews.toEntity())
                    }

                    // CPU Renewals (0-year expiring) and Extensions (1-year remaining core stars)
                    val allPlayers = getPlayers(gameId)
                    val cpuTeams = getTeams(gameId).filter { it.id != game.userTeamId }

                    cpuTeams.forEach { team ->
                        val teamPlayers = allPlayers.filter { it.teamId == team.id }

                        // 1. CPU Expiring Contracts (yearsContract == 0)
                        val expiring = teamPlayers.filter { it.yearsContract == 0 }
                        expiring.forEach { p ->
                            val shouldRenew = p.overallRating >= 76 || (p.age < 25 && p.potential >= 7) || (p.age > 33 && p.overallRating >= 80)
                            if (shouldRenew) {
                                val roll = kotlin.random.Random.nextInt(0, 10)
                                val renewSuccess = roll < (p.loyalty + 3).coerceIn(1, 9)
                                if (renewSuccess) {
                                    val years = when {
                                        p.age <= 25 -> kotlin.random.Random.nextInt(2, 5)
                                        p.age <= 30 -> kotlin.random.Random.nextInt(1, 5)
                                        else -> kotlin.random.Random.nextInt(1, 3)
                                    }
                                    val (marketBase, _) = ContractEngine.calculateMarketDemandSalary(p, isHomeTeamRenewal = true)
                                    db.execSQL("UPDATE ${DB.TABLE_PLAYER} SET yearsContract = ?, salary = ? WHERE id = ?", arrayOf(years, marketBase, p.id))
                                }
                            }
                        }

                        // 2. CPU Contract Extensions (yearsContract == 1 for franchise core players)
                        val extensionCandidates = teamPlayers.filter { it.yearsContract == 1 }
                        extensionCandidates.forEach { p ->
                            val isFranchiseCore = p.overallRating >= 84 || (p.age <= 25 && p.potential >= 8 && p.overallRating >= 78)
                            if (isFranchiseCore && p.loyalty >= 3) {
                                val roll = kotlin.random.Random.nextInt(0, 10)
                                if (roll < p.loyalty + 3) {
                                    val additionalYears = if (p.age >= 32) 2 else kotlin.random.Random.nextInt(2, 4)
                                    val newTotalYears = p.yearsContract + additionalYears
                                    val (marketBase, _) = ContractEngine.calculateMarketDemandSalary(p, isHomeTeamRenewal = true)
                                    db.execSQL("UPDATE ${DB.TABLE_PLAYER} SET yearsContract = ?, salary = ? WHERE id = ?", arrayOf(newTotalYears, marketBase, p.id))

                                    if (p.overallRating >= 84) {
                                        val extNews = NewsItem(
                                            gameId = gameId,
                                            matchday = currentDay,
                                            type = NewsType.INFO,
                                            title = "Contract Extension: ${p.shortName}",
                                            body = "${team.name} has signed ${p.name} to a $additionalYears-year contract extension through Season ${game.currentSeason + newTotalYears}!",
                                            team1Id = team.id,
                                            playerId = p.id
                                        )
                                        insertNewsDirect(db, extNews.toEntity())
                                    }
                                }
                            }
                        }
                    }
                }

                // Trade Day & Draft Prospect Generation (Matchday 230)
                currentDay == 230 -> {
                    val prospects = DraftEngine.generateDraftProspects(gameId, 90)
                    prospects.forEach { p -> insertPlayerDirect(db, p.toEntity()) }

                    // Setup Draft Order for Round 1 & Round 2 based on standings & lottery
                    val standings = getStandings(gameId)
                    val draftOrder = DraftEngine.calculateDraftOrder(standings)

                    draftOrder.forEachIndexed { index, teamId ->
                        val pickPos = index + 1
                        db.execSQL(
                            "UPDATE ${DB.TABLE_DRAFT_PICK} SET position = ? WHERE gameId = ? AND round = 1 AND originalTeamId = ?",
                            arrayOf(pickPos, gameId, teamId)
                        )
                        db.execSQL(
                            "UPDATE ${DB.TABLE_DRAFT_PICK} SET position = ? WHERE gameId = ? AND round = 2 AND originalTeamId = ?",
                            arrayOf(pickPos, gameId, teamId)
                        )
                    }

                    val news = NewsItem(
                        gameId = gameId,
                        matchday = currentDay,
                        type = NewsType.TRADE,
                        title = "Rookie Draft Ceremony Begins!",
                        body = "The draft order is set. 90 top rookie prospects are on the board across 2 rounds of selection."
                    )
                    insertNewsDirect(db, news.toEntity())
                }

                // Day 231: Free Agency Opens & Finish Renewals (Release all unrenewed 0-year players to Free Agency)
                currentDay == 231 -> {
                    val unrenewedPlayers = getPlayers(gameId).filter { it.yearsContract == 0 && it.teamId != null }
                    if (unrenewedPlayers.isNotEmpty()) {
                        unrenewedPlayers.forEach { p ->
                            db.execSQL("UPDATE ${DB.TABLE_PLAYER} SET teamId = NULL, salary = 0 WHERE id = ?", arrayOf(p.id))
                        }

                        // Clean up tactic slots referencing released players
                        val releasedIds = unrenewedPlayers.map { it.id }.toSet()
                        val tacticCursor = db.rawQuery("SELECT * FROM ${DB.TABLE_TACTIC} WHERE gameId = ?", arrayOf(gameId.toString()))
                        val tacticsToUpdate = mutableListOf<Tactic>()
                        while (tacticCursor.moveToNext()) {
                            val t = cursorToTactic(tacticCursor).toDomain()
                            var updated = t
                            if (t.starterPgId in releasedIds) updated = updated.copy(starterPgId = null)
                            if (t.starterSgId in releasedIds) updated = updated.copy(starterSgId = null)
                            if (t.starterSfId in releasedIds) updated = updated.copy(starterSfId = null)
                            if (t.starterPfId in releasedIds) updated = updated.copy(starterPfId = null)
                            if (t.starterCId in releasedIds) updated = updated.copy(starterCId = null)
                            if (t.reservePgId in releasedIds) updated = updated.copy(reservePgId = null)
                            if (t.reserveSgId in releasedIds) updated = updated.copy(reserveSgId = null)
                            if (t.reserveSfId in releasedIds) updated = updated.copy(reserveSfId = null)
                            if (t.reservePfId in releasedIds) updated = updated.copy(reservePfId = null)
                            if (t.reserveCId in releasedIds) updated = updated.copy(reserveCId = null)
                            if (t.starOnePlayerId in releasedIds) updated = updated.copy(starOnePlayerId = null)
                            if (t.starTwoPlayerId in releasedIds) updated = updated.copy(starTwoPlayerId = null)
                            if (t.starThreePlayerId in releasedIds) updated = updated.copy(starThreePlayerId = null)
                            if (updated != t) {
                                tacticsToUpdate.add(updated)
                            }
                        }
                        tacticCursor.close()

                        tacticsToUpdate.forEach { t ->
                            db.update(DB.TABLE_TACTIC, tacticToContentValues(t.toEntity()), "id = ?", arrayOf(t.id.toString()))
                        }

                        val faNews = NewsItem(
                            gameId = gameId,
                            matchday = currentDay,
                            type = NewsType.TRADE,
                            title = "Free Agency Market Officially Opens!",
                            body = "${unrenewedPlayers.size} unrenewed players across the league have entered the open Free Agency pool. Teams may now submit contract offers."
                        )
                        insertNewsDirect(db, faNews.toEntity())
                    }
                }

                // CPU Free Agency Validation & New Season Reset (Matchday 234)
                currentDay >= 234 -> {
                    val teams = getTeams(gameId)
                    val freeAgents = getFreeAgents(gameId)
                    val rosterMap = teams.associate { it.id to getTeamPlayersDirect(db, it.id) }
                    val signings = FreeAgencyEngine.evaluateCpuSignings(teams, freeAgents, rosterMap, game.userTeamId)
                    signings.forEach { (p, t) ->
                        db.execSQL("UPDATE ${DB.TABLE_PLAYER} SET teamId = ?, salary = ?, yearsContract = ? WHERE id = ?", arrayOf(t.id, p.salary, p.yearsContract, p.id))
                    }

                    val newSeason = game.currentSeason + 1
                    db.delete(DB.TABLE_MATCH, "gameId = ?", arrayOf(gameId.toString()))
                    db.delete(DB.TABLE_MATCH_RESULT, "gameId = ?", arrayOf(gameId.toString()))
                    db.delete(DB.TABLE_PLAYOFF_SERIES, "gameId = ?", arrayOf(gameId.toString()))
                    db.delete(DB.TABLE_NEWS, "gameId = ?", arrayOf(gameId.toString()))
                    db.execSQL("UPDATE ${DB.TABLE_STANDINGS} SET gamesWon = 0, gamesLost = 0, pointsScored = 0, pointsAllowed = 0 WHERE gameId = ?", arrayOf(gameId.toString()))

                    val newSchedule = SeasonCalendarEngine.generateSeasonSchedule(gameId, teams)
                    newSchedule.forEach { m -> insertMatchDirect(db, m.toEntity()) }

                    val kickoffNews = NewsItem(
                        gameId = gameId,
                        matchday = 1,
                        type = NewsType.INFO,
                        title = "Season $newSeason Tip-Off!",
                        body = "Welcome to Season $newSeason! 30 franchises compete across 82 regular season matchdays for the World Championship."
                    )
                    insertNewsDirect(db, kickoffNews.toEntity())

                    val updatedGame = game.copy(currentSeason = newSeason, currentMatchday = 1)
                    updateGame(updatedGame)
                    db.setTransactionSuccessful()
                    return@withContext updatedGame
                }
            }

            val nextDay = currentDay + 1
            val updatedGame = game.copy(currentMatchday = nextDay)
            updateGame(updatedGame)
            db.setTransactionSuccessful()
            updatedGame
        } finally {
            db.endTransaction()
        }
    }

    override suspend fun autoSimulateTo(gameId: Long, targetMatchday: Int, onProgress: (Int, String) -> Unit): GameSession = withContext(Dispatchers.IO) {
        var current = getGame(gameId) ?: throw IllegalStateException("Game not found")
        while (current.currentMatchday < targetMatchday && current.currentMatchday < 234) {
            val prevUserPlayers = getTeamPlayers(current.userTeamId).associateBy { it.id }
            onProgress(current.currentMatchday, "Simulating Day ${current.currentMatchday}...")
            current = advanceMatchday(gameId)
            
            // Check if any user player suffered a new injury when auto-lineup is disabled
            if (!current.autoLineupEnabled) {
                val newUserPlayers = getTeamPlayers(current.userTeamId)
                val newInjured = newUserPlayers.find { p ->
                    p.stateInjury > 0 && (prevUserPlayers[p.id]?.stateInjury ?: 0) == 0
                }
                if (newInjured != null) {
                    onProgress(current.currentMatchday, "PAUSED: ${newInjured.name} suffered an injury (${newInjured.stateInjury} days)")
                    break
                }
            }
        }
        current
    }

    // ==========================================
    // Internal Helper Functions
    // ==========================================

    private fun getTeamPlayersDirect(db: android.database.sqlite.SQLiteDatabase, teamId: Long): List<Player> {
        val list = mutableListOf<Player>()
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_PLAYER} WHERE teamId = ?", arrayOf(teamId.toString()))
        cursor.use { c ->
            while (c.moveToNext()) {
                list.add(cursorToPlayer(c).toDomain())
            }
        }
        return list
    }

    private fun insertPlayerDirect(db: android.database.sqlite.SQLiteDatabase, entity: PlayerEntity): Long {
        return db.insert(DB.TABLE_PLAYER, null, playerToContentValues(entity))
    }

    private fun insertTacticDirect(db: android.database.sqlite.SQLiteDatabase, entity: TacticEntity): Long {
        return db.insert(DB.TABLE_TACTIC, null, tacticToContentValues(entity))
    }

    private fun insertMatchDirect(db: android.database.sqlite.SQLiteDatabase, entity: MatchEntity): Long {
        return db.insert(DB.TABLE_MATCH, null, matchToContentValues(entity))
    }

    private fun updateMatchDirect(db: android.database.sqlite.SQLiteDatabase, entity: MatchEntity) {
        db.update(DB.TABLE_MATCH, matchToContentValues(entity), "id = ?", arrayOf(entity.id.toString()))
    }

    private fun insertMatchResultDirect(db: android.database.sqlite.SQLiteDatabase, entity: MatchResultEntity): Long {
        return db.insert(DB.TABLE_MATCH_RESULT, null, matchResultToContentValues(entity))
    }

    private fun insertNewsDirect(db: android.database.sqlite.SQLiteDatabase, entity: NewsEntity): Long {
        return db.insert(DB.TABLE_NEWS, null, newsToContentValues(entity))
    }

    private fun playoffSeriesToContentValues(s: PlayoffSeries): ContentValues = ContentValues().apply {
        put("gameId", s.gameId)
        if (s.conference != null) put("conference", s.conference.id) else putNull("conference")
        put("round", s.round)
        put("seed1", s.seed1)
        put("seed2", s.seed2)
        put("team1Id", s.team1Id)
        put("team2Id", s.team2Id)
        put("team1Wins", s.team1Wins)
        put("team2Wins", s.team2Wins)
        if (s.winnerTeamId != null) put("winnerTeamId", s.winnerTeamId) else putNull("winnerTeamId")
    }

    private fun insertPlayoffSeriesDirect(db: android.database.sqlite.SQLiteDatabase, series: PlayoffSeries): Long {
        val cv = ContentValues().apply {
            put("gameId", series.gameId)
            if (series.conference != null) put("conference", series.conference.id) else putNull("conference")
            put("round", series.round)
            put("seed1", series.seed1)
            put("seed2", series.seed2)
            put("team1Id", series.team1Id)
            put("team2Id", series.team2Id)
            put("team1Wins", series.team1Wins)
            put("team2Wins", series.team2Wins)
            if (series.winnerTeamId != null) put("winnerTeamId", series.winnerTeamId) else putNull("winnerTeamId")
        }
        return db.insert(DB.TABLE_PLAYOFF_SERIES, null, cv)
    }

    private fun updateStandingsAfterMatch(db: android.database.sqlite.SQLiteDatabase, gameId: Long, teamId: Long, won: Boolean, scored: Int, allowed: Int) {
        val wonIncrement = if (won) 1 else 0
        val lostIncrement = if (won) 0 else 1
        db.execSQL("""
            UPDATE ${DB.TABLE_STANDINGS} 
            SET gamesWon = gamesWon + $wonIncrement,
                gamesLost = gamesLost + $lostIncrement,
                pointsScored = pointsScored + $scored,
                pointsAllowed = pointsAllowed + $allowed
            WHERE gameId = $gameId AND teamId = $teamId
        """)
    }

    private fun playerToContentValues(p: PlayerEntity): ContentValues = ContentValues().apply {
        put("gameId", p.gameId)
        if (p.teamId != null) put("teamId", p.teamId) else putNull("teamId")
        put("name", p.name)
        put("age", p.age)
        put("potential", p.potential)
        put("yearsContract", p.yearsContract)
        put("salary", p.salary)
        put("loyalty", p.loyalty)
        put("yearsExperience", p.yearsExperience)
        put("positionFirst", p.positionFirst)
        put("positionSecond", p.positionSecond)
        put("skillPhysique", p.skillPhysique)
        put("skillBlock", p.skillBlock)
        put("skillSteal", p.skillSteal)
        put("skillRebound", p.skillRebound)
        put("skillPass", p.skillPass)
        put("skillShotInterior", p.skillShotInterior)
        put("skillShotExterior", p.skillShotExterior)
        put("skillShotFree", p.skillShotFree)
        put("stateEnergy", p.stateEnergy)
        put("stateForm", p.stateForm)
        put("stateInjury", p.stateInjury)
    }

    private fun tacticToContentValues(t: TacticEntity): ContentValues = ContentValues().apply {
        put("gameId", t.gameId)
        put("teamId", t.teamId)
        put("gameType", t.gameType)
        put("benchImportance", t.benchImportance)
        put("shotInteriorPercent", t.shotInteriorPercent)
        put("shotTriplePercent", t.shotTriplePercent)
        if (t.starterPgId != null) put("starterPgId", t.starterPgId) else putNull("starterPgId")
        if (t.starterSgId != null) put("starterSgId", t.starterSgId) else putNull("starterSgId")
        if (t.starterSfId != null) put("starterSfId", t.starterSfId) else putNull("starterSfId")
        if (t.starterPfId != null) put("starterPfId", t.starterPfId) else putNull("starterPfId")
        if (t.starterCId != null) put("starterCId", t.starterCId) else putNull("starterCId")
        if (t.reservePgId != null) put("reservePgId", t.reservePgId) else putNull("reservePgId")
        if (t.reserveSgId != null) put("reserveSgId", t.reserveSgId) else putNull("reserveSgId")
        if (t.reserveSfId != null) put("reserveSfId", t.reserveSfId) else putNull("reserveSfId")
        if (t.reservePfId != null) put("reservePfId", t.reservePfId) else putNull("reservePfId")
        if (t.reserveCId != null) put("reserveCId", t.reserveCId) else putNull("reserveCId")
        if (t.starOnePlayerId != null) put("starOnePlayerId", t.starOnePlayerId) else putNull("starOnePlayerId")
        if (t.starTwoPlayerId != null) put("starTwoPlayerId", t.starTwoPlayerId) else putNull("starTwoPlayerId")
        if (t.starThreePlayerId != null) put("starThreePlayerId", t.starThreePlayerId) else putNull("starThreePlayerId")
    }

    private fun matchToContentValues(m: MatchEntity): ContentValues = ContentValues().apply {
        put("gameId", m.gameId)
        put("matchday", m.matchday)
        put("teamLocalId", m.teamLocalId)
        put("teamVisitorId", m.teamVisitorId)
        put("name", m.name)
        if (m.localScore != null) put("localScore", m.localScore) else putNull("localScore")
        if (m.visitorScore != null) put("visitorScore", m.visitorScore) else putNull("visitorScore")
        if (m.localQuarter1 != null) put("localQuarter1", m.localQuarter1) else putNull("localQuarter1")
        if (m.localQuarter2 != null) put("localQuarter2", m.localQuarter2) else putNull("localQuarter2")
        if (m.localQuarter3 != null) put("localQuarter3", m.localQuarter3) else putNull("localQuarter3")
        if (m.localQuarter4 != null) put("localQuarter4", m.localQuarter4) else putNull("localQuarter4")
        if (m.localOt != null) put("localOt", m.localOt) else putNull("localOt")
        if (m.visitorQuarter1 != null) put("visitorQuarter1", m.visitorQuarter1) else putNull("visitorQuarter1")
        if (m.visitorQuarter2 != null) put("visitorQuarter2", m.visitorQuarter2) else putNull("visitorQuarter2")
        if (m.visitorQuarter3 != null) put("visitorQuarter3", m.visitorQuarter3) else putNull("visitorQuarter3")
        if (m.visitorQuarter4 != null) put("visitorQuarter4", m.visitorQuarter4) else putNull("visitorQuarter4")
        if (m.visitorOt != null) put("visitorOt", m.visitorOt) else putNull("visitorOt")
        put("isPlayed", if (m.isPlayed) 1 else 0)
    }

    private fun matchResultToContentValues(r: MatchResultEntity): ContentValues = ContentValues().apply {
        put("gameId", r.gameId)
        put("matchId", r.matchId)
        put("playerId", r.playerId)
        put("playerName", r.playerName)
        put("teamId", r.teamId)
        put("matchday", r.matchday)
        put("minutesPlayed", r.minutesPlayed)
        put("points", r.points)
        put("fouls", r.fouls)
        put("blocks", r.blocks)
        put("steals", r.steals)
        put("rebounds", r.rebounds)
        put("passesOk", r.passesOk)
        put("passesKo", r.passesKo)
        put("shotsFreeOk", r.shotsFreeOk)
        put("shotsFreeKo", r.shotsFreeKo)
        put("shotsInteriorOk", r.shotsInteriorOk)
        put("shotsInteriorKo", r.shotsInteriorKo)
        put("shotsExteriorDoubleOk", r.shotsExteriorDoubleOk)
        put("shotsExteriorDoubleKo", r.shotsExteriorDoubleKo)
        put("shotsExteriorTripleOk", r.shotsExteriorTripleOk)
        put("shotsExteriorTripleKo", r.shotsExteriorTripleKo)
    }

    private fun newsToContentValues(n: NewsEntity): ContentValues = ContentValues().apply {
        put("gameId", n.gameId)
        put("matchday", n.matchday)
        put("type", n.type)
        put("title", n.title)
        put("body", n.body)
        if (n.team1Id != null) put("team1Id", n.team1Id) else putNull("team1Id")
        if (n.team2Id != null) put("team2Id", n.team2Id) else putNull("team2Id")
        if (n.playerId != null) put("playerId", n.playerId) else putNull("playerId")
        put("createdAt", n.createdAt)
    }

    private fun cursorToGameSession(c: Cursor): GameSession = GameSession(
        id = c.getLong(c.getColumnIndexOrThrow("id")),
        name = c.getString(c.getColumnIndexOrThrow("name")),
        currentSeason = c.getInt(c.getColumnIndexOrThrow("currentSeason")),
        currentMatchday = c.getInt(c.getColumnIndexOrThrow("currentMatchday")),
        userTeamId = c.getLong(c.getColumnIndexOrThrow("userTeamId")),
        autoLineupEnabled = c.getInt(c.getColumnIndexOrThrow("autoLineupEnabled")) == 1,
        createdAt = c.getLong(c.getColumnIndexOrThrow("createdAt")),
        lastPlayedAt = c.getLong(c.getColumnIndexOrThrow("lastPlayedAt"))
    )

    private fun cursorToTeam(c: Cursor): TeamEntity = TeamEntity(
        id = c.getLong(c.getColumnIndexOrThrow("id")),
        gameId = c.getLong(c.getColumnIndexOrThrow("gameId")),
        name = c.getString(c.getColumnIndexOrThrow("name")),
        fullName = c.getString(c.getColumnIndexOrThrow("fullName")),
        conference = c.getInt(c.getColumnIndexOrThrow("conference")),
        division = c.getInt(c.getColumnIndexOrThrow("division")),
        salaryCap = c.getInt(c.getColumnIndexOrThrow("salaryCap")),
        colorHex = c.getString(c.getColumnIndexOrThrow("colorHex"))
    )

    private fun cursorToPlayer(c: Cursor): PlayerEntity = PlayerEntity(
        id = c.getLong(c.getColumnIndexOrThrow("id")),
        gameId = c.getLong(c.getColumnIndexOrThrow("gameId")),
        teamId = if (c.isNull(c.getColumnIndexOrThrow("teamId"))) null else c.getLong(c.getColumnIndexOrThrow("teamId")),
        name = c.getString(c.getColumnIndexOrThrow("name")),
        age = c.getInt(c.getColumnIndexOrThrow("age")),
        potential = c.getInt(c.getColumnIndexOrThrow("potential")),
        yearsContract = c.getInt(c.getColumnIndexOrThrow("yearsContract")),
        salary = c.getInt(c.getColumnIndexOrThrow("salary")),
        loyalty = c.getInt(c.getColumnIndexOrThrow("loyalty")),
        yearsExperience = c.getInt(c.getColumnIndexOrThrow("yearsExperience")),
        positionFirst = c.getInt(c.getColumnIndexOrThrow("positionFirst")),
        positionSecond = c.getInt(c.getColumnIndexOrThrow("positionSecond")),
        skillPhysique = c.getInt(c.getColumnIndexOrThrow("skillPhysique")),
        skillBlock = c.getInt(c.getColumnIndexOrThrow("skillBlock")),
        skillSteal = c.getInt(c.getColumnIndexOrThrow("skillSteal")),
        skillRebound = c.getInt(c.getColumnIndexOrThrow("skillRebound")),
        skillPass = c.getInt(c.getColumnIndexOrThrow("skillPass")),
        skillShotInterior = c.getInt(c.getColumnIndexOrThrow("skillShotInterior")),
        skillShotExterior = c.getInt(c.getColumnIndexOrThrow("skillShotExterior")),
        skillShotFree = c.getInt(c.getColumnIndexOrThrow("skillShotFree")),
        stateEnergy = c.getInt(c.getColumnIndexOrThrow("stateEnergy")),
        stateForm = c.getInt(c.getColumnIndexOrThrow("stateForm")),
        stateInjury = c.getInt(c.getColumnIndexOrThrow("stateInjury"))
    )

    private fun cursorToTactic(c: Cursor): TacticEntity = TacticEntity(
        id = c.getLong(c.getColumnIndexOrThrow("id")),
        gameId = c.getLong(c.getColumnIndexOrThrow("gameId")),
        teamId = c.getLong(c.getColumnIndexOrThrow("teamId")),
        gameType = c.getInt(c.getColumnIndexOrThrow("gameType")),
        benchImportance = c.getInt(c.getColumnIndexOrThrow("benchImportance")),
        shotInteriorPercent = c.getInt(c.getColumnIndexOrThrow("shotInteriorPercent")),
        shotTriplePercent = c.getInt(c.getColumnIndexOrThrow("shotTriplePercent")),
        starterPgId = if (c.isNull(c.getColumnIndexOrThrow("starterPgId"))) null else c.getLong(c.getColumnIndexOrThrow("starterPgId")),
        starterSgId = if (c.isNull(c.getColumnIndexOrThrow("starterSgId"))) null else c.getLong(c.getColumnIndexOrThrow("starterSgId")),
        starterSfId = if (c.isNull(c.getColumnIndexOrThrow("starterSfId"))) null else c.getLong(c.getColumnIndexOrThrow("starterSfId")),
        starterPfId = if (c.isNull(c.getColumnIndexOrThrow("starterPfId"))) null else c.getLong(c.getColumnIndexOrThrow("starterPfId")),
        starterCId = if (c.isNull(c.getColumnIndexOrThrow("starterCId"))) null else c.getLong(c.getColumnIndexOrThrow("starterCId")),
        reservePgId = if (c.isNull(c.getColumnIndexOrThrow("reservePgId"))) null else c.getLong(c.getColumnIndexOrThrow("reservePgId")),
        reserveSgId = if (c.isNull(c.getColumnIndexOrThrow("reserveSgId"))) null else c.getLong(c.getColumnIndexOrThrow("reserveSgId")),
        reserveSfId = if (c.isNull(c.getColumnIndexOrThrow("reserveSfId"))) null else c.getLong(c.getColumnIndexOrThrow("reserveSfId")),
        reservePfId = if (c.isNull(c.getColumnIndexOrThrow("reservePfId"))) null else c.getLong(c.getColumnIndexOrThrow("reservePfId")),
        reserveCId = if (c.isNull(c.getColumnIndexOrThrow("reserveCId"))) null else c.getLong(c.getColumnIndexOrThrow("reserveCId")),
        starOnePlayerId = if (c.isNull(c.getColumnIndexOrThrow("starOnePlayerId"))) null else c.getLong(c.getColumnIndexOrThrow("starOnePlayerId")),
        starTwoPlayerId = if (c.isNull(c.getColumnIndexOrThrow("starTwoPlayerId"))) null else c.getLong(c.getColumnIndexOrThrow("starTwoPlayerId")),
        starThreePlayerId = if (c.isNull(c.getColumnIndexOrThrow("starThreePlayerId"))) null else c.getLong(c.getColumnIndexOrThrow("starThreePlayerId"))
    )

    private fun cursorToMatch(c: Cursor): MatchEntity = MatchEntity(
        id = c.getLong(c.getColumnIndexOrThrow("id")),
        gameId = c.getLong(c.getColumnIndexOrThrow("gameId")),
        matchday = c.getInt(c.getColumnIndexOrThrow("matchday")),
        teamLocalId = c.getLong(c.getColumnIndexOrThrow("teamLocalId")),
        teamVisitorId = c.getLong(c.getColumnIndexOrThrow("teamVisitorId")),
        name = if (c.isNull(c.getColumnIndexOrThrow("name"))) null else c.getString(c.getColumnIndexOrThrow("name")),
        localScore = if (c.isNull(c.getColumnIndexOrThrow("localScore"))) null else c.getInt(c.getColumnIndexOrThrow("localScore")),
        visitorScore = if (c.isNull(c.getColumnIndexOrThrow("visitorScore"))) null else c.getInt(c.getColumnIndexOrThrow("visitorScore")),
        localQuarter1 = if (c.isNull(c.getColumnIndexOrThrow("localQuarter1"))) null else c.getInt(c.getColumnIndexOrThrow("localQuarter1")),
        localQuarter2 = if (c.isNull(c.getColumnIndexOrThrow("localQuarter2"))) null else c.getInt(c.getColumnIndexOrThrow("localQuarter2")),
        localQuarter3 = if (c.isNull(c.getColumnIndexOrThrow("localQuarter3"))) null else c.getInt(c.getColumnIndexOrThrow("localQuarter3")),
        localQuarter4 = if (c.isNull(c.getColumnIndexOrThrow("localQuarter4"))) null else c.getInt(c.getColumnIndexOrThrow("localQuarter4")),
        localOt = if (c.isNull(c.getColumnIndexOrThrow("localOt"))) null else c.getInt(c.getColumnIndexOrThrow("localOt")),
        visitorQuarter1 = if (c.isNull(c.getColumnIndexOrThrow("visitorQuarter1"))) null else c.getInt(c.getColumnIndexOrThrow("visitorQuarter1")),
        visitorQuarter2 = if (c.isNull(c.getColumnIndexOrThrow("visitorQuarter2"))) null else c.getInt(c.getColumnIndexOrThrow("visitorQuarter2")),
        visitorQuarter3 = if (c.isNull(c.getColumnIndexOrThrow("visitorQuarter3"))) null else c.getInt(c.getColumnIndexOrThrow("visitorQuarter3")),
        visitorQuarter4 = if (c.isNull(c.getColumnIndexOrThrow("visitorQuarter4"))) null else c.getInt(c.getColumnIndexOrThrow("visitorQuarter4")),
        visitorOt = if (c.isNull(c.getColumnIndexOrThrow("visitorOt"))) null else c.getInt(c.getColumnIndexOrThrow("visitorOt")),
        isPlayed = c.getInt(c.getColumnIndexOrThrow("isPlayed")) == 1
    )

    private fun cursorToMatchResult(c: Cursor): MatchResultEntity = MatchResultEntity(
        id = c.getLong(c.getColumnIndexOrThrow("id")),
        gameId = c.getLong(c.getColumnIndexOrThrow("gameId")),
        matchId = c.getLong(c.getColumnIndexOrThrow("matchId")),
        playerId = c.getLong(c.getColumnIndexOrThrow("playerId")),
        playerName = c.getString(c.getColumnIndexOrThrow("playerName")),
        teamId = c.getLong(c.getColumnIndexOrThrow("teamId")),
        matchday = c.getInt(c.getColumnIndexOrThrow("matchday")),
        minutesPlayed = c.getInt(c.getColumnIndexOrThrow("minutesPlayed")),
        points = c.getInt(c.getColumnIndexOrThrow("points")),
        fouls = c.getInt(c.getColumnIndexOrThrow("fouls")),
        blocks = c.getInt(c.getColumnIndexOrThrow("blocks")),
        steals = c.getInt(c.getColumnIndexOrThrow("steals")),
        rebounds = c.getInt(c.getColumnIndexOrThrow("rebounds")),
        passesOk = c.getInt(c.getColumnIndexOrThrow("passesOk")),
        passesKo = c.getInt(c.getColumnIndexOrThrow("passesKo")),
        shotsFreeOk = c.getInt(c.getColumnIndexOrThrow("shotsFreeOk")),
        shotsFreeKo = c.getInt(c.getColumnIndexOrThrow("shotsFreeKo")),
        shotsInteriorOk = c.getInt(c.getColumnIndexOrThrow("shotsInteriorOk")),
        shotsInteriorKo = c.getInt(c.getColumnIndexOrThrow("shotsInteriorKo")),
        shotsExteriorDoubleOk = c.getInt(c.getColumnIndexOrThrow("shotsExteriorDoubleOk")),
        shotsExteriorDoubleKo = c.getInt(c.getColumnIndexOrThrow("shotsExteriorDoubleKo")),
        shotsExteriorTripleOk = c.getInt(c.getColumnIndexOrThrow("shotsExteriorTripleOk")),
        shotsExteriorTripleKo = c.getInt(c.getColumnIndexOrThrow("shotsExteriorTripleKo"))
    )

    private fun cursorToStandings(c: Cursor): StandingsEntity = StandingsEntity(
        id = c.getLong(c.getColumnIndexOrThrow("id")),
        gameId = c.getLong(c.getColumnIndexOrThrow("gameId")),
        teamId = c.getLong(c.getColumnIndexOrThrow("teamId")),
        teamName = c.getString(c.getColumnIndexOrThrow("teamName")),
        conference = c.getInt(c.getColumnIndexOrThrow("conference")),
        division = c.getInt(c.getColumnIndexOrThrow("division")),
        gamesWon = c.getInt(c.getColumnIndexOrThrow("gamesWon")),
        gamesLost = c.getInt(c.getColumnIndexOrThrow("gamesLost")),
        pointsScored = c.getInt(c.getColumnIndexOrThrow("pointsScored")),
        pointsAllowed = c.getInt(c.getColumnIndexOrThrow("pointsAllowed"))
    )

    private fun cursorToNews(c: Cursor): NewsEntity = NewsEntity(
        id = c.getLong(c.getColumnIndexOrThrow("id")),
        gameId = c.getLong(c.getColumnIndexOrThrow("gameId")),
        matchday = c.getInt(c.getColumnIndexOrThrow("matchday")),
        type = c.getString(c.getColumnIndexOrThrow("type")),
        title = c.getString(c.getColumnIndexOrThrow("title")),
        body = c.getString(c.getColumnIndexOrThrow("body")),
        team1Id = if (c.isNull(c.getColumnIndexOrThrow("team1Id"))) null else c.getLong(c.getColumnIndexOrThrow("team1Id")),
        team2Id = if (c.isNull(c.getColumnIndexOrThrow("team2Id"))) null else c.getLong(c.getColumnIndexOrThrow("team2Id")),
        playerId = if (c.isNull(c.getColumnIndexOrThrow("playerId"))) null else c.getLong(c.getColumnIndexOrThrow("playerId")),
        createdAt = c.getLong(c.getColumnIndexOrThrow("createdAt"))
    )

    private fun cursorToDraftPick(c: Cursor): DraftPickEntity = DraftPickEntity(
        id = c.getLong(c.getColumnIndexOrThrow("id")),
        gameId = c.getLong(c.getColumnIndexOrThrow("gameId")),
        originalTeamId = c.getLong(c.getColumnIndexOrThrow("originalTeamId")),
        currentTeamId = c.getLong(c.getColumnIndexOrThrow("currentTeamId")),
        round = c.getInt(c.getColumnIndexOrThrow("round")),
        position = if (c.isNull(c.getColumnIndexOrThrow("position"))) null else c.getInt(c.getColumnIndexOrThrow("position")),
        marketValue = c.getDouble(c.getColumnIndexOrThrow("marketValue"))
    )

    override suspend fun getTeamDraftPicks(teamId: Long): List<DraftPick> = withContext(Dispatchers.IO) {
        val db = dbHelper.readableDatabase
        val cursor = db.rawQuery("SELECT * FROM ${DB.TABLE_DRAFT_PICK} WHERE currentTeamId = ?", arrayOf(teamId.toString()))
        val list = mutableListOf<DraftPick>()
        while (cursor.moveToNext()) {
            list.add(cursorToDraftPick(cursor).toDomain())
        }
        cursor.close()
        list
    }

    override suspend fun findShopTradeOffers(
        userTeamId: Long,
        offeredPlayerIds: List<Long>,
        offeredDraftPickIds: List<Long>
    ): List<CpuTradeBid> = withContext(Dispatchers.IO) {
        val userTeam = getTeam(userTeamId) ?: return@withContext emptyList()
        val allPlayers = getPlayers(userTeam.gameId)
        val allPicks = getDraftPicks(userTeam.gameId)
        val allTeams = getTeams(userTeam.gameId)

        val userRoster = allPlayers.filter { it.teamId == userTeamId }
        val offeredPlayers = userRoster.filter { offeredPlayerIds.contains(it.id) }
        val offeredPicks = allPicks.filter { offeredDraftPickIds.contains(it.id) }

        val cpuTeams = allTeams.filter { it.id != userTeamId }
        val cpuRosters = allPlayers.groupBy { it.teamId ?: 0L }
        val cpuPicks = allPicks.groupBy { it.currentTeamId }

        TradeEvaluationEngine.findTradeOffersForAssets(
            userTeam = userTeam,
            offeredPlayers = offeredPlayers,
            offeredPicks = offeredPicks,
            userRoster = userRoster,
            cpuTeams = cpuTeams,
            cpuRosters = cpuRosters,
            cpuPicks = cpuPicks
        )
    }

    override suspend fun askTargetTradeDemand(
        userTeamId: Long,
        targetTeamId: Long,
        requestedPlayerIds: List<Long>,
        requestedDraftPickIds: List<Long>
    ): CpuTargetInquiryResult = withContext(Dispatchers.IO) {
        val userTeam = getTeam(userTeamId) ?: return@withContext CpuTargetInquiryResult(false, Team(id = targetTeamId, name = "Target Team", conference = Conference.EAST, division = Division.E1_ATLANTIC, salaryCap = 70_000_000), emptyList(), emptyList(), "User team not found")
        val targetTeam = getTeam(targetTeamId) ?: return@withContext CpuTargetInquiryResult(false, Team(id = targetTeamId, name = "Target Team", conference = Conference.EAST, division = Division.E1_ATLANTIC, salaryCap = 70_000_000), emptyList(), emptyList(), "Target team not found")

        val allPlayers = getPlayers(userTeam.gameId)
        val allPicks = getDraftPicks(userTeam.gameId)

        val userRoster = allPlayers.filter { it.teamId == userTeamId }
        val userPicks = allPicks.filter { it.currentTeamId == userTeamId }

        val targetRoster = allPlayers.filter { it.teamId == targetTeamId }
        val targetPicks = allPicks.filter { it.currentTeamId == targetTeamId }

        val targetPlayers = targetRoster.filter { requestedPlayerIds.contains(it.id) }
        val targetSelectedPicks = targetPicks.filter { requestedDraftPickIds.contains(it.id) }

        TradeEvaluationEngine.generateCpuDemandForTargetAssets(
            userTeam = userTeam,
            userRoster = userRoster,
            userPicks = userPicks,
            targetTeam = targetTeam,
            targetPlayers = targetPlayers,
            targetPicks = targetSelectedPicks,
            targetRoster = targetRoster
        )
    }
}
