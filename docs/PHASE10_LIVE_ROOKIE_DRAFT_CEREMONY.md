# Phase 10: Live Rookie Draft Ceremony & Pick-by-Pick CPU Simulation

## 1. Problem Addressed
Previously, the draft screen displayed a static list of 60 prospects without simulating the authentic pick-by-pick draft ceremony. The user could not see which team was on the clock, CPU teams did not make dynamic tactical draft selections, and the user was not prompted when their specific draft pick arrived.

## 2. Solution & Implementation

### 2.1 Authentic CPU Draft Selection Algorithm ([`DraftEngine.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/domain/engine/DraftEngine.kt))
- Implemented `DraftEngine.cpuSelectProspect(...)`:
  - **Top 3 Picks**: Selected from the top 3 overall rated prospects on the board.
  - **Picks 4-60**: Scans the drafting team's roster for positional weaknesses (positions with $\le 1$ player). If a deficit is detected, selects the best candidate for that position among the top 4 prospects; otherwise, selects randomly from the top 3 best available prospects.
- Implemented `calculateDraftOrder(...)`: Orders picks by regular season record (worst to best) with lottery grouping in buckets of 4.

### 2.2 Live Draft Simulation Engine & Repository ([`GameRepositoryImpl.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/data/repository/GameRepositoryImpl.kt))
- Implemented `executeCpuDraftPick(gameId, pickId)`: Dynamically selects, contracts, and signs the prospect to the picking team, logs news event, and updates the pool.
- Implemented `simulateDraftUntilUser(gameId, userTeamId)`: Fast-forwards CPU selections sequentially until a pick owned by the user's franchise is "On the Clock".

### 2.3 Interactive Live Draft Ceremony UI ([`LiveDraftCeremonyScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/LiveDraftCeremonyScreen.kt))
- **Hero Banner ("On the Clock")**:
  - Highlights currently picking team, round, pick number, guaranteed salary, and contract duration.
  - When user is on the clock, pulses gold with **"👑 YOU ARE ON THE CLOCK!"**.
- **Action Controls**:
  - **"Draft Selected Prospect"**: Mandatory confirmation modal displaying guaranteed rookie salary and contract length.
  - **"Auto Best Available"**: Drafts top prospect immediately.
  - **"Simulate to My Next Pick ⚡"**: Fast-forwards CPU selections step-by-step.
  - **"Next Pick >"**: Advances 1 pick.
- **Three Dynamic Tabs**:
  - **Available Prospects Big Board**: Filterable by position (PG, SG, SF, PF, C) with overall rating, potential stars (★), age, and skills.
  - **Live Draft Log**: Chronological feed of all selections made across Round 1 & Round 2.
  - **Remaining Picks Tracker**: Overview of upcoming pick ownership.
