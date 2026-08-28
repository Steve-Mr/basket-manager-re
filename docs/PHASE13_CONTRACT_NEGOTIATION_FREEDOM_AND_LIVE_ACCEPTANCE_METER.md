# Phase 13: Enhanced Contract Negotiation System, 5 Quick Presets & Live Acceptance Meter

## 1. Problem Addressed
In the original BM15:
1. **RNG-Locked Options**: The game randomly rolled 5 static offer packages with randomly rolled contract lengths.
2. **Repetitive Dialog Reloading (Refreshing)**: To get a specific duration (e.g. 4-year deal) or fair salary, users had to repeatedly close and reopen the dialog to refresh options.

## 2. Solution & Dual-Track Negotiation Architecture

### 2.1 Reusable Modern Negotiation Component ([`ContractNegotiationDialog.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/components/ContractNegotiationDialog.kt))
1. **Mathematical Market Value Expectation (`Util.getSalary(player)`)**:
   - Computes player's true market benchmark based on non-linear exponential overall rating (4th power), age discount, and potential multiplier.
2. **5 One-Tap Quick Presets (Original BM15 Tiers)**:
   - `[-20% Cut]` (Tier 0)
   - `[-10% Discount]` (Tier 1)
   - `[Market 100%]` (Tier 2)
   - `[+10% Raise]` (Tier 3)
   - `[+20% Max]` (Tier 4)
3. **Full Freedom Manual Sliders & Duration Selection**:
   - Smooth continuous slider from **$1.0M to $40.0M/yr**.
   - Contract duration selection from **1 to 5 Years**.
4. **Real-Time Live Acceptance Meter & Sentiment Quotes**:
   - Dynamically calculates the current offer tier and player acceptance probability `(loyalty + tier) * 10%`.
   - Displays color-coded sentiment indicators (🟢 `Very Likely (~85%)`, 🟡 `Fair Chance (~60%)`, 🔴 `Uncertain / Reject (~25%)`).
   - Quotes player inner thoughts based on loyalty rating (★1 to ★5).

### 2.2 Integration Across Screens
- Unified and wired into both **Offseason Contract Renewals** ([`OffseasonScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/OffseasonScreen.kt)) and **In-Season Roster Finances** ([`FinancesScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/FinancesScreen.kt)).
