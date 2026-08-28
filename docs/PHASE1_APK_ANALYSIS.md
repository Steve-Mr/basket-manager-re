# Phase 1: APK Decompilation & Architecture Analysis Report

## 1. Project Overview & APK Metadata
- **Source APK**: `BasketManager2015-40.apk`
- **Application ID**: `com.blank.bm15pro` / `com.blank.bm15`
- **Original Version**: 40 (5.0.1)
- **Genre**: Sports Management Simulation (Basketball General Manager)
- **Target Modernization**: Modern Android Architecture (Kotlin, Jetpack Compose, Material 3, Clean Architecture, Coroutines/Flow, Room Database, StateFlow/MVVM).

---

## 2. Decompilation Analysis Summary

### 2.1 Code Structure & Packages
- `com.blank.bm15.model.object.crud`: Core business entities:
  - `Game`: Represents game state (current season, current matchday 1..234, user team).
  - `Team`: 30 NBA teams across East/West conferences and 6 divisions with salary cap, colors, tactical references.
  - `Player`: Player attributes, contract, salary, age, potential (1..10), energy, form, injury state, 8 core basketball skills.
  - `Match`: Game fixture with quarters (Q1-Q4, OT), home/away teams, final score.
  - `MatchResult`: Box score for a player in a game (minutes, points, rebounds, assists, steals, blocks, fouls, field goals inside/ext/3pt, free throws, PER).
  - `Tactic`: Team game strategy (Game Pace/Style, Bench Importance 1..5, Interior Shot %, 3-Point Shot %, Starting 5, Bench 5, 3 Star players).
  - `Trade`: Multi-asset player + draft pick trade proposal between two franchises.
  - `DraftRound`: Round 1 & Round 2 draft picks owned and traded between teams.
  - `Playoffs`: Playoff series standings and bracket tracking for top 8 seeds in East & West.
  - `Offer`: Contract & trade offers made to players / teams.
  - `News`: Inbox notifications for game recaps, awards, injuries, trades, contract decisions, player development.
  - `Challenge`: 30-team championship achievements.
- `com.blank.bm15.model.core`: Core simulation engines:
  - `Simulate.java`: Detailed possession-by-possession basketball simulation engine.
  - `Play.java`: Season scheduler & day advancement loop.
  - `Lineup.java`: Automatic lineup optimizer & positional depth chart manager.
  - `ManageDraft.java`: Draft lottery, rookie prospect generation, 2-round draft simulation.
  - `ManageFreeAgency.java`: Free agent signing market & CPU AI bidding.
  - `ManageRenewals.java`: Contract extension negotiations & loyalty mechanics.
  - `ManageDevelopment.java`: Player progression / regression & attribute development.
  - `ManagePlayoffs.java`: Playoff bracket progression & best-of-7 series.
  - `ManageSeasons.java`: Year transition, retirements, contract deductions, salary cap updates.
- `com.blank.bm15.model.generator`:
  - `SeasonCalendar.java`: Full 82-game regular season schedule for 30 teams (matchdays 1..166).
  - `Names.java`, `Surnames1.java`, `Surnames2.java`: Procedural player name generator.
- `com.blank.bm15.dao`: Legacy SQLite database layer.

---

## 3. Reverse-Engineered Game Mechanics & Mathematical Models

### 3.1 Player Skills & Positions
- **Positions**:
  - `1`: Point Guard (PG)
  - `2`: Shooting Guard (SG)
  - `3`: Small Forward (SF)
  - `4`: Power Forward (PF)
  - `5`: Center (C)
- **8 Core Skills** (Range 40..99):
  1. Physique (`skillPhysique`)
  2. Block (`skillBlock`)
  3. Steal (`skillSteal`)
  4. Rebound (`skillRebound`)
  5. Pass / Playmaking (`skillPass`)
  6. Interior Scoring / Paint (`skillShotInterior`)
  7. Perimeter Scoring / Mid-range (`skillShotExterior`)
  8. Free Throw (`skillShotFree`)
- **Player Rating Formula**:
  - Attack Average: Weighted sum of Pass, Inside Shot, Exterior Shot, Free Throw divided by positional attack weights.
  - Defense Average: Weighted sum of Physique, Block, Steal, Rebound divided by positional defense weights.
  - Overall Rating: `(Attack + Defense) / 1.5 - 19` (Clamped between 40 and 99).
- **Player Market Value Formula**:
  - Base Value: `Overall + 2 * Potential - Age / 2`
  - Market Value: `((Value - 70)^2 * sign(Value - 70) / 4) - (Salary / 2.5M + (Age - 18)^2 / 15) + 10`
  - Young talent bonus (+Potential for age < 24 and Potential > 8).

### 3.2 Possession-Level Match Simulation Engine
- **Possessions per Game**: 120 possessions alternating between Visitor and Local (plus 5 possessions per Overtime period if tied).
- **Matchday Stages**:
  - Regular Season: Matchdays 1 to 166 (82 games per team).
  - Playoffs: Matchdays 167 to 225 (Conference Quarterfinals, Semifinals, Conference Finals, NBA World Finals).
  - End of Season / Awards: Matchday 226.
  - Contract Renewals: Matchdays 227 to 230.
  - Rookie Draft: Matchdays 231 to 232.
  - Free Agency: Matchday 233.
  - New Season Transition: Matchday 234.
- **Possession Resolution Logic**:
  1. Fatigue & Injury Check based on energy and physique.
  2. Steal Check: Defensive steal attempt with Gaussian random check against offensive ballhandler.
  3. Turnover Check: Bad pass check against passing skill.
  4. Assist Check: Passing skill roll adds +5% to shooter accuracy.
  5. Shot Selection:
     - Inside Shot (Base accuracy 65%) vs Exterior 2PT (55%) vs 3PT (45%).
     - Block attempt check by defender.
     - Shooting foul check (1 FT on made shot, 2/3 FTs on missed shot).
     - Offensive/Defensive Rebound roll on missed shot (with second-chance possession chance if trailing).

### 3.3 Player Progression & Regression
- Development occurs on scheduled intervals based on Player ID and Matchday.
- Young players (<24) with high potential gain skill increments across positional attributes.
- Older players (>30) gradually experience physical attribute decline.
- Rare potential adjustments (+/-1) simulate breakout or bust development.

---

## 4. Modern Android Architecture Strategy

1. **Language & Tooling**: Kotlin 1.9+, Android SDK 35, Jetpack Compose, Gradle Kotlin DSL / Groovy.
2. **UI Toolkit**: 100% Jetpack Compose with Material Design 3 (Cards, Bottom Navigation / Navigation Rails, Top App Bars, Badges, Modals, Progress Indicators, Sliders).
3. **Architecture Pattern**: Clean Architecture + MVVM / MVI with `StateFlow` and Coroutines.
4. **Database & Storage**: Room ORM database with full repository abstraction for type-safe, asynchronous reactive data flows.
5. **Assets**: Reusable graphics and original roster database (`rosters.csv`) bundled and parsed seamlessly.
6. **Multi-Language Support**: Complete English and Chinese localization.
