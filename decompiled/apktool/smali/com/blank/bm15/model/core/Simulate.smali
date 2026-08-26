.class public Lcom/blank/bm15/model/core/Simulate;
.super Ljava/lang/Object;
.source "Simulate.java"


# static fields
.field private static final MATCH_MODIFIER_AVERAGE_VALUE:I = 0x5a

.field private static final MATCH_MODIFIER_LOCAL_BASE:I = 0x1

.field private static final MATCH_MODIFIER_LOCAL_PLAYOFFS:I = 0x2

.field private static final MATCH_MODIFIER_VISITOR_BASE:I = 0x0

.field private static final MINUTES_BENCH_MULTIPLIER:I = 0x4

.field private static final MINUTES_TOTALS:I = 0x30

.field private static final SHOT_TYPE_EXT_DOUBLE:I = 0x2

.field private static final SHOT_TYPE_EXT_TRIPLE:I = 0x3

.field private static final SHOT_TYPE_INT:I = 0x1


# instance fields
.field private game:Lcom/blank/bm15/model/object/crud/Game;

.field private leagueList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/League;",
            ">;"
        }
    .end annotation
.end field

.field private matchList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Match;",
            ">;"
        }
    .end annotation
.end field

.field private matchResultList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/MatchResult;",
            ">;"
        }
    .end annotation
.end field

.field private newsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/News;",
            ">;"
        }
    .end annotation
.end field

.field private playoffsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Playoffs;",
            ">;"
        }
    .end annotation
.end field

.field private rulete:Lcom/blank/bm15/model/object/other/Rulete;


