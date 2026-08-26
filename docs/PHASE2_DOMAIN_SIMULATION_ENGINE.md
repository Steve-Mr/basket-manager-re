# Phase 2: Domain Model & Simulation Engine Documentation

## 1. Architectural Design & Domain Layer
The Domain layer is completely independent of Android framework dependencies, utilizing pure Kotlin data classes and modular calculation engines.

### 1.1 Core Domain Models
- `Player`: Models 8 core skills, positional attributes, contract length, salary, loyalty, form, energy, injury status, and computed metrics (overall, attack, defense ratings, market values, and in-game penalties).
- `Team`: Represents 30 NBA teams mapped to East / West conferences and 6 divisions (Atlantic, Central, Southeast, Southwest, Northwest, Pacific) with authentic primary colors and salary cap limits ($55M - $85M).
- `Tactic`: Strategy configuration with rotation depth, starter & reserve assignments, star bonuses (+3, +2, +1), inside vs perimeter shot sliders, and pace/style sliders.
- `Match` & `MatchResult`: Full fixture and box score models tracking points, rebounds, assists, steals, blocks, fouls, field goal accuracy, free throws, and PER.
- `StandingsItem` & `PlayoffSeries`: Standings with win%, point differentials, games behind, and best-of-7 playoff series tree.
- `NewsItem`, `DraftPick`, `TradeProposal`, `GameSession`, `ChallengeAchievement`: Supporting models for franchise operations.

---

## 2. Core Simulation & Algorithmic Engines

### 2.1 `MatchSimulationEngine`
- Simulates 120 possessions per game with realistic NBA tempo.
- Starter / bench minute allocation based on `benchImportance` (1..5).
- Multi-phase possession resolution:
  - Steal & Turnover checks
  - Assist modifiers (+5% shot accuracy)
  - Inside vs Exterior 2PT vs 3PT shot distribution
  - Defensive contest & Block rolls
  - Shooting fouls and And-1 free throws
  - Rebound battles (75% defensive, 25% offensive)
  - Overtime rules (extra possessions per tie)
  - Post-match fatigue, energy consumption, and form progression

### 2.2 `LineupOptimizer`
- Analyzes team roster by primary and secondary positions.
- Assigns optimal starting 5 and reserve 5 based on match values, energy levels, and positional suitability.
- Auto-assigns the top 3 stars of the franchise.

### 2.3 `DraftEngine`
- Generates 90 rookie prospects per season with procedural names, potentials, and attribute archetypes.
- Easter egg legendary prospects (Jordan, Bird, Magic, Shaq, LeBron, Duncan, etc.).
- Authentic rookie-scale contract salary tables for Round 1 (picks 1..30) and Round 2.

### 2.4 `FreeAgencyEngine`
- Calculates player salary expectations based on rating, age, and potential.
- AI team evaluation: identifies positional gaps, cap space, and submits market offers.

### 2.5 `TradeEvaluationEngine`
- Multi-asset player and draft pick valuation.
- Enforces strict roster sizes (12..20 players) and salary cap compliance.
- Realistic AI acceptance threshold based on relative value ratios.

### 2.6 `PlayerDevelopmentEngine` & `PlayoffsEngine`
- Age-dependent attribute progression (youth growth vs veteran physical decline).
- Retirement probability calculations.
- Playoff bracket generation for top 8 seeds per conference with series advancement logic.

---

## 3. Unit Test Verification
- All test suites in `app/src/test/java/com/basketmanager/re/engine/SimulationEngineTest.kt` validate:
  - Player rating calculations and market valuations.
  - Draft prospect generation within valid ranges.
  - Lineup optimization and depth chart validation.
  - Full match simulation with realistic scores and box scores.
  - Trade evaluation and fairness checks.
