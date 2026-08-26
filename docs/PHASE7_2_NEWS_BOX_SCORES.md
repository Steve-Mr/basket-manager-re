# Phase 7.2: Match News Visuals, Detailed Leaders, and Grouped Box Scores

## 1. Problem Addressed
- Unclear win/loss visual indicators in news feed.
- News summary only contained MVP without full statistical leaders.
- Clicking match news opened player detail rather than match box scores.
- Box score players were mixed together without distinction between Starters and Reserves.

## 2. Solution & Implementation
- **Visual News Cards ([`DashboardScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/DashboardScreen.kt))**:
  - Distinct borders and containers: Green for Victory, Red for Defeat, Amber/Error for Injury.
  - Tapping match news directly fetches and opens the **Match Box Score Dialog**.
- **Detailed Statistical Summaries ([`MatchSimulationEngine.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/domain/engine/MatchSimulationEngine.kt))**:
  - News bodies now include MVP, Top Scorer (PTS), Top Rebounder (REB), Top Passer (AST), Top Blocker (BLK), and Top Stealer (STL).
- **Grouped Box Scores ([`Components.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/components/Components.kt))**:
  - Box Score dialog splits each team into **Starters (首发五虎)** and **Bench Rotation (替补轮换)** with comprehensive stats.
