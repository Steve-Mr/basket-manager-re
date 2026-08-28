# Phase 5: Authentic Roster Mapping & Modernized UI/UX Architecture

This document details the refinements made in Phase 5 to achieve 100% fidelity with the original BM15 APK mechanics and modern Android design system standards.

---

## 1. Authentic Roster Parsing & Accurate Franchise Assignment
- **Issue Discovered**: In initial CSV parsing, player-to-team matching used name heuristics rather than the explicit CSV column `team`. This caused star players (e.g., Gasol, Howard, Anthony) to be clustered onto LAL or randomly assigned.
- **Root Cause & Solution**: 
  - Column 14 (`team`) of `app/src/main/res/raw/rosters.csv` explicitly specifies franchise 3-letter codes (`BOS`, `CHI`, `HOU`, `NYK`, `LAL`, `GSW`, etc.) or `0` for free agents.
  - Updated [`RosterParser.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/domain/engine/RosterParser.kt) to return `ParsedRosterPlayer(player, teamCode)`.
  - Updated [`GameRepositoryImpl.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/data/repository/GameRepositoryImpl.kt) to assign each player strictly to their authentic franchise (`CHI`: Rose & Gasol; `HOU`: Harden & Howard; `NYK`: Anthony & Calderon; `LAL`: Bryant & Lin; `0`: 106 Free Agents).

---

## 2. Complete UI Suite from Original APK
All missing original views and statistics have been cleanly implemented:
1. **Top 100 & Rookie Rankings ([`LeagueStatsScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/LeagueStatsScreen.kt))**:
   - **Top 100 MVP Race**: Sorted by overall rating and PER.
   - **Rookies of the Year (ROY)**: Filtered for 0 years experience prospects.
   - **Stat Leaders**: PPG, RPG, APG, SPG, BPG, and PER.
2. **Schedule & Matchday Calendar ([`ScheduleScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/ScheduleScreen.kt))**:
   - Filter by Matchday (1..166) or Filter by Franchise.
   - Clickable match cards that pop up full **Box Score Dialogs** with quarter-by-quarter breakdowns and detailed individual box scores.
3. **Select Team Live Roster Preview ([`SelectTeamScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/SelectTeamScreen.kt))**:
   - Shows live squad list of selected team with overall rating, positions, age, potential, and contracts before starting a game.
4. **Franchise Finances ([`FinancesScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/FinancesScreen.kt))**:
   - Total payroll, salary cap limit, cap room, and player contract book.
5. **Championship Challenges ([`ChallengesScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/ChallengesScreen.kt))**:
   - 30 NBA Franchises championship trophy progress.

---

## 3. Navigation Architecture & UX Overhaul
- **Bottom Navigation Refinement**: Simplified from 8 overcrowded tabs into **4 primary tabs**:
  - `Home` (Dashboard & Quick Sim)
  - `Squad` (Sub-tabs: Roster | Lineup | Tactics | Finances)
  - `League` (Sub-tabs: Standings | Schedule | Leaders)
  - `Office` (Sub-tabs: Trade | Free Agency | Draft | Challenges)
- **Modal Navigation Drawer**: Accessible from the top app bar hamburger menu to allow instant 1-tap navigation to any section of the game.

---

## 4. Interactive Lineup & Rotation Management
- **Manual vs Auto-Lineup Option**:
  - Added toggle switch `autoLineupEnabled` in `GameSession`.
  - When ON: Simulation engine runs `LineupOptimizer` before simulating.
  - When OFF: Simulation engine strictly executes matches with the user's manual lineup assignments.
- **Interactive Slot Assignment**:
  - Clicking any starter slot (PG, SG, SF, PF, C) or reserve slot opens a player selection modal sheet.
  - Star selection for Star 1 (+3 bonus), Star 2 (+2 bonus), and Star 3 (+1 bonus).

---

## 5. Roster Screen Layout Fix
- Fixed horizontal button squishing on `RosterScreen.kt` using `Modifier.horizontalScroll(rememberScrollState())` for both position filters and sort options.
