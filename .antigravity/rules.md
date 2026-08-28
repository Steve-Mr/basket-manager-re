# Basket Manager RE - Engineering & Code Quality Rules

## 1. Internationalization (i18n) & Language Standards
- **Source Code Language**: All Kotlin/Java source code (including class/variable names, comments, docstrings, internal domain logic, engine reasons, news titles/templates, and default UI strings) MUST be written in **standard English**.
- **No Hardcoded Non-English Strings**: NEVER hardcode Chinese characters (`[一-龥]`) or bilingual mixed bracket annotations (e.g. `"WESTERN CONFERENCE (西部赛区)"`, `"STARTERS (首发五虎)"`, `"季后赛资格 (+ $2.0M)"`) inside `.kt` or `.java` files.
- **Localization Files**:
  - English default: `app/src/main/res/values/strings.xml`
  - Chinese localization: `app/src/main/res/values-zh/strings.xml`
  - All multi-language UI strings must be resolved using `stringResource(R.string.xxx)` or `context.getString(R.string.xxx)`.

## 2. Trade & Negotiation Architecture
- **Trade Machine Integration**: The Trade Machine is a unified smart canvas. When only user assets are selected, it acts as "Shop Assets"; when only target assets are selected, it acts as "Target Inquiry"; when both sides have assets, it evaluates the two-team trade. No separate redundant tabs.

## 3. Financial & Simulation System Integrity
- Maintain fidelity to authentic BM15 mathematical models and mechanics (e.g. Rulete, Form/Energy evolution, Step-tier salary cap calculations, Draft order, Playoff brackets).

