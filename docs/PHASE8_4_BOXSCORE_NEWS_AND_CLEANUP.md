# Phase 8.4: Full-Featured Box Scores, News Paragraphs, and Clean I18n

## 1. Problem Addressed
- Box score PER displayed excessive decimal places and lacked shooting percentage details (FG%, 3P%, FT%).
- Bracketed translations (e.g. `(首发阵容)`) violated standard internationalization conventions.
- Literal `\n` escaping in news summary strings created unformatted text.
- Specific trademark keywords ("NBA") needed replacement with generic league terms.
- Playoff news feed flooded user with AI-vs-AI single-match results.

## 2. Solution & Implementation
- **Enhanced Box Score Presentation ([`Components.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/components/Components.kt))**:
  - `PER` formatted to 1 decimal place (`String.format("%.1f", per)`).
  - Integrated complete shooting splits:
    - `FG: M/A (FG%)`
    - `3PT: M/A`
    - `FT: M/A`
  - Grouped by `STARTERS` and `BENCH RESERVES`.
- **Clean News Formatting & Targeted Playoff Feeds ([`MatchSimulationEngine.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/domain/engine/MatchSimulationEngine.kt), [`DashboardScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/DashboardScreen.kt), [`GameRepositoryImpl.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/data/repository/GameRepositoryImpl.kt))**:
  - Fixed newline escaping in news bodies for clean multiline paragraph display.
  - During playoffs, individual match reports only generate for games involving the user's team, while major round announcements remain league-wide.
- **Clean UI Terminology & Standard I18n**:
  - Removed all bracketed translations and replaced all "NBA" keywords with standard professional basketball league terminology ("World Championship", "World Finals", "Season Schedule", "Trade Machine").
