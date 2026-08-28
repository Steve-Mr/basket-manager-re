# Phase 12: Smooth Veteran Aging, Load Management & Dynamic Retirement Without Hard Age Cap

## 1. Problem Addressed
1. **Steep Post-30 Cliff Drops**: In the original BM15 formula, any player aged > 30 was subjected to 3 aggressive decline loops every 10 days with a high threshold `< 55`, causing veterans to lose 5-10 skill points in a single season.
2. **Unfair Penalty for Controlled Veteran Minutes**: Playing 10-20 minutes as a solid role player gave low `minutesAvg`, which heavily triggered the decline roll.
3. **Hard 40-Year-Old Retirement Limit**: The game forced all players to retire at age 40 regardless of skill rating or active contract.

## 2. Solution & Engine Redesign ([`PlayerDevelopmentEngine.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/domain/engine/PlayerDevelopmentEngine.kt))

### 2.1 Smooth Age-Tiered Decline & Superstar Protection
- **Age 30-33 (Prime-to-Veteran Transition)**:
  - Reduced loops from 3 to **1**.
  - Decline threshold lowered to **24** (superstars $\ge 80$ OVR) and **30** (standard).
  - High-performing veterans with PER $\ge 18.0$ can still maintain or improve.
- **Age 34-36 (Gradual Decline)**:
  - Moderate decline loops = 2. Threshold: **32** ($\ge 80$ OVR) / **40** (standard).
- **Age 37+ (Late Career)**:
  - Decline loops = 3. Threshold: **40** ($\ge 80$ OVR) / **48** (standard).

### 2.2 Realistic Workload & Load Management Logic
- **Controlled Workload (12-28 MPG)**: Grants a load management protection bonus (`minutesFactor = 32`), preventing role veterans from decaying due to moderate minutes.
- **Overwork Fatigue (> 32 MPG at Age 34+)**: Heavy continuous minutes without rest penalize physical endurance and increase fatigue.

### 2.3 Attribute-Specific Decay Weighting
- When a veteran declines:
  - **Physical attributes** (Physique, Block, Steal, Rebound) absorb **70%** of skill drops.
  - **Skill & IQ attributes** (Passing, 3PT shooting touch, Free throw, Mid-range) are preserved with only **30%** decay weight.

### 2.4 Removal of Hard 40-Year-Old Retirement Cap
- Replaced 40-year hard cap with a **Rating & Contract driven dynamic retirement model**:
  - High-rated legends (82+ OVR, e.g. LeBron/Kareem tier) have only a 10-15% chance of retiring at age 40+ and can continue playing into their 40s.
  - Expiring or low-rated players (< 55-65 OVR) retire naturally based on market demand.
