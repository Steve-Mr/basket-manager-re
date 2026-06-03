# BasketManager2015 现代化项目进度审查报告

## 1. 概览与功能完成度汇总

目前仓库中的 Kotlin 实现（Jetpack Compose + Room）已经构建了坚实的基础框架，涵盖了数据库层、大部分核心逻辑和用户界面。然而，在细节和“忠实还原”层面仍有部分功能缺失或存在偏差。

- **进度状态**: Phase 3（逻辑迁移）与 Phase 4（UI现代化）交织进行中。
- **完成的模块**: 数据库迁移、基础的赛程生成（SeasonCalendar）、单日比赛模拟（MatchSimulator）、基础球员成长/老化（StateEvolver）、主要的UI页面结构。
- **缺失/未完善模块**: 季后赛生成、多赛季平滑过渡（会导致“没有第二个赛季”的问题）、完整的休赛期逻辑（选秀流程 UI 交互、AI 续约及交易判断逻辑不全）。

---

## 2. 问题深度剖析：为什么“没有第二个赛季”？

在测试中发现第二赛季无法正常运行，其核心原因在于**状态清理和查询过滤未严格对齐原版逻辑**。

### 原版行为 (`ManageSeasons.java`)
原版在 `deletingOldSeason` 中，使用 `BlankDao.deleteAll()` 暴力清空了 `MatchResult`, `Offer`, `Trade`, `Playoffs`, `DraftRound` 等表，以确保新赛季处于干净状态。在 `creatingNewSeason` 中，清空了所有第一赛季的 `Match` 记录（季后赛记录除外）。

### 当前实现 (`GameViewModel.kt -> startNewSeason()`)
新版架构由于引入了 `season` 字段，旨在保留历史记录。在 `startNewSeason` 方法中，执行了：
1. 球员成长/老化。
2. 生成 90 个新秀并重置排名。
3. 调用 `SeasonCalendar.generateMatches` 生成新赛季 `MatchEntity` 并将其插入。
4. **缺失的致命点**:
   - `CalendarScreen` 的查询（`MatchDao.getAllMatchesForGameFlow`）和模拟器的查询，**没有按 `currentSeason` 进行过滤**。这导致第一赛季（已结束的 234 天赛程）和第二赛季的比赛被混合在一起。
   - `MatchSimulator` 和 `GameViewModel` 在递增比赛日（`nextDay`）时，读取的是整个 `Match` 表中匹配 `matchday` 的所有比赛，导致它可能会将两个赛季的同日比赛同时进行模拟，甚至引发主键或状态冲突。
   - 季后赛阶段的自动调度由于原版逻辑硬编码（如第168、183天）而没有适配赛季递增偏移。

### 结论
新版尝试“保留历史”（通过增加 `season` 字段）是一项很棒的现代化改进，但相关的下游数据读取层（DAOs, UI Filters, Simulation loops）尚未适配这一改动，导致多赛季数据污染。

---

## 3. 功能是否忠实还原？（逐项对比）

### 3.1 比赛引擎计算 (`MatchSimulator.kt` vs `Simulate.java`)
- **优点**: 核心的投篮命中判断 `accomplishedAction`、防守修正（`getAttackModifier`, `getDefenseModifier`）、追赶机制（`loseManyPoints`）、罚球独立统计均**已完美复刻原版逻辑**。常量也全部从 `Constants.kt` 中引入。
- **偏差**:
  - 伤病几率（Injury Check）：新版实现了基础伤病计算，但未结合 `ManageDevelopment.java` 中的康复倒计时计算系统。
  - 体力消耗：`StateEvolver.evolvePlayerAfterMatch` 基本还原了替补和首发的体力增减逻辑，但原版有基于赛程密度的惩罚机制，这在新版中较弱。

### 3.2 选秀与自由市场 (`ManageDraft.java`, `ManageRenewals.java` vs `MarketViewModel.kt`)
- **偏差**: 原版在 `ManageRenewals.java` 中有一套复杂的 AI 续约评估逻辑：当球员合同到期（`YearsContract == 0`）时，AI 会根据球员的忠诚度、潜力以及是否为球队唯一位置球员（`IsUniqueInPosition`）掷骰子决定是否续约。目前新版仅将合同到期球员释放到自由市场，**缺少了 AI 队伍主动续约的意愿逻辑**，导致大量高价值球员直接流入自由市场。
- **选秀（Draft）**: 原版的选秀是分为真实选秀（有顺序的选人交互）的，而当前的代码虽然在后台生成了新秀，但缺乏完整的选秀抽签和顺位摘牌逻辑。

### 3.3 球队工资帽与战绩奖励 (`updateAllSalaryCaps`)
- **优点**: 已经还原了进入季后赛和分区第一带来的工资帽奖励（`SALARY_CAP_STEP * 2`）。
- **缺陷**: 原版中对于季后赛的后续轮次（如分区决赛、总决赛、冠军）有着递增的工资帽奖励。当前实现仅在常规赛末（Day 167）执行了一次结算，缺少了季后赛打完后的第二次工资帽调整。

---

## 4. 改进建议与下一步计划

为了解决上述问题并彻底完成现代化改造，建议按以下步骤修复：

1. **修正赛季隔离（修复第二赛季 BUG）**:
   - 彻底修改 `MatchDao`，所有的查询（如 `getRecentMatchesFlow`、`getMatchesByDay`）**必须传入并匹配 `season` 参数**。
   - 更新 `CalendarScreen` 和 `GameViewModel`，仅展示和模拟属于 `activeGame.currentSeason` 的比赛。
2. **补全 AI 行为树**:
   - 在进入自由市场阶段前（例如 Day 230），增加一个 `executeAIRenewals()` 逻辑，复刻 `ManageRenewals.java`，让 AI 球队自行消化部分到期球员。
3. **完善季后赛状态机**:
   - 增加专用的 `generatePlayoffTree(season)`，而非硬编码日期。季后赛赛程应根据 `season` 进行隔离，避免读取上一赛季的淘汰赛数据。

## 5. 总结
目前重构版本在架构设计、并发控制（Kotlin Coroutines）和界面现代化上表现优异，基础的单场模拟也具有 100% 的数学精确度。目前的缺陷主要集中在“跨赛季”和“全局宏观AI调度”上。只需对数据流增加赛季维度（Season Scope）的过滤，即可大幅提升游戏的可玩性并解锁无尽的赛季循环。