# direct methods
.method public constructor <init>(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 3
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 49
    new-instance v0, Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 50
    .local v0, "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/Match;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 51
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/Match;->setMatchday(Ljava/lang/Integer;)V

    .line 52
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v2

    iput-object v2, p0, Lcom/blank/bm15/model/core/Simulate;->matchList:Ljava/util/List;

    .line 54
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/blank/bm15/model/core/Simulate;->matchResultList:Ljava/util/List;

    .line 55
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/blank/bm15/model/core/Simulate;->leagueList:Ljava/util/List;

    .line 56
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/blank/bm15/model/core/Simulate;->newsList:Ljava/util/List;

    .line 58
    new-instance v1, Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Playoffs;-><init>(Landroid/content/Context;)V

    .line 59
    .local v1, "playoffs":Lcom/blank/bm15/model/object/crud/Playoffs;
    invoke-virtual {v1, p1}, Lcom/blank/bm15/model/object/crud/Playoffs;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 60
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v2

    iput-object v2, p0, Lcom/blank/bm15/model/core/Simulate;->playoffsList:Ljava/util/List;

    .line 61
    return-void
.end method

.method private accomplishedAction(IF)Z
    .locals 5
    .param p1, "skill"    # I
    .param p2, "modifier"    # F

    .prologue
    const/16 v4, 0x64

    const/4 v1, 0x0

    .line 760
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 761
    .local v0, "random":I
    if-nez v0, :cond_1

    .line 762
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 766
    :cond_0
    :goto_0
    return v1

    .line 763
    :cond_1
    if-ne v0, v4, :cond_2

    .line 764
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_0

    .line 766
    :cond_2
    int-to-float v2, v0

    int-to-float v3, p1

    mul-float/2addr v3, p2

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method private calculateMinutes(Lcom/blank/bm15/model/object/crud/Match;Z)V
    .locals 11
    .param p1, "match"    # Lcom/blank/bm15/model/object/crud/Match;
    .param p2, "isLocal"    # Z

    .prologue
    .line 722
    const/4 v5, 0x0

    .line 723
    .local v5, "listTitulars":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    const/4 v4, 0x0

    .line 725
    .local v4, "listReserves":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    const/4 v2, 0x0

    .line 726
    .local v2, "benchImportance":Ljava/lang/Integer;
    const/4 v0, 0x0

    .line 727
    .local v0, "auxImportance":Ljava/lang/Integer;
    const/4 v7, 0x0

    .line 728
    .local v7, "reserveMinutes":Ljava/lang/Integer;
    if-eqz p2, :cond_0

    .line 729
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticBenchImportance()Ljava/lang/Integer;

    move-result-object v2

    .line 730
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 731
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersTitulars()Ljava/util/List;

    move-result-object v5

    .line 732
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersReserves()Ljava/util/List;

    move-result-object v4

    .line 740
    :goto_0
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    const/4 v8, 0x5

    if-lt v3, v8, :cond_1

    .line 752
    return-void

    .line 734
    .end local v3    # "i":I
    :cond_0
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticBenchImportance()Ljava/lang/Integer;

    move-result-object v2

    .line 735
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 736
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersTitulars()Ljava/util/List;

    move-result-object v5

    .line 737
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersReserves()Ljava/util/List;

    move-result-object v4

    goto :goto_0

    .line 741
    .restart local v3    # "i":I
    :cond_1
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/blank/bm15/model/object/crud/Player;

    .line 742
    .local v6, "playerTitular":Lcom/blank/bm15/model/object/crud/Player;
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Player;

    .line 744
    .local v1, "auxPlayerReserve":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v9

    mul-int/lit8 v9, v9, 0x4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v10

    mul-int/lit8 v10, v10, 0x4

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    add-int/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 745
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v8

    if-eqz v8, :cond_2

    .line 746
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v8

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v9

    rsub-int/lit8 v9, v9, 0x30

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/blank/bm15/model/object/crud/MatchResult;->setMinutesPlayed(Ljava/lang/Integer;)V

    .line 748
    :cond_2
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v8

    if-eqz v8, :cond_3

    .line 749
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v8

    invoke-virtual {v8, v7}, Lcom/blank/bm15/model/object/crud/MatchResult;->setMinutesPlayed(Ljava/lang/Integer;)V

    .line 740
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1
.end method

.method private calculateNewStateOfAllPlayers()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 696
    new-instance v7, Lcom/blank/bm15/model/object/crud/Player;

    iget-object v0, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v7, v0}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 697
    .local v7, "filter":Lcom/blank/bm15/model/object/crud/Player;
    iget-object v0, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v7, v0}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 698
    invoke-static {v7}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v6

    .line 700
    .local v6, "allPlayersList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 718
    return-object v6

    .line 700
    :cond_0
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/blank/bm15/model/object/crud/Player;

    .line 701
    .local v9, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-gez v0, :cond_2

    .line 702
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v9, v0}, Lcom/blank/bm15/model/object/crud/Player;->setStateInjury(Ljava/lang/Integer;)V

    .line 714
    :cond_1
    :goto_1
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, -0x11

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0xf

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    rsub-int/lit8 v2, v2, 0x64

    div-int/lit8 v2, v2, 0x14

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v9, v0}, Lcom/blank/bm15/model/object/crud/Player;->setStateForm(Ljava/lang/Integer;)V

    .line 715
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, -0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    rsub-int/lit8 v2, v2, 0x64

    div-int/lit8 v2, v2, 0x14

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v9, v0}, Lcom/blank/bm15/model/object/crud/Player;->setStateEnergy(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 703
    :cond_2
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_1

    .line 704
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v9, v0}, Lcom/blank/bm15/model/object/crud/Player;->setStateInjury(Ljava/lang/Integer;)V

    .line 705
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v9, v0}, Lcom/blank/bm15/model/object/crud/Player;->setStateForm(Ljava/lang/Integer;)V

    .line 707
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_1

    .line 708
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 709
    iget-object v0, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const v2, 0x7f02003f

    const v3, 0x7f050104

    const v4, 0x7f050105

    const/4 v0, 0x1

    new-array v5, v0, [Ljava/lang/Object;

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v11

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/model/core/Simulate;->createNewsAndAdd(IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;

    move-result-object v8

    .line 710
    .local v8, "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual {v8, v9}, Lcom/blank/bm15/model/object/crud/News;->setPlayer1(Lcom/blank/bm15/model/object/crud/Player;)V

    goto/16 :goto_1
.end method

.method private createAllNews(Lcom/blank/bm15/model/object/crud/Match;Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 10
    .param p1, "match"    # Lcom/blank/bm15/model/object/crud/Match;
    .param p2, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 262
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 312
    return-void

    .line 262
    :cond_1
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/blank/bm15/model/object/crud/Player;

    .line 263
    .local v7, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v6, 0x0

    .line 265
    .local v6, "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 266
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x9

    if-le v0, v1, :cond_2

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getReboundsInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x9

    if-le v0, v1, :cond_2

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOk()Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->intValue()I

    move-result v0

    const/16 v1, 0x9

    if-le v0, v1, :cond_2

    .line 267
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const v2, 0x7f02003d

    const v3, 0x7f050115

    const v4, 0x7f050116

    const/4 v0, 0x5

    new-array v5, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    .line 268
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v5, v0

    const/4 v0, 0x1

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v0

    const/4 v0, 0x2

    .line 269
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/MatchResult;->getReboundsInt()Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v0

    const/4 v0, 0x3

    .line 270
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOkInt()Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v0

    const/4 v0, 0x4

    .line 271
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v5, v0

    move-object v0, p0

    .line 267
    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/model/core/Simulate;->createNewsAndAdd(IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;

    move-result-object v6

    .line 272
    invoke-virtual {v6, v7}, Lcom/blank/bm15/model/object/crud/News;->setPlayer1(Lcom/blank/bm15/model/object/crud/Player;)V

    goto/16 :goto_0

    .line 273
    :cond_2
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPer()Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    const-wide v2, 0x4048800000000000L    # 49.0

    cmpl-double v0, v0, v2

    if-lez v0, :cond_3

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMinutesPlayed()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x17

    if-le v0, v1, :cond_3

    .line 274
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const v2, 0x7f02003d

    const v3, 0x7f050113

    const v4, 0x7f050114

    const/16 v0, 0x8

    new-array v5, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    .line 275
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v5, v0

    const/4 v0, 0x1

    .line 276
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v0

    const/4 v0, 0x2

    .line 277
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/MatchResult;->getReboundsInt()Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v0

    const/4 v0, 0x3

    .line 278
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOkInt()Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v0

    const/4 v0, 0x4

    .line 279
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocksInt()Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v0

    const/4 v0, 0x5

    .line 280
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/MatchResult;->getStealsInt()Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v0

    const/4 v0, 0x6

    .line 281
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v5, v0

    const/4 v0, 0x7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMinutesPlayed()Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v0

    move-object v0, p0

    .line 274
    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/model/core/Simulate;->createNewsAndAdd(IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;

    move-result-object v6

    .line 282
    invoke-virtual {v6, v7}, Lcom/blank/bm15/model/object/crud/News;->setPlayer1(Lcom/blank/bm15/model/object/crud/Player;)V

    goto/16 :goto_0

    .line 284
    :cond_3
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x31

    if-le v0, v1, :cond_0

    .line 285
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const v2, 0x7f02003d

    const v3, 0x7f050109

    const v4, 0x7f05010a

    const/4 v0, 0x3

    new-array v5, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v5, v0

    const/4 v0, 0x1

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v0

    const/4 v0, 0x2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v5, v0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/model/core/Simulate;->createNewsAndAdd(IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;

    move-result-object v6

    .line 286
    invoke-virtual {v6, v7}, Lcom/blank/bm15/model/object/crud/News;->setPlayer1(Lcom/blank/bm15/model/object/crud/Player;)V

    goto/16 :goto_0
.end method

.method private createMatchResultsAndBonus(Lcom/blank/bm15/model/object/crud/Match;)V
    .locals 22
    .param p1, "match"    # Lcom/blank/bm15/model/object/crud/Match;

    .prologue
    .line 132
    const/4 v8, 0x0

    .line 133
    .local v8, "numOfPlayers":I
    const/4 v5, 0x0

    .line 134
    .local v5, "localTeamAgeAverage":I
    const/4 v6, 0x0

    .line 135
    .local v6, "localTeamAllAverage":I
    const/4 v4, 0x1

    .line 136
    .local v4, "localBaseMatchModifier":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    const/16 v15, 0xa7

    if-lt v14, v15, :cond_0

    .line 137
    const/4 v4, 0x2

    .line 140
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_1
    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-nez v14, :cond_3

    .line 166
    div-int/2addr v5, v8

    .line 167
    div-int/2addr v6, v8

    .line 170
    const/4 v8, 0x0

    .line 171
    const/4 v12, 0x0

    .line 172
    .local v12, "visitorTeamAgeAverage":I
    const/4 v13, 0x0

    .line 173
    .local v13, "visitorTeamAllAverage":I
    const/4 v11, 0x0

    .line 174
    .local v11, "visitorBaseMatchModifier":I
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_2
    :goto_1
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-nez v14, :cond_9

    .line 200
    div-int/2addr v12, v8

    .line 201
    div-int/2addr v13, v8

    .line 203
    const/16 v14, 0xa7

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    if-le v14, v15, :cond_f

    sub-int v14, v5, v12

    div-int/lit8 v2, v14, 0x2

    .line 204
    .local v2, "bonoAverageAge":I
    :goto_2
    sub-int v14, v6, v13

    div-int/lit8 v3, v14, 0x2

    .line 207
    .local v3, "bonoAverageAll":I
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersTitulars()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_3
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-nez v15, :cond_10

    .line 216
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersReserves()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_4
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-nez v15, :cond_11

    .line 226
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersTitulars()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_5
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-nez v15, :cond_12

    .line 231
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersReserves()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_6
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-nez v15, :cond_13

    .line 235
    return-void

    .line 140
    .end local v2    # "bonoAverageAge":I
    .end local v3    # "bonoAverageAll":I
    .end local v11    # "visitorBaseMatchModifier":I
    .end local v12    # "visitorTeamAgeAverage":I
    .end local v13    # "visitorTeamAllAverage":I
    :cond_3
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/blank/bm15/model/object/crud/Player;

    .line 141
    .local v9, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    if-eqz v14, :cond_1

    .line 142
    new-instance v7, Lcom/blank/bm15/model/object/crud/MatchResult;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-direct {v7, v14}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 143
    .local v7, "matchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    const-string v10, ""

    .line 144
    .local v10, "text":Ljava/lang/String;
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getIsStarOne()Ljava/lang/Boolean;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 145
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v14, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "(+3) "

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 151
    :cond_4
    :goto_7
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v14, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v7, v14}, Lcom/blank/bm15/model/object/crud/MatchResult;->setName(Ljava/lang/String;)V

    .line 152
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v7, v14}, Lcom/blank/bm15/model/object/crud/MatchResult;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 153
    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setMatch(Lcom/blank/bm15/model/object/crud/Match;)V

    .line 154
    invoke-virtual {v7, v9}, Lcom/blank/bm15/model/object/crud/MatchResult;->setPlayer(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 155
    invoke-virtual {v9, v7}, Lcom/blank/bm15/model/object/crud/Player;->setCurrentMatchResult(Lcom/blank/bm15/model/object/crud/MatchResult;)V

    .line 156
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/blank/bm15/model/core/Simulate;->matchResultList:Ljava/util/List;

    invoke-interface {v14, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getPositionMatch()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v9, v14}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAllByPosition(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v16

    const-wide v18, 0x4056800000000000L    # 90.0

    cmpl-double v14, v16, v18

    if-ltz v14, :cond_5

    .line 159
    add-int/lit8 v4, v4, 0x1

    .line 161
    :cond_5
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    add-int/2addr v5, v14

    .line 162
    int-to-double v0, v6

    move-wide/from16 v16, v0

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getPositionMatch()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v9, v14}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAllByPosition(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v18

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getIsTitular()Ljava/lang/Boolean;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    if-eqz v14, :cond_8

    const/4 v14, 0x2

    :goto_8
    int-to-double v0, v14

    move-wide/from16 v20, v0

    mul-double v18, v18, v20

    add-double v16, v16, v18

    move-wide/from16 v0, v16

    double-to-int v6, v0

    .line 163
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_0

    .line 146
    :cond_6
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getIsStarTwo()Ljava/lang/Boolean;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    if-eqz v14, :cond_7

    .line 147
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v14, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "(+2) "

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 148
    goto/16 :goto_7

    :cond_7
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getIsStarThree()Ljava/lang/Boolean;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    if-eqz v14, :cond_4

    .line 149
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v14, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "(+1) "

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_7

    .line 162
    :cond_8
    const/4 v14, 0x1

    goto :goto_8

    .line 174
    .end local v7    # "matchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    .end local v9    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .end local v10    # "text":Ljava/lang/String;
    .restart local v11    # "visitorBaseMatchModifier":I
    .restart local v12    # "visitorTeamAgeAverage":I
    .restart local v13    # "visitorTeamAllAverage":I
    :cond_9
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/blank/bm15/model/object/crud/Player;

    .line 175
    .restart local v9    # "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    if-eqz v14, :cond_2

    .line 176
    new-instance v7, Lcom/blank/bm15/model/object/crud/MatchResult;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-direct {v7, v14}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 177
    .restart local v7    # "matchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    const-string v10, ""

    .line 178
    .restart local v10    # "text":Ljava/lang/String;
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getIsStarOne()Ljava/lang/Boolean;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    if-eqz v14, :cond_c

    .line 179
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v14, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "(+3) "

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 185
    :cond_a
    :goto_9
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v14, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v7, v14}, Lcom/blank/bm15/model/object/crud/MatchResult;->setName(Ljava/lang/String;)V

    .line 186
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v7, v14}, Lcom/blank/bm15/model/object/crud/MatchResult;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 187
    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setMatch(Lcom/blank/bm15/model/object/crud/Match;)V

    .line 188
    invoke-virtual {v7, v9}, Lcom/blank/bm15/model/object/crud/MatchResult;->setPlayer(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 189
    invoke-virtual {v9, v7}, Lcom/blank/bm15/model/object/crud/Player;->setCurrentMatchResult(Lcom/blank/bm15/model/object/crud/MatchResult;)V

    .line 190
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/blank/bm15/model/core/Simulate;->matchResultList:Ljava/util/List;

    invoke-interface {v14, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getPositionMatch()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v9, v14}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAllByPosition(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v16

    const-wide v18, 0x4056800000000000L    # 90.0

    cmpl-double v14, v16, v18

    if-ltz v14, :cond_b

    .line 193
    add-int/lit8 v11, v11, 0x1

    .line 195
    :cond_b
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    add-int/2addr v12, v14

    .line 196
    int-to-double v0, v13

    move-wide/from16 v16, v0

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getPositionMatch()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v9, v14}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAllByPosition(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v18

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getIsTitular()Ljava/lang/Boolean;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    if-eqz v14, :cond_e

    const/4 v14, 0x2

    :goto_a
    int-to-double v0, v14

    move-wide/from16 v20, v0

    mul-double v18, v18, v20

    add-double v16, v16, v18

    move-wide/from16 v0, v16

    double-to-int v13, v0

    .line 197
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_1

    .line 180
    :cond_c
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getIsStarTwo()Ljava/lang/Boolean;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    if-eqz v14, :cond_d

    .line 181
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v14, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "(+2) "

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 182
    goto/16 :goto_9

    :cond_d
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getIsStarThree()Ljava/lang/Boolean;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    if-eqz v14, :cond_a

    .line 183
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v14, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "(+1) "

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_9

    .line 196
    :cond_e
    const/4 v14, 0x1

    goto :goto_a

    .line 203
    .end local v7    # "matchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    .end local v9    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .end local v10    # "text":Ljava/lang/String;
    :cond_f
    const/4 v2, 0x0

    goto/16 :goto_2

    .line 207
    .restart local v2    # "bonoAverageAge":I
    .restart local v3    # "bonoAverageAll":I
    :cond_10
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/blank/bm15/model/object/crud/Player;

    .line 208
    .restart local v9    # "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticGameType()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    add-int/2addr v15, v4

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Lcom/blank/bm15/model/object/crud/Player;->getPenalty(Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    add-int v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v9, v15}, Lcom/blank/bm15/model/object/crud/Player;->setBaseMatchAttackModifier(Ljava/lang/Integer;)V

    .line 209
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticGameType()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    mul-int/lit8 v15, v15, -0x1

    add-int/2addr v15, v4

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Lcom/blank/bm15/model/object/crud/Player;->getPenalty(Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    add-int v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v9, v15}, Lcom/blank/bm15/model/object/crud/Player;->setBaseMatchDefenseModifier(Ljava/lang/Integer;)V

    .line 212
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchAttackModifier()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    add-int/2addr v15, v2

    add-int/2addr v15, v3

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v9, v15}, Lcom/blank/bm15/model/object/crud/Player;->setBaseMatchAttackModifier(Ljava/lang/Integer;)V

    .line 213
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchDefenseModifier()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    add-int/2addr v15, v2

    add-int/2addr v15, v3

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v9, v15}, Lcom/blank/bm15/model/object/crud/Player;->setBaseMatchDefenseModifier(Ljava/lang/Integer;)V

    goto/16 :goto_3

    .line 216
    .end local v9    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_11
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/blank/bm15/model/object/crud/Player;

    .line 217
    .restart local v9    # "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticGameType()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    add-int/2addr v15, v4

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Lcom/blank/bm15/model/object/crud/Player;->getPenalty(Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    add-int v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v9, v15}, Lcom/blank/bm15/model/object/crud/Player;->setBaseMatchAttackModifier(Ljava/lang/Integer;)V

    .line 218
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticGameType()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    mul-int/lit8 v15, v15, -0x1

    add-int/2addr v15, v4

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Lcom/blank/bm15/model/object/crud/Player;->getPenalty(Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    add-int v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v9, v15}, Lcom/blank/bm15/model/object/crud/Player;->setBaseMatchDefenseModifier(Ljava/lang/Integer;)V

    .line 221
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchAttackModifier()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    add-int/2addr v15, v2

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v9, v15}, Lcom/blank/bm15/model/object/crud/Player;->setBaseMatchAttackModifier(Ljava/lang/Integer;)V

    .line 222
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchDefenseModifier()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    add-int/2addr v15, v2

    add-int/2addr v15, v3

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v9, v15}, Lcom/blank/bm15/model/object/crud/Player;->setBaseMatchDefenseModifier(Ljava/lang/Integer;)V

    goto/16 :goto_4

    .line 226
    .end local v9    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_12
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/blank/bm15/model/object/crud/Player;

    .line 227
    .restart local v9    # "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticGameType()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    add-int/2addr v15, v11

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Lcom/blank/bm15/model/object/crud/Player;->getPenalty(Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    add-int v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v9, v15}, Lcom/blank/bm15/model/object/crud/Player;->setBaseMatchAttackModifier(Ljava/lang/Integer;)V

    .line 228
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticGameType()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    mul-int/lit8 v15, v15, -0x1

    add-int/2addr v15, v11

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Lcom/blank/bm15/model/object/crud/Player;->getPenalty(Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    add-int v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v9, v15}, Lcom/blank/bm15/model/object/crud/Player;->setBaseMatchDefenseModifier(Ljava/lang/Integer;)V

    goto/16 :goto_5

    .line 231
    .end local v9    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_13
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/blank/bm15/model/object/crud/Player;

    .line 232
    .restart local v9    # "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticGameType()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    add-int/2addr v15, v11

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Lcom/blank/bm15/model/object/crud/Player;->getPenalty(Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    add-int v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v9, v15}, Lcom/blank/bm15/model/object/crud/Player;->setBaseMatchAttackModifier(Ljava/lang/Integer;)V

    .line 233
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticGameType()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    mul-int/lit8 v15, v15, -0x1

    add-int/2addr v15, v11

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Lcom/blank/bm15/model/object/crud/Player;->getPenalty(Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    add-int v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v9, v15}, Lcom/blank/bm15/model/object/crud/Player;->setBaseMatchDefenseModifier(Ljava/lang/Integer;)V

    goto/16 :goto_6
.end method

.method private varargs createNewsAndAdd(IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;
    .locals 2
    .param p1, "matchday"    # I
    .param p2, "type"    # I
    .param p3, "title"    # I
    .param p4, "body"    # I
    .param p5, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 796
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    iget-object v1, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 797
    .local v0, "news":Lcom/blank/bm15/model/object/crud/News;
    iget-object v1, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 798
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 799
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 800
    iget-object v1, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 801
    iget-object v1, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 802
    iget-object v1, p0, Lcom/blank/bm15/model/core/Simulate;->newsList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 804
    return-object v0
.end method

.method private createUserNews(Lcom/blank/bm15/model/object/crud/Match;)V
    .locals 14
    .param p1, "match"    # Lcom/blank/bm15/model/object/crud/Match;

    .prologue
    .line 238
    const/4 v12, 0x0

    .line 239
    .local v12, "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getMvp()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v11

    .line 240
    .local v11, "mvp":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getMaxPts()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v8

    .line 241
    .local v8, "maxPts":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getMaxReb()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v9

    .line 242
    .local v9, "maxReb":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getMaxAst()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    .line 243
    .local v6, "maxAst":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getMaxStl()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v10

    .line 244
    .local v10, "maxStl":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getMaxBlk()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v7

    .line 245
    .local v7, "maxBlk":Lcom/blank/bm15/model/object/crud/Player;
    iget-object v0, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {p1, v0}, Lcom/blank/bm15/model/object/crud/Match;->getIsMathOfUserTeam(Lcom/blank/bm15/model/object/crud/Game;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    const v2, 0x7f020043

    .line 246
    .local v2, "resultIcon":I
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {p1, v0}, Lcom/blank/bm15/model/object/crud/Match;->getIsMathOfUserTeam(Lcom/blank/bm15/model/object/crud/Game;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    const v3, 0x7f050107

    .line 248
    .local v3, "titleText":I
    :goto_1
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const v4, 0x7f050108

    const/16 v0, 0x13

    new-array v5, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    .line 249
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v5, v0

    const/4 v0, 0x1

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v5, v0

    const/4 v0, 0x2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamWinner()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v5, v0

    const/4 v0, 0x3

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPer()Ljava/lang/Double;

    move-result-object v13

    aput-object v13, v5, v0

    const/4 v0, 0x4

    .line 250
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v5, v0

    const/4 v0, 0x5

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v5, v0

    const/4 v0, 0x6

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v5, v0

    const/4 v0, 0x7

    .line 251
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v5, v0

    const/16 v0, 0x8

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v5, v0

    const/16 v0, 0x9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/MatchResult;->getReboundsInt()Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v5, v0

    const/16 v0, 0xa

    .line 252
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v5, v0

    const/16 v0, 0xb

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v5, v0

    const/16 v0, 0xc

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOkInt()Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v5, v0

    const/16 v0, 0xd

    .line 253
    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v5, v0

    const/16 v0, 0xe

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v5, v0

    const/16 v0, 0xf

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/MatchResult;->getStealsInt()Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v5, v0

    const/16 v0, 0x10

    .line 254
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v5, v0

    const/16 v0, 0x11

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v5, v0

    const/16 v0, 0x12

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocksInt()Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v5, v0

    move-object v0, p0

    .line 248
    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/model/core/Simulate;->createNewsAndAdd(IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;

    move-result-object v12

    .line 256
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v12, v0}, Lcom/blank/bm15/model/object/crud/News;->setTeam1(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 257
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v12, v0}, Lcom/blank/bm15/model/object/crud/News;->setTeam2(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 258
    return-void

    .line 245
    .end local v2    # "resultIcon":I
    .end local v3    # "titleText":I
    :cond_0
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamWinner()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_1

    const v2, 0x7f020042

    goto/16 :goto_0

    :cond_1
    const v2, 0x7f02003c

    goto/16 :goto_0

    .line 246
    .restart local v2    # "resultIcon":I
    :cond_2
    const v3, 0x7f050106

    goto/16 :goto_1
.end method

.method private finishMatch(Lcom/blank/bm15/model/object/crud/Match;)V
    .locals 16
    .param p1, "match"    # Lcom/blank/bm15/model/object/crud/Match;

    .prologue
    .line 549
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/model/core/Simulate;->leagueList:Ljava/util/List;

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 550
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/model/core/Simulate;->leagueList:Ljava/util/List;

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 552
    invoke-static {}, Lcom/blank/bm15/model/core/Simulate;->getQuarters()Ljava/util/List;

    move-result-object v8

    .line 553
    .local v8, "localQuarters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v12, 0x0

    .line 554
    .local v12, "totalPoints":I
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getLocalExtension()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lez v1, :cond_1

    .line 555
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getLocalExtension()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v12

    .line 556
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTotalPointsLocalPlayers()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v1, v12

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Match;->setLocalExtension(Ljava/lang/Integer;)V

    .line 560
    :goto_0
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    mul-int/2addr v1, v12

    div-int/lit8 v1, v1, 0x64

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Match;->setLocalQuarterFirst(Ljava/lang/Integer;)V

    .line 561
    const/4 v1, 0x1

    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    mul-int/2addr v1, v12

    div-int/lit8 v1, v1, 0x64

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Match;->setLocalQuarterSecond(Ljava/lang/Integer;)V

    .line 562
    const/4 v1, 0x2

    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    mul-int/2addr v1, v12

    div-int/lit8 v1, v1, 0x64

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Match;->setLocalQuarterThird(Ljava/lang/Integer;)V

    .line 563
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getLocalQuarterFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int v1, v12, v1

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getLocalQuarterSecond()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getLocalQuarterThird()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Match;->setLocalQuarterFourth(Ljava/lang/Integer;)V

    .line 565
    invoke-static {}, Lcom/blank/bm15/model/core/Simulate;->getQuarters()Ljava/util/List;

    move-result-object v14

    .line 566
    .local v14, "visitorQuarters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorExtension()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lez v1, :cond_2

    .line 567
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorExtension()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v12

    .line 568
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTotalPointsVisitorPlayers()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v1, v12

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Match;->setVisitorExtension(Ljava/lang/Integer;)V

    .line 572
    :goto_1
    const/4 v1, 0x0

    invoke-interface {v14, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    mul-int/2addr v1, v12

    div-int/lit8 v1, v1, 0x64

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Match;->setVisitorQuarterFirst(Ljava/lang/Integer;)V

    .line 573
    const/4 v1, 0x1

    invoke-interface {v14, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    mul-int/2addr v1, v12

    div-int/lit8 v1, v1, 0x64

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Match;->setVisitorQuarterSecond(Ljava/lang/Integer;)V

    .line 574
    const/4 v1, 0x2

    invoke-interface {v14, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    mul-int/2addr v1, v12

    div-int/lit8 v1, v1, 0x64

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Match;->setVisitorQuarterThird(Ljava/lang/Integer;)V

    .line 575
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorQuarterFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int v1, v12, v1

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorQuarterSecond()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorQuarterThird()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Match;->setVisitorQuarterFourth(Ljava/lang/Integer;)V

    .line 577
    const/4 v7, 0x0

    .line 578
    .local v7, "localBono":I
    const/4 v13, 0x0

    .line 579
    .local v13, "visitorBono":I
    const/16 v1, 0xa7

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-le v1, v2, :cond_4

    .line 580
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/League;->getPointsScored()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/League;->setPointsScored(Ljava/lang/Integer;)V

    .line 581
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/League;->getPointsAllowed()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/League;->setPointsAllowed(Ljava/lang/Integer;)V

    .line 582
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/League;->getPointsScored()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/League;->setPointsScored(Ljava/lang/Integer;)V

    .line 583
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/League;->getPointsAllowed()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/League;->setPointsAllowed(Ljava/lang/Integer;)V

    .line 585
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-le v1, v2, :cond_3

    .line 586
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/League;->getGamesWon()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/League;->setGamesWon(Ljava/lang/Integer;)V

    .line 587
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/League;->getGamesLost()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/League;->setGamesLost(Ljava/lang/Integer;)V

    .line 589
    const/4 v7, 0x1

    .line 590
    const/4 v13, -0x1

    .line 671
    :cond_0
    :goto_2
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v7}, Lcom/blank/bm15/model/core/Simulate;->updateFormAndEnergy(Lcom/blank/bm15/model/object/crud/Team;I)V

    .line 672
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v13}, Lcom/blank/bm15/model/core/Simulate;->updateFormAndEnergy(Lcom/blank/bm15/model/object/crud/Team;I)V

    .line 673
    return-void

    .line 558
    .end local v7    # "localBono":I
    .end local v13    # "visitorBono":I
    .end local v14    # "visitorQuarters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTotalPointsLocalPlayers()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v12

    goto/16 :goto_0

    .line 570
    .restart local v14    # "visitorQuarters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTotalPointsVisitorPlayers()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v12

    goto/16 :goto_1

    .line 592
    .restart local v7    # "localBono":I
    .restart local v13    # "visitorBono":I
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/League;->getGamesWon()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/League;->setGamesWon(Ljava/lang/Integer;)V

    .line 593
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/League;->getGamesLost()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/League;->setGamesLost(Ljava/lang/Integer;)V

    .line 595
    const/4 v7, -0x1

    .line 596
    const/4 v13, 0x1

    .line 598
    goto :goto_2

    .line 599
    :cond_4
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/model/core/Simulate;->playoffsList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/blank/bm15/model/object/crud/Playoffs;

    .line 601
    .local v11, "playoffs":Lcom/blank/bm15/model/object/crud/Playoffs;
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v2, v3, :cond_c

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-le v2, v3, :cond_c

    .line 602
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->addSeriesGamesWon()V

    .line 604
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_6

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_6

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0xc

    if-ne v1, v2, :cond_9

    .line 605
    :cond_6
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const v3, 0x7f02003e

    const v4, 0x7f05011b

    const v5, 0x7f05011c

    const/4 v1, 0x2

    new-array v6, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v6, v1

    const/4 v1, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v6, v1

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/blank/bm15/model/core/Simulate;->createNewsAndAdd(IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;

    move-result-object v9

    .line 606
    .local v9, "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v9, v1}, Lcom/blank/bm15/model/object/crud/News;->setTeam1(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 607
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v9, v1}, Lcom/blank/bm15/model/object/crud/News;->setTeam2(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 609
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0xc

    if-ne v1, v2, :cond_7

    .line 610
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_8

    .line 631
    .end local v9    # "news":Lcom/blank/bm15/model/object/crud/News;
    :cond_7
    :goto_4
    const/4 v7, 0x2

    .line 632
    const/4 v13, -0x2

    .line 633
    goto/16 :goto_2

    .line 610
    .restart local v9    # "news":Lcom/blank/bm15/model/object/crud/News;
    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/blank/bm15/model/object/crud/Player;

    .line 611
    .local v10, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v10, v2}, Lcom/blank/bm15/model/object/crud/Player;->setLoyalty(Ljava/lang/Integer;)V

    goto :goto_3

    .line 614
    .end local v9    # "news":Lcom/blank/bm15/model/object/crud/News;
    .end local v10    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_9
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x10

    if-ne v1, v2, :cond_7

    .line 615
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const v3, 0x7f020041

    const v4, 0x7f05011d

    const v5, 0x7f05011e

    const/4 v1, 0x1

    new-array v6, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v6, v1

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/blank/bm15/model/core/Simulate;->createNewsAndAdd(IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;

    move-result-object v9

    .line 616
    .restart local v9    # "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v9, v1}, Lcom/blank/bm15/model/object/crud/News;->setTeam1(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 618
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_a

    .line 622
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_b

    .line 626
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_7

    .line 627
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/ChallengesFragment;->addChallenge(Lcom/blank/bm15/model/object/crud/Game;)V

    goto/16 :goto_4

    .line 618
    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/blank/bm15/model/object/crud/Player;

    .line 619
    .restart local v10    # "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v10, v2}, Lcom/blank/bm15/model/object/crud/Player;->setLoyalty(Ljava/lang/Integer;)V

    goto :goto_5

    .line 622
    .end local v10    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_b
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/blank/bm15/model/object/crud/Player;

    .line 623
    .restart local v10    # "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v10, v2}, Lcom/blank/bm15/model/object/crud/Player;->setLoyalty(Ljava/lang/Integer;)V

    goto :goto_6

    .line 634
    .end local v9    # "news":Lcom/blank/bm15/model/object/crud/News;
    .end local v10    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_c
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v2, v3, :cond_5

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ge v2, v3, :cond_5

    .line 635
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->addSeriesGamesWon()V

    .line 637
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_d

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_d

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0xc

    if-ne v1, v2, :cond_10

    .line 638
    :cond_d
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const v3, 0x7f02003e

    const v4, 0x7f05011b

    const v5, 0x7f05011c

    const/4 v1, 0x2

    new-array v6, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v6, v1

    const/4 v1, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v6, v1

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/blank/bm15/model/core/Simulate;->createNewsAndAdd(IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;

    move-result-object v9

    .line 639
    .restart local v9    # "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v9, v1}, Lcom/blank/bm15/model/object/crud/News;->setTeam1(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 640
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v9, v1}, Lcom/blank/bm15/model/object/crud/News;->setTeam2(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 642
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0xc

    if-ne v1, v2, :cond_e

    .line 643
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_f

    .line 664
    .end local v9    # "news":Lcom/blank/bm15/model/object/crud/News;
    :cond_e
    :goto_8
    const/4 v7, -0x2

    .line 665
    const/4 v13, 0x2

    .line 666
    goto/16 :goto_2

    .line 643
    .restart local v9    # "news":Lcom/blank/bm15/model/object/crud/News;
    :cond_f
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/blank/bm15/model/object/crud/Player;

    .line 644
    .restart local v10    # "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v10, v2}, Lcom/blank/bm15/model/object/crud/Player;->setLoyalty(Ljava/lang/Integer;)V

    goto :goto_7

    .line 647
    .end local v9    # "news":Lcom/blank/bm15/model/object/crud/News;
    .end local v10    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_10
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x10

    if-ne v1, v2, :cond_e

    .line 648
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const v3, 0x7f020041

    const v4, 0x7f05011d

    const v5, 0x7f05011e

    const/4 v1, 0x1

    new-array v6, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v6, v1

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/blank/bm15/model/core/Simulate;->createNewsAndAdd(IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;

    move-result-object v9

    .line 649
    .restart local v9    # "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v9, v1}, Lcom/blank/bm15/model/object/crud/News;->setTeam1(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 651
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_11

    .line 655
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_12

    .line 659
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_e

    .line 660
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/ChallengesFragment;->addChallenge(Lcom/blank/bm15/model/object/crud/Game;)V

    goto/16 :goto_8

    .line 651
    :cond_11
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/blank/bm15/model/object/crud/Player;

    .line 652
    .restart local v10    # "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v10, v2}, Lcom/blank/bm15/model/object/crud/Player;->setLoyalty(Ljava/lang/Integer;)V

    goto :goto_9

    .line 655
    .end local v10    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_12
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/blank/bm15/model/object/crud/Player;

    .line 656
    .restart local v10    # "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v10, v2}, Lcom/blank/bm15/model/object/crud/Player;->setLoyalty(Ljava/lang/Integer;)V

    goto :goto_a
.end method

.method private static getQuarters()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v6, 0x18

    const/4 v5, 0x3

    const/4 v4, 0x1

    .line 775
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 777
    .local v1, "random":I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 778
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    if-ne v1, v4, :cond_1

    .line 779
    const/16 v2, 0x15

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 780
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 781
    const/16 v2, 0x1d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 791
    :cond_0
    :goto_0
    invoke-static {v0}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 792
    return-object v0

    .line 782
    :cond_1
    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 783
    const/16 v2, 0x11

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 784
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 785
    const/16 v2, 0x1c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 786
    :cond_2
    if-ne v1, v5, :cond_0

    .line 787
    const/16 v2, 0x16

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 788
    const/16 v2, 0x1a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 789
    const/16 v2, 0x21

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private static getRandomValueGauss(Ljava/lang/Integer;Ljava/lang/Integer;)I
    .locals 2
    .param p0, "minValue"    # Ljava/lang/Integer;
    .param p1, "maxValue"    # Ljava/lang/Integer;

    .prologue
    .line 520
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 522
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {p0, p1}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 523
    invoke-static {p0, p1}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 524
    invoke-static {p0, p1}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 526
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 527
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method

.method private getRulete(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;
    .locals 1
    .param p1, "ruleteSkill"    # Ljava/lang/Integer;
    .param p2, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 771
    iget-object v0, p0, Lcom/blank/bm15/model/core/Simulate;->rulete:Lcom/blank/bm15/model/object/other/Rulete;

    invoke-virtual {v0, p1, p2}, Lcom/blank/bm15/model/object/other/Rulete;->getRulete(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    return-object v0
.end method

.method private static loseManyPoints(Lcom/blank/bm15/model/object/crud/Match;Lcom/blank/bm15/model/object/crud/Team;Lcom/blank/bm15/model/object/crud/Team;)Z
    .locals 8
    .param p0, "match"    # Lcom/blank/bm15/model/object/crud/Match;
    .param p1, "teamThatGetsTheRebound"    # Lcom/blank/bm15/model/object/crud/Team;
    .param p2, "teamOther"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 531
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageTitulars()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageReserves()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    add-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 532
    .local v1, "averageTeamThatGetsTheRebound":I
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageTitulars()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageReserves()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    add-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 533
    .local v0, "averageTeamOther":I
    sub-int v3, v1, v0

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int/lit8 v2, v3, 0x2

    .line 535
    .local v2, "difference":I
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v3, v4, :cond_0

    .line 536
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTotalPointsLocalPlayers()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v3, v2

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTotalPointsVisitorPlayers()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 537
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .line 545
    :goto_0
    return v3

    .line 540
    :cond_0
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTotalPointsVisitorPlayers()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v3, v2

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTotalPointsLocalPlayers()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 541
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    goto :goto_0

    .line 545
    :cond_1
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    goto :goto_0
.end method

.method private playMatch(Lcom/blank/bm15/model/object/crud/Match;)V
    .locals 6
    .param p1, "match"    # Lcom/blank/bm15/model/object/crud/Match;

    .prologue
    .line 315
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-direct {p0, p1, v4}, Lcom/blank/bm15/model/core/Simulate;->calculateMinutes(Lcom/blank/bm15/model/object/crud/Match;Z)V

    .line 316
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-direct {p0, p1, v4}, Lcom/blank/bm15/model/core/Simulate;->calculateMinutes(Lcom/blank/bm15/model/object/crud/Match;Z)V

    .line 317
    const/16 v1, 0x78

    .line 320
    .local v1, "possessions":I
    new-instance v4, Lcom/blank/bm15/model/object/other/Rulete;

    invoke-direct {v4, p1}, Lcom/blank/bm15/model/object/other/Rulete;-><init>(Lcom/blank/bm15/model/object/crud/Match;)V

    iput-object v4, p0, Lcom/blank/bm15/model/core/Simulate;->rulete:Lcom/blank/bm15/model/object/other/Rulete;

    .line 322
    const/4 v2, 0x0

    .line 323
    .local v2, "teamAttack":Lcom/blank/bm15/model/object/crud/Team;
    const/4 v3, 0x0

    .line 324
    .local v3, "teamDefense":Lcom/blank/bm15/model/object/crud/Team;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 344
    invoke-direct {p0, p1}, Lcom/blank/bm15/model/core/Simulate;->finishMatch(Lcom/blank/bm15/model/object/crud/Match;)V

    .line 345
    return-void

    .line 325
    :cond_0
    rem-int/lit8 v4, v0, 0x2

    if-nez v4, :cond_2

    .line 326
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    .line 327
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    .line 333
    :goto_1
    invoke-direct {p0, v0, p1, v2, v3}, Lcom/blank/bm15/model/core/Simulate;->playPossession(ILcom/blank/bm15/model/object/crud/Match;Lcom/blank/bm15/model/object/crud/Team;Lcom/blank/bm15/model/object/crud/Team;)V

    .line 335
    add-int/lit8 v4, v1, -0x1

    if-ne v0, v4, :cond_1

    .line 336
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTotalPointsLocalPlayers()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTotalPointsVisitorPlayers()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_1

    .line 337
    add-int/lit8 v1, v1, 0x5

    .line 338
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTotalPointsLocalPlayers()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/blank/bm15/model/object/crud/Match;->setLocalExtension(Ljava/lang/Integer;)V

    .line 339
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTotalPointsVisitorPlayers()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/blank/bm15/model/object/crud/Match;->setVisitorExtension(Ljava/lang/Integer;)V

    .line 324
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 329
    :cond_2
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    .line 330
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    goto :goto_1
.end method

.method private playPossession(ILcom/blank/bm15/model/object/crud/Match;Lcom/blank/bm15/model/object/crud/Team;Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 24
    .param p1, "pos"    # I
    .param p2, "match"    # Lcom/blank/bm15/model/object/crud/Match;
    .param p3, "teamAttack"    # Lcom/blank/bm15/model/object/crud/Team;
    .param p4, "teamDefense"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 348
    const v19, 0x3f266666    # 0.65f

    .line 349
    .local v19, "shotModifier":F
    const/16 v20, 0x1

    .line 350
    .local v20, "shotType":I
    const/16 v21, 0x0

    .line 351
    .local v21, "shotValue":I
    const/16 v22, 0x0

    .line 352
    .local v22, "shotsFree":I
    const/16 v12, 0xb

    .line 353
    .local v12, "attemptBlock":I
    const/4 v11, 0x0

    .line 354
    .local v11, "assistanceModifier":I
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v15

    .line 355
    .local v15, "isFoul":Z
    const/16 v18, 0x0

    .line 356
    .local v18, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/16 v17, 0x0

    .line 359
    .local v17, "opponent":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v5, 0x4

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/core/Simulate;->skillAttempt(I)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual/range {p3 .. p3}, Lcom/blank/bm15/model/object/crud/Team;->getMoreInjuries()Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 360
    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v5, v1}, Lcom/blank/bm15/model/core/Simulate;->getRulete(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v18

    .line 361
    if-eqz v18, :cond_0

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPhysique()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchDefenseModifier()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/2addr v6, v7

    mul-int/2addr v5, v6

    div-int/lit8 v5, v5, 0x64

    const/high16 v6, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6}, Lcom/blank/bm15/model/core/Simulate;->accomplishedAction(IF)Z

    move-result v5

    if-nez v5, :cond_0

    .line 362
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-nez v5, :cond_2

    .line 363
    const/4 v5, -0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lcom/blank/bm15/model/object/crud/Player;->setStateInjury(Ljava/lang/Integer;)V

    .line 382
    :cond_0
    :goto_0
    const/16 v5, 0xe

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/core/Simulate;->skillAttempt(I)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 383
    const/4 v5, 0x3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v5, v1}, Lcom/blank/bm15/model/core/Simulate;->getRulete(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v17

    .line 384
    if-eqz v17, :cond_5

    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Player;->getSkillSteal()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchDefenseModifier()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/2addr v5, v6

    const/high16 v6, 0x3f000000    # 0.5f

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6}, Lcom/blank/bm15/model/core/Simulate;->accomplishedAction(IF)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 385
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addSteal()V

    .line 517
    :cond_1
    :goto_1
    return-void

    .line 364
    :cond_2
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_0

    .line 365
    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/16 v6, 0x64

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v13

    .line 366
    .local v13, "damageType":I
    const/16 v5, 0x50

    if-gt v13, v5, :cond_3

    .line 367
    const/4 v5, 0x2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lcom/blank/bm15/model/object/crud/Player;->setStateInjury(Ljava/lang/Integer;)V

    .line 373
    :goto_2
    invoke-virtual/range {p3 .. p3}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v5, v6, :cond_0

    .line 374
    invoke-virtual/range {p2 .. p2}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const v7, 0x7f02003b

    const v8, 0x7f050102

    const v9, 0x7f050103

    const/4 v5, 0x2

    new-array v10, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v10, v5

    const/4 v5, 0x1

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Integer;->intValue()I

    move-result v23

    add-int/lit8 v23, v23, -0x1

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v10, v5

    move-object/from16 v5, p0

    invoke-direct/range {v5 .. v10}, Lcom/blank/bm15/model/core/Simulate;->createNewsAndAdd(IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;

    move-result-object v16

    .line 375
    .local v16, "news":Lcom/blank/bm15/model/object/crud/News;
    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setPlayer1(Lcom/blank/bm15/model/object/crud/Player;)V

    goto/16 :goto_0

    .line 368
    .end local v16    # "news":Lcom/blank/bm15/model/object/crud/News;
    :cond_3
    const/16 v5, 0x63

    if-gt v13, v5, :cond_4

    .line 369
    const/16 v5, 0x8

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/16 v6, 0x31

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lcom/blank/bm15/model/object/crud/Player;->setStateInjury(Ljava/lang/Integer;)V

    goto :goto_2

    .line 371
    :cond_4
    const/16 v5, 0x32

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/16 v6, 0xb4

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lcom/blank/bm15/model/object/crud/Player;->setStateInjury(Ljava/lang/Integer;)V

    goto/16 :goto_2

    .line 391
    .end local v13    # "damageType":I
    :cond_5
    const/16 v5, 0x11

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/core/Simulate;->skillAttempt(I)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 392
    const/4 v5, 0x5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v5, v1}, Lcom/blank/bm15/model/core/Simulate;->getRulete(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v18

    .line 393
    if-eqz v18, :cond_6

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPass()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchAttackModifier()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/2addr v5, v6

    const v6, 0x3f19999a    # 0.6f

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6}, Lcom/blank/bm15/model/core/Simulate;->accomplishedAction(IF)Z

    move-result v5

    if-nez v5, :cond_6

    .line 394
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addPassKO()V

    goto/16 :goto_1

    .line 400
    :cond_6
    const/16 v5, 0xa

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/core/Simulate;->skillAttempt(I)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 401
    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v5, v1}, Lcom/blank/bm15/model/core/Simulate;->getRulete(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v17

    .line 402
    if-eqz v17, :cond_7

    .line 403
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addFoulMade()V

    .line 408
    :cond_7
    const/4 v11, 0x0

    .line 409
    const/16 v5, 0x22

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/core/Simulate;->skillAttempt(I)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 410
    const/4 v5, 0x5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v5, v1}, Lcom/blank/bm15/model/core/Simulate;->getRulete(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v18

    .line 411
    if-eqz v18, :cond_8

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPass()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchAttackModifier()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/2addr v5, v6

    const/high16 v6, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6}, Lcom/blank/bm15/model/core/Simulate;->accomplishedAction(IF)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 412
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addPassOK()V

    .line 413
    const/4 v11, 0x5

    .line 418
    :cond_8
    invoke-virtual/range {p3 .. p3}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticShotIntPercent()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/core/Simulate;->skillAttempt(I)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 420
    const v19, 0x3f266666    # 0.65f

    .line 421
    const/16 v20, 0x1

    .line 422
    const/16 v12, 0xb

    .line 423
    const/4 v5, 0x6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v5, v1}, Lcom/blank/bm15/model/core/Simulate;->getRulete(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v18

    .line 424
    if-eqz v18, :cond_9

    .line 425
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotInterior()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchAttackModifier()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int v21, v5, v6

    .line 443
    :cond_9
    :goto_3
    if-eqz v18, :cond_1

    .line 444
    mul-int v5, v21, v11

    div-int/lit8 v5, v5, 0x64

    add-int v21, v21, v5

    .line 445
    const/4 v5, 0x2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v5, v1}, Lcom/blank/bm15/model/core/Simulate;->getRulete(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v17

    .line 447
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/blank/bm15/model/core/Simulate;->skillAttempt(I)Z

    move-result v5

    if-eqz v5, :cond_c

    if-eqz v17, :cond_c

    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Player;->getSkillBlock()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchDefenseModifier()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/2addr v5, v6

    .line 448
    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/16 v7, 0x64

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/core/Simulate;->getRandomValueGauss(Ljava/lang/Integer;Ljava/lang/Integer;)I

    move-result v6

    add-int/2addr v5, v6

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/16 v7, 0x64

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/core/Simulate;->getRandomValueGauss(Ljava/lang/Integer;Ljava/lang/Integer;)I

    move-result v6

    add-int v6, v6, v21

    if-le v5, v6, :cond_c

    .line 449
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addBlock()V

    goto/16 :goto_1

    .line 429
    :cond_a
    invoke-virtual/range {p3 .. p3}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticShotTriplePercent()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/core/Simulate;->skillAttempt(I)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 430
    const v19, 0x3ee66666    # 0.45f

    .line 431
    const/16 v20, 0x3

    .line 436
    :goto_4
    const/16 v12, 0x9

    .line 437
    const/4 v5, 0x7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v5, v1}, Lcom/blank/bm15/model/core/Simulate;->getRulete(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v18

    .line 438
    if-eqz v18, :cond_9

    .line 439
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotExterior()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchAttackModifier()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int v21, v5, v6

    goto/16 :goto_3

    .line 433
    :cond_b
    const v19, 0x3f0ccccd    # 0.55f

    .line 434
    const/16 v20, 0x2

    goto :goto_4

    .line 453
    :cond_c
    const/16 v5, 0xf

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/core/Simulate;->skillAttempt(I)Z

    move-result v5

    if-eqz v5, :cond_d

    if-eqz v17, :cond_d

    .line 454
    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/16 v6, 0x64

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/blank/bm15/model/core/Simulate;->getRandomValueGauss(Ljava/lang/Integer;Ljava/lang/Integer;)I

    move-result v5

    add-int v5, v5, v21

    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Player;->getSkillBlock()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 455
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchDefenseModifier()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/2addr v6, v7

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/16 v8, 0x64

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/blank/bm15/model/core/Simulate;->getRandomValueGauss(Ljava/lang/Integer;Ljava/lang/Integer;)I

    move-result v7

    add-int/2addr v6, v7

    if-le v5, v6, :cond_d

    .line 456
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addFoulMade()V

    .line 457
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v15

    .line 458
    add-int/lit8 v21, v21, -0xa

    .line 461
    :cond_d
    move-object/from16 v0, p0

    move/from16 v1, v21

    move/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/blank/bm15/model/core/Simulate;->accomplishedAction(IF)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 462
    const/4 v5, 0x1

    move/from16 v0, v20

    if-ne v0, v5, :cond_f

    .line 463
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addShotsInteriorOk()V

    .line 469
    :goto_5
    if-eqz v15, :cond_e

    .line 470
    const/16 v22, 0x1

    .line 508
    :cond_e
    :goto_6
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_7
    move/from16 v0, v22

    if-ge v14, v0, :cond_1

    .line 509
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotFree()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchAttackModifier()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/2addr v5, v6

    const/high16 v6, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6}, Lcom/blank/bm15/model/core/Simulate;->accomplishedAction(IF)Z

    move-result v5

    if-eqz v5, :cond_17

    .line 510
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addShotsFreeOk()V

    .line 508
    :goto_8
    add-int/lit8 v14, v14, 0x1

    goto :goto_7

    .line 464
    .end local v14    # "i":I
    :cond_f
    const/4 v5, 0x2

    move/from16 v0, v20

    if-ne v0, v5, :cond_10

    .line 465
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addShotExteriorDoubleOk()V

    goto :goto_5

    .line 467
    :cond_10
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addShotExteriorTripleOk()V

    goto :goto_5

    .line 473
    :cond_11
    const/4 v5, 0x1

    move/from16 v0, v20

    if-ne v0, v5, :cond_13

    .line 474
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addShotsInteriorKo()V

    .line 480
    :goto_9
    if-eqz v15, :cond_15

    const/4 v5, 0x3

    move/from16 v0, v20

    if-ne v0, v5, :cond_15

    .line 481
    const/16 v22, 0x3

    .line 486
    :cond_12
    :goto_a
    if-nez v22, :cond_e

    const/16 v5, 0x4c

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/core/Simulate;->skillAttempt(I)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 487
    const/4 v5, 0x4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v5, v1}, Lcom/blank/bm15/model/core/Simulate;->getRulete(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v18

    .line 488
    const/4 v5, 0x4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v5, v1}, Lcom/blank/bm15/model/core/Simulate;->getRulete(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v17

    .line 489
    if-eqz v18, :cond_16

    if-eqz v17, :cond_16

    .line 490
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getSkillRebound()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchDefenseModifier()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/2addr v5, v6

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/16 v7, 0x64

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/core/Simulate;->getRandomValueGauss(Ljava/lang/Integer;Ljava/lang/Integer;)I

    move-result v6

    add-int/2addr v5, v6

    .line 491
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Player;->getSkillRebound()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchDefenseModifier()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/2addr v6, v7

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/16 v8, 0x64

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/blank/bm15/model/core/Simulate;->getRandomValueGauss(Ljava/lang/Integer;Ljava/lang/Integer;)I

    move-result v7

    add-int/2addr v6, v7

    if-le v5, v6, :cond_16

    .line 492
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addRebound()V

    .line 494
    invoke-static/range {p2 .. p4}, Lcom/blank/bm15/model/core/Simulate;->loseManyPoints(Lcom/blank/bm15/model/object/crud/Match;Lcom/blank/bm15/model/object/crud/Team;Lcom/blank/bm15/model/object/crud/Team;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 495
    invoke-direct/range {p0 .. p4}, Lcom/blank/bm15/model/core/Simulate;->playPossession(ILcom/blank/bm15/model/object/crud/Match;Lcom/blank/bm15/model/object/crud/Team;Lcom/blank/bm15/model/object/crud/Team;)V

    goto/16 :goto_6

    .line 475
    :cond_13
    const/4 v5, 0x2

    move/from16 v0, v20

    if-ne v0, v5, :cond_14

    .line 476
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addShotExteriorDoubleKo()V

    goto/16 :goto_9

    .line 478
    :cond_14
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addShotExteriorTripleKo()V

    goto/16 :goto_9

    .line 482
    :cond_15
    if-eqz v15, :cond_12

    .line 483
    const/16 v22, 0x2

    goto/16 :goto_a

    .line 497
    :cond_16
    if-eqz v17, :cond_e

    .line 498
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addRebound()V

    .line 500
    move-object/from16 v0, p2

    move-object/from16 v1, p4

    move-object/from16 v2, p3

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/Simulate;->loseManyPoints(Lcom/blank/bm15/model/object/crud/Match;Lcom/blank/bm15/model/object/crud/Team;Lcom/blank/bm15/model/object/crud/Team;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 501
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move-object/from16 v4, p3

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/core/Simulate;->playPossession(ILcom/blank/bm15/model/object/crud/Match;Lcom/blank/bm15/model/object/crud/Team;Lcom/blank/bm15/model/object/crud/Team;)V

    goto/16 :goto_6

    .line 512
    .restart local v14    # "i":I
    :cond_17
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->addShotsFreeKo()V

    goto/16 :goto_8
.end method

.method private setLineup(Lcom/blank/bm15/model/object/crud/Match;)V
    .locals 2
    .param p1, "match"    # Lcom/blank/bm15/model/object/crud/Match;

    .prologue
    .line 116
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 117
    iget-object v0, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 118
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 119
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/core/Lineup;->setBetterLineup(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 121
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 122
    iget-object v0, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 123
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 124
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/core/Lineup;->setBetterLineup(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 126
    :cond_1
    return-void
.end method

.method private skillAttempt(I)Z
    .locals 4
    .param p1, "attempt"    # I

    .prologue
    const/4 v1, 0x0

    .line 755
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x64

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 756
    .local v0, "random":I
    if-gt v0, p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method private updateFormAndEnergy(Lcom/blank/bm15/model/object/crud/Team;I)V
    .locals 6
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;
    .param p2, "bono"    # I

    .prologue
    .line 676
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticBenchImportance()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 678
    .local v0, "benchImportance":I
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 693
    return-void

    .line 678
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Player;

    .line 679
    .local v1, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getIsTitular()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 681
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    rsub-int/lit8 v4, v0, 0x6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    rsub-int/lit8 v5, v0, 0xb

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Player;->setStateForm(Ljava/lang/Integer;)V

    .line 682
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    rsub-int/lit8 v4, v0, 0x7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    rsub-int/lit8 v5, v0, 0xc

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Player;->setStateEnergy(Ljava/lang/Integer;)V

    goto :goto_0

    .line 683
    :cond_1
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getIsReserve()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 685
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/lit8 v4, v0, -0x5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    add-int/lit8 v5, v0, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Player;->setStateForm(Ljava/lang/Integer;)V

    .line 686
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/lit8 v4, v0, -0x2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    add-int/lit8 v5, v0, 0x3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Player;->setStateEnergy(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 689
    :cond_2
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    div-int/lit8 v5, v5, 0xa

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Player;->setStateForm(Ljava/lang/Integer;)V

    .line 690
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    rsub-int/lit8 v5, v5, 0x64

    div-int/lit8 v5, v5, 0x4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Player;->setStateEnergy(Ljava/lang/Integer;)V

    goto/16 :goto_0
.end method


# virtual methods
.method public getMatchListSize()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/blank/bm15/model/core/Simulate;->matchList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public playMatchOfPosition(I)Ljava/lang/String;
    .locals 6
    .param p1, "position"    # I

    .prologue
    .line 85
    iget-object v3, p0, Lcom/blank/bm15/model/core/Simulate;->matchList:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Match;

    .line 86
    .local v1, "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Match;->getName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 87
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Match;->getName()Ljava/lang/String;

    move-result-object v3

    .line 112
    :goto_0
    return-object v3

    .line 91
    :cond_0
    invoke-direct {p0, v1}, Lcom/blank/bm15/model/core/Simulate;->setLineup(Lcom/blank/bm15/model/object/crud/Match;)V

    .line 94
    invoke-direct {p0, v1}, Lcom/blank/bm15/model/core/Simulate;->createMatchResultsAndBonus(Lcom/blank/bm15/model/object/crud/Match;)V

    .line 97
    invoke-direct {p0, v1}, Lcom/blank/bm15/model/core/Simulate;->playMatch(Lcom/blank/bm15/model/object/crud/Match;)V

    .line 98
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 99
    .local v0, "localResult":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 100
    .local v2, "visitorResult":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f05002a

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Match;->setName(Ljava/lang/String;)V

    .line 103
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-direct {p0, v1, v3}, Lcom/blank/bm15/model/core/Simulate;->createAllNews(Lcom/blank/bm15/model/object/crud/Match;Lcom/blank/bm15/model/object/crud/Team;)V

    .line 104
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-direct {p0, v1, v3}, Lcom/blank/bm15/model/core/Simulate;->createAllNews(Lcom/blank/bm15/model/object/crud/Match;Lcom/blank/bm15/model/object/crud/Team;)V

    .line 107
    iget-object v3, p0, Lcom/blank/bm15/model/core/Simulate;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Match;->getIsMathOfUserTeam(Lcom/blank/bm15/model/object/crud/Game;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0xd4

    if-le v3, v4, :cond_2

    .line 108
    :cond_1
    invoke-direct {p0, v1}, Lcom/blank/bm15/model/core/Simulate;->createUserNews(Lcom/blank/bm15/model/object/crud/Match;)V

    .line 112
    :cond_2
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Match;->getName()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_0
.end method

.method public saveAll()V
    .locals 4

    .prologue
    .line 68
    iget-object v2, p0, Lcom/blank/bm15/model/core/Simulate;->playoffsList:Ljava/util/List;

    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 69
    iget-object v2, p0, Lcom/blank/bm15/model/core/Simulate;->leagueList:Ljava/util/List;

    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 70
    iget-object v2, p0, Lcom/blank/bm15/model/core/Simulate;->matchList:Ljava/util/List;

    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 71
    iget-object v2, p0, Lcom/blank/bm15/model/core/Simulate;->matchResultList:Ljava/util/List;

    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 73
    iget-object v2, p0, Lcom/blank/bm15/model/core/Simulate;->matchList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 78
    invoke-direct {p0}, Lcom/blank/bm15/model/core/Simulate;->calculateNewStateOfAllPlayers()Ljava/util/List;

    move-result-object v0

    .line 79
    .local v0, "allPlayersList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 81
    iget-object v2, p0, Lcom/blank/bm15/model/core/Simulate;->newsList:Ljava/util/List;

    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 82
    return-void

    .line 73
    .end local v0    # "allPlayersList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Match;

    .line 74
    .local v1, "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 75
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    goto :goto_0
.end method
