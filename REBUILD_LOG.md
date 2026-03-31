# BasketManager2015 Modernization - Rebuild Log

This document serves as a persistent record of the modernization process for BasketManager2015. It tracks analysis findings, logic mapping, and project progress to ensure continuity across multiple development sessions.

## Project Vision
Modernize the original "BasketManager2015" (BM2015) by rewriting it from scratch using modern Android technologies (Kotlin, Jetpack Compose, Room) while preserving the core gameplay and assets.

## Roadmap

### Phase 1: Discovery (Current)
- [x] Decompile APK and extract resources (Completed in previous session).
- [x] Document SQLite Database Schema.
- [x] Map Core Game Logic (Match simulation, player growth, etc.).
- [x] Audit and catalog game assets.
- [x] Finalize Phase 1 documentation in `REBUILD_LOG.md`.

### Phase 2: Foundation
- [ ] Initialize new Android project (Kotlin, Compose, Material 3).
- [ ] Implement Room Database based on documented schema.
- [ ] Implement Database Export/Import functionality (High Priority).
- [ ] Set up basic navigation and placeholder screens.

### Phase 3: Logic Migration
- [ ] Implement player and team data models.
- [ ] Port match simulation engine (`Simulate.java`, `Play.java`).
- [ ] Port season management and draft logic.
- [ ] Port player development and free agency logic.
- [ ] Verify logic with unit tests to match original game balance.

### Phase 4: Modernization & UI
- [ ] Build Material 3 UI with Jetpack Compose.
- [ ] Implement Documents Provider for external database access.
- [ ] Performance optimization and bug fixes (addressing original memory leaks).
- [ ] Final polish and testing.

---

## Analysis Findings

### Database Structure (Room Entities Mapping)

The original app uses a custom ORM where objects inherit from `BlankBase`. Below is the suggested mapping for the new Room entities.

| Entity | Fields | Notes |
| :--- | :--- | :--- |
| **Game** | `id`, `currentMatchday`, `currentSeason`, `name`, `userTeamId` | Root state of a save game. |
| **Team** | `id`, `color`, `conference`, `division`, `fullName`, `gameId`, `name`, `salaryCap` | 30 Teams. |
| **Player** | `id`, `age`, `gameId`, `loyalty`, `name`, `positionFirst`, `positionSecond`, `potential`, `salary`, `skillBlock`, `skillPass`, `skillPhysique`, `skillRebound`, `skillShotExterior`, `skillShotFree`, `skillShotInterior`, `skillSteal`, `stateEnergy`, `stateForm`, `stateInjury`, `teamId`, `yearsContract`, `yearsExperience` | Main actors. Positions: 1-PG, 2-SG, 3-SF, 4-PF, 5-C. |
| **League** | `id`, `gameId`, `gamesLost`, `gamesWon`, `pointsAllowed`, `pointsScored`, `teamId` | Tracks season standings per team. |
| **Match** | `id`, `gameId`, `localExtension`, `localQ1`, `localQ2`, `localQ3`, `localQ4`, `matchday`, `name`, `teamLocalId`, `teamVisitorId`, `visitorExtension`, `visitorQ1`, `visitorQ2`, `visitorQ3`, `visitorQ4` | Individual game results. |
| **MatchResult** | `id`, `blocks`, `foulsMade`, `gameId`, `matchId`, `matchday`, `minutesPlayed`, `name`, `passesKo`, `passesOk`, `playerId`, `rebounds`, `shotsExt2Ko`, `shotsExt2Ok`, `shotsExt3Ko`, `shotsExt3Ok`, `shotsFreeKo`, `shotsFreeOk`, `shotsIntKo`, `shotsIntOk`, `steals` | Box score entries for players. |
| **Tactic** | `id`, `gameId`, `resC`, `resPG`, `resPF`, `resSG`, `resSF`, `titC`, `titPG`, `titPF`, `titSG`, `titSF`, `benchImportance`, `gameType`, `shotInt%`, `shotTriple%`, `star1`, `star2`, `star3`, `teamId` | Team lineups and strategies. |

### Core Logic Mapping

#### Match Simulation Engine (`Simulate.java`)
1. **Preparation**: AI teams auto-pick lineups. Calculate match modifiers:
    - **Home Court**: +1 base (+2 in playoffs).
    - **Star Players**: Bonus for skills >= 90 adds to team modifier.
    - **Bono Age/All**: Difference between team averages / 2.
    - **Individual Modifier**: `TacticGameType + teamModifier + playerPenalty`.

2. **Simulation Loop**: 120 possessions per match (standard). Extensions of 5 possessions if tied.
3. **Possession Flow**:
    - **Injury Check**: Probability `4/100`. If triggered, check `(Energy * (Physique + Modifier)) / 100` against random roll.
    - **Steal Check**: `Steal + Modifier` vs roll (0.5f modifier).
    - **Turnover Check**: `Pass + Modifier` vs roll (0.6f modifier).
    - **Shot Selection**: Based on team Tactic (ShotInt%, ShotTriple%).
    - **Block Check**: `Block + Modifier + Gauss(0,100)` vs `Gauss(0,100) + ShotValue`.
    - **Shot Success**: `accomplishedAction(ShotValue, Modifier)` where Modifier is 0.65 (Int), 0.55 (2P), 0.45 (3P).
    - **Rebounds**: Triggered on miss (76% attempt). `Rebound + Modifier + Gauss(0,100)` comparison.
4. **Post-Match**:
    - Update League standings.
    - **Energy/Form**:
        - Titulars: Form +(6-benchImp to 11-benchImp), Energy -(7-benchImp to 12-benchImp).
        - Reserves: Form +(benchImp-5 to benchImp), Energy -(benchImp-2 to benchImp+3).

#### Player Formulas (`Player.java`, `Util.java`)
- **Average Skill**: Position-weighted average.
    - Weights defined in `getBaseOfPosition(position, skill)`.
    - Example: Center (Pos 5) Physique weight = 31, PG (Pos 1) Physique weight = 25.
- **Penalty Calculation**:
    - If Position != First: -2 (if Second) or -7.
    - Form/Energy < 80: -1, < 60: -2, < 40: -4, < 20: -8.
- **Valuation (`getValue`)**: `(AverageSkillAll + Potential * 2) - (Age / 2)`.
- **Market Value**: `(((Value - 70)^2 / 4) - (Salary / 2.5M + (Age-18)^2 / 15)) + 10`.

### Asset Catalog
- **Roster Data**: `decoded_apk/res/raw/rosters.csv` - Contains all initial player data and team assignments.
- **UI Icons**: `decoded_apk/res/drawable-*` - Contains all game icons (news categories, injuries, trophies).
