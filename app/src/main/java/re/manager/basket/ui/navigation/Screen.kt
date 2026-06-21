package re.manager.basket.ui.navigation

sealed class Screen(val route: String) {
    object Dashboard : Screen("dashboard")
    
    // Hubs
    object FranchiseHub : Screen("franchise_hub")
    object FrontOfficeHub : Screen("front_office_hub")
    
    // Details
    object TeamDetail : Screen("team_detail/{teamId}") {
        fun createRoute(teamId: Int) = "team_detail/$teamId"
    }
    
    object PlayerDetail : Screen("player_detail/{playerId}") {
        fun createRoute(playerId: Int) = "player_detail/$playerId"
    }

    object Calendar : Screen("calendar")
    object Standings : Screen("standings")
    object History : Screen("history")
    object DraftScouting : Screen("draft_scouting")
    object FreeAgency : Screen("free_agency")
}
