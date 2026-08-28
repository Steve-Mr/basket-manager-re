# Phase 6: Core Engine Realism, Interactive UX, and Scouting Draft Board

This phase addresses comprehensive QA feedback to refine simulation pace, injury moderation, interactive navigation, player stats presentation, and new custom rookie draft features.

---

## 1. League Matches Display on Dashboard
- **Problem**: Matches were rendered with generic `"Game #id"` placeholders lacking team identities and context.
- **Solution**:
  - Replaced with rich match fixtures: `[Visitor Team Name] (W-L) @ [Home Team Name] (W-L)`.
  - Displays final scores when played (`108 - 99`) and "TONIGHT / UPCOMING" tags before simulation.
  - Highlights user's game with container styling.
  - Tapping any completed match directly loads and opens the **Match Box Score Dialog**.

---

## 2. Interactive News System & Extended History
- **Problem**: News was capped and non-interactive.
- **Solution**:
  - Retained full season news history.
  - Made news cards actionable:
    - Injury / Recovery / Development news items open the player's detail card (`PlayerDetailBottomSheet`).
    - Victory / Defeat / Playoff news items open the corresponding match box score.

---

## 3. Authentic Injury Probability & Squad Protection
- **Problem**: Players were getting injured too frequently during matches.
- **Root Cause & Alignment**:
  - Original BM15 `Simulate.java` enforces that injuries during matches only trigger if `team.healthyCount > 12` (`team.getMoreInjuries()`).
  - First roll results in `-1` (day-to-day / rest remainder of match). Only repeated rolls convert to multi-day injuries.
  - Implemented this exact protection rule in `MatchSimulationEngine.kt`.

---

## 4. Realistic NBA Scoring Pace
- **Problem**: Total possessions (120 total) yielded ~65-75 points per team.
- **Solution**:
  - Adjusted total possessions to 190 (~95 possessions per team), matching modern NBA pace and producing realistic final scores in the 95-115 range.

---

## 5. Upcoming Rookie Draft Scouting Board & Pick Ownership
- **Problem**: The draft screen previously lacked a dedicated scouting class view during the season.
- **Solution**:
  - Designed an **Upcoming Rookie Draft Hub** with 2 comprehensive tabs:
    - **Draft Big Board**: 60-90 top incoming collegiate & international prospects ranked #1 through #60 with Projected Pick (Top 3, Lottery Top 14, 1st Round, 2nd Round), Age, Potential (★4 to ★10), Overall Rating, and Position.
    - **Pick Ownership**: Tracks Round 1 and Round 2 draft pick ownership across all 30 NBA franchises, highlighting traded picks and user franchise picks.

---

## 6. Integer Ratings & Season Statistics Presentation
- **Problem**: Player ratings contained floating point decimals, and individual season averages were not visible.
- **Solution**:
  - Enforced clean integer rounding across all rating badges and attributes (`overallRating: Int`).
  - Added full **Season Statistics** display to `PlayerDetailBottomSheet`:
    - `GP` (Games Played), `PPG` (Points Per Game), `RPG` (Rebounds Per Game), `APG` (Assists Per Game), `SPG` (Steals Per Game), `BPG` (Blocks Per Game), `PER` (Player Efficiency Rating).

---

## 7. Position-Specific Top 100 Rankings
- **Problem**: Selecting a position filter previously only showed players within the overall Top 100 who played that position.
- **Solution**:
  - Filtering by position (e.g., `PG`) now queries all Point Guards across the entire league, sorts them, and displays the **Top 100 Point Guards in the NBA**.

---

## 8. Grouped Team Box Scores
- **Problem**: Post-match box scores listed players from both teams in a single mixed table.
- **Solution**:
  - Segmented the box score into distinct **Visitor Team** and **Home Team** tabs/sections with individual minutes, shooting splits, box score stats, and PER.
