package re.manager.basket.ui.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import re.manager.basket.ui.viewmodel.GameViewModel
import re.manager.basket.ui.viewmodel.PlayerListViewModel
import re.manager.basket.ui.viewmodel.PlayerUiState
import re.manager.basket.ui.viewmodel.MarketViewModel
import re.manager.basket.ui.viewmodel.LeagueViewModel

@Composable
fun MainScaffold(
    gameViewModel: GameViewModel,
    playerListViewModel: PlayerListViewModel,
    marketViewModel: MarketViewModel,
    leagueViewModel: LeagueViewModel
) {
    val gameState by gameViewModel.gameState.collectAsState()
    val players by playerListViewModel.players.collectAsState()
    val isSimulating by gameViewModel.isSimulating.collectAsState()
    val showAutoLineupDialog by gameViewModel.showAutoLineupDialog.collectAsState()
    val simProgress by gameViewModel.simProgress.collectAsState()
    val nextMatch by gameViewModel.nextMatch.collectAsState()
    val news by gameViewModel.news.collectAsState()
    val allMatches by gameViewModel.allMatches.collectAsState()
    val availableTeams by gameViewModel.availableTeams.collectAsState()
    val userTactic by gameViewModel.userTactic.collectAsState()
    val activePlayer by gameViewModel.activePlayer.collectAsState()
    val selectedPlayerStats by gameViewModel.selectedPlayerStats.collectAsState()
    val selectedTeamRoster by gameViewModel.selectedTeamRoster.collectAsState()
    val selectedTeamLeague by gameViewModel.selectedTeamLeague.collectAsState()
    val selectedTeamTactic by gameViewModel.selectedTeamTactic.collectAsState()
    val selectedTeamDraftPicks by gameViewModel.selectedTeamDraftPicks.collectAsState()
    val selectedMatchDetail by gameViewModel.selectedMatchDetail.collectAsState()
    val selectedMatchResults by gameViewModel.selectedMatchResults.collectAsState()
    val selectedTeamStats by gameViewModel.selectedTeamStats.collectAsState()
    val selectedCalendarDay by gameViewModel.selectedCalendarDay.collectAsState()

    MainScaffoldContent(
        gameViewModel = gameViewModel,
        selectedItemInitial = 0,
        gameState = gameState,
        players = players,
        marketViewModel = marketViewModel,
        leagueViewModel = leagueViewModel,
        isSimulating = isSimulating,
        simProgress = simProgress,
        nextMatch = nextMatch,
        news = news,
        allMatches = allMatches,
        availableTeams = availableTeams,
        userTactic = userTactic,
        selectedPlayerStats = selectedPlayerStats,
        selectedTeamRoster = selectedTeamRoster,
        selectedTeamLeague = selectedTeamLeague,
        selectedTeamTactic = selectedTeamTactic,
        selectedTeamDraftPicks = selectedTeamDraftPicks,
        selectedMatchDetail = selectedMatchDetail,
        selectedMatchResults = selectedMatchResults,
        selectedTeamStats = selectedTeamStats,
        selectedCalendarDay = selectedCalendarDay,
        activePlayer = activePlayer,
        onLoadPlayerDetails = { gameViewModel.loadPlayerDetails(it) },
        onClosePlayerDetails = { gameViewModel.closePlayerDetails() },
        onLoadTeamRoster = { gameViewModel.loadTeamRoster(it) },
        onLoadMatchDetail = { gameViewModel.loadMatchDetail(it.id) },
        onCloseMatchDetail = { gameViewModel.closeMatchDetail() },
        onDayClick = { gameViewModel.selectCalendarDay(it) },
        onTogglePosition = { gameViewModel.togglePlayerPosition(it) },
        onUpdateTactic = { gameViewModel.updateTactic(it) },
        onNextDay = { gameViewModel.onNextDayClick(1) },
        onNextWeek = { gameViewModel.onNextDayClick(7) },
        onNextMonth = { gameViewModel.onNextDayClick(30) },
        showAutoLineupDialog = showAutoLineupDialog,
        onDismissAutoLineup = { gameViewModel.dismissAutoLineupDialog() },
        onAutoLineupConfirm = { gameViewModel.autoArrangeAndSimulate(1) } // Simplified for now
    )
}

