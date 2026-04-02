package re.manager.basket.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import android.content.Context
import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.GameEntity
import re.manager.basket.data.entity.MatchEntity
import re.manager.basket.data.entity.TeamEntity
import re.manager.basket.data.importer.RosterImporter
import re.manager.basket.domain.engine.SeasonManager
import re.manager.basket.domain.model.Constants

class GameViewModel(private val database: AppDatabase) : ViewModel() {

    private val _gameState = MutableStateFlow<GameEntity?>(null)
    val gameState: StateFlow<GameEntity?> = _gameState

    private val _previewPlayers = MutableStateFlow<List<re.manager.basket.data.entity.PlayerEntity>>(emptyList())
    val previewPlayers: StateFlow<List<re.manager.basket.data.entity.PlayerEntity>> = _previewPlayers

    private val _allGames = MutableStateFlow<List<GameEntity>>(emptyList())
    val allGames: StateFlow<List<GameEntity>> = _allGames

    private val _availableTeams = MutableStateFlow<List<re.manager.basket.data.entity.TeamEntity>>(emptyList())
    val availableTeams: StateFlow<List<re.manager.basket.data.entity.TeamEntity>> = _availableTeams

    private val _recentMatches = MutableStateFlow<List<MatchEntity>>(emptyList())
    val recentMatches: StateFlow<List<MatchEntity>> = _recentMatches

    private val _nextMatch = MutableStateFlow<Pair<MatchEntity, TeamEntity>?>(null)
    val nextMatch: StateFlow<Pair<MatchEntity, TeamEntity>?> = _nextMatch

    private val _news = MutableStateFlow<List<re.manager.basket.data.entity.NewsEntity>>(emptyList())
    val news: StateFlow<List<re.manager.basket.data.entity.NewsEntity>> = _news

    private val _allMatches = MutableStateFlow<List<MatchEntity>>(emptyList())
    val allMatches: StateFlow<List<MatchEntity>> = _allMatches

    private val _userTactic = MutableStateFlow<re.manager.basket.data.entity.TacticEntity?>(null)
    val userTactic: StateFlow<re.manager.basket.data.entity.TacticEntity?> = _userTactic

    private val _selectedPlayerStats = MutableStateFlow<List<re.manager.basket.data.entity.MatchResultEntity>>(emptyList())
    val selectedPlayerStats: StateFlow<List<re.manager.basket.data.entity.MatchResultEntity>> = _selectedPlayerStats

    private val _selectedTeamRoster = MutableStateFlow<List<re.manager.basket.data.entity.PlayerEntity>>(emptyList())
    val selectedTeamRoster: StateFlow<List<re.manager.basket.data.entity.PlayerEntity>> = _selectedTeamRoster

    private val _selectedTeamLeague = MutableStateFlow<re.manager.basket.data.entity.LeagueEntity?>(null)
    val selectedTeamLeague: StateFlow<re.manager.basket.data.entity.LeagueEntity?> = _selectedTeamLeague

    private val _selectedMatchDetail = MutableStateFlow<re.manager.basket.data.entity.MatchEntity?>(null)
    val selectedMatchDetail: StateFlow<re.manager.basket.data.entity.MatchEntity?> = _selectedMatchDetail

    private val _selectedMatchResults = MutableStateFlow<List<re.manager.basket.data.entity.MatchResultEntity>>(emptyList())
    val selectedMatchResults: StateFlow<List<re.manager.basket.data.entity.MatchResultEntity>> = _selectedMatchResults

    private val _isSimulating = MutableStateFlow(false)
    val isSimulating: StateFlow<Boolean> = _isSimulating

    private val _showAutoLineupDialog = MutableStateFlow(false)
    val showAutoLineupDialog: StateFlow<Boolean> = _showAutoLineupDialog

