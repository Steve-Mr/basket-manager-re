package re.manager.basket.ui.viewmodel

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.PlayerEntity

class MarketViewModel(private val database: AppDatabase) : ViewModel() {

    private val _gameId = MutableStateFlow<Int?>(null)
    private val _userTeamId = MutableStateFlow<Int?>(null)

    @OptIn(ExperimentalCoroutinesApi::class)
    val freeAgents: StateFlow<List<PlayerEntity>> = _gameId.flatMapLatest { id ->
        if (id == null) flowOf(emptyList())
        else database.playerDao().getFreeAgentsFlow(id)
            .map { list ->
                Log.d("MarketViewModel", "Found ${list.size} free agents for game $id")
                list.sortedByDescending { it.getAverageSkillAll() }
            }
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    @OptIn(ExperimentalCoroutinesApi::class)
    val teamSalary: StateFlow<Int> = combine(_gameId, _userTeamId) { gameId, teamId ->
        gameId to teamId
    }.flatMapLatest { (gameId, teamId) ->
        if (gameId == null || teamId == null) flowOf(0)
        else database.playerDao().getPlayersByTeamFlow(teamId, gameId).map { it.sumOf { p -> p.salary } }
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), 0)

    @OptIn(ExperimentalCoroutinesApi::class)
    val salaryCap: StateFlow<Int> = combine(_gameId, _userTeamId) { gameId, teamId ->
        gameId to teamId
    }.flatMapLatest { (gameId, teamId) ->
        if (gameId == null || teamId == null) flowOf(re.manager.basket.domain.model.Constants.SALARY_CAP_MED)
        else flow { emit(database.teamDao().getTeamById(teamId, gameId)?.salaryCap ?: re.manager.basket.domain.model.Constants.SALARY_CAP_MED) }
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), re.manager.basket.domain.model.Constants.SALARY_CAP_MED)

    private val _allTeams = MutableStateFlow<List<re.manager.basket.data.entity.TeamEntity>>(emptyList())
    val allTeams: StateFlow<List<re.manager.basket.data.entity.TeamEntity>> = _allTeams.asStateFlow()

    @OptIn(ExperimentalCoroutinesApi::class)
    val otherTeams: StateFlow<List<re.manager.basket.data.entity.TeamEntity>> = combine(_allTeams, _userTeamId) { all, user ->
        all.filter { it.id != user }
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    private val _selectedTradeTeamId = MutableStateFlow<Int?>(null)
    val selectedTradeTeamId: StateFlow<Int?> = _selectedTradeTeamId.asStateFlow()

    @OptIn(ExperimentalCoroutinesApi::class)
    val tradeTeamPlayers: StateFlow<List<PlayerEntity>> = combine(_selectedTradeTeamId, _gameId) { teamId, gameId ->
        teamId to gameId
    }.flatMapLatest { (teamId, gameId) ->
        if (teamId == null || gameId == null) flowOf(emptyList())
        else database.playerDao().getPlayersByTeamFlow(teamId, gameId)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    @OptIn(ExperimentalCoroutinesApi::class)
    val tradeTeamPicks: StateFlow<List<re.manager.basket.data.entity.DraftPickEntity>> = combine(_selectedTradeTeamId, _gameId) { teamId, gameId ->
        teamId to gameId
    }.flatMapLatest { (teamId, gameId) ->
        if (teamId == null || gameId == null) flowOf(emptyList())
        else database.draftPickDao().getPicksByTeam(teamId, gameId)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    @OptIn(ExperimentalCoroutinesApi::class)
    val userTeamPicks: StateFlow<List<re.manager.basket.data.entity.DraftPickEntity>> = combine(_userTeamId, _gameId) { teamId, gameId ->
        teamId to gameId
    }.flatMapLatest { (teamId, gameId) ->
        if (teamId == null || gameId == null) flowOf(emptyList())
        else database.draftPickDao().getPicksByTeam(teamId, gameId)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    private val _tradeOffers = MutableStateFlow<List<TradeOffer>>(emptyList())
    val tradeOffers: StateFlow<List<TradeOffer>> = _tradeOffers.asStateFlow()

    private val _signingResult = MutableStateFlow<String?>(null)
    val signingResult: StateFlow<String?> = _signingResult.asStateFlow()

    fun loadMarketData(gameId: Int, userTeamId: Int) {
        _gameId.value = gameId
        _userTeamId.value = userTeamId
        viewModelScope.launch {
            _allTeams.value = database.teamDao().getTeamsByGame(gameId)
        }
    }

    fun selectTradeTeam(teamId: Int) {
        _selectedTradeTeamId.value = teamId
    }

    fun signPlayer(player: PlayerEntity, teamId: Int) {
        viewModelScope.launch {
            val expectedSalary = (player.getValue() * 100000).toInt().coerceAtLeast(500000)
            val satisfaction = (player.salary.toFloat() / expectedSalary.toFloat() * 100).toInt()
            if (satisfaction >= 80) {
                database.playerDao().update(player.copy(teamId = teamId))
                _signingResult.value = "Success: ${player.name} has signed!"
            } else {
                _signingResult.value = "Rejected: ${player.name} wants more money."
            }
        }
    }

    fun executeTrade(
        userTeamId: Int,
        targetTeamId: Int,
        userPlayers: List<PlayerEntity>,
        targetPlayers: List<PlayerEntity>,
        userPicks: List<re.manager.basket.data.entity.DraftPickEntity>,
        targetPicks: List<re.manager.basket.data.entity.DraftPickEntity>
    ) {
        viewModelScope.launch {
            val pUpdate = userPlayers.map { it.copy(teamId = targetTeamId) } + targetPlayers.map { it.copy(teamId = userTeamId) }
            val pickUpdate = userPicks.map { it.copy(currentTeamId = targetTeamId) } + targetPicks.map { it.copy(currentTeamId = userTeamId) }
            if (pUpdate.isNotEmpty()) database.playerDao().updateAll(pUpdate)
            if (pickUpdate.isNotEmpty()) database.draftPickDao().updatePicks(pickUpdate)
            Log.d("MarketViewModel", "Trade executed: ${userPlayers.size} <-> ${targetPlayers.size} players")
        }
    }

    fun shopPlayer(player: PlayerEntity) {
        viewModelScope.launch {
            val gameId = _gameId.value ?: return@launch
            val userTeamId = _userTeamId.value ?: return@launch
            val teams = database.teamDao().getTeamsByGame(gameId).filter { it.id != userTeamId }.shuffled()
            val valRef = player.getValue()
            val offers = mutableListOf<TradeOffer>()

            Log.d("MarketViewModel", "Shopping player: ${player.name}, Value: $valRef")

            for (team in teams) {
                val tPlayers = database.playerDao().getPlayersByTeam(team.id, gameId)
                val tPicks = database.draftPickDao().getPicksByTeam(team.id, gameId).firstOrNull() ?: emptyList()

                // Match criteria: Package value 80% to 120% of shopping player
                val match = tPlayers.find { it.getValue() in (valRef * 0.8)..(valRef * 1.2) }
                if (match != null) {
                    offers.add(TradeOffer(team, listOf(match), emptyList()))
                } else {
                    val pick = tPicks.find { it.round == 1 }
                    // A 1st round pick is worth ~15.0 in our valuation
                    if (pick != null && 15.0 in (valRef * 0.7)..(valRef * 1.3)) {
                        offers.add(TradeOffer(team, emptyList(), listOf(pick)))
                    }
                }
                if (offers.size >= 5) break
            }
            Log.d("MarketViewModel", "Generated ${offers.size} offers for ${player.name}")
            _tradeOffers.value = offers
        }
    }

    fun acceptShopOffer(offer: TradeOffer, playerToTrade: PlayerEntity) {
        viewModelScope.launch {
            val userTeamId = _userTeamId.value ?: return@launch
            executeTrade(userTeamId, offer.team.id, listOf(playerToTrade), offer.players, emptyList(), offer.picks)
            _tradeOffers.value = emptyList()
            _signingResult.value = "Trade Finalized with ${offer.team.name}"
        }
    }

    fun clearShopOffers() { _tradeOffers.value = emptyList() }
    fun clearSigningResult() { _signingResult.value = null }
}

data class TradeOffer(
    val team: re.manager.basket.data.entity.TeamEntity,
    val players: List<PlayerEntity>,
    val picks: List<re.manager.basket.data.entity.DraftPickEntity>
)