@Composable
fun MainScaffoldContent(
    gameViewModel: GameViewModel,
    selectedItemInitial: Int,
    gameState: re.manager.basket.data.entity.GameEntity?,
    players: List<PlayerUiState>,
    marketViewModel: MarketViewModel,
    leagueViewModel: LeagueViewModel,
    isSimulating: Boolean,
    simProgress: Float,
    nextMatch: Pair<re.manager.basket.data.entity.MatchEntity, re.manager.basket.data.entity.TeamEntity>?,
    news: List<re.manager.basket.data.entity.NewsEntity>,
    allMatches: List<re.manager.basket.data.entity.MatchEntity>,
    availableTeams: List<re.manager.basket.data.entity.TeamEntity>,
    userTactic: re.manager.basket.data.entity.TacticEntity?,
    selectedPlayerStats: List<re.manager.basket.data.entity.MatchResultEntity>,
    selectedTeamRoster: List<re.manager.basket.data.entity.PlayerEntity>,
    selectedTeamLeague: re.manager.basket.data.entity.LeagueEntity?,
    selectedTeamTactic: re.manager.basket.data.entity.TacticEntity?,
    selectedTeamDraftPicks: List<re.manager.basket.data.entity.DraftPickEntity>,
    activePlayer: re.manager.basket.data.entity.PlayerEntity?,
    selectedMatchDetail: re.manager.basket.data.entity.MatchEntity?,
    selectedMatchResults: List<re.manager.basket.data.entity.MatchResultEntity>,
    selectedTeamStats: List<re.manager.basket.data.entity.MatchResultEntity>,
    selectedCalendarDay: Int,
    onLoadPlayerDetails: (Int) -> Unit,
    onClosePlayerDetails: () -> Unit,
    onLoadTeamRoster: (Int) -> Unit,
    onLoadMatchDetail: (re.manager.basket.data.entity.MatchEntity) -> Unit,
    onCloseMatchDetail: () -> Unit,
    onDayClick: (Int) -> Unit,
    onTogglePosition: (re.manager.basket.data.entity.PlayerEntity) -> Unit,
    onUpdateTactic: (re.manager.basket.data.entity.TacticEntity) -> Unit,
    onNextDay: () -> Unit,
    onNextWeek: () -> Unit,
    onNextMonth: () -> Unit,
    showAutoLineupDialog: Boolean = false,
    onDismissAutoLineup: () -> Unit = {},
    onAutoLineupConfirm: () -> Unit = {}
) {
    var selectedItem by remember { mutableIntStateOf(selectedItemInitial) }
    val items = listOf("Home", "Team", "League", "Market")
    val icons = listOf(Icons.Filled.Home, Icons.Filled.Person, Icons.Filled.List, Icons.Filled.ShoppingCart)

    var detailPlayerId by remember { mutableStateOf<Int?>(null) }
    var detailTeamId by remember { mutableIntStateOf(-1) }
    var showCalendar by remember { mutableStateOf(false) }
    var showTeamStats by remember { mutableStateOf(false) }
    var teamSubTab by remember { mutableIntStateOf(0) } // 0: Squad, 1: Lineup, 2: Tactic, 3: Finance

    Scaffold(
        bottomBar = {
            NavigationBar {
                items.forEachIndexed { index, item ->
                    NavigationBarItem(
                        icon = { Icon(icons[index], contentDescription = item) },
                        label = { Text(item) },
                        selected = selectedItem == index,
                        onClick = { selectedItem = index }
                    )
                }
            }
        },
        floatingActionButton = {
            var expanded by remember { mutableStateOf(false) }
            Column(horizontalAlignment = Alignment.End) {
                if (expanded) {
                    SmallFloatingActionButton(onClick = { showCalendar = true; expanded = false }, modifier = Modifier.padding(bottom = 8.dp)) {
                        Icon(Icons.Filled.DateRange, contentDescription = "Calendar")
                    }
                    SmallFloatingActionButton(onClick = { onNextMonth(); expanded = false }, modifier = Modifier.padding(bottom = 8.dp)) {
                        Text("1M", modifier = Modifier.padding(horizontal = 8.dp))
                    }
                    SmallFloatingActionButton(onClick = { onNextWeek(); expanded = false }, modifier = Modifier.padding(bottom = 8.dp)) {
                        Text("1W", modifier = Modifier.padding(horizontal = 8.dp))
                    }
                }
                ExtendedFloatingActionButton(
                    onClick = { if (expanded) onNextDay() else expanded = true },
                    icon = { Icon(if (expanded) Icons.Filled.PlayArrow else Icons.Filled.Add, "Simulate") },
                    text = { Text(if (expanded) "Next Day" else "Play...") }
                )
            }
        }
    ) { innerPadding ->
        Surface(modifier = Modifier.padding(innerPadding)) {
            Box(modifier = Modifier.fillMaxSize()) {
                if (isSimulating) {
                    Dialog(onDismissRequest = {}) {
                        Card {
                            Column(
                                modifier = Modifier.padding(24.dp),
                                horizontalAlignment = Alignment.CenterHorizontally
                            ) {
                                Text("Simulating League Matches...", style = MaterialTheme.typography.titleMedium)
                                Spacer(modifier = Modifier.height(16.dp))
                                LinearProgressIndicator(
                                    progress = { simProgress },
                                    modifier = Modifier.fillMaxWidth()
                                )
                                Text("${(simProgress * 100).toInt()}%", modifier = Modifier.padding(top = 8.dp))
                            }
                        }
                    }
                }

                if (showAutoLineupDialog) {
                    AlertDialog(
                        onDismissRequest = onDismissAutoLineup,
                        title = { Text("Incomplete Lineup") },
                        text = { Text("Your lineup is not fully assigned. Would you like to automatically arrange the best possible lineup or cancel to set it manually?") },
                        confirmButton = {
                            Button(onClick = onAutoLineupConfirm) { Text("Auto Arrange") }
                        },
                        dismissButton = {
                            TextButton(onClick = onDismissAutoLineup) { Text("Set Manually") }
                        }
                    )
                }

                // Nested Navigation Handlers
                if (selectedMatchDetail != null) {
                    MatchDetailScreen(
                        match = selectedMatchDetail!!,
                        localTeam = availableTeams.find { it.id == selectedMatchDetail!!.teamLocalId },
                        visitorTeam = availableTeams.find { it.id == selectedMatchDetail!!.teamVisitorId },
                        playerStats = selectedMatchResults,
                        onBack = onCloseMatchDetail
                    )
                } else if (detailPlayerId != null) {
                    LaunchedEffect(detailPlayerId) { onLoadPlayerDetails(detailPlayerId!!) }
                    if (activePlayer != null) {
                        PlayerDetailScreen(
                            player = activePlayer!!,
                            stats = selectedPlayerStats,
                            onTogglePosition = { onTogglePosition(activePlayer!!) },
                            onBack = {
                                detailPlayerId = null
                                onClosePlayerDetails()
                            }
                        )
                    }
                } else if (showTeamStats && detailTeamId != -1) {
                    val team = availableTeams.find { it.id == detailTeamId }
                    if (team != null) {
                        TeamStatsScreen(
                            team = team,
                            players = selectedTeamRoster,
                            allStats = selectedTeamStats,
                            onBack = { showTeamStats = false }
                        )
                    }
                } else if (detailTeamId != -1) {
                    val team = availableTeams.find { it.id == detailTeamId }
                    if (team != null) {
                        LaunchedEffect(detailTeamId) { onLoadTeamRoster(detailTeamId) }
                        TeamDetailScreen(
                            team = team,
                            league = selectedTeamLeague,
                            players = selectedTeamRoster,
                            tactic = selectedTeamTactic,
                            draftPicks = selectedTeamDraftPicks,
                            onPlayerClick = { detailPlayerId = it },
                            onStatsClick = { showTeamStats = true },
                            onBack = { detailTeamId = -1 }
                        )
                    } else {
                        detailTeamId = -1
                    }
                } else if (showCalendar) {
                    gameState?.let { game ->
                        CalendarScreen(
                            matches = allMatches,
                            teams = availableTeams,
                            currentMatchday = game.currentMatchday,
                            selectedDayInitial = selectedCalendarDay,
                            userTeamId = game.userTeamId,
                            onDayClick = onDayClick,
                            onMatchClick = onLoadMatchDetail,
                            onBack = { showCalendar = false }
                        )
                    }
                } else {
                    when (selectedItem) {
                        0 -> DashboardContent(gameState, nextMatch, news, onShowCalendar = { showCalendar = true })
                        1 -> Column {
                            ScrollableTabRow(selectedTabIndex = teamSubTab) {
                                Tab(selected = teamSubTab == 0, onClick = { teamSubTab = 0 }) { Text("Squad", modifier = Modifier.padding(16.dp)) }
                                Tab(selected = teamSubTab == 1, onClick = { teamSubTab = 1 }) { Text("Lineup", modifier = Modifier.padding(16.dp)) }
                                Tab(selected = teamSubTab == 2, onClick = { teamSubTab = 2 }) { Text("Tactic", modifier = Modifier.padding(16.dp)) }
                                Tab(selected = teamSubTab == 3, onClick = { teamSubTab = 3 }) { Text("Finance", modifier = Modifier.padding(16.dp)) }
                            }
                            when (teamSubTab) {
                                0 -> TeamSquadContent(players, tactic = userTactic, onPlayerClick = { detailPlayerId = it })
                                1 -> {
                                    val teamPlayers = players.map { it.originalEntity }
                                    if (userTactic != null) {
                                        LineupManagementScreen(players = teamPlayers, tactic = userTactic!!, onTacticUpdate = onUpdateTactic)
                                    }
                                }
                                2 -> {
                                    val teamPlayers = players.map { it.originalEntity }
                                    if (userTactic != null) {
                                        TacticScreen(players = teamPlayers, tactic = userTactic!!, onUpdate = onUpdateTactic)
                                    }
                                }
                                3 -> gameState?.let { game ->
                                    val userTeam = availableTeams.find { it.id == game.userTeamId }
                                    if (userTeam != null) {
                                        TeamFinancesScreen(team = userTeam, players = players.map { it.originalEntity })
                                    }
                                }
                            }
                        }
                        2 -> gameState?.let {
                            LeagueScreen(
                                gameId = it.id,
                                viewModel = leagueViewModel,
                                onPlayerClick = { playerId -> detailPlayerId = playerId }
                            )
                        }
                        3 -> gameState?.let { game ->
                            MarketScreen(
                                gameId = game.id,
                                userTeamId = game.userTeamId ?: 1,
                                marketViewModel = marketViewModel,
                                userPlayers = players.map { it.originalEntity },
                                currentMatchday = game.currentMatchday
                            )
                        }
                    }
                }
            }
        }
    }
}
