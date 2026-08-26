package top.maary.basketmanager.re.ui.navigation

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavType
import androidx.navigation.compose.*
import androidx.navigation.navArgument
import kotlinx.coroutines.launch
import top.maary.basketmanager.re.ui.screens.*
import top.maary.basketmanager.re.ui.viewmodel.GameDashboardViewModel
import top.maary.basketmanager.re.ui.viewmodel.MainViewModel

sealed class Screen(val route: String) {
    data object MainMenu : Screen("main_menu")
    data object SelectTeam : Screen("select_team/{gameName}") {
        fun createRoute(gameName: String) = "select_team/$gameName"
    }
    data object GameDashboard : Screen("game_dashboard/{gameId}") {
        fun createRoute(gameId: Long) = "game_dashboard/$gameId"
    }
}

enum class PrimaryTab(val title: String, val icon: androidx.compose.ui.graphics.vector.ImageVector) {
    HOME("Home", Icons.Default.Home),
    SQUAD("Squad", Icons.Default.Group),
    LEAGUE("League", Icons.Default.EmojiEvents),
    OFFICE("Office", Icons.Default.BusinessCenter)
}

@Composable
fun AppNavigation() {
    val navController = rememberNavController()
    val mainViewModel: MainViewModel = viewModel()

    NavHost(
        navController = navController,
        startDestination = Screen.MainMenu.route
    ) {
        composable(Screen.MainMenu.route) {
            MainMenuScreen(
                viewModel = mainViewModel,
                onNavigateToSelectTeam = { name ->
                    navController.navigate(Screen.SelectTeam.createRoute(name))
                },
                onNavigateToGame = { gameId ->
                    navController.navigate(Screen.GameDashboard.createRoute(gameId))
                }
            )
        }

        composable(
            route = Screen.SelectTeam.route,
            arguments = listOf(navArgument("gameName") { type = NavType.StringType })
        ) { backStackEntry ->
            val gameName = backStackEntry.arguments?.getString("gameName") ?: "My Franchise"
            SelectTeamScreen(
                gameName = gameName,
                viewModel = mainViewModel,
                onBack = { navController.popBackStack() },
                onGameCreated = { gameId ->
                    navController.navigate(Screen.GameDashboard.createRoute(gameId)) {
                        popUpTo(Screen.MainMenu.route) { inclusive = false }
                    }
                }
            )
        }

        composable(
            route = Screen.GameDashboard.route,
            arguments = listOf(navArgument("gameId") { type = NavType.LongType })
        ) { backStackEntry ->
            val gameId = backStackEntry.arguments?.getLong("gameId") ?: 0L
            val dashboardViewModel: GameDashboardViewModel = viewModel()

            LaunchedEffect(gameId) {
                dashboardViewModel.loadGame(gameId)
            }

            MainGameDashboardScaffold(
                viewModel = dashboardViewModel,
                onExitToMainMenu = {
                    navController.popBackStack(Screen.MainMenu.route, inclusive = false)
                }
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MainGameDashboardScaffold(
    viewModel: GameDashboardViewModel,
    onExitToMainMenu: () -> Unit
) {
    val game by viewModel.game.collectAsState()
    val userTeam by viewModel.userTeam.collectAsState()
    val drawerState = rememberDrawerState(initialValue = DrawerValue.Closed)
    val scope = rememberCoroutineScope()

    var primaryTab by remember { mutableStateOf(PrimaryTab.HOME) }
    var squadSubTab by remember { mutableStateOf(0) } // 0: Roster, 1: Lineup, 2: Tactics, 3: Finances
    var leagueSubTab by remember { mutableStateOf(0) } // 0: Standings, 1: Schedule, 2: Leaders
    var officeSubTab by remember { mutableStateOf(0) } // 0: Trade, 1: Free Agency, 2: Draft, 3: Challenges

    ModalNavigationDrawer(
        drawerState = drawerState,
        drawerContent = {
            ModalDrawerSheet {
                Spacer(modifier = Modifier.height(16.dp))
                Column(modifier = Modifier.padding(horizontal = 16.dp)) {
                    Text(
                        text = "Basket Manager 2015",
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "Franchise: ${userTeam?.name ?: "N/A"} • Season ${game?.currentSeason ?: 1} Day ${game?.currentMatchday ?: 1}",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                HorizontalDivider(modifier = Modifier.padding(vertical = 12.dp))

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.Home, contentDescription = null) },
                    label = { Text("Dashboard (Play)") },
                    selected = primaryTab == PrimaryTab.HOME,
                    onClick = {
                        primaryTab = PrimaryTab.HOME
                        scope.launch { drawerState.close() }
                    }
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.People, contentDescription = null) },
                    label = { Text("Team Roster") },
                    selected = primaryTab == PrimaryTab.SQUAD && squadSubTab == 0,
                    onClick = {
                        primaryTab = PrimaryTab.SQUAD
                        squadSubTab = 0
                        scope.launch { drawerState.close() }
                    }
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.FormatListNumbered, contentDescription = null) },
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
                    label = { Text("Team Tactics") },
                    selected = primaryTab == PrimaryTab.SQUAD && squadSubTab == 2,
                    onClick = {
                        primaryTab = PrimaryTab.SQUAD
                        squadSubTab = 2
                        scope.launch { drawerState.close() }
                    }
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.Leaderboard, contentDescription = null) },
                    label = { Text("League Standings") },
                    selected = primaryTab == PrimaryTab.LEAGUE && leagueSubTab == 0,
                    onClick = {
                        primaryTab = PrimaryTab.LEAGUE
                        leagueSubTab = 0
                        scope.launch { drawerState.close() }
                    }
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.CalendarMonth, contentDescription = null) },
                    label = { Text("Calendar & Schedule") },
                    selected = primaryTab == PrimaryTab.LEAGUE && leagueSubTab == 1,
                    onClick = {
                        primaryTab = PrimaryTab.LEAGUE
                        leagueSubTab = 1
                        scope.launch { drawerState.close() }
                    }
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.Star, contentDescription = null) },
                    label = { Text("Top 100 & Rookie Stats") },
                    selected = primaryTab == PrimaryTab.LEAGUE && leagueSubTab == 2,
                    onClick = {
                        primaryTab = PrimaryTab.LEAGUE
                        leagueSubTab = 2
                        scope.launch { drawerState.close() }
                    }
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
                    label = { Text("Rookie Draft") },
                    selected = primaryTab == PrimaryTab.OFFICE && officeSubTab == 2,
                    onClick = {
                        primaryTab = PrimaryTab.OFFICE
                        officeSubTab = 2
                        scope.launch { drawerState.close() }
                    }
                )

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.EmojiEvents, contentDescription = null) },
                    label = { Text("Championship Challenges") },
                    selected = primaryTab == PrimaryTab.OFFICE && officeSubTab == 3,
                    onClick = {
                        primaryTab = PrimaryTab.OFFICE
                        officeSubTab = 3
                        scope.launch { drawerState.close() }
                    }
                )

                Spacer(modifier = Modifier.weight(1f))
                HorizontalDivider()

                NavigationDrawerItem(
                    icon = { Icon(Icons.Default.ExitToApp, contentDescription = null) },
                    label = { Text("Save & Exit to Menu") },
                    selected = false,
                    onClick = {
                        scope.launch {
                            drawerState.close()
                            onExitToMainMenu()
                        }
                    }
                )
                Spacer(modifier = Modifier.height(16.dp))
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
                NavigationBar {
                    PrimaryTab.entries.forEach { tab ->
                        NavigationBarItem(
                            icon = { Icon(tab.icon, contentDescription = tab.title) },
                            label = { Text(tab.title) },
                            selected = primaryTab == tab,
                            onClick = { primaryTab = tab }
                        )
                    }
                }
            }
        ) { innerPadding ->
            Box(modifier = Modifier.padding(innerPadding)) {
                when (primaryTab) {
                    PrimaryTab.HOME -> {
                        DashboardScreen(
                            viewModel = viewModel,
                            onNavigateToRoster = {
                                primaryTab = PrimaryTab.SQUAD
                                squadSubTab = 0
                            },
                            onNavigateToStandings = {
                                primaryTab = PrimaryTab.LEAGUE
                                leagueSubTab = 0
                            }
                        )
                    }

                    PrimaryTab.SQUAD -> {
                        Column(modifier = Modifier.fillMaxSize()) {
                            PrimaryTabRow(selectedTabIndex = squadSubTab) {
                                Tab(selected = squadSubTab == 0, onClick = { squadSubTab = 0 }, text = { Text("Roster") })
                                Tab(selected = squadSubTab == 1, onClick = { squadSubTab = 1 }, text = { Text("Lineup") })
                                Tab(selected = squadSubTab == 2, onClick = { squadSubTab = 2 }, text = { Text("Tactics") })
                                Tab(selected = squadSubTab == 3, onClick = { squadSubTab = 3 }, text = { Text("Finances") })
                            }
                            when (squadSubTab) {
                                0 -> RosterScreen(viewModel = viewModel)
                                1 -> LineupScreen(viewModel = viewModel)
                                2 -> TacticsScreen(viewModel = viewModel)
                                3 -> FinancesScreen(viewModel = viewModel)
                            }
                        }
                    }

                    PrimaryTab.LEAGUE -> {
                        Column(modifier = Modifier.fillMaxSize()) {
                            PrimaryTabRow(selectedTabIndex = leagueSubTab) {
                                Tab(selected = leagueSubTab == 0, onClick = { leagueSubTab = 0 }, text = { Text("Standings") })
                                Tab(selected = leagueSubTab == 1, onClick = { leagueSubTab = 1 }, text = { Text("Schedule") })
                                Tab(selected = leagueSubTab == 2, onClick = { leagueSubTab = 2 }, text = { Text("Leaders") })
                            }
                            when (leagueSubTab) {
                                0 -> StandingsScreen(viewModel = viewModel)
                                1 -> ScheduleScreen(viewModel = viewModel)
                                2 -> LeagueStatsScreen(viewModel = viewModel)
                            }
                        }
                    }

                    PrimaryTab.OFFICE -> {
                        Column(modifier = Modifier.fillMaxSize()) {
                            PrimaryTabRow(selectedTabIndex = officeSubTab) {
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
