package re.manager.basket.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import android.content.Context
import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.GameEntity
import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.entity.TeamEntity
import re.manager.basket.data.importer.RosterImporter
import androidx.room.withTransaction
import re.manager.basket.domain.engine.SeasonManager
import re.manager.basket.domain.model.Constants
import re.manager.basket.util.MathUtils.toOriginalInt

class GameViewModel(private val database: AppDatabase) : ViewModel() {

    private val _currentGameId = MutableStateFlow<Int?>(null)
    @OptIn(ExperimentalCoroutinesApi::class)
    val gameState: StateFlow<GameEntity?> = _currentGameId
        .flatMapLatest { id ->
            if (id == null) flowOf(null) else database.gameDao().getGameByIdFlow(id)
        }
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), null)

    private val _previewTeamId = MutableStateFlow<Int?>(null)
    @OptIn(ExperimentalCoroutinesApi::class)
    val previewPlayers: StateFlow<List<re.manager.basket.data.entity.PlayerEntity>> = combine(_previewTeamId, _currentGameId) { teamId, gameId ->
        teamId to gameId
    }.flatMapLatest { (teamId, gameId) ->
        if (teamId == null || gameId == null) flowOf(emptyList())
        else database.playerDao().getPlayersByTeamFlow(teamId, gameId)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    private val _allGames = MutableStateFlow<List<GameEntity>>(emptyList())
    val allGames: StateFlow<List<GameEntity>> = _allGames

    private val _availableTeams = MutableStateFlow<List<re.manager.basket.data.entity.TeamEntity>>(emptyList())
    val availableTeams: StateFlow<List<re.manager.basket.data.entity.TeamEntity>> = _availableTeams

    @OptIn(ExperimentalCoroutinesApi::class)
    val recentMatches: StateFlow<List<MatchEntity>> = _currentGameId
        .flatMapLatest { id ->
            if (id == null) flowOf(emptyList()) else database.matchDao().getRecentMatchesFlow(id)
        }
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    private val _nextMatch = MutableStateFlow<Pair<MatchEntity, TeamEntity>?>(null)
    val nextMatch: StateFlow<Pair<MatchEntity, TeamEntity>?> = _nextMatch

    @OptIn(ExperimentalCoroutinesApi::class)
    val news: StateFlow<List<re.manager.basket.data.entity.NewsEntity>> = _currentGameId
        .flatMapLatest { id ->
            if (id == null) flowOf(emptyList()) else database.newsDao().getNewsByGameFlow(id)
        }
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    @OptIn(ExperimentalCoroutinesApi::class)
    val allMatches: StateFlow<List<MatchEntity>> = _currentGameId
        .flatMapLatest { id ->
            if (id == null) flowOf(emptyList()) else database.matchDao().getAllMatchesForGameFlow(id)
        }
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    @OptIn(ExperimentalCoroutinesApi::class)
    val userTactic: StateFlow<re.manager.basket.data.entity.TacticEntity?> = gameState
        .flatMapLatest { game ->
            if (game?.userTeamId == null) flowOf(null) else database.tacticDao().getTacticForTeamFlow(game.userTeamId, game.id)
        }
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), null)

    private val _activePlayerId = MutableStateFlow<Int?>(null)
    @OptIn(ExperimentalCoroutinesApi::class)
    val activePlayer: StateFlow<re.manager.basket.data.entity.PlayerEntity?> = combine(_activePlayerId, _currentGameId) { playerId, gameId ->
        playerId to gameId
    }.flatMapLatest { (playerId, gameId) ->
        if (playerId == null || gameId == null) flowOf(null) else database.playerDao().getPlayerByIdFlow(playerId, gameId)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), null)

    @OptIn(ExperimentalCoroutinesApi::class)
    val selectedPlayerStats: StateFlow<List<re.manager.basket.data.entity.MatchResultEntity>> = combine(_activePlayerId, _currentGameId) { playerId, gameId ->
        playerId to gameId
    }.flatMapLatest { (playerId, gameId) ->
        if (playerId == null || gameId == null) flowOf(emptyList()) else database.matchResultDao().getResultsByPlayerFlow(playerId, gameId)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    private val _selectedTeamId = MutableStateFlow<Int?>(null)
    @OptIn(ExperimentalCoroutinesApi::class)
    val selectedTeamRoster: StateFlow<List<re.manager.basket.data.entity.PlayerEntity>> = combine(_selectedTeamId, _currentGameId) { teamId, gameId ->
        teamId to gameId
    }.flatMapLatest { (teamId, gameId) ->
        if (teamId == null || gameId == null) flowOf(emptyList()) else database.playerDao().getPlayersByTeamFlow(teamId, gameId)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    @OptIn(ExperimentalCoroutinesApi::class)
    val selectedTeamLeague: StateFlow<re.manager.basket.data.entity.LeagueEntity?> = combine(_selectedTeamId, _currentGameId) { teamId, gameId ->
        teamId to gameId
    }.flatMapLatest { (teamId, gameId) ->
        if (teamId == null || gameId == null) flowOf(null) else database.leagueDao().getLeagueForTeamFlow(teamId, gameId)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), null)

    @OptIn(ExperimentalCoroutinesApi::class)
    val selectedTeamTactic: StateFlow<re.manager.basket.data.entity.TacticEntity?> = combine(_selectedTeamId, _currentGameId) { teamId, gameId ->
        teamId to gameId
    }.flatMapLatest { (teamId, gameId) ->
        if (teamId == null || gameId == null) flowOf(null) else database.tacticDao().getTacticForTeamFlow(teamId, gameId)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), null)

    @OptIn(ExperimentalCoroutinesApi::class)
    val selectedTeamDraftPicks: StateFlow<List<re.manager.basket.data.entity.DraftPickEntity>> = combine(_selectedTeamId, _currentGameId) { teamId, gameId ->
        teamId to gameId
    }.flatMapLatest { (teamId, gameId) ->
        if (teamId == null || gameId == null) flowOf(emptyList()) else database.draftPickDao().getPicksByTeam(teamId, gameId)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    private val _selectedMatchId = MutableStateFlow<Int?>(null)
    @OptIn(ExperimentalCoroutinesApi::class)
    val selectedMatchDetail: StateFlow<re.manager.basket.data.entity.MatchEntity?> = _selectedMatchId
        .flatMapLatest { id ->
            if (id == null) flowOf(null) else database.matchDao().getMatchByIdFlow(id)
        }
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), null)

    @OptIn(ExperimentalCoroutinesApi::class)
    val selectedMatchResults: StateFlow<List<re.manager.basket.data.entity.MatchResultEntity>> = _selectedMatchId
        .flatMapLatest { id ->
            if (id == null) flowOf(emptyList()) else database.matchResultDao().getResultsByMatchFlow(id)
        }
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    @OptIn(ExperimentalCoroutinesApi::class)
    val selectedTeamStats: StateFlow<List<re.manager.basket.data.entity.MatchResultEntity>> = combine(_selectedTeamId, _currentGameId) { teamId, gameId ->
        teamId to gameId
    }.flatMapLatest { (teamId, gameId) ->
        if (teamId == null || gameId == null) flowOf(emptyList()) else database.matchResultDao().getResultsByTeamFlow(teamId, gameId)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    private val _isSimulating = MutableStateFlow(false)
    val isSimulating: StateFlow<Boolean> = _isSimulating

    private val _showAutoLineupDialog = MutableStateFlow(false)
    val showAutoLineupDialog: StateFlow<Boolean> = _showAutoLineupDialog

    private val _simProgress = MutableStateFlow(0f)
    val simProgress: StateFlow<Float> = _simProgress

    private val _selectedCalendarDay = MutableStateFlow(1)
    val selectedCalendarDay: StateFlow<Int> = _selectedCalendarDay

    fun selectCalendarDay(day: Int) {
        _selectedCalendarDay.value = day
    }

    fun loadAllGames() {
        Log.d("GameViewModel", "Loading all save games")
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val games = database.gameDao().getAllGames()
                Log.d("GameViewModel", "Found ${games.size} saves")
                _allGames.value = games
            }
        }
    }

    fun loadMatchDetail(matchId: Int) {
        _selectedMatchId.value = matchId
    }

    fun closeMatchDetail() {
        _selectedMatchId.value = null
    }

    fun togglePlayerPosition(player: re.manager.basket.data.entity.PlayerEntity) {
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val updated = player.copy(primaryPositionActive = !player.primaryPositionActive)
                database.playerDao().update(updated)
                // Refresh data
                loadPlayerDetails(player.id)
                player.teamId?.let { loadTeamRoster(it) }
            }
        }
    }

    fun loadPlayerDetails(playerId: Int) {
        _activePlayerId.value = playerId
    }

    fun closePlayerDetails() {
        _activePlayerId.value = null
    }

    fun loadTeamRoster(teamId: Int) {
        _selectedTeamId.value = teamId
    }

    fun createNewGame(context: Context, name: String) {
        Log.d("GameViewModel", "Creating new game: $name")
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val newGame = GameEntity(
                    currentMatchday = 1,
                    currentSeason = 2025,
                    name = name
                )
                val gameId = database.gameDao().insertAndReturnId(newGame).toInt()
                val importer = RosterImporter(context, database)
                importer.importFromAssets(gameId)

                _currentGameId.value = gameId
                _availableTeams.value = database.teamDao().getTeamsByGame(gameId)
            }
        }
    }

    fun loadPreviewPlayers(teamId: Int) {
        _previewTeamId.value = teamId
    }

    fun selectTeam(teamId: Int) {
        val current = gameState.value ?: return
        Log.d("GameViewModel", "Selecting teamId: $teamId for gameId: ${current.id}")
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val updated = current.copy(userTeamId = teamId)
                database.gameDao().update(updated)
                updateNextMatch(updated)
                Log.d("GameViewModel", "userTeamId updated in DB using update()")
            }
        }
    }

    fun updateTactic(tactic: re.manager.basket.data.entity.TacticEntity) {
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                database.tacticDao().update(tactic)
            }
        }
    }

    fun loadGame(gameId: Int) {
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val game = database.gameDao().getGameById(gameId)
                _currentGameId.value = gameId
                _selectedCalendarDay.value = game?.currentMatchday ?: 1

                // Integrity check: if players for this game are 0, something is wrong
                val playerCount = database.playerDao().getPlayersByGame(gameId).size
                Log.d("GameViewModel", "Loaded gameId: $gameId, found $playerCount players")
                if (game != null && playerCount == 0) {
                    Log.w("GameViewModel", "CRITICAL: Game exists but players are missing! Data might have been wiped.")
                }

                _availableTeams.value = database.teamDao().getTeamsByGame(gameId)
                updateNextMatch(game)
                Log.d("GameViewModel", "Game loaded, teams: ${_availableTeams.value.size}, matches: ${allMatches.value.size}")
            }
        }
    }

    private suspend fun updateNextMatch(game: GameEntity?) {
        val userTeamId = game?.userTeamId ?: return
        Log.d("GameViewModel", "Updating next match for team: $userTeamId, day: ${game.currentMatchday}")
        val match = database.matchDao().getNextMatchForTeam(game.id, userTeamId, game.currentMatchday)
        if (match != null) {
            val opponentId = if (match.teamLocalId == userTeamId) match.teamVisitorId else match.teamLocalId
            val opponent = database.teamDao().getTeamsByGame(game.id).find { it.id == opponentId }
            if (opponent != null) {
                _nextMatch.value = match to opponent
            }
        } else {
            _nextMatch.value = null
        }
    }

    fun onNextDayClick(daysToSimulate: Int = 1) {
        val current = gameState.value ?: return
        viewModelScope.launch {
            val userTactic = database.tacticDao().getTacticForTeam(current.userTeamId ?: -1, current.id)
            val isIncomplete = userTactic?.let {
                it.titPG == 0 || it.titSG == 0 || it.titSF == 0 || it.titPF == 0 || it.titC == 0
            } ?: true

            if (isIncomplete) {
                _showAutoLineupDialog.value = true
            } else {
                nextDay(daysToSimulate)
            }
        }
    }

    fun dismissAutoLineupDialog() {
        _showAutoLineupDialog.value = false
    }

    fun autoArrangeAndSimulate(daysToSimulate: Int = 1) {
        val current = gameState.value ?: return
        viewModelScope.launch {
            val players = database.playerDao().getPlayersByTeam(current.userTeamId ?: -1, current.id)
            val tactic = database.tacticDao().getTacticForTeam(current.userTeamId ?: -1, current.id)
            if (tactic != null) {
                val optimized = re.manager.basket.domain.engine.LineupOptimizer().optimize(players, tactic)
                database.tacticDao().update(optimized)
            }
            _showAutoLineupDialog.value = false
            nextDay(daysToSimulate)
        }
    }

    fun nextDay(daysToSimulate: Int = 1) {
        val current = gameState.value ?: return
        Log.d("GameViewModel", "Triggering nextDay for day: ${current.currentMatchday}, count: $daysToSimulate")
        viewModelScope.launch {
            _isSimulating.value = true
            _simProgress.value = 0f
            try {
                withContext(Dispatchers.IO) {
                    var simulatedCount = 0
                    while (simulatedCount < daysToSimulate) {
                        val activeGame = database.gameDao().getGameById(current.id) ?: break
                        val currentDay = activeGame.currentMatchday
                        val userTeamId = activeGame.userTeamId ?: -1

                        // 0. Auto-optimize AI lineups
                        optimizeAiLineups(activeGame.id, userTeamId)

                        // 1. Get all matches for this matchday
                        val matches = database.matchDao().getMatchesByDay(activeGame.id, currentDay)
                        Log.d("GameViewModel", "Day $currentDay: Found ${matches.size} matches")

                        var injuryOccurred = false
                        matches.forEachIndexed { index, match ->
                            val localPlayers = database.playerDao().getPlayersByTeam(match.teamLocalId, activeGame.id)
                            val visitorPlayers = database.playerDao().getPlayersByTeam(match.teamVisitorId, activeGame.id)
                            val localTactic = database.tacticDao().getTacticForTeam(match.teamLocalId, activeGame.id)
                            val visitorTactic = database.tacticDao().getTacticForTeam(match.teamVisitorId, activeGame.id)

                            if (localTactic != null && visitorTactic != null) {
                                val simulator = re.manager.basket.domain.engine.MatchSimulator(
                                    match, localPlayers, visitorPlayers, localTactic, visitorTactic
                                )
                                val result = simulator.simulate()

                                database.matchDao().update(result.match)
                                // Only save results for players who actually played to keep DB lean and fix averaging
                                database.matchResultDao().insertAll(result.playerResults.filter { it.minutesPlayed > 0 })

                                // Update evolved player states, merging injury data to avoid overwriting evolution
                                val finalEvolved = result.evolvedPlayers.map { evolvedP ->
                                    result.injuries.findLast { it.id == evolvedP.id }?.let { injury ->
                                        evolvedP.copy(stateInjury = injury.stateInjury)
                                    } ?: evolvedP
                                }
                                database.playerDao().updateAll(finalEvolved)

                                // Check if user team had an injury
                                if (result.injuries.any { it.teamId == userTeamId && it.stateInjury > 0 }) {
                                    injuryOccurred = true
                                }
                                generateMatchNews(result)
                                updateLeagueStandings(result)
                            }
                            if (daysToSimulate == 1) {
                                _simProgress.value = (index + 1).toFloat() / matches.size
                            }
                        }

                        // 2. Evolve states (Daily evolution for ALL players, including free agents)
                        val allPlayers = database.playerDao().getPlayersByGame(activeGame.id)
                        val evolvedPlayersDaily = re.manager.basket.domain.engine.StateEvolver().evolveAllPlayersDaily(allPlayers)
                        database.playerDao().updateAll(evolvedPlayersDaily)

                        // 3. Move to next day
                        val seasonManager = SeasonManager(activeGame)
                        val nextDayVal = seasonManager.getNextMatchday()

                        if (currentDay == 166 && nextDayVal == 167) {
                            updateAllSalaryCaps(activeGame.id)
                            generatePlayoffSeeding(activeGame.id)
                            evaluateAwards(activeGame.id, activeGame.currentSeason)
                        }

                        if (nextDayVal in listOf(182, 197, 212)) {
                            generateNextPlayoffRound(activeGame.id, nextDayVal)
                        }

                        val updated = activeGame.copy(currentMatchday = nextDayVal)
                        database.gameDao().update(updated)
                        // Important: Refresh activeGame reference for next iteration of multi-day loop
                        _selectedCalendarDay.value = nextDayVal

                        simulatedCount++
                        if (daysToSimulate > 1) {
                            _simProgress.value = simulatedCount.toFloat() / daysToSimulate
                        }

                        if (injuryOccurred) {
                            Log.i("GameViewModel", "Stopping multi-day simulation due to user team injury")
                            break
                        }
                        if (nextDayVal == 0) {
                            startNewSeason(activeGame.id, activeGame.currentSeason)
                            break
                        }
                    }

                    // Refresh final state
                    val finalGame = database.gameDao().getGameById(current.id)
                    finalGame?.let { updateNextMatch(it) }
                }
            } catch (e: Exception) {
                Log.e("GameViewModel", "Error during simulation", e)
            } finally {
                _isSimulating.value = false
            }
        }
    }

    private suspend fun optimizeAiLineups(gameId: Int, userTeamId: Int) {
        val teams = database.teamDao().getTeamsByGame(gameId)
        val optimizer = re.manager.basket.domain.engine.LineupOptimizer()
        teams.filter { it.id != userTeamId }.forEach { team ->
            val players = database.playerDao().getPlayersByTeam(team.id, gameId)
            val tactic = database.tacticDao().getTacticForTeam(team.id, gameId)
            if (tactic != null) {
                val optimized = optimizer.optimize(players, tactic)
                database.tacticDao().update(optimized)
            }
        }
    }

    private suspend fun updateLeagueStandings(result: re.manager.basket.domain.engine.MatchFullResult) {
        val match = result.match
        val localWin = match.getTotalLocal() > match.getTotalVisitor()

        if (match.matchday < 167) {
            updateTeamStanding(match.teamLocalId, match.gameId, localWin, result.match.getTotalLocal(), result.match.getTotalVisitor())
            updateTeamStanding(match.teamVisitorId, match.gameId, !localWin, result.match.getTotalVisitor(), result.match.getTotalLocal())
        } else {
            // Playoff Logic (based on finishMatch in Simulate.java)
            val winnerId = if (localWin) match.teamLocalId else match.teamVisitorId
            val loserId = if (localWin) match.teamVisitorId else match.teamLocalId

            val playoffWinner = database.playoffDao().getPlayoffForTeam(match.gameId, winnerId)
            if (playoffWinner != null) {
                val updatedWinnerPlayoff = playoffWinner.copy(seriesGamesWon = playoffWinner.seriesGamesWon + 1)
                database.playoffDao().update(updatedWinnerPlayoff)

                // Check for milestone news
                handlePlayoffMilestones(match.gameId, match.matchday, updatedWinnerPlayoff, loserId)
            }

            // Salary Cap Bonus for Playoff Win (+2M)
            val winnerTeam = database.teamDao().getTeamById(winnerId, match.gameId)
            winnerTeam?.let { team ->
                val updatedWinnerTeam = team.addSalaryCap(Constants.PLAYOFF_WIN_SALARY_CAP_BONUS)
                database.teamDao().update(updatedWinnerTeam)
            }

            // Manage redundancy: Delete matches if series is over
            checkSeriesOver(match.gameId, match.matchday, winnerId)
        }
    }

    private suspend fun handlePlayoffMilestones(gameId: Int, day: Int, playoff: re.manager.basket.data.entity.PlayoffEntity, loserId: Int) {
        val team = database.teamDao().getTeamById(playoff.teamId, gameId) ?: return
        val opponent = database.teamDao().getTeamById(loserId, gameId) ?: return

        when (playoff.seriesGamesWon) {
            4, 8, 12 -> {
                database.newsDao().insert(re.manager.basket.data.entity.NewsEntity(
                    gameId = gameId,
                    matchday = day,
                    title = "Series Won!",
                    body = "${team.name} has advanced after defeating ${opponent.name}.",
                    type = "PLAYOFFS"
                ))
            }
            16 -> {
                database.newsDao().insert(re.manager.basket.data.entity.NewsEntity(
                    gameId = gameId,
                    matchday = day,
                    title = "CHAMPIONS!",
                    body = "${team.name} are the league champions!",
                    type = "TROPHY"
                ))
                // Record Champion Award
                val current = gameState.value
                current?.let {
                    database.awardDao().insertAward(re.manager.basket.data.entity.AwardEntity(
                        gameId = gameId, season = it.currentSeason, type = re.manager.basket.data.entity.AwardType.CHAMPION,
                        teamId = team.id, value = team.fullName
                    ))
                }
            }
        }
    }

    private suspend fun checkSeriesOver(gameId: Int, currentDay: Int, winnerId: Int) {
        val playoff = database.playoffDao().getPlayoffForTeam(gameId, winnerId) ?: return
        val targetWon = when {
            currentDay < 182 -> 4
            currentDay < 197 -> 8
            currentDay < 212 -> 12
            else -> 16
        }

        if (playoff.seriesGamesWon == targetWon) {
            // Delete future matches for this series
            val matches = database.matchDao().getAllMatchesForGame(gameId)
                .filter { it.matchday > currentDay && (it.teamLocalId == winnerId || it.teamVisitorId == winnerId) }

            // We need to be careful not to delete matches for NEXT ROUND.
            // BM2015 only deletes matches within the same round.
            val roundEndDay = when {
                currentDay < 182 -> 181
                currentDay < 197 -> 196
                currentDay < 212 -> 211
                else -> 234
            }
            val toDelete = matches.filter { it.matchday <= roundEndDay }
            database.matchDao().deleteMatches(toDelete)
        }
    }

    private suspend fun updateTeamStanding(teamId: Int, gameId: Int, won: Boolean, scored: Int, allowed: Int) {
        val standing = database.leagueDao().getLeagueForTeam(teamId, gameId) ?: return
        val updated = standing.copy(
            gamesWon = standing.gamesWon + (if (won) 1 else 0),
            gamesLost = standing.gamesLost + (if (won) 0 else 1),
            pointsScored = standing.pointsScored + scored,
            pointsAllowed = standing.pointsAllowed + allowed
        )
        database.leagueDao().update(updated)

        // Check for Salary Cap update at the end of regular season (day 166)
        // Original logic: manage() in ManageRenewals.java
        // We'll trigger it when nextDay moves from 166 to 167
    }

    private suspend fun generateMatchNews(result: re.manager.basket.domain.engine.MatchFullResult) {
        val match = result.match
        val localScore = match.getTotalLocal()
        val visitorScore = match.getTotalVisitor()
        val currentUserId = gameState.value?.userTeamId

        val teams = database.teamDao().getTeamsByGame(match.gameId)
        val localTeam = teams.find { it.id == match.teamLocalId }
        val visitorTeam = teams.find { it.id == match.teamVisitorId }

        // 1. Awesome Performance News (All teams)
        result.playerResults.forEach { pResult ->
            val pts = pResult.points
            val reb = pResult.rebounds.toOriginalInt()
            val ast = pResult.assists.toOriginalInt()

            val isTripleDouble = pts >= 10 && reb >= 10 && ast >= 10
            val isHighPer = pts >= 40 // Simplified original awesome logic

            if (isTripleDouble || isHighPer) {
                database.newsDao().insert(
                    re.manager.basket.data.entity.NewsEntity(
                        gameId = match.gameId,
                        matchday = match.matchday,
                        title = "Awesome Performance: ${pResult.name}",
                        body = "${pResult.name} recorded $pts pts, $reb reb, $ast ast in the game ${localTeam?.name} vs ${visitorTeam?.name}.",
                        type = "PLAYER"
                    )
                )
            }
        }

        // 2. User Team Match News
        if (match.teamLocalId == currentUserId || match.teamVisitorId == currentUserId) {
            val winnerId = if (localScore > visitorScore) match.teamLocalId else match.teamVisitorId
            val winnerTeam = if (localScore > visitorScore) localTeam else visitorTeam
            val isUserWin = winnerId == currentUserId

            val maxPts = result.playerResults.maxByOrNull { it.points }
            val maxReb = result.playerResults.maxByOrNull { it.rebounds }
            val maxAst = result.playerResults.maxByOrNull { it.assists }

            val title = if (isUserWin) "Victory! ${winnerTeam?.name} wins" else "Defeat: ${localTeam?.name} vs ${visitorTeam?.name}"
            val maxStl = result.playerResults.maxByOrNull { it.steals }
            val maxBlk = result.playerResults.maxByOrNull { it.blocks }

            val body = "Final Score: $localScore - $visitorScore.\n" +
                       "Top Scorer: ${maxPts?.name} (${maxPts?.points} pts)\n" +
                       "Top Rebounder: ${maxReb?.name} (${maxReb?.rebounds?.toOriginalInt()} reb)\n" +
                       "Top Passer: ${maxAst?.name} (${maxAst?.assists?.toOriginalInt()} ast)\n" +
                       "Top Steals: ${maxStl?.name} (${maxStl?.steals?.toOriginalInt() ?: 0})\n" +
                       "Top Blocks: ${maxBlk?.name} (${maxBlk?.blocks?.toOriginalInt() ?: 0})"

            database.newsDao().insert(
                re.manager.basket.data.entity.NewsEntity(
                    gameId = match.gameId,
                    matchday = match.matchday,
                    title = title,
                    body = body,
                    type = "MATCH"
                )
            )
        }

        // Generate Injury News for User Team
        val userTeamId = gameState.value?.userTeamId
        result.injuries.filter { it.teamId == userTeamId && it.stateInjury > 0 }.forEach { injured ->
            database.newsDao().insert(
                re.manager.basket.data.entity.NewsEntity(
                    gameId = match.gameId,
                    matchday = match.matchday,
                    title = "Injury Report: ${injured.name}",
                    body = "${injured.name} has suffered an injury and will be out for ${injured.stateInjury - 1} days.",
                    type = "INFO"
                )
            )
        }
    }

    private suspend fun generatePlayoffSeeding(gameId: Int) {
        val standings = database.leagueDao().getStandings(gameId)
        val teams = database.teamDao().getTeamsByGame(gameId)

        val eastStandings = standings.filter { sid -> teams.find { it.id == sid.teamId }?.conference == re.manager.basket.domain.model.Conference.EAST }.take(8)
        val westStandings = standings.filter { sid -> teams.find { it.id == sid.teamId }?.conference == re.manager.basket.domain.model.Conference.WEST }.take(8)

        val playoffEntities = mutableListOf<re.manager.basket.data.entity.PlayoffEntity>()

        eastStandings.forEachIndexed { index, sid ->
            playoffEntities.add(re.manager.basket.data.entity.PlayoffEntity(
                gameId = gameId, teamId = sid.teamId, conference = 1, position = index + 1,
                gamesWon = sid.gamesWon, pointsDiff = sid.pointsScored - sid.pointsAllowed, pointsScored = sid.pointsScored
            ))
        }
        westStandings.forEachIndexed { index, sid ->
            playoffEntities.add(re.manager.basket.data.entity.PlayoffEntity(
                gameId = gameId, teamId = sid.teamId, conference = 2, position = index + 1,
                gamesWon = sid.gamesWon, pointsDiff = sid.pointsScored - sid.pointsAllowed, pointsScored = sid.pointsScored
            ))
        }
        database.playoffDao().insertAll(playoffEntities)

        // Generate First Round Matches (Day 168-181)
        val matches = mutableListOf<MatchEntity>()
        val pairs = listOf(0 to 7, 1 to 6, 2 to 5, 3 to 4)

        // Days 168, 170, 178, 180: Home 1,2,3,4
        // Days 169, 171, 179, 181: Home 3,4,1,2 (Original code is slightly different, let's match logic)
        // Original logic from getPlayoffsSeriesQuarters:
        // 168: E1-E8, E2-E7, W1-W8, W2-W7 (T)
        // 169: E3-E6, E4-E5, W3-W6, W4-W5 (T)
        // 170: same as 168 (T)
        // 171: same as 169 (T)
        // 172: E8-E1, E7-E2, W8-W1, W7-W2 (F)
        // ...

        // Correcting to exact days from Simulate.java
        val schedule = listOf(
            Triple(168, listOf(0, 1), true), Triple(169, listOf(2, 3), true),
            Triple(170, listOf(0, 1), true), Triple(171, listOf(2, 3), true),
            Triple(172, listOf(0, 1), false), Triple(173, listOf(2, 3), false),
            Triple(174, listOf(0, 1), false), Triple(175, listOf(2, 3), false),
            Triple(176, listOf(0, 1), false), Triple(177, listOf(2, 3), false),
            Triple(178, listOf(0, 1), true), Triple(179, listOf(2, 3), true),
            Triple(180, listOf(0, 1), true), Triple(181, listOf(2, 3), true)
        )

        schedule.forEach { (day, indices, t1Home) ->
            indices.forEach { idx ->
                val p1 = idx
                val p2 = 7 - idx
                listOf(1, 2).forEach { conf ->
                    val t1 = (if (conf == 1) eastStandings else westStandings)[p1].teamId
                    val t2 = (if (conf == 1) eastStandings else westStandings)[p2].teamId
                    matches.add(if (t1Home) MatchEntity(gameId = gameId, matchday = day, teamLocalId = t1, teamVisitorId = t2)
                                else MatchEntity(gameId = gameId, matchday = day, teamLocalId = t2, teamVisitorId = t1))
                }
            }
        }
        database.matchDao().insertAll(matches)
    }

    private suspend fun generateNextPlayoffRound(gameId: Int, day: Int) {
        val playoffs = database.playoffDao().getPlayoffsForGame(gameId)
        val matches = mutableListOf<MatchEntity>()

        if (day == 182) { // Semis
            fun getWinner(conf: Int, s1: Int, s2: Int): Int? {
                val p1 = playoffs.find { it.conference == conf && it.position == s1 }
                val p2 = playoffs.find { it.conference == conf && it.position == s2 }
                return if (p1 != null && p1.seriesGamesWon >= 4) p1.teamId else p2?.teamId
            }

            listOf(1, 2).forEach { conf ->
                val w18 = getWinner(conf, 1, 8) ?: return@forEach
                val w45 = getWinner(conf, 4, 5) ?: return@forEach
                val w27 = getWinner(conf, 2, 7) ?: return@forEach
                val w36 = getWinner(conf, 3, 6) ?: return@forEach

                val schedule = listOf(
                    Triple(183, listOf(w18 to w45, w27 to w36), true),
                    Triple(185, listOf(w18 to w45, w27 to w36), true),
                    Triple(187, listOf(w45 to w18, w36 to w27), true),
                    Triple(189, listOf(w45 to w18, w36 to w27), true),
                    Triple(191, listOf(w45 to w18, w36 to w27), true),
                    Triple(193, listOf(w18 to w45, w27 to w36), true),
                    Triple(195, listOf(w18 to w45, w27 to w36), true)
                )
                // Offset West by 1 day
                val offset = if (conf == 2) 1 else 0
                schedule.forEach { (d, pairs, _) ->
                    pairs.forEach { (loc, vis) ->
                        matches.add(MatchEntity(gameId = gameId, matchday = d + offset, teamLocalId = loc, teamVisitorId = vis))
                    }
                }
            }
        } else if (day == 197) { // Conf Finals
            fun getWinner(conf: Int, s1: Int, s2: Int, s3: Int, s4: Int): Int? {
                val p1 = playoffs.find { it.conference == conf && it.position == s1 }
                val p2 = playoffs.find { it.conference == conf && it.position == s2 }
                val p3 = playoffs.find { it.conference == conf && it.position == s3 }
                val p4 = playoffs.find { it.conference == conf && it.position == s4 }
                return listOfNotNull(p1, p2, p3, p4).find { it.seriesGamesWon >= 8 }?.teamId
            }

            listOf(1, 2).forEach { conf ->
                val w1845 = getWinner(conf, 1, 8, 4, 5) ?: return@forEach
                val w2736 = getWinner(conf, 2, 7, 3, 6) ?: return@forEach

                val schedule = listOf(
                    198 to (w1845 to w2736), 200 to (w1845 to w2736),
                    202 to (w2736 to w1845), 204 to (w2736 to w1845), 206 to (w2736 to w1845),
                    208 to (w1845 to w2736), 210 to (w1845 to w2736)
                )
                val offset = if (conf == 2) 1 else 0
                schedule.forEach { (d, p) ->
                    matches.add(MatchEntity(gameId = gameId, matchday = d + offset, teamLocalId = p.first, teamVisitorId = p.second))
                }
            }
        } else if (day == 212) { // Finals
            val eastWinner = playoffs.filter { it.conference == 1 }.find { it.seriesGamesWon >= 12 }?.teamId ?: return
            val westWinner = playoffs.filter { it.conference == 2 }.find { it.seriesGamesWon >= 12 }?.teamId ?: return

            val schedule = listOf(
                213 to (eastWinner to westWinner), 215 to (eastWinner to westWinner),
                217 to (westWinner to eastWinner), 219 to (westWinner to eastWinner), 221 to (westWinner to eastWinner),
                223 to (eastWinner to westWinner), 225 to (eastWinner to westWinner)
            )
            schedule.forEach { (d, p) ->
                matches.add(MatchEntity(gameId = gameId, matchday = d, teamLocalId = p.first, teamVisitorId = p.second))
            }
        }
        database.matchDao().insertAll(matches)
    }

    private suspend fun evaluateAwards(gameId: Int, season: Int) {
        val allPlayers = database.playerDao().getPlayersByGame(gameId)
        val standings = database.leagueDao().getStandings(gameId)
        val teamMap = database.teamDao().getTeamsByGame(gameId).associateBy { it.id }

        val playerResults = database.matchResultDao().getResultsBySeason(gameId, season)
            .groupBy { it.playerId }

        val playerAverages = playerResults.mapValues { (_, results) ->
            val played = results.size
            if (played == 0) null
            else {
                val per = results.sumOf { it.getPer() } / played
                per
            }
        }.filterValues { it != null }

        // MVP: PER + Team Record Bonus
        val mvp = playerAverages.map { (pid, avgPer) ->
            val player = allPlayers.find { it.id == pid }
            val teamStanding = standings.find { it.teamId == player?.teamId }
            val winRate = if (teamStanding != null) teamStanding.gamesWon.toDouble() / (teamStanding.gamesWon + teamStanding.gamesLost) else 0.0
            val score = avgPer!! * (1.0 + winRate * 0.5)
            pid to score
        }.maxByOrNull { it.second }

        mvp?.let { (pid, score) ->
            val player = allPlayers.find { it.id == pid }
            database.awardDao().insertAward(re.manager.basket.data.entity.AwardEntity(
                gameId = gameId, season = season, type = re.manager.basket.data.entity.AwardType.MVP,
                playerId = pid, value = "${player?.name} (PER: ${String.format("%.2f", score)})"
            ))
        }

        // ROY: Only rookies, only PER
        val rookies = allPlayers.filter { it.yearsExperience == 0 }.map { it.id }.toSet()
        val roy = playerAverages.filter { it.key in rookies }.maxByOrNull { it.value!! }

        roy?.let { (pid, per) ->
            val player = allPlayers.find { it.id == pid }
            database.awardDao().insertAward(re.manager.basket.data.entity.AwardEntity(
                gameId = gameId, season = season, type = re.manager.basket.data.entity.AwardType.ROY,
                playerId = pid, value = "${player?.name} (PER: ${String.format("%.2f", per)})"
            ))
        }
    }

    private suspend fun updateAllSalaryCaps(gameId: Int) {
        val teams = database.teamDao().getTeamsByGame(gameId)
        val standings = database.leagueDao().getStandings(gameId)
        val userTeamId = gameState.value?.userTeamId

        // Group by conference
        val eastTeams = teams.filter { it.conference == re.manager.basket.domain.model.Conference.EAST }
        val westTeams = teams.filter { it.conference == re.manager.basket.domain.model.Conference.WEST }

        val updatedTeams = mutableListOf<TeamEntity>()

        suspend fun processConference(confTeams: List<TeamEntity>) {
            val confIds = confTeams.map { it.id }.toSet()
            val confStandings = standings.filter { it.teamId in confIds }

            confStandings.forEachIndexed { index, standing ->
                val team = confTeams.find { it.id == standing.teamId } ?: return@forEachIndexed
                var bonus = 0

                val isClassified = index < 8
                if (isClassified) {
                    bonus += Constants.SALARY_CAP_STEP * 2

                    // Division Winner Bonus
                    // Check standing in division
                    val divisionTeams = confStandings.filter { tid ->
                        confTeams.find { it.id == tid.teamId }?.division == team.division
                    }.sortedByDescending { it.gamesWon }
                    if (divisionTeams.firstOrNull()?.teamId == team.id) {
                        bonus += Constants.SALARY_CAP_STEP
                    }

                    // Note: Original code ManageRenewals.java also checks for
                    // Semis, conference final, world final, and champion.
                    // However, at day 166 (end of regular season), these are not yet determined for the current season.
                    // In the original game, this is called at the end of regular season to set up next season's cap.
                } else {
                    bonus -= Constants.SALARY_CAP_STEP * 3

                    // Position in division check (5th)
                    val divisionTeams = confStandings.filter { tid ->
                        confTeams.find { it.id == tid.teamId }?.division == team.division
                    }.sortedByDescending { it.gamesWon }
                    if (divisionTeams.lastOrNull()?.teamId == team.id) {
                        bonus -= Constants.SALARY_CAP_STEP
                    }

                    if (index == 14) {
                        bonus -= Constants.SALARY_CAP_STEP
                    }
                }

                val updatedTeam = team.addSalaryCap(bonus)
                updatedTeams.add(updatedTeam)

                if (updatedTeam.id == userTeamId) {
                    database.newsDao().insert(
                        re.manager.basket.data.entity.NewsEntity(
                            gameId = gameId,
                            matchday = 167,
                            title = "Salary Cap Updated",
                            body = "Your new Salary Cap is ${re.manager.basket.util.CurrencyUtils.formatCurrency(updatedTeam.salaryCap)}",
                            type = "INFO"
                        )
                    )
                }
            }
        }

        processConference(eastTeams)
        processConference(westTeams)

        if (updatedTeams.isNotEmpty()) {
            database.teamDao().updateAll(updatedTeams)
        }
    }

    private suspend fun startNewSeason(gameId: Int, oldSeason: Int) {
        val newSeason = oldSeason + 1
        val allPlayers = database.playerDao().getPlayersByGame(gameId)
        val evolver = re.manager.basket.domain.engine.StateEvolver()

        database.withTransaction {
            // 1. Process Retirements and Evolution
            val updatedPlayers = mutableListOf<re.manager.basket.data.entity.PlayerEntity>()
            val retiredPlayers = mutableListOf<re.manager.basket.data.entity.PlayerEntity>()

            allPlayers.forEach { player ->
                if (evolver.shouldPlayerRetire(player)) {
                    retiredPlayers.add(player)
                } else {
                    updatedPlayers.add(evolver.evolvePlayerEndOfSeason(player))
                }
            }
            database.playerDao().updateAll(updatedPlayers)
            database.playerDao().deleteAllPlayers(retiredPlayers)

            // 2. Generate New Rookies for Draft
            val newRookies = mutableListOf<re.manager.basket.data.entity.PlayerEntity>()
            repeat(90) {
                newRookies.add(generateRandomPlayer(gameId))
            }
            database.playerDao().insertAll(newRookies)

            // 3. Reset League Standings
            val standings = database.leagueDao().getStandings(gameId)
            val resetStandings = standings.map { it.copy(gamesWon = 0, gamesLost = 0, pointsScored = 0, pointsAllowed = 0) }
            database.leagueDao().updateAll(resetStandings)

            // 4. Generate New Calendar
            val teams = database.teamDao().getTeamsByGame(gameId)
            val newMatches = re.manager.basket.domain.generator.SeasonCalendar.generateMatches(gameId, teams).map { it.copy(season = newSeason) }
            database.matchDao().insertAll(newMatches)

            // 5. Generate New Draft Picks
            val draftPicks = mutableListOf<re.manager.basket.data.entity.DraftPickEntity>()
            teams.forEach { team ->
                draftPicks.add(re.manager.basket.data.entity.DraftPickEntity(gameId = gameId, originalTeamId = team.id, currentTeamId = team.id, round = 1, year = newSeason + 1))
                draftPicks.add(re.manager.basket.data.entity.DraftPickEntity(gameId = gameId, originalTeamId = team.id, currentTeamId = team.id, round = 2, year = newSeason + 1))
            }
            database.draftPickDao().insertPicks(draftPicks)

            // 6. Clear Old Playoff Data
            database.playoffDao().deletePlayoffsByGame(gameId)

            // Update Game State
            database.gameDao().getGameById(gameId)?.let {
                database.gameDao().update(it.copy(currentSeason = newSeason, currentMatchday = 1))
            }
        }
    }

    private fun generateRandomPlayer(gameId: Int): re.manager.basket.data.entity.PlayerEntity {
        val pos = re.manager.basket.domain.model.Position.entries.filter { it != re.manager.basket.domain.model.Position.NONE }.random()
        return re.manager.basket.data.entity.PlayerEntity(
            name = "Rookie ${kotlin.random.Random.nextInt(1000, 9999)}",
            age = kotlin.random.Random.nextInt(18, 23),
            teamId = null,
            positionFirst = pos,
            positionSecond = re.manager.basket.domain.model.Position.NONE,
            potential = kotlin.random.Random.nextInt(1, 11),
            salary = 0,
            yearsContract = 0,
            yearsExperience = 0,
            skillPhysique = kotlin.random.Random.nextInt(40, 70),
            skillBlock = kotlin.random.Random.nextInt(40, 70),
            skillSteal = kotlin.random.Random.nextInt(40, 70),
            skillRebound = kotlin.random.Random.nextInt(40, 70),
            skillPass = kotlin.random.Random.nextInt(40, 70),
            skillShotInterior = kotlin.random.Random.nextInt(40, 70),
            skillShotExterior = kotlin.random.Random.nextInt(40, 70),
            skillShotFree = kotlin.random.Random.nextInt(40, 70),
            stateEnergy = 99,
            stateForm = kotlin.random.Random.nextInt(30, 71),
            stateInjury = 0,
            gameId = gameId
        )
    }

    private fun MatchEntity.getTotalLocal() = localQ1 + localQ2 + localQ3 + localQ4
    private fun MatchEntity.getTotalVisitor() = visitorQ1 + visitorQ2 + visitorQ3 + visitorQ4
}
