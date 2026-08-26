package com.basketmanager.re.ui.navigation

import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavType
import androidx.navigation.compose.*
import androidx.navigation.navArgument
import com.basketmanager.re.ui.screens.*
import com.basketmanager.re.ui.viewmodel.GameDashboardViewModel
import com.basketmanager.re.ui.viewmodel.MainViewModel

sealed class Screen(val route: String) {
    data object MainMenu : Screen("main_menu")
    data object SelectTeam : Screen("select_team/{gameName}") {
        fun createRoute(gameName: String) = "select_team/$gameName"
    }
    data object GameDashboard : Screen("game_dashboard/{gameId}") {
        fun createRoute(gameId: Long) = "game_dashboard/$gameId"
    }
}

enum class DashboardTab(val title: String, val icon: androidx.compose.ui.graphics.vector.ImageVector) {
    HOME("Home", Icons.Default.Home),
    ROSTER("Roster", Icons.Default.People),
    LINEUP("Lineup", Icons.Default.FormatListNumbered),
    TACTICS("Tactics", Icons.Default.Tune),
    STANDINGS("Standings", Icons.Default.Leaderboard),
    TRADE("Trade", Icons.Default.SwapHoriz),
    MARKET("Market", Icons.Default.ShoppingBag)
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

            var currentTab by remember { mutableStateOf(DashboardTab.HOME) }

            Scaffold(
                bottomBar = {
                    NavigationBar {
                        DashboardTab.entries.forEach { tab ->
                            NavigationBarItem(
                                icon = { Icon(tab.icon, contentDescription = tab.title) },
                                label = { Text(tab.title) },
                                selected = currentTab == tab,
                                onClick = { currentTab = tab }
                            )
                        }
                    }
                }
            ) { padding ->
                androidx.compose.foundation.layout.Box(modifier = Modifier.padding(padding)) {
                    when (currentTab) {
                        DashboardTab.HOME -> DashboardScreen(
                            viewModel = dashboardViewModel,
                            onNavigateToRoster = { currentTab = DashboardTab.ROSTER },
                            onNavigateToStandings = { currentTab = DashboardTab.STANDINGS }
                        )
                        DashboardTab.ROSTER -> RosterScreen(viewModel = dashboardViewModel)
                        DashboardTab.LINEUP -> LineupScreen(viewModel = dashboardViewModel)
                        DashboardTab.TACTICS -> TacticsScreen(viewModel = dashboardViewModel)
                        DashboardTab.STANDINGS -> StandingsScreen(viewModel = dashboardViewModel)
                        DashboardTab.TRADE -> TradeScreen(viewModel = dashboardViewModel)
                        DashboardTab.MARKET -> FreeAgencyScreen(viewModel = dashboardViewModel)
                    }
                }
            }
        }
    }
}
