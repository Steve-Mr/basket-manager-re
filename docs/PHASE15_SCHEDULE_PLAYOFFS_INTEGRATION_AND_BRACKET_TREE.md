# Phase 15: Schedule & Playoffs Integration, Modern Stepper, and Symmetrical Bracket Tree

## 1. Summary of Changes
- **Unified Hub**: Consolidated the disconnected `Schedule` and `Playoffs` tabs into a single unified `Schedule & Playoffs 🏆` center under the League section.
- **Matchday Stepper & Range Extension**:
  - Replaced the awkward horizontal list of 166-200 chips with a modern Matchday Stepper (`[ ◀ Day X / 225 ▶ ]`).
  - Added a "Jump to Today" shortcut button and a Stage Shortcuts Dialog (`Day 1 Opener`, `Day 82 Midseason`, `Day 166 Regular Finale`, `Day 167 Playoff R1`, `Day 185 Semis`, `Day 200 Conf Finals`, `Day 215 NBA Finals`).
  - Extended schedule reach from 1..166 to full 1..225 days, seamlessly covering postseason matchups.
- **Symmetrical Playoff Tournament Bracket Tree**:
  - Created [`PlayoffBracketTreeComponent.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/components/PlayoffBracketTreeComponent.kt) matching standard NBA championship layouts (Left: West 4-round tree, Center: World Championship & Trophy 🏆, Right: East 4-round tree).
  - Supports live series scores (e.g. 4-2), winner green highlighting, user team gold borders, and tap-to-view individual game box scores.
