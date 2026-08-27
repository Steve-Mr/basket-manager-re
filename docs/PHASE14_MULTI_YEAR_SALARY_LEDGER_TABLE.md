# Phase 14: Multi-Year Salary Ledger & Future Payroll Outlook

## 1. Problem Addressed
In the original BM15, the team salary finances screen provided a multi-year payroll ledger table showing current and future year commitments (`Year 1 (今年)`, `Year 2 (下年)`, `Year 3 (後年)`, `Year 4 (第四年)`), making it intuitive to project future cap space and contract expirations.

## 2. Implementation & Design ([`FinancesScreen.kt`](file:///data/data/com.termux/files/home/downloads/build/basket-manager-re/app/src/main/java/top/maary/basketmanager/re/ui/screens/FinancesScreen.kt))

### 2.1 Hero Summary Header
- Displays:
  - Team Name & Division (e.g. `POR • Pacific Division`)
  - **Salary Cap**: Formatted as `$70,000,000 $` (Blue accent)
  - **Total Payroll (Year 1)**: Formatted as `$69,404,282 $` (Green accent)
  - **Cap Space / Remaining Budget**: Formatted in real-time (Green if positive, Red if exceeding cap)
  - Interactive Cap Utilization Progress Bar.

### 2.2 4-Year Multi-Year Salary Ledger Grid
- **Cyan Accent Header**: `Player | Year 1 (Current) | Year 2 (Next) | Year 3 (Y+2) | Year 4 (Y+3)`
- **Zebra Striped Rows**:
  - Rating Badge + Player Short Name + Position + "Expiring" status tag
  - Exact currency numbers (e.g. `16,500,000 $`, `3,203,000 $`, `0 $`)
  - Faded `$0` for years after contract expiration, immediately showing future financial flexibility
  - Tap-to-extend or view player detail bottom sheet.
- **Green Accent Footer (Total Committed Payroll)**:
  - Aggregates committed salary obligations across Year 1, Year 2, Year 3, and Year 4.
