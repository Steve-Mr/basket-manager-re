# Phase 8: Playoffs Bracket System & Isolated Playoff Statistics

## 1. Objectives & Requirements
1. **Full Playoff Lifecycle Simulation**:
   - Best-of-7 series across all 4 postseason rounds (Round 1: First Round 8-series, Round 2: Conference Semifinals 4-series, Round 3: Conference Finals 2-series, Round 4: NBA Finals 1-series).
   - Authentic 2-2-1-1-1 home court format.
   - NBA Champion crowning, Larry O'Brien trophy awarding to Challenges, and Finals MVP.
2. **Dedicated Interactive Playoffs Screen ([`PlayoffsScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/PlayoffsScreen.kt))**:
   - Interactive East Bracket, West Bracket, and NBA Finals 🏆 tabs.
   - Projected playoff bracket during Regular Season (Days 1..166) vs Live Postseason Bracket (Days 167..225).
   - Tapping any series displays complete game-by-game results with click-to-box-score.
3. **Isolated Regular Season vs Playoff Statistics**:
   - **Split Database Aggregations**:
     - `getAllPlayerRegularStats(gameId)`: aggregates player data from regular season (`matchday <= 166`).
     - `getAllPlayerPlayoffStats(gameId)`: aggregates player data from postseason (`matchday > 166`).
   - **Player Detail Bottom Sheet ([`Components.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/components/Components.kt))**:
     - Toggle between **[Regular Season]** and **[Playoffs]** statistics.
   - **League Leaders Screen ([`LeagueStatsScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/LeagueStatsScreen.kt))**:
     - Filter between Regular Season Statistical Leaders and Playoff Statistical Leaders.
4. **Release APK Production**:
   - Generated signed `app-release.apk` with Darkbag keystore.

## 2. Test Verification
- Added automated unit test suite [`PlayoffsEngineTest.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/test/java/top/maary/basketmanager/re/engine/PlayoffsEngineTest.kt) verifying:
  - 1st Round 1v8, 4v5, 2v7, 3v6 matchups across East and West conferences.
  - Winner determination, score incrementation, and clinching at 4 wins.
  - Conference Semifinals, Conference Finals, and NBA Finals bracket generation.
  - 2-2-1-1-1 home/away court alternation.
- `./gradlew test` completed with 100% success.
- `./gradlew assembleRelease` compiled and generated optimized Release APK (`12MB`).
