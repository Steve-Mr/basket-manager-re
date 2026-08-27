# Phase 8.2: Lineup Penalty Clarity & Key Stars Tactics Hierarchy

## 1. Problem Addressed
- Confusion between position eligibility penalty (-2 / -7) and condition/energy modifiers.
- Missing UI/controls to edit Key Star offensive options.
- Clipping and padding issues on the lineup screen.

## 2. Solution & Implementation
- **Explicit Position Penalty ([`Player.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/domain/model/Player.kt), [`LineupScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/LineupScreen.kt))**:
  - `getPositionPenalty(position)` returns strictly `0` (Natural position), `-2` (Secondary position), or `-7` (Out of position).
  - Slots display clean position penalty badges (`-2 Sec Pos`, `-7 Out of Pos`) matching candidate dialogs.
  - Added `contentPadding = PaddingValues(start = 16.dp, end = 16.dp, top = 12.dp, bottom = 32.dp)` to prevent any overlap or clipping.
- **Key Stars Offensive Hierarchy ([`TacticsScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/TacticsScreen.kt))**:
  - Integrated Key Stars directly into Tactics:
    - **Star #1**: +30% Usage / Primary Crunch-time Go-To Scorer
    - **Star #2**: +20% Usage / Secondary Scoring Option
    - **Star #3**: +10% Usage / Third Scoring Option
  - Interactive bottom sheet allows tapping any star to select from the active roster or clear the assignment.
