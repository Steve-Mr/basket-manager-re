package re.manager.basket.ui.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import re.manager.basket.ui.screen.DashboardHubScreen
import re.manager.basket.ui.screen.FranchiseHubScreen
import re.manager.basket.ui.screen.FrontOfficeHubScreen
import re.manager.basket.ui.viewmodel.GameViewModel
import re.manager.basket.ui.viewmodel.PlayerListViewModel
import re.manager.basket.ui.viewmodel.MarketViewModel
import re.manager.basket.ui.viewmodel.LeagueViewModel

import re.manager.basket.ui.screen.CalendarScreen
import re.manager.basket.ui.screen.TeamDetailScreen
import re.manager.basket.ui.screen.PlayerDetailScreen
import re.manager.basket.ui.screen.LeagueScreen
import re.manager.basket.ui.screen.MarketScreen
import androidx.navigation.NavType
import androidx.navigation.navArgument
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue

@Composable
fun BasketNavGraph(
    navController: NavHostController,
    gameViewModel: GameViewModel,
    playerListViewModel: PlayerListViewModel,
    marketViewModel: MarketViewModel,
    leagueViewModel: LeagueViewModel,
    startDestination: String = Screen.Dashboard.route
) {
    NavHost(
        navController = navController,
        startDestination = startDestination
    ) {
        composable(Screen.Dashboard.route) {
            DashboardHubScreen(navController = navController, gameViewModel = gameViewModel, leagueViewModel = leagueViewModel)
        }
        
        composable(Screen.FranchiseHub.route) {
            FranchiseHubScreen(navController = navController, gameViewModel = gameViewModel, playerListViewModel = playerListViewModel, leagueViewModel = leagueViewModel)
        }
        
        composable("tactic") {
            re.manager.basket.ui.screen.TacticScreen(navController = navController, gameViewModel = gameViewModel, playerListViewModel = playerListViewModel)
        }
        
        composable(Screen.FrontOfficeHub.route) {
            FrontOfficeHubScreen(navController = navController, gameViewModel = gameViewModel, marketViewModel = marketViewModel, leagueViewModel = leagueViewModel)
        }

        composable("league_players") {
            re.manager.basket.ui.screen.LeaguePlayersScreen(navController = navController, playerListViewModel = playerListViewModel)
        }

        composable("standings") {
            re.manager.basket.ui.screen.StandingsScreen(navController = navController, leagueViewModel = leagueViewModel)
        }

        composable(Screen.DraftScouting.route) {
            val rookies by gameViewModel.draftPlayers.collectAsState()
            
            re.manager.basket.ui.screen.DraftScoutingScreen(
                rookies = rookies,
                onPlayerClick = { playerId -> navController.navigate(Screen.PlayerDetail.createRoute(playerId)) },
                onBack = { navController.popBackStack() }
            )
        }

        composable(Screen.History.route) {
            val historyList by leagueViewModel.history.collectAsState()
            
            re.manager.basket.ui.screen.LeagueHistoryScreen(
                historyList = historyList,
                onBack = { navController.popBackStack() }
            )
        }

        composable(Screen.FreeAgency.route) {
            val gameState by gameViewModel.gameState.collectAsState()
            val players by playerListViewModel.players.collectAsState()
            
            gameState?.let { game ->
                MarketScreen(
                    gameId = game.id,
                    userTeamId = game.userTeamId ?: 1,
                    marketViewModel = marketViewModel,
                    userPlayers = players.map { it.originalEntity },
                    currentMatchday = game.currentMatchday
                )
            }
        }

        composable(Screen.Calendar.route) {
            val gameState by gameViewModel.gameState.collectAsState()
            val allMatches by gameViewModel.allMatches.collectAsState()
            val availableTeams by gameViewModel.availableTeams.collectAsState()
            val selectedCalendarDay by gameViewModel.selectedCalendarDay.collectAsState()
            
            gameState?.let { game ->
                CalendarScreen(
                    matches = allMatches,
                    teams = availableTeams,
                    currentMatchday = game.currentMatchday,
                    selectedDayInitial = selectedCalendarDay,
                    userTeamId = game.userTeamId,
                    onDayClick = { gameViewModel.selectCalendarDay(it) },
                    onMatchClick = { /* Handle Match detail */ },
                    onBack = { navController.popBackStack() }
                )
            }
        }

        composable(
            route = Screen.TeamDetail.route,
            arguments = listOf(navArgument("teamId") { type = NavType.IntType })
        ) { backStackEntry ->
            val teamId = backStackEntry.arguments?.getInt("teamId")
            val availableTeams by gameViewModel.availableTeams.collectAsState()
            val players by gameViewModel.selectedTeamRoster.collectAsState()
            val league by gameViewModel.selectedTeamLeague.collectAsState()
            val tactic by gameViewModel.selectedTeamTactic.collectAsState()
            val draftPicks by gameViewModel.selectedTeamDraftPicks.collectAsState()

            // Load team roster
            androidx.compose.runtime.LaunchedEffect(teamId) {
                if (teamId != null) {
                    gameViewModel.loadTeamRoster(teamId)
                }
            }

            val team = availableTeams.find { it.id == teamId }
            if (team != null) {
                TeamDetailScreen(
                    team = team,
                    league = league,
                    players = players,
                    tactic = tactic,
                    draftPicks = draftPicks,
                    onPlayerClick = { playerId -> navController.navigate(Screen.PlayerDetail.createRoute(playerId)) },
                    onStatsClick = { /* open stats */ },
                    onBack = { navController.popBackStack() }
                )
            }
        }

        composable(
            route = Screen.PlayerDetail.route,
            arguments = listOf(navArgument("playerId") { type = NavType.IntType })
        ) { backStackEntry ->
            val playerId = backStackEntry.arguments?.getInt("playerId")
            val activePlayer by gameViewModel.activePlayer.collectAsState()
            val selectedPlayerStats by gameViewModel.selectedPlayerStats.collectAsState()

            androidx.compose.runtime.LaunchedEffect(playerId) {
                if (playerId != null) {
                    gameViewModel.loadPlayerDetails(playerId)
                }
            }

            if (activePlayer != null) {
                PlayerDetailScreen(
                    player = activePlayer!!,
                    stats = selectedPlayerStats,
                    onTogglePosition = { gameViewModel.togglePlayerPosition(activePlayer!!) },
                    onBack = { 
                        gameViewModel.closePlayerDetails()
                        navController.popBackStack() 
                    }
                )
            }
        }
    }
}
