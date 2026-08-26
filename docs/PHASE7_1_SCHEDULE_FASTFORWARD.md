# Phase 7.1: Collision-Free NBA Schedule Engine & Fast-Forward Controls

## 1. Problem Addressed
- Multi-game matchday collisions (teams playing 2-3 games on the same day).
- Static match order across seasons.
- Lack of 1-week/1-month simulation presets.

## 2. Solution & Implementation
- **Authentic Schedule Algorithm ([`SeasonCalendarEngine.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/domain/engine/SeasonCalendarEngine.kt))**:
  - Exactly 82 games per team (16 division, 36 conference non-division, 30 inter-conference) = 1,230 total matches.
  - Placed into 166 matchday buckets ensuring strict **0 duplicate team collisions** on any single matchday (7 to 8 games per day).
  - Seeded per season/game so every new season generates a dynamic, randomized match schedule.
- **Fast-Forward Presets ([`ScheduleScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/ScheduleScreen.kt))**:
  - Fast Forward dialog options: **+1 Week (7 Days)**, **+1 Month (30 Days)**, **End of Regular Season (Day 166)**, and custom input.
  - Interactive Schedule: Tapping any future game prompts to simulate up to that matchday.
