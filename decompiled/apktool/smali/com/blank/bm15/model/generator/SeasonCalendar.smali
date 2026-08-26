.class public Lcom/blank/bm15/model/generator/SeasonCalendar;
.super Ljava/lang/Object;
.source "SeasonCalendar.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static findTeam(Ljava/util/List;Ljava/lang/String;)Lcom/blank/bm15/model/object/crud/Team;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Team;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/blank/bm15/model/object/crud/Team;"
        }
    .end annotation

    .prologue
    .line 57
    .local p0, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 62
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 57
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Team;

    .line 58
    .local v0, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method

.method public static getMatchList(Lcom/blank/bm15/model/object/crud/Game;Ljava/util/List;)Ljava/util/List;
    .locals 6
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Team;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Match;",
            ">;"
        }
    .end annotation

    .prologue
    .line 14
    .local p1, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .local v2, "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekOneMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 18
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekTwoMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekThreeMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 20
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekFourMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 21
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekFiveMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 22
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekSixMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 23
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekSevenMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 24
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekEightMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 25
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekNineMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 26
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekTenMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 27
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekElevenMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 28
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekTwelveMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 29
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekThirteenMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 30
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekFourteenMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 31
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekFifteenMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 32
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekSixteenMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 33
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekSeventeenMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 34
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekEighteenMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 35
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekNineteenMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 36
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekTwentyMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 37
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekTwentyOneMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 38
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekTwentyTwoMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 39
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekTwentyThreeMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 40
    invoke-static {}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getWeekTwentyFourMatchCalendarList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 43
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 53
    return-object v2

    .line 43
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    .line 44
    .local v3, "matchdayCalendar":Lcom/blank/bm15/model/object/other/MatchdayCalendar;
    new-instance v1, Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v1, v5}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 45
    .local v1, "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->getMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/blank/bm15/model/object/crud/Match;->setMatchday(Ljava/lang/Integer;)V

    .line 46
    invoke-virtual {v1, p0}, Lcom/blank/bm15/model/object/crud/Match;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 47
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->getTeamLocal()Ljava/lang/String;

    move-result-object v5

    invoke-static {p1, v5}, Lcom/blank/bm15/model/generator/SeasonCalendar;->findTeam(Ljava/util/List;Ljava/lang/String;)Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/blank/bm15/model/object/crud/Match;->setTeamLocal(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 48
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->getTeamVisitor()Ljava/lang/String;

    move-result-object v5

    invoke-static {p1, v5}, Lcom/blank/bm15/model/generator/SeasonCalendar;->findTeam(Ljava/util/List;Ljava/lang/String;)Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/blank/bm15/model/object/crud/Match;->setTeamVisitor(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 50
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private static getWeekEightMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x38

    const/16 v8, 0x34

    const/16 v7, 0x37

    const/16 v6, 0x35

    const/16 v5, 0x32

    .line 483
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 485
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 486
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 487
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 488
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 489
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 490
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 491
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 492
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 493
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 494
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 495
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 496
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 497
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x33

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 498
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x33

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 499
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 500
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 501
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 502
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 503
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 504
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 505
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 506
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 507
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 508
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 509
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 510
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 511
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 512
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 513
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 514
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 515
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 516
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 517
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 518
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 519
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 520
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x36

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 521
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x36

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 522
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x36

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 523
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 524
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 525
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 526
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 527
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 528
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 529
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 530
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 531
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 532
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 533
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 534
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 535
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 536
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 537
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 538
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 540
    return-object v0
.end method

.method private static getWeekEighteenMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x7a

    const/16 v8, 0x78

    const/16 v7, 0x7b

    const/16 v6, 0x79

    const/16 v5, 0x7d

    .line 1054
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1056
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1057
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1058
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1059
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1060
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1061
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1062
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1063
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1064
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1065
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1066
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1067
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1068
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1069
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1070
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1071
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1072
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1073
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1074
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1075
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1076
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1077
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1078
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1079
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1080
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1081
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1082
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1083
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1084
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1085
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1086
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1087
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x7c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1088
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x7c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1089
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x7c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1090
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x7c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1091
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x7c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1092
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x7c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1093
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1094
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1095
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1096
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1097
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1098
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1099
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1100
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1101
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1102
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1103
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x7e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1104
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x7e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1105
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x7e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1107
    return-object v0
.end method

.method private static getWeekElevenMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x4c

    const/16 v8, 0x4b

    const/16 v7, 0x49

    const/16 v6, 0x4d

    const/16 v5, 0x48

    .line 664
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 666
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x47

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 667
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x47

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 668
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 669
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 670
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 671
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 672
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 673
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 674
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 675
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 676
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 677
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 678
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 679
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 680
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 681
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 682
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 683
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 684
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 685
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 686
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 687
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 688
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 689
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x4a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 690
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x4a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 691
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x4a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 692
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 693
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 694
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 695
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 696
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 697
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 698
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 699
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 700
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 701
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 702
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 703
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 704
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 705
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 706
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 707
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 708
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 709
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 710
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 711
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 712
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 713
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 714
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 716
    return-object v0
.end method

.method private static getWeekFifteenMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x68

    const/16 v8, 0x69

    const/16 v7, 0x67

    const/16 v6, 0x63

    const/16 v5, 0x65

    .line 876
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 878
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 879
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 880
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 881
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 882
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 883
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 884
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 885
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 886
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 887
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 888
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 889
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x64

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 890
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x64

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 891
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x64

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 892
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x64

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 893
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 894
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 895
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 896
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 897
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 898
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 899
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 900
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 901
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 902
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 903
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 904
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 905
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x66

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 906
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x66

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 907
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 908
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 909
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 910
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 911
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 912
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 913
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 914
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 915
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 916
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 917
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 918
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 919
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 920
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 921
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 922
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 923
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 924
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 925
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 926
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 927
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 928
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 929
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 930
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 931
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 933
    return-object v0
.end method

.method private static getWeekFiveMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x20

    const/16 v8, 0x23

    const/16 v7, 0x21

    const/16 v6, 0x1f

    const/16 v5, 0x1e

    .line 304
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 306
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x1d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x1d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 308
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x1d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 309
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x1d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 310
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 311
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 312
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 313
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 314
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 315
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 316
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 317
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 318
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 319
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 320
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 321
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 322
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 323
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 324
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 325
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 326
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 327
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 328
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 329
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 330
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 331
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 332
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 333
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 334
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 335
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 336
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 337
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 338
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 339
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 340
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 341
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 342
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 343
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 344
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 345
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 346
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 347
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 348
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 349
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 350
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 351
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x22

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 352
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x22

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 353
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x22

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 354
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x22

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 355
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x22

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 356
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 357
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 358
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 359
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 360
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 361
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 362
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 363
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 365
    return-object v0
.end method

.method private static getWeekFourMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x16

    const/16 v8, 0x1c

    const/16 v7, 0x1a

    const/16 v6, 0x19

    const/16 v5, 0x17

    .line 242
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 244
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 246
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 247
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 248
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 249
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 250
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 253
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 254
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 255
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 257
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 258
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 259
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 260
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x18

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 263
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x18

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 264
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 265
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 266
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 267
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 268
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 269
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 270
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 271
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 272
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 273
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 274
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 275
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 276
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 277
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 278
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 279
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 280
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 281
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 282
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 283
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 284
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 285
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x1b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 286
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x1b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 287
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x1b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 288
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x1b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 289
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x1b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 290
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 291
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 292
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 293
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 294
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 295
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 296
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 297
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 298
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 300
    return-object v0
.end method

.method private static getWeekFourteenMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x5c

    const/16 v8, 0x5d

    const/16 v7, 0x60

    const/16 v6, 0x5e

    const/16 v5, 0x61

    .line 821
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 823
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 824
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 825
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 826
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 827
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 828
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 829
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 830
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 831
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 832
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 833
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 834
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 835
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 836
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 837
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 838
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 839
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 840
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 841
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 842
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 843
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 844
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 845
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 846
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 847
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x5f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 848
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x5f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 849
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x5f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 850
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 851
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 852
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 853
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 854
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 855
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 856
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 857
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 858
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 859
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 860
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 861
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 862
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 863
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 864
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 865
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 866
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 867
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 868
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 869
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 870
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x62

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 872
    return-object v0
.end method

.method private static getWeekNineMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x3c

    const/16 v8, 0x3d

    const/16 v7, 0x3e

    const/16 v6, 0x3a

    const/16 v5, 0x3b

    .line 544
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 546
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x39

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 547
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x39

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 548
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x39

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 549
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x39

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 550
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 551
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 552
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 553
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 554
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 555
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 556
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 557
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 558
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 559
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 560
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 561
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 562
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 563
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 564
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 565
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 566
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 567
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 568
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 569
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 570
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 571
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 572
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 573
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 574
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 575
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 576
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 577
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 578
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 579
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 580
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 581
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 582
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 583
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 584
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 585
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 586
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 587
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 588
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 589
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 590
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 591
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x3f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 592
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x3f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 593
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x3f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 594
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x3f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 595
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x3f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 597
    return-object v0
.end method

.method private static getWeekNineteenMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x83

    const/16 v8, 0x82

    const/16 v7, 0x81

    const/16 v6, 0x84

    const/16 v5, 0x7f

    .line 1111
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1113
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1114
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1115
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1116
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1117
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1118
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1119
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1120
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1121
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1122
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1123
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1124
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x80

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1125
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x80

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1126
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x80

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1127
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x80

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1128
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x80

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1129
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x80

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1130
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1131
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1132
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1133
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1134
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1135
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1136
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1137
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1138
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1139
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1140
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1141
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1142
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1143
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1144
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1145
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1146
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1147
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1148
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1149
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1150
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1151
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1152
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1153
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1154
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1155
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1156
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1157
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1158
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1159
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1160
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1161
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1162
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1163
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1164
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x85

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1165
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x85

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1166
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x85

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1168
    return-object v0
.end method

.method private static getWeekOneMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x7

    const/4 v8, 0x6

    const/4 v7, 0x5

    const/4 v6, 0x4

    const/4 v5, 0x2

    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    return-object v0
.end method

.method private static getWeekSevenMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x2f

    const/16 v8, 0x30

    const/16 v7, 0x2e

    const/16 v6, 0x2b

    const/16 v5, 0x2d

    .line 425
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 427
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 428
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 429
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 430
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 431
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 432
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 433
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 434
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 435
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 436
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x2c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 437
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x2c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 438
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 439
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 440
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 441
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 442
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 443
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 444
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 445
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 446
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 447
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 448
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 449
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 450
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 451
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 452
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 453
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 454
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 455
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 456
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 457
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 458
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 459
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 460
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 461
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 462
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 463
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 464
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 465
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 466
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 467
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 468
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 469
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 470
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 471
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 472
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 473
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x31

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 474
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x31

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 475
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x31

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 476
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x31

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 477
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x31

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 479
    return-object v0
.end method

.method private static getWeekSeventeenMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x75

    const/16 v8, 0x73

    const/16 v7, 0x72

    const/16 v6, 0x76

    const/16 v5, 0x71

    .line 995
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 997
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 998
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 999
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1000
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1001
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1002
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1003
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1004
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1005
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1006
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1007
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1008
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1009
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1010
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1011
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1012
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1013
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1014
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1015
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1016
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1017
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1018
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1019
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1020
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1021
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1022
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1023
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x74

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1024
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x74

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1025
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x74

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1026
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x74

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1027
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x74

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1028
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1029
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1030
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1031
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1032
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1033
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1034
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1035
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1036
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1037
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1038
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1039
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1040
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1041
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1042
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1043
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1044
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1045
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x77

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1046
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x77

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1047
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x77

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1048
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x77

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1050
    return-object v0
.end method

.method private static getWeekSixMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x29

    const/16 v8, 0x2a

    const/16 v7, 0x24

    const/16 v6, 0x27

    const/16 v5, 0x26

    .line 369
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 371
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 372
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 373
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 374
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 375
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 376
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 377
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 378
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 379
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x25

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 380
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x25

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 381
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x25

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 382
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 383
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 384
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 385
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 386
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 387
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 388
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 389
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 390
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 391
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 392
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 393
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 394
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 395
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 396
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 397
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 398
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 399
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 400
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 401
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x28

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 402
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x28

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 403
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x28

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 404
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x28

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 405
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x28

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 406
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 407
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 408
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 409
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 410
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 411
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 412
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 413
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 414
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 415
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 416
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 417
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 418
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 419
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 421
    return-object v0
.end method

.method private static getWeekSixteenMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x6a

    const/16 v8, 0x6b

    const/16 v7, 0x6e

    const/16 v6, 0x6f

    const/16 v5, 0x6c

    .line 937
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 939
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 940
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 941
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 942
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 943
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 944
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 945
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 946
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 947
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 948
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 949
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 950
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 951
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 952
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 953
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 954
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 955
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 956
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 957
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 958
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 959
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 960
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 961
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 962
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 963
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 964
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 965
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x6d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 966
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x6d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 967
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 968
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 969
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 970
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 971
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 972
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 973
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 974
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 975
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 976
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 977
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 978
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 979
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 980
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 981
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 982
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 983
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 984
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 985
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 986
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 987
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x70

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 988
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x70

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 989
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x70

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 991
    return-object v0
.end method

.method private static getWeekTenMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x41

    const/16 v8, 0x46

    const/16 v7, 0x42

    const/16 v6, 0x40

    const/16 v5, 0x45

    .line 601
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 603
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 604
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 605
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 606
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 607
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 608
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 609
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 610
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 611
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 612
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 613
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 614
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 615
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 616
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 617
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 618
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 619
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 620
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 621
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 622
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 623
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 624
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 625
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 626
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 627
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 628
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x43

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 629
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x43

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 630
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x43

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 631
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x43

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 632
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x43

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 633
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x43

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 634
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x43

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 635
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x44

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 636
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x44

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 637
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x44

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 638
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 639
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 640
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 641
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 642
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 643
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 644
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 645
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 646
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 647
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 648
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 649
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 650
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 651
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 652
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 653
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 654
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 655
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 656
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 657
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 658
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 660
    return-object v0
.end method

.method private static getWeekThirteenMatchCalendarList()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v8, 0x55

    const/16 v7, 0x5b

    const/16 v6, 0x57

    const/16 v5, 0x56

    .line 780
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 782
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 783
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 784
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 785
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 786
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 787
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 788
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 789
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 790
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 791
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 792
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 793
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 794
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 795
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 796
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 797
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 798
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 799
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 800
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 801
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 802
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 803
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 804
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 808
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 809
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 810
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 811
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 812
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 813
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 814
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 815
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 817
    return-object v0
.end method

.method private static getWeekThreeMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0xf

    const/16 v8, 0x15

    const/16 v7, 0x13

    const/16 v6, 0x12

    const/16 v5, 0x10

    .line 186
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 188
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 189
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 202
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x11

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x11

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 208
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 209
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 221
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 223
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 226
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 228
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x14

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x14

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 230
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x14

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 233
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 234
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 235
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 236
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    return-object v0
.end method

.method private static getWeekTwelveMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x51

    const/16 v8, 0x50

    const/16 v7, 0x54

    const/16 v6, 0x52

    const/16 v5, 0x4f

    .line 720
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 722
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x4e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 723
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x4e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 724
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x4e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 725
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 726
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 727
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 728
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 729
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 730
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 731
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 732
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 733
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 734
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 735
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 736
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 737
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 738
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 739
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 740
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 741
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 742
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 743
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 744
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 745
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 746
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 747
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 748
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 749
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 750
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 751
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 752
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 753
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 754
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 755
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 756
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 757
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 758
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 759
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 760
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x53

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 761
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x53

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 762
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x53

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 763
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x53

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 764
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x53

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 765
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 766
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 767
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 768
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 769
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 770
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 771
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 772
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 773
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 774
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 776
    return-object v0
.end method

.method private static getWeekTwentyFourMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0xa5

    const/16 v8, 0xa3

    const/16 v7, 0xa2

    const/16 v6, 0xa4

    const/16 v5, 0xa6

    .line 1418
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1420
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1421
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1422
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1423
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1424
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1425
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1426
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1427
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1428
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1429
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1430
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1431
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1432
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1433
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1434
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1435
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1436
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1437
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1438
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1439
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1440
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1441
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1442
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1443
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1444
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1445
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1446
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1447
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1448
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1449
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1450
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1451
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1452
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1453
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1454
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1455
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1456
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1457
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1458
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1459
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1460
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1461
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1463
    return-object v0
.end method

.method private static getWeekTwentyMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x87

    const/16 v8, 0x89

    const/16 v7, 0x88

    const/16 v6, 0x8b

    const/16 v5, 0x86

    .line 1172
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1174
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1175
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1176
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1177
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1178
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1179
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1180
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1181
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1182
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1183
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1184
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1185
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1186
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1187
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1188
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1189
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1190
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1191
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1192
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1193
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1194
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1195
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1196
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1197
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1198
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1199
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1200
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1201
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1202
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1203
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1204
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1205
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1206
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x8a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1207
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x8a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1208
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x8a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1209
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x8a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1210
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x8a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1211
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1212
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1213
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1214
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1215
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1216
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1217
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1218
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1219
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1220
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1221
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x8c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1222
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x8c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1223
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x8c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1224
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x8c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1226
    return-object v0
.end method

.method private static getWeekTwentyOneMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x8f

    const/16 v8, 0x8e

    const/16 v7, 0x92

    const/16 v6, 0x90

    const/16 v5, 0x8d

    .line 1230
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1232
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1233
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1234
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1235
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1236
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1237
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1238
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1239
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1240
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1241
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1242
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1243
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1244
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1245
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1246
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1247
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1248
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1249
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1250
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1251
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1252
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1253
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1254
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1255
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1256
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1257
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1258
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1259
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1260
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1261
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1262
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1263
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1264
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1265
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1266
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1267
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x91

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1268
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x91

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1269
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x91

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1270
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x91

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1271
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1272
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1273
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1274
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1275
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1276
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1277
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1278
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1279
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1280
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1281
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x93

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1282
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x93

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1283
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x93

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1284
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x93

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1286
    return-object v0
.end method

.method private static getWeekTwentyThreeMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x9c

    const/16 v8, 0x9d

    const/16 v7, 0x9f

    const/16 v6, 0xa1

    const/16 v5, 0x9b

    .line 1351
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1353
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1354
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1355
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1356
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1357
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1358
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1359
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1360
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1361
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1362
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1363
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1364
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1365
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1366
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1367
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1368
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1369
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1370
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1371
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1372
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1373
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1374
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1375
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1376
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1377
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1378
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1379
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1380
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1381
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1382
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x9e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1383
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x9e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1384
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x9e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1385
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x9e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1386
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1387
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1388
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1389
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1390
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1391
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1392
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1393
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1394
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1395
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1396
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1397
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1398
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0xa0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1399
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0xa0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1400
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1401
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1402
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1403
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1404
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1405
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1406
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1407
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1408
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1409
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1410
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1411
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1412
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1414
    return-object v0
.end method

.method private static getWeekTwentyTwoMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x95

    const/16 v8, 0x96

    const/16 v7, 0x97

    const/16 v6, 0x94

    const/16 v5, 0x99

    .line 1290
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1292
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1293
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1294
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1295
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1296
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1297
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1298
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1299
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1300
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1301
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1302
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1303
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1304
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1305
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1306
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1307
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1308
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1309
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1310
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1311
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1312
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1313
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1314
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1315
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "GSW"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1316
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1317
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1318
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1319
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1320
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1321
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1322
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1323
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1324
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1325
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1326
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1327
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1328
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x98

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1329
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x98

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1330
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x98

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1331
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1332
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1333
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1334
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1335
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1336
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1337
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1338
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIL"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1339
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1340
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1341
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1342
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1343
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1344
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x9a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1345
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0x9a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1347
    return-object v0
.end method

.method private static getWeekTwoMatchCalendarList()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0xe

    const/16 v8, 0xc

    const/16 v7, 0x8

    const/16 v6, 0x9

    const/16 v5, 0xb

    .line 123
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIA"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHA"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "DAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "HOU"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CHI"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHO"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "DEN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 146
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NYK"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "ORL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BRO"

    const-string v4, "WAS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "OKC"

    const-string v4, "DET"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "MIN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAL"

    const-string v4, "NOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "SAN"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAC"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "UTA"

    const-string v4, "TOR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "ATL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "IND"

    const-string v4, "BRO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PHI"

    const-string v4, "CLE"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "BOS"

    const-string v4, "MIA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 164
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "LAC"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GSW"

    const-string v4, "MEM"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DAL"

    const-string v4, "MIL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "POR"

    const-string v4, "SAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0xd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "NYK"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0xd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "WAS"

    const-string v4, "OKC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0xd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NOR"

    const-string v4, "PHO"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v2, 0xd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "LAL"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ATL"

    const-string v4, "CHA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MEM"

    const-string v4, "IND"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "SAN"

    const-string v4, "PHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "ORL"

    const-string v4, "BOS"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CLE"

    const-string v4, "CHI"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "TOR"

    const-string v4, "HOU"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DEN"

    const-string v4, "UTA"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "DET"

    const-string v4, "POR"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN"

    const-string v4, "LAC"

    invoke-direct {v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 182
    return-object v0
.end method
