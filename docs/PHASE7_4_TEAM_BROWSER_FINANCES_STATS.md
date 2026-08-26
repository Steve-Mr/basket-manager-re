# Phase 7.4: 30-Team Browser, Integer Financials, and Season Performance Cards

## 1. Problem Addressed
- Inability to inspect other 29 NBA teams' rosters, starting lineups, and results.
- Excessive decimals in financial figures.
- Top 100 ranking items redundantly displayed ratings twice.
- Player season statistics were showing as 0 due to unpassed stats mapping.

## 2. Solution & Implementation
- **Comprehensive Team Browser ([`TeamDetailScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/TeamDetailScreen.kt))**:
  - Lets players explore any of the 30 NBA franchises:
    - Squad Roster with ratings, potential, contracts, and player detail popups.
    - Starting Five & Bench Rotation breakdown.
    - 82-Game Season Schedule & match results with clickable box scores.
  - Connected via today's opponent card on Dashboard and team rows on Standings.
- **Integer Financial Formatting ([`FinancesScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/FinancesScreen.kt))**:
  - Clean integer notation (`$70M`, `$12M/yr`, `$850K/yr`) without floating-point decimals.
- **Deduplicated Top 100 Layout & Season Performance Cards ([`LeagueStatsScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/LeagueStatsScreen.kt), [`ViewModels.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/viewmodel/ViewModels.kt))**:
  - Cleaned ranking item layout to show Rank Badge -> Rating Badge -> Name -> Position & Team -> Stat/Potential.
  - Mapped `PlayerSeasonStats` throughout all screens so player popups display authentic GP, PPG, RPG, APG, SPG, BPG, and PER.
