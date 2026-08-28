# Phase 11: Position Base Attribute Calibration & PG Mid-Range Shooting Balance

## 1. Problem Addressed
In the original BM15 formula, `Player.getBaseOfPosition(pos, 6)` (Shot Interior / Mid-range & Paint scoring) was set to an extreme minimum of 10-15 for Point Guards (PG). As a result, newly generated point guards were crippled with 40-50 mid-range ratings despite having 65-75 three-point ratings, producing an unrealistic scoring profile where guards could not finish floaters, pull-up jumpers, or drives.

## 2. Solution & Attribute Recalibration

### 2.1 Position Attribute Balance Table ([`Player.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/domain/model/Player.kt))
Calibrated `getBaseOfPosition` across all 5 positions for realistic modern basketball archetypes:

| Position | Physique (1) | Block (2) | Steal (3) | Rebound (4) | Pass (5) | Shot Interior (6) | Shot Exterior (7) | Shot Free (8) | Average OVR |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **PG (Point Guard)** | 25 | 10 | 30 | 14 | 35 | **25** (Calibrated from 10/15) | 30 | 30 | **58.3** |
| **SG (Shooting Guard)** | 26 | 14 | 28 | 18 | 28 | **27** (Calibrated from 20/25) | 33 | 30 | **58.8** |
| **SF (Small Forward)** | 28 | 24 | 25 | 26 | 25 | **28** | 28 | 28 | **59.6** |
| **PF (Power Forward)** | 32 | 31 | 18 | 32 | 18 | **32** | 22 | 24 | **59.1** |
| **C (Center)** | 34 | 35 | 12 | 35 | 16 | **35** | 14 | 20 | **58.3** |

### 2.2 Simulation Verification & Unit Tests ([`SimulationEngineTest.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/test/java/top/maary/basketmanager/re/engine/SimulationEngineTest.kt))
- Added `testDraftProspectBalance()` validating:
  - Average PG Mid-range (Shot Interior) is healthy: ~59.4 (Range: 45 to 75 for standard prospects; 80+ for generational talents).
  - Average PG 3PT (Shot Exterior) is strong: ~64.7.
  - Average PG Passing is elite: ~69.6.
  - Center/PF dominance in paint scoring (~68.6), rebounding (~68.8), and shot blocking (~68.6) is preserved.