    private val _simProgress = MutableStateFlow(0f)
    val simProgress: StateFlow<Float> = _simProgress

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
        val gameId = _gameState.value?.id ?: return
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val match = database.matchDao().getAllMatchesForGame(gameId).find { it.id == matchId }
                _selectedMatchDetail.value = match
                _selectedMatchResults.value = database.matchResultDao().getResultsByMatch(matchId)
            }
        }
    }

    fun closeMatchDetail() {
        _selectedMatchDetail.value = null
        _selectedMatchResults.value = emptyList()
    }

    fun togglePlayerPosition(player: re.manager.basket.data.entity.PlayerEntity) {
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val updated = player.copy(primaryPositionActive = !player.primaryPositionActive)
                database.playerDao().update(updated)
                // Refresh data
                loadPlayerStats(player.id)
                player.teamId?.let { loadTeamRoster(it) }
            }
        }
    }

    fun loadPlayerStats(playerId: Int) {
        val gameId = _gameState.value?.id ?: return
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                _selectedPlayerStats.value = database.matchResultDao().getResultsByPlayer(playerId, gameId)
            }
        }
    }

    fun loadTeamRoster(teamId: Int) {
        val gameId = _gameState.value?.id ?: return
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                _selectedTeamRoster.value = database.playerDao().getPlayersByTeam(teamId, gameId)
                _selectedTeamLeague.value = database.leagueDao().getLeagueForTeam(teamId, gameId)
            }
        }
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

                val createdGame = database.gameDao().getGameById(gameId)
                _gameState.value = createdGame
                _availableTeams.value = database.teamDao().getTeamsByGame(gameId)
            }
        }
    }

    fun loadPreviewPlayers(teamId: Int) {
        val gameId = _gameState.value?.id ?: return
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val players = database.playerDao().getPlayersByGame(gameId)
                _previewPlayers.value = players.filter { it.teamId == teamId }
            }
        }
    }

    fun selectTeam(teamId: Int) {
        val current = _gameState.value ?: return
        Log.d("GameViewModel", "Selecting teamId: $teamId for gameId: ${current.id}")
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val updated = current.copy(userTeamId = teamId)
                database.gameDao().update(updated)
                _gameState.value = updated
                _userTactic.value = database.tacticDao().getTacticForTeam(teamId, current.id)
                updateNextMatch(updated)
                Log.d("GameViewModel", "userTeamId updated in DB using update()")
            }
        }
    }

    fun updateTactic(tactic: re.manager.basket.data.entity.TacticEntity) {
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                database.tacticDao().update(tactic)
                _userTactic.value = tactic
            }
        }
    }

    fun loadGame(gameId: Int) {
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                val game = database.gameDao().getGameById(gameId)
                _gameState.value = game

                // Integrity check: if players for this game are 0, something is wrong
                val playerCount = database.playerDao().getPlayersByGame(gameId).size
                Log.d("GameViewModel", "Loaded gameId: $gameId, found $playerCount players")
                if (game != null && playerCount == 0) {
                    Log.w("GameViewModel", "CRITICAL: Game exists but players are missing! Data might have been wiped.")
                }

                _recentMatches.value = database.matchDao().getRecentMatches(gameId)
                _news.value = database.newsDao().getNewsByGame(gameId)
                _allMatches.value = database.matchDao().getAllMatchesForGame(gameId)
                _availableTeams.value = database.teamDao().getTeamsByGame(gameId)
                if (game?.userTeamId != null) {
                    _userTactic.value = database.tacticDao().getTacticForTeam(game.userTeamId, gameId)
                }
                updateNextMatch(game)
                Log.d("GameViewModel", "Game loaded, teams: ${_availableTeams.value.size}, matches: ${_allMatches.value.size}")
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
        val current = _gameState.value ?: return
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
        val current = _gameState.value ?: return
        viewModelScope.launch {
            val players = database.playerDao().getPlayersByTeam(current.userTeamId ?: -1, current.id)
            val tactic = database.tacticDao().getTacticForTeam(current.userTeamId ?: -1, current.id)
            if (tactic != null) {
                val optimized = re.manager.basket.domain.engine.LineupOptimizer().optimize(players, tactic)
                database.tacticDao().update(optimized)
                _userTactic.value = optimized
            }
            _showAutoLineupDialog.value = false
            nextDay(daysToSimulate)
        }
    }

    fun nextDay(daysToSimulate: Int = 1) {
        val current = _gameState.value ?: return
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
                                database.matchResultDao().insertAll(result.playerResults)

                                if (result.injuries.isNotEmpty()) {
                                    database.playerDao().insertAll(result.injuries)
                                    // Check if user team had an injury
                                    if (result.injuries.any { it.teamId == userTeamId && it.stateInjury > 0 }) {
                                        injuryOccurred = true
                                    }
                                }
                                generateMatchNews(result)
                                updateLeagueStandings(result)
                            }
                            if (daysToSimulate == 1) {
                                _simProgress.value = (index + 1).toFloat() / matches.size
                            }
                        }

                        // 2. Evolve states
                        val allPlayers = database.playerDao().getPlayersByGame(activeGame.id)
                        val evolvedPlayers = re.manager.basket.domain.engine.StateEvolver().evolveAllPlayersDaily(allPlayers)
                        database.playerDao().insertAll(evolvedPlayers)

                        // 3. Move to next day
                        val seasonManager = SeasonManager(activeGame)
                        val nextDayVal = seasonManager.getNextMatchday()

                        if (currentDay == 166 && nextDayVal == 167) {
                            updateAllSalaryCaps(activeGame.id)
                        }

                        val updated = activeGame.copy(currentMatchday = nextDayVal)
                        database.gameDao().update(updated)

                        simulatedCount++
                        if (daysToSimulate > 1) {
                            _simProgress.value = simulatedCount.toFloat() / daysToSimulate
                        }

                        if (injuryOccurred) {
                            Log.i("GameViewModel", "Stopping multi-day simulation due to user team injury")
                            break
                        }
                        if (nextDayVal == 0) break // Season end
                    }

                    // Refresh final state
                    val finalGame = database.gameDao().getGameById(current.id)
                    _gameState.value = finalGame
                    _recentMatches.value = database.matchDao().getRecentMatches(current.id)
                    _news.value = database.newsDao().getNewsByGame(current.id)
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
        val localWin = match.localQ1 + match.localQ2 + match.localQ3 + match.localQ4 >
                       match.visitorQ1 + match.visitorQ2 + match.visitorQ3 + match.visitorQ4

        updateTeamStanding(match.teamLocalId, match.gameId, localWin, result.match.getTotalLocal(), result.match.getTotalVisitor())
        updateTeamStanding(match.teamVisitorId, match.gameId, !localWin, result.match.getTotalVisitor(), result.match.getTotalLocal())

        // Handling playoff bonuses in real-time (based on finishMatch in Simulate.java)
        if (match.matchday >= 167) {
            val winnerId = if (localWin) match.teamLocalId else match.teamVisitorId
            val winner = database.teamDao().getTeamById(winnerId, match.gameId)
            winner?.let { team ->
                // Bonus for each playoff win: +2M according to original game's financial balance
                val updatedWinner = team.addSalaryCap(Constants.SALARY_CAP_STEP * 2)
                database.teamDao().update(updatedWinner)
            }
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
        val currentUserId = _gameState.value?.userTeamId

        val teams = database.teamDao().getTeamsByGame(match.gameId)
        val localTeam = teams.find { it.id == match.teamLocalId }
        val visitorTeam = teams.find { it.id == match.teamVisitorId }

        // 1. Awesome Performance News (All teams)
        result.playerResults.forEach { pResult ->
            val isTripleDouble = pResult.points >= 10 && pResult.rebounds >= 10 && pResult.assists >= 10
            val isHighPer = pResult.points >= 40 // Simplified original awesome logic

            if (isTripleDouble || isHighPer) {
                database.newsDao().insert(
                    re.manager.basket.data.entity.NewsEntity(
                        gameId = match.gameId,
                        matchday = match.matchday,
                        title = "Awesome Performance: ${pResult.name}",
                        body = "${pResult.name} recorded ${pResult.points} pts, ${pResult.rebounds} reb, ${pResult.assists} ast in the game ${localTeam?.name} vs ${visitorTeam?.name}.",
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

            val title = if (isUserWin) "Victory! ${winnerTeam?.name} wins" else "Defeat: ${localTeam?.name} vs ${visitorTeam?.name}"
            val body = "Final Score: $localScore - $visitorScore. Top Scorer: ${result.playerResults.maxByOrNull { it.points }?.name}"

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
        val userTeamId = _gameState.value?.userTeamId
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

    private suspend fun updateAllSalaryCaps(gameId: Int) {
        val teams = database.teamDao().getTeamsByGame(gameId)
        val standings = database.leagueDao().getStandings(gameId)
        val userTeamId = _gameState.value?.userTeamId

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

    private fun MatchEntity.getTotalLocal() = localQ1 + localQ2 + localQ3 + localQ4
    private fun MatchEntity.getTotalVisitor() = visitorQ1 + visitorQ2 + visitorQ3 + visitorQ4
}
