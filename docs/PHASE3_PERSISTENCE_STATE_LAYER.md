# Phase 3: Persistence & State Management Layer

## 1. Database Architecture & SQLite Schema
The persistence layer provides a strongly-typed, indexed SQLite database managed by `BasketManagerDatabaseHelper`.

### 1.1 Tables and Relations
1. `game_session`: Multi-slot game save manager tracking current season, current matchday, user team, and settings.
2. `team`: 30 NBA teams with conference, division, salary cap, and brand styling.
3. `player`: Roster of all active players, free agents, and draft prospects with 8 core skills, energy, form, and injury status.
4. `tactic`: Team strategy, rotation depth (bench importance 1..5), 5 starters, 5 reserves, and top 3 star assignments.
5. `matches`: 82-game regular season schedule and playoff fixtures with quarter-by-quarter and overtime scoring.
6. `match_result`: Player box score records with PTS, REB, AST, STL, BLK, FOULS, FG/3PT/FT efficiency, and PER.
7. `standings`: Real-time standings tracking W/L, points scored, points allowed, and point differentials.
8. `playoff_series`: Best-of-7 playoff tree tracking rounds, seeds, and series wins.
9. `news`: Chronological news feed for alerts, awards, injuries, trades, and milestones.
10. `draft_pick`: Round 1 & Round 2 tradable draft assets.
11. `challenge`: 30-franchise championship achievement tracker.

---

## 2. Repository Pattern (`GameRepository`)
- Asynchronous coroutine-based data access (`withContext(Dispatchers.IO)`).
- Complete transactional integrity (`db.beginTransaction()`) during game initialization, day advancement, and trade execution.
- High-performance indexed querying on `(gameId, teamId)`, `(gameId, matchday)`, and `(gameId, playerId)`.
- Full integration with procedural roster parsing, schedule generation, match simulation, trade machine, draft lottery, and off-season contract management.
