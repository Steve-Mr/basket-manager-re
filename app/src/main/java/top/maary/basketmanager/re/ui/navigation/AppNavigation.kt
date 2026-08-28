package top.maary.basketmanager.re.ui.navigation

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ExitToApp
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.activity.compose.BackHandler
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import kotlinx.coroutines.launch
import top.maary.basketmanager.re.ui.screens.*
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel
import top.maary.basketmanager.re.ui.viewmodel.MainViewModel

enum class Screen {
    MAIN_MENU,
    SELECT_TEAM,
    DASHBOARD
}

enum class PrimaryTab(val title: String, val icon: ImageVector) {
    HOME("Home", Icons.Default.Home),
    SQUAD("Squad", Icons.Default.People),
    LEAGUE("League", Icons.Default.FormatListNumbered),
    OFFICE("Office", Icons.Default.BusinessCenter)
}

@Composable
fun AppNavigation(
    mainViewModel: MainViewModel = viewModel(),
    dashboardViewModel: GameDashboardViewModel = viewModel()
) {
    var currentScreen by remember { mutableStateOf(Screen.MAIN_MENU) }
    var selectedGameName by remember { mutableStateOf("My Franchise") }

    when (currentScreen) {
        Screen.MAIN_MENU -> {
            MainMenuScreen(
                viewModel = mainViewModel,
                onNavigateToSelectTeam = { name ->
                    selectedGameName = name
                    currentScreen = Screen.SELECT_TEAM
                },
                onNavigateToGame = { gameId ->
                    dashboardViewModel.loadGame(gameId)
                    currentScreen = Screen.DASHBOARD
                }
            )
        }

        Screen.SELECT_TEAM -> {
            SelectTeamScreen(
                gameName = selectedGameName,
                viewModel = mainViewModel,
                onBack = { currentScreen = Screen.MAIN_MENU },
                onGameCreated = { gameId ->
                    dashboardViewModel.loadGame(gameId)
                    currentScreen = Screen.DASHBOARD
                }
            )
        }

        Screen.DASHBOARD -> {
            DashboardScaffold(
                viewModel = dashboardViewModel,
                onExitToMainMenu = {
                    mainViewModel.loadSavedGames()
                    currentScreen = Screen.MAIN_MENU
                }
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DashboardScaffold(
    viewModel: GameDashboardViewModel,
    onExitToMainMenu: () -> Unit
) {
    val drawerState = rememberDrawerState(initialValue = DrawerValue.Closed)
    val scope = rememberCoroutineScope()
    val game by viewModel.game.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()

    var primaryTab by remember { mutableStateOf(PrimaryTab.HOME) }
    var squadSubTab by remember { mutableStateOf(0) } // 0: Roster, 1: Lineup, 2: Tactics, 3: Finances
    var leagueSubTab by remember { mutableStateOf(0) } // 0: Standings, 1: Schedule, 2: Leaders, 3: Playoffs
    var officeSubTab by remember { mutableStateOf(0) } // 0: Trade, 1: Free Agency, 2: Draft, 3: Challenges

    var viewingTeamDetailId by remember { mutableStateOf<Long?>(null) }

    BackHandler {
        when {
            drawerState.isOpen -> {
                scope.launch { drawerState.close() }
            }
            viewingTeamDetailId != null -> {
                viewingTeamDetailId = null
            }
            primaryTab != PrimaryTab.HOME -> {
                primaryTab = PrimaryTab.HOME
            }
        }
    }

    if (viewingTeamDetailId != null) {
        TeamDetailScreen(
            teamId = viewingTeamDetailId!!,
            viewModel = viewModel,
            onBack = { viewingTeamDetailId = null }
        )
        return
    }

    ModalNavigationDrawer(
        drawerState = drawerState,
        drawerContent = {
            ModalDrawerSheet(
                modifier = Modifier.width(310.dp)
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxHeight()
                        .verticalScroll(rememberScrollState())
                        .padding(bottom = 32.dp)
                ) {
                    Spacer(modifier = Modifier.height(16.dp))
                Text(
                    text = userTeam?.name ?: "Basket Manager",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.ExtraBold,
                    modifier = Modifier.padding(horizontal = 24.dp)
                )
                Text(
                    text = "Season ${game?.currentSeason ?: 1} • Day ${game?.currentMatchday ?: 1}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    modifier = Modifier.padding(horizontal = 24.dp, vertical = 4.dp)
                )
                HorizontalDivider(modifier = Modifier.padding(vertical = 12.dp))

                // Section 1: Dashboard
                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.Dashboard, contentDescription = null) },
                    label = { Text("Dashboard Overview") },
                    selected = primaryTab == PrimaryTab.HOME,
                    onClick = {
                        primaryTab = PrimaryTab.HOME
                        scope.launch { drawerState.close() }
                    }
                )

                // Section 2: Squad Management
                Text(
                    text = "SQUAD MANAGEMENT",
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.padding(horizontal = 24.dp, vertical = 8.dp)
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.Group, contentDescription = null) },
                    label = { Text("Roster & Contracts") },
                    selected = primaryTab == PrimaryTab.SQUAD && squadSubTab == 0,
                    onClick = {
                        primaryTab = PrimaryTab.SQUAD
                        squadSubTab = 0
                        scope.launch { drawerState.close() }
                    }
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.SportsBasketball, contentDescription = null) },
                    label = { Text("Lineup & Rotation") },
                    selected = primaryTab == PrimaryTab.SQUAD && squadSubTab == 1,
                    onClick = {
                        primaryTab = PrimaryTab.SQUAD
                        squadSubTab = 1
                        scope.launch { drawerState.close() }
                    }
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.Tune, contentDescription = null) },
                    label = { Text("Game Tactics") },
                    selected = primaryTab == PrimaryTab.SQUAD && squadSubTab == 2,
                    onClick = {
                        primaryTab = PrimaryTab.SQUAD
                        squadSubTab = 2
                        scope.launch { drawerState.close() }
                    }
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.AccountBalance, contentDescription = null) },
                    label = { Text("Franchise Finances") },
                    selected = primaryTab == PrimaryTab.SQUAD && squadSubTab == 3,
                    onClick = {
                        primaryTab = PrimaryTab.SQUAD
                        squadSubTab = 3
                        scope.launch { drawerState.close() }
                    }
                )

                // Section 3: League Hub
                Text(
                    text = "LEAGUE HUB",
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.padding(horizontal = 24.dp, vertical = 8.dp)
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.FormatListNumbered, contentDescription = null) },
                    label = { Text("Standings") },
                    selected = primaryTab == PrimaryTab.LEAGUE && leagueSubTab == 0,
                    onClick = {
                        primaryTab = PrimaryTab.LEAGUE
                        leagueSubTab = 0
                        scope.launch { drawerState.close() }
                    }
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.CalendarMonth, contentDescription = null) },
                    label = { Text("Schedule") },
                    selected = primaryTab == PrimaryTab.LEAGUE && leagueSubTab == 1,
                    onClick = {
                        primaryTab = PrimaryTab.LEAGUE
                        leagueSubTab = 1
                        scope.launch { drawerState.close() }
                    }
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.Leaderboard, contentDescription = null) },
                    label = { Text("Leaders & Top 100") },
                    selected = primaryTab == PrimaryTab.LEAGUE && leagueSubTab == 2,
                    onClick = {
                        primaryTab = PrimaryTab.LEAGUE
                        leagueSubTab = 2
                        scope.launch { drawerState.close() }
                    }
                )

                // Section 4: Front Office
                Text(
                    text = "FRONT OFFICE",
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.padding(horizontal = 24.dp, vertical = 8.dp)
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.SwapHoriz, contentDescription = null) },
                    label = { Text("Trade Machine") },
                    selected = primaryTab == PrimaryTab.OFFICE && officeSubTab == 0,
                    onClick = {
                        primaryTab = PrimaryTab.OFFICE
                        officeSubTab = 0
                        scope.launch { drawerState.close() }
                    }
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.ShoppingBag, contentDescription = null) },
                    label = { Text("Free Agency") },
                    selected = primaryTab == PrimaryTab.OFFICE && officeSubTab == 1,
                    onClick = {
                        primaryTab = PrimaryTab.OFFICE
                        officeSubTab = 1
                        scope.launch { drawerState.close() }
                    }
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.HowToVote, contentDescription = null) },
                    label = { Text("Rookie Draft Hub") },
                    selected = primaryTab == PrimaryTab.OFFICE && officeSubTab == 2,
                    onClick = {
                        primaryTab = PrimaryTab.OFFICE
                        officeSubTab = 2
                        scope.launch { drawerState.close() }
                    }
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.MilitaryTech, contentDescription = null) },
                    label = { Text("Championship Challenges") },
                    selected = primaryTab == PrimaryTab.OFFICE && officeSubTab == 3,
                    onClick = {
                        primaryTab = PrimaryTab.OFFICE
                        officeSubTab = 3
                        scope.launch { drawerState.close() }
                    }
                )

                if ((game?.currentMatchday ?: 1) in 226..234) {
                    NavigationDrawerItem(
                        icon = { Icon(Icons.Default.Celebration, contentDescription = null) },
                        label = { Text("Offseason Hub 🏆") },
                        selected = primaryTab == PrimaryTab.HOME,
                        onClick = {
                            primaryTab = PrimaryTab.HOME
                            scope.launch { drawerState.close() }
                        }
                    )
                }

                

                Spacer(modifier = Modifier.height(16.dp))
                HorizontalDivider()
                Spacer(modifier = Modifier.height(8.dp))

                NavigationDrawerItem(
                    icon = { Icon(Icons.AutoMirrored.Filled.ExitToApp, contentDescription = null) },
                    label = { Text("Save & Exit to Menu") },
                    selected = false,
                    onClick = {
                        scope.launch {
                            drawerState.close()
                            onExitToMainMenu()
                        }
                    }
                )
                Spacer(modifier = Modifier.height(24.dp))
                }
            }
        }
    ) {
        Scaffold(
            topBar = {
                TopAppBar(
                    title = {
                        Column {
                            Text(
                                text = userTeam?.name ?: "Basket Manager",
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.Bold
                            )
                            Text(
                                text = "Season ${game?.currentSeason ?: 1} • Day ${game?.currentMatchday ?: 1}",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    },
                    navigationIcon = {
                        IconButton(onClick = { scope.launch { drawerState.open() } }) {
                            Icon(Icons.Default.Menu, contentDescription = "Menu Drawer")
                        }
                    },
                    colors = TopAppBarDefaults.topAppBarColors(containerColor = MaterialTheme.colorScheme.surface)
                )
            },
            bottomBar = {
                val isOffseason = (game?.currentMatchday ?: 1) in 226..234

                NavigationBar {
                    PrimaryTab.entries.forEach { tab ->
                        val (tabTitle, tabIcon) = if (tab == PrimaryTab.HOME && isOffseason) {
                            Pair("Offseason", Icons.Default.Celebration)
                        } else {
                            Pair(tab.title, tab.icon)
                        }

                        NavigationBarItem(
                            icon = { Icon(tabIcon, contentDescription = tabTitle) },
                            label = { Text(tabTitle) },
                            selected = primaryTab == tab,
                            onClick = { primaryTab = tab }
                        )
                    }
                }
            }
        ) { innerPadding ->
            Box(modifier = Modifier.padding(innerPadding)) {
                val isOffseason = (game?.currentMatchday ?: 1) in 226..234
                when (primaryTab) {
                    PrimaryTab.HOME -> {
                        if (isOffseason) {
                            OffseasonScreen(
                                viewModel = viewModel,
                                onNavigateToNewSeason = {
                                    primaryTab = PrimaryTab.HOME
                                }
                            )
                        } else {
                            DashboardScreen(
                                viewModel = viewModel,
                                onNavigateToRoster = {
                                    primaryTab = PrimaryTab.SQUAD
                                    squadSubTab = 0
                                },
                                onNavigateToStandings = {
                                    primaryTab = PrimaryTab.LEAGUE
                                    leagueSubTab = 0
                                },
                                onNavigateToTeamDetail = { teamId ->
                                    viewingTeamDetailId = teamId
                                },
                                onNavigateToOffseason = {
                                    primaryTab = PrimaryTab.HOME
                                }
                            )
                        }
                    }

                    PrimaryTab.SQUAD -> {
                        Column(modifier = Modifier.fillMaxSize()) {
                            TabRow(selectedTabIndex = squadSubTab) {
                                Tab(selected = squadSubTab == 0, onClick = { squadSubTab = 0 }, text = { Text("Roster") })
                                Tab(selected = squadSubTab == 1, onClick = { squadSubTab = 1 }, text = { Text("Lineup") })
                                Tab(selected = squadSubTab == 2, onClick = { squadSubTab = 2 }, text = { Text("Tactics") })
                                Tab(selected = squadSubTab == 3, onClick = { squadSubTab = 3 }, text = { Text("Finances") })
                                Tab(selected = squadSubTab == 4, onClick = { squadSubTab = 4 }, text = { Text("Stats") })
                            }
                            when (squadSubTab) {
                                0 -> RosterScreen(viewModel = viewModel)
                                1 -> LineupScreen(viewModel = viewModel)
                                2 -> TacticsScreen(viewModel = viewModel)
                                3 -> FinancesScreen(viewModel = viewModel)
                                4 -> TeamStatsScreen(viewModel = viewModel)
                            }
                        }
                    }

                    PrimaryTab.LEAGUE -> {
                        Column(modifier = Modifier.fillMaxSize()) {
                            TabRow(selectedTabIndex = leagueSubTab) {
                                Tab(selected = leagueSubTab == 0, onClick = { leagueSubTab = 0 }, text = { Text("Standings") })
                                Tab(selected = leagueSubTab == 1, onClick = { leagueSubTab = 1 }, text = { Text("Schedule") })
                                Tab(selected = leagueSubTab == 2, onClick = { leagueSubTab = 2 }, text = { Text("Leaders") })
                            }
                            when (leagueSubTab) {
                                0 -> StandingsScreen(viewModel = viewModel, onNavigateToTeamDetail = { viewingTeamDetailId = it })
                                1 -> ScheduleScreen(viewModel = viewModel)
                                2 -> LeagueStatsScreen(viewModel = viewModel)
                            }
                        }
                    }

                    PrimaryTab.OFFICE -> {
                        Column(modifier = Modifier.fillMaxSize()) {
                            TabRow(selectedTabIndex = officeSubTab) {
                                Tab(selected = officeSubTab == 0, onClick = { officeSubTab = 0 }, text = { Text("Trade") })
                                Tab(selected = officeSubTab == 1, onClick = { officeSubTab = 1 }, text = { Text("Free Agents") })
                                Tab(selected = officeSubTab == 2, onClick = { officeSubTab = 2 }, text = { Text("Draft") })
                                Tab(selected = officeSubTab == 3, onClick = { officeSubTab = 3 }, text = { Text("Challenges") })
                            }
                            when (officeSubTab) {
                                0 -> TradeScreen(viewModel = viewModel)
                                1 -> FreeAgencyScreen(viewModel = viewModel)
                                2 -> DraftScreen(viewModel = viewModel)
                                3 -> ChallengesScreen(viewModel = viewModel)
                            }
                        }
                    }
                }
            }
        }
    }
}
