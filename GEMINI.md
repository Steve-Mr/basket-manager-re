# Basket Manager RE - Engineering & Code Quality Rules

## 1. UI Information Architecture & Concise Titles
- **Concise UI Titles**: All screen titles, section headers, tab labels, table column headers, and action buttons MUST be short, clean, and punchy.
  - Examples: `Roster`, `Lineup`, `Team Stats`, `Tactics`, `Finances`, `Starters`, `Reserves`, `Bench`, `Team Total`, `Attributes`, `Statistics`.
  - Avoid overly verbose sentences or redundant subtitles in headers.
  - Avoid decorative emoji clutter in headers and buttons. Use Material 3 semantic icons instead.

## 2. Language & Internationalization (i18n) Standards
- **English-First UI**: The entire application UI defaults strictly to clean, modern, standard English.
- **No Hardcoded Chinese in Code**: NEVER hardcode Chinese characters (`[一-龥]`) or Traditional Chinese phrases in `.kt` files or default layouts.
- **Future i18n Flow**:
  - English default strings: `app/src/main/res/values/strings.xml`
  - Chinese localization: `app/src/main/res/values-zh/strings.xml`
  - All multi-language UI strings must use standard English as the base and resolve cleanly.

## 3. Trade & Negotiation Architecture
- **Trade Machine Integration**: The Trade Machine is a unified smart canvas. When only user assets are selected, it acts as "Shop Assets"; when only target assets are selected, it acts as "Target Inquiry"; when both sides have assets, it evaluates the two-team trade. No separate redundant tabs.

## 4. Financial & Simulation System Integrity
- Maintain fidelity to authentic BM15 mathematical models and mechanics (e.g. Rulete, Form/Energy evolution, Step-tier salary cap calculations, Draft order, Playoff brackets).

