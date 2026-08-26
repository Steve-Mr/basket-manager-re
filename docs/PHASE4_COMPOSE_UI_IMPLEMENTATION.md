# Phase 4: Modern Jetpack Compose UI & Screen Workflows

## 1. UI Architecture & Design System (Material 3)
The entire user interface is rebuilt in 100% declarative Jetpack Compose using modern Material Design 3 guidelines:
- **Theme & Colors**: Full support for dynamic dark and light mode, team color branding, and tiered rating badge colors (Green 85+, Blue 78+, Yellow 70+, Orange 60+, Red <60).
- **Navigation Architecture**: `AppNavigation` using Navigation Compose with type-safe routing:
  - `Screen.MainMenu` -> Main landing screen with save slot loader and new game creator.
  - `Screen.SelectTeam` -> 30-team franchise picker with conference filters (All/East/West), cap details, and brand badges.
  - `Screen.GameDashboard` -> Root franchise control hub with Material 3 Navigation Bar (Home, Roster, Lineup, Tactics, Standings, Trade Machine, Free Agency Market).

---

## 2. Screen Workflows & Features

### 2.1 Main Menu & Team Selection
- **New Game Dialog**: Prompt for custom franchise save name.
- **Save Management**: Saved games list with season, matchday, and one-click delete / continue.
- **Team Picker Grid**: 30 NBA teams categorized by conference and division with salary cap indicators.

### 2.2 Dashboard & Simulation Hub
- Matchday progress card (e.g. "Matchday 42 of 234").
- Today's matchup preview with team names and scores.
- **One-Click Simulate Day**: Instant simulation of the daily fixtures with animated progress feedback.
- **Fast Forward**: Multi-day simulation dialog.
- Today's league score recaps and live news feed.

### 2.3 Roster & Lineup Management
- **Roster Overview**: Filterable and sortable player table by OVR, Pos, Age, Salary, and Potential.
- **Player Detail Bottom Sheet**: Modal inspecting 8 core basketball attributes (Physique, Paint Shot, Perimeter, Free Throw, Playmaking, Rebounding, Steals, Blocks), contract length, salary, energy, form, and injury status.
- **Lineup Depth Chart**: Visual Starter 5 (PG, SG, SF, PF, C), Reserve 5 (PG, SG, SF, PF, C), and Star 1/2/3 player bonus indicators.
- **1-Click Auto Lineup**: Instant algorithmic rotation optimizer.

### 2.4 Strategy & Tactics
- **Pace Slider**: -2 (Very Conservative) to +2 (Aggressive Run & Gun).
- **Bench Depth Slider**: 1 to 5 rotation scale managing player fatigue and minutes distribution.
- **Shot Distribution Sliders**: Paint attack percentage vs 3-point attempt percentage.

### 2.5 Standings, Trade Machine & Free Agency
- **Standings**: League-wide, Eastern Conference, and Western Conference tables with W, L, Win%, Diff, and playoff qualifying cutoffs.
- **Trade Machine**: Interactive two-team trade builder supporting up to 3 players + picks per side with real-time value and salary cap compliance validation.
- **Free Agency Market**: Position-filtered market browser with expected salary valuation and contract negotiations.
- **Rookie Draft Board**: Full scouting report for rookie prospects with potential and skill breakdowns.
