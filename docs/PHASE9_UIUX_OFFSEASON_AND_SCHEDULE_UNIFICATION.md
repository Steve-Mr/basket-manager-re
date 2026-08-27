# Phase 9: UI/UX Refinements, Unified Playoff Schedule & Offseason Center

## 1. Problem Addressed
1. **Screen Margins & Spacing**: Multiple screens had excessive nested margins from double padding and redundant Spacers.
2. **Navigation Drawer Scrolling**: Side navigation drawer was unscrollable on smaller displays and cut off items at the bottom.
3. **System Back Navigation**: App did not handle system gesture back navigation (e.g. closing drawer, closing team details, or returning to Home).
4. **Playoff Box Scores & Win/Loss Visuals**: Playoff match results were saved without linking `matchId` to player results (resulting in empty box scores), and playoff news was missing green/red victory/defeat badges.
5. **Unified Regular Season & Playoff Schedule**: Postseason series fixtures and matches were missing from the primary schedule browser.
6. **Dedicated Offseason Hub & BM15 Contract Negotiation**: Expiring contract negotiations, draft, and free agency lacked a dedicated guided workflow with authentic player acceptance calculations based on loyalty and salary tiers.

## 2. Solution & Implementation

### 2.1 Navigation & System Back Handling ([`AppNavigation.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/navigation/AppNavigation.kt))
- Integrated `BackHandler` supporting hierarchical back navigation:
  1. Closes open navigation drawer.
  2. Dismisses secondary detail screens (e.g. `TeamDetailScreen`).
  3. Returns to `PrimaryTab.HOME`.
- Wrapped navigation drawer sheet in `Modifier.verticalScroll(rememberScrollState())` to support smooth vertical scrolling on all screen sizes and orientations.
- Standardized inner screen paddings to `PaddingValues(horizontal = 16.dp, vertical = 10.dp)` across all tabs.

### 2.2 Playoff Match Result Linkage & News Win/Loss Visuals ([`GameRepositoryImpl.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/data/repository/GameRepositoryImpl.kt), [`MatchSimulationEngine.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/domain/engine/MatchSimulationEngine.kt))
- Attached the generated `insertedMatchId` to each `MatchResultEntity` when simulating playoff games so `getMatchBoxScores(match.id)` successfully queries and displays all player stats.
- Formatted playoff match news titles as `Playoffs Victory: ...` and `Playoffs Defeat: ...` with appropriate `RatingGreen` and `RatingRed` visual styling in `DashboardScreen.kt`.

### 2.3 Unified Regular Season & Playoffs Schedule ([`ScheduleScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/ScheduleScreen.kt))
- Added stage switcher: **[Regular Season (82G)]** vs **[Playoffs Series]**.
- Automatically switches to Postseason tab when `matchday > 166`.
- Displays complete postseason match logs with click-to-box-score functionality.

### 2.4 Dedicated Offseason Center ([`OffseasonScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/OffseasonScreen.kt))
- Multi-step guided wizard for Matchdays 226..234:
  1. **Veterans Retirements**: Review players hanging up their jerseys.
  2. **Contract Renewals**: Interactive contract negotiation dialog allowing custom contract years (1..5) and salary offers with authentic acceptance formula:
     $$\text{Tier} = \begin{cases} 4 & \text{if } \text{ratio} \ge 1.20 \\ 3 & \text{if } \text{ratio} \ge 1.05 \\ 2 & \text{if } \text{ratio} \ge 0.95 \\ 1 & \text{if } \text{ratio} \ge 0.85 \\ 0 & \text{otherwise} \end{cases}$$
     $$\text{Acceptance Roll} \sim \mathcal{U}(0, 10) \le (\text{Loyalty} + \text{Tier})$$
  3. **Rookie Draft Hub**: Select rookie prospects when on the clock.
  4. **Free Agency Market**: Sign remaining free agents before season kickoff.
  5. **Season N+1 Kickoff**: Advances to Day 1 of the new season with new schedule and clean standings.
- Dashboard highlights an Offseason Banner when active.
