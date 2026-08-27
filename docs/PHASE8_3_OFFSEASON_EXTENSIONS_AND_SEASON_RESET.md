# Phase 8.3: Offseason Contract Extensions & Clean New Season Reset

## 1. Problem Addressed
- Lack of UI/controls to extend expiring player contracts before free agency.
- Advancing to a new season kept stale news items from previous seasons.
- Finals championship news repeated every day until season transition.

## 2. Solution & Implementation
- **Expiring Contract Extensions ([`FinancesScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/FinancesScreen.kt))**:
  - Highlights expiring player contracts (`yearsContract <= 1`).
  - Added "Extend" button and interactive dialog allowing offers of 1 to 3 year renewals.
- **Season Transition & News Reset ([`GameRepositoryImpl.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/data/repository/GameRepositoryImpl.kt))**:
  - On Day 234, clears old match records, playoff series, and news from previous season.
  - Resets standings to 0-0 and generates a fresh 82-game collision-free schedule for Season N+1.
  - Inserts Season Kickoff news item: `Season {N+1} Tip-Off!`.
  - Guarded World Championship news insertion so it triggers only once upon Finals series conclusion.
