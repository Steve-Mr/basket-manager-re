# Phase 7.3: Roster Enhancement, Position Swapping, and Lineup Positioning

## 1. Problem Addressed
- Roster screen contained unnecessary salary clutter while potential and age were understated.
- Dual-position swingmen lacked the original APK feature to swap primary/secondary positions.
- Lineup screen lacked prominent injury alerts and position eligibility candidate grouping.

## 2. Solution & Implementation
- **Roster Screen Refinements ([`RosterScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/RosterScreen.kt))**:
  - Removed salary text to streamline view (salary is in Finances).
  - Prominent gold star potential badge (`★ 9`) and clear age display.
  - Added **Position Swap (⇄)** button for dual-position players allowing instant switching between primary and secondary positions.
- **Lineup Injury & Slot Grouping ([`LineupScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/LineupScreen.kt))**:
  - Injured starters and reserves display prominent red warning borders and `⚠️ INJURED (X days)` badges.
  - Candidate selection bottom sheet categorizes roster players into:
    1. **Primary Matches** (0 penalty)
    2. **Secondary Matches** (-2 penalty)
    3. **Out of Position** (-7 penalty, amber/red warning badges)
