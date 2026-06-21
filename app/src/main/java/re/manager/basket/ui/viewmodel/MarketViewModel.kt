package re.manager.basket.ui.viewmodel

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import re.manager.basket.data.AppDatabase
import re.manager.basket.data.entity.PlayerEntity
import re.manager.basket.data.entity.DraftPickEntity
import androidx.room.withTransaction

class MarketViewModel(private val database: AppDatabase) : ViewModel() {

    private val _gameId = MutableStateFlow<Int?>(null)
    private val _userTeamId = MutableStateFlow<Int?>(null)

    @OptIn(ExperimentalCoroutinesApi::class)
    val freeAgents: StateFlow<List<PlayerEntity>> = _gameId.flatMapLatest { id ->
        if (id == null) flowOf(emptyList())
        else database.playerDao().getFreeAgentsFlow(id)
            .map { list -> list.sortedByDescending { it.getAverageSkillAll() } }
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
    val tradeTeamPicks: StateFlow<List<DraftPickEntity>> = combine(_selectedTradeTeamId, _gameId) { teamId, gameId ->
        teamId to gameId
    }.flatMapLatest { (teamId, gameId) ->
        if (teamId == null || gameId == null) flowOf(emptyList())
        else database.draftPickDao().getPicksByTeam(teamId, gameId)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    @OptIn(ExperimentalCoroutinesApi::class)
    val userTeamPicks: StateFlow<List<DraftPickEntity>> = combine(_userTeamId, _gameId) { teamId, gameId ->
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

    fun signPlayer(player: PlayerEntity, teamId: Int, negotiatedSalary: Int, negotiatedYears: Int, currentMatchday: Int) {
        viewModelScope.launch {
            val gameId = _gameId.value ?: return@launch
            
            // Check if player already has an offer from THIS team
            val existingOffer = database.offerDao().getOffersForPlayerAll(gameId, player.id).find { it.teamId == teamId }
            
            if (existingOffer != null) {
                // Update existing offer
                val updated = existingOffer.copy(
                    salary = negotiatedSalary,
                    years = negotiatedYears,
                    responseDay = currentMatchday + 3
                )
                database.offerDao().update(updated)
                _signingResult.value = "Offer updated for ${player.name}. They will consider it for a few days."
            } else {
                // Insert new offer
                val offer = re.manager.basket.data.entity.OfferEntity(
                    gameId = gameId,
                    matchday = currentMatchday,
                    playerId = player.id,
                    teamId = teamId,
                    salary = negotiatedSalary,
                    years = negotiatedYears,
                    isRenewal = (player.teamId == teamId),
                    responseDay = currentMatchday + (1..3).random()
                )
                database.offerDao().insert(offer)
                _signingResult.value = "Offer sent to ${player.name}. They will consider it for a few days."
            }
        }
    }

    suspend fun executeTrade(
        userTeamId: Int,
        targetTeamId: Int,
        userPlayers: List<PlayerEntity>,
        targetPlayers: List<PlayerEntity>,
        userPicks: List<DraftPickEntity>,
        targetPicks: List<DraftPickEntity>
    ) {
        database.withTransaction {
            val pUpdate = userPlayers.map { it.copy(teamId = targetTeamId) } +
                          targetPlayers.map { it.copy(teamId = userTeamId) }
            val pickUpdate = userPicks.map { it.copy(currentTeamId = targetTeamId) } +
                             targetPicks.map { it.copy(currentTeamId = userTeamId) }

            if (pUpdate.isNotEmpty()) database.playerDao().updateAll(pUpdate)
            if (pickUpdate.isNotEmpty()) database.draftPickDao().updatePicks(pickUpdate)
        }
    }

    fun shopAssets(userPlayers: List<PlayerEntity>, userPicks: List<DraftPickEntity>) {
        viewModelScope.launch {
            val gameId = _gameId.value ?: return@launch
            val userTeamId = _userTeamId.value ?: return@launch
            val totalUserValue = userPlayers.sumOf { it.getValue() } + userPicks.sumOf { if (it.round == 1) 15.0 else 5.0 }

            if (totalUserValue <= 0) return@launch

            // Solving N+1 problem: fetch all players and picks once
            val allOtherPlayers = database.playerDao().getPlayersByGame(gameId).filter { it.teamId != userTeamId && it.teamId != null }
            val allOtherPicks = database.draftPickDao().getAllPicks(gameId).first().filter { it.currentTeamId != userTeamId }

            val otherTeams = _allTeams.value.filter { it.id != userTeamId }
            val offers = mutableListOf<TradeOffer>()

            for (team in otherTeams.shuffled()) {
                val teamPlayers = allOtherPlayers.filter { it.teamId == team.id }.sortedByDescending { it.getValue() }
                val teamPicks = allOtherPicks.filter { it.currentTeamId == team.id }

                val packagePlayers = mutableListOf<PlayerEntity>()
                val packagePicks = mutableListOf<DraftPickEntity>()
                var currentVal = 0.0

                for (p in teamPlayers) {
                    if (currentVal + p.getValue() <= totalUserValue * 1.1) {
                        packagePlayers.add(p)
                        currentVal += p.getValue()
                    }
                    if (packagePlayers.size >= 2) break
                }

                for (pick in teamPicks) {
                    val pVal = if (pick.round == 1) 15.0 else 5.0
                    if (currentVal + pVal <= totalUserValue * 1.15) {
                        packagePicks.add(pick)
                        currentVal += pVal
                    }
                    if (packagePicks.size >= 2) break
                }

                if (currentVal >= totalUserValue * 0.8) {
                    offers.add(TradeOffer(team, packagePlayers, packagePicks))
                }
                if (offers.size >= 5) break
            }
            _tradeOffers.value = offers
        }
    }

    fun acceptShopOffer(offer: TradeOffer, userPlayers: List<PlayerEntity>, userPicks: List<DraftPickEntity>) {
        viewModelScope.launch {
            val userTeamId = _userTeamId.value ?: return@launch
            executeTrade(userTeamId, offer.team.id, userPlayers, offer.players, userPicks, offer.picks)
            _tradeOffers.value = emptyList()
            _signingResult.value = "Multi-Asset Trade Finalized with ${offer.team.name}"
        }
    }

    fun clearShopOffers() { _tradeOffers.value = emptyList() }
    fun clearSigningResult() { _signingResult.value = null }
}

data class TradeOffer(
    val team: re.manager.basket.data.entity.TeamEntity,
    val players: List<PlayerEntity>,
    val picks: List<DraftPickEntity>
)
