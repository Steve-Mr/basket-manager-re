# Phase 8.1: Injury Simulation Pause & Fast-Forward Lineup Controls

## 1. Problem Addressed
- Simulating with injured players proceeded without warning.
- Long batch simulation (+1 week / +1 month / calendar fast forward) did not pause when a player was injured.

## 2. Solution & Implementation
- **Injury Guard on Advance Day ([`ViewModels.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/viewmodel/ViewModels.kt))**:
  - `getInjuredStartingPlayers()` checks user's active starting five.
  - If any starter is injured and auto-lineup is disabled, simulation is halted and prompts the user with an alert: "Auto-Adjust & Play" or "Adjust Manually".
- **Dynamic Injury Interruption in Fast-Forward ([`GameRepositoryImpl.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/data/repository/GameRepositoryImpl.kt))**:
  - `autoSimulateTo` tracks player injury state after each simulated day. If a user player gets injured and auto-lineup is off, simulation breaks immediately and reports the pause event.
- **Fast-Forward Dialog Checkbox ([`DashboardScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/DashboardScreen.kt), [`ScheduleScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/ScheduleScreen.kt))**:
  - Added "Auto-adjust lineup if players are injured" checkbox in all simulation dialogs.
