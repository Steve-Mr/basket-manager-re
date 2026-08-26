.class public Lcom/blank/bm15/model/core/ManagePlayoffs;
.super Ljava/lang/Object;
.source "ManagePlayoffs.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static varargs createNewsAndAdd(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Game;IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;
    .locals 2
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p2, "matchday"    # I
    .param p3, "type"    # I
    .param p4, "title"    # I
    .param p5, "body"    # I
    .param p6, "objects"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/News;",
            ">;",
            "Lcom/blank/bm15/model/object/crud/Game;",
            "IIII[",
            "Ljava/lang/Object;",
            ")",
            "Lcom/blank/bm15/model/object/crud/News;"
        }
    .end annotation

    .prologue
    .line 529
    .local p0, "newsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/News;>;"
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 530
    .local v0, "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 531
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 532
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 533
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 534
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 535
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 537
    return-object v0
.end method

.method private static createPlayoff(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/other/Classification;I)Lcom/blank/bm15/model/object/crud/Playoffs;
    .locals 3
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "classification"    # Lcom/blank/bm15/model/object/other/Classification;
    .param p2, "position"    # I

    .prologue
    .line 91
    new-instance v0, Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Playoffs;-><init>(Landroid/content/Context;)V

    .line 93
    .local v0, "playoffs":Lcom/blank/bm15/model/object/crud/Playoffs;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Team;->setId(Ljava/lang/Integer;)V

    .line 94
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Playoffs;->setPosition(Ljava/lang/Integer;)V

    .line 95
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/League;->getGamesWon()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Playoffs;->setGamesWon(Ljava/lang/Integer;)V

    .line 96
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/other/Classification;->getConference()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Playoffs;->setConference(Ljava/lang/Integer;)V

    .line 97
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/other/Classification;->getPointsScored()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/other/Classification;->getPointsAllowed()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Playoffs;->setPointsDiff(Ljava/lang/Integer;)V

    .line 98
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getLeague()Lcom/blank/bm15/model/object/crud/League;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/League;->getPointsScored()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Playoffs;->setPointsScored(Ljava/lang/Integer;)V

    .line 99
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 101
    return-object v0
.end method

.method private static createPlayoffsMatches(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 8
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 133
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v0, v6}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 134
    .local v0, "filter":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 135
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v5

    .line 136
    .local v5, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .local v3, "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/16 v7, 0xa7

    if-ne v6, v7, :cond_1

    .line 140
    invoke-static {p0}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffsSeriesQuarters(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;

    move-result-object v1

    .line 150
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_4

    .line 159
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 160
    return-void

    .line 141
    :cond_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/16 v7, 0xb6

    if-ne v6, v7, :cond_2

    .line 142
    invoke-static {p0}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffsSeriesSemis(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;

    move-result-object v1

    .line 143
    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/16 v7, 0xc5

    if-ne v6, v7, :cond_3

    .line 144
    invoke-static {p0}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffsSeriesConference(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;

    move-result-object v1

    .line 145
    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/16 v7, 0xd4

    if-ne v6, v7, :cond_0

    .line 146
    invoke-static {p0}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffsSeriesFinal(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;

    move-result-object v1

    goto :goto_0

    .line 150
    :cond_4
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    .line 151
    .local v4, "matchdayCalendar":Lcom/blank/bm15/model/object/other/MatchdayCalendar;
    new-instance v2, Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v2, v7}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 152
    .local v2, "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->getMatchday()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v7}, Lcom/blank/bm15/model/object/crud/Match;->setMatchday(Ljava/lang/Integer;)V

    .line 153
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Match;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 154
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->getTeamLocal()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/blank/bm15/model/core/ManagePlayoffs;->findTeam(Ljava/util/List;Ljava/lang/String;)Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v2, v7}, Lcom/blank/bm15/model/object/crud/Match;->setTeamLocal(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 155
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->getTeamVisitor()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/blank/bm15/model/core/ManagePlayoffs;->findTeam(Ljava/util/List;Ljava/lang/String;)Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v2, v7}, Lcom/blank/bm15/model/object/crud/Match;->setTeamVisitor(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 157
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
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
    .line 541
    .local p0, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 546
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 541
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Team;

    .line 542
    .local v0, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method

.method private static getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;
    .locals 3
    .param p1, "conference"    # I
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Playoffs;",
            ">;II)",
            "Lcom/blank/bm15/model/object/crud/Playoffs;"
        }
    .end annotation

    .prologue
    .line 520
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 525
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 520
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Playoffs;

    .line 521
    .local v0, "playoffs":Lcom/blank/bm15/model/object/crud/Playoffs;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getConference()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, p1, :cond_0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPosition()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, p2, :cond_0

    goto :goto_0
.end method

.method private static getPlayoffsSeriesConference(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;
    .locals 39
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    .line 362
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 364
    .local v20, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v19, Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v36

    move-object/from16 v0, v19

    move-object/from16 v1, v36

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Playoffs;-><init>(Landroid/content/Context;)V

    .line 365
    .local v19, "filter":Lcom/blank/bm15/model/object/crud/Playoffs;
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Playoffs;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 366
    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v21

    .line 369
    .local v21, "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    const/16 v36, 0x1

    const/16 v37, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v11

    .line 370
    .local v11, "eastTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x1

    const/16 v37, 0x2

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v12

    .line 371
    .local v12, "eastTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x1

    const/16 v37, 0x3

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v13

    .line 372
    .local v13, "eastTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x1

    const/16 v37, 0x4

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v14

    .line 373
    .local v14, "eastTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x1

    const/16 v37, 0x5

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v15

    .line 374
    .local v15, "eastTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x1

    const/16 v37, 0x6

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v16

    .line 375
    .local v16, "eastTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x1

    const/16 v37, 0x7

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v17

    .line 376
    .local v17, "eastTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x1

    const/16 v37, 0x8

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v18

    .line 378
    .local v18, "eastTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x2

    const/16 v37, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v28

    .line 379
    .local v28, "westTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x2

    const/16 v37, 0x2

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v29

    .line 380
    .local v29, "westTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x2

    const/16 v37, 0x3

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v30

    .line 381
    .local v30, "westTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x2

    const/16 v37, 0x4

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v31

    .line 382
    .local v31, "westTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x2

    const/16 v37, 0x5

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v32

    .line 383
    .local v32, "westTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x2

    const/16 v37, 0x6

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v33

    .line 384
    .local v33, "westTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x2

    const/16 v37, 0x7

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v34

    .line 385
    .local v34, "westTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v36, 0x2

    const/16 v37, 0x8

    move-object/from16 v0, v21

    move/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v35

    .line 388
    .local v35, "westTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    if-eqz v11, :cond_6

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_6

    move-object v5, v11

    .line 389
    .local v5, "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_0
    if-eqz v12, :cond_8

    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_8

    move-object v7, v12

    .line 390
    .local v7, "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_1
    if-eqz v13, :cond_a

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_a

    move-object v9, v13

    .line 391
    .local v9, "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_2
    if-eqz v14, :cond_c

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_c

    move-object v10, v14

    .line 393
    .local v10, "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_3
    if-eqz v28, :cond_e

    invoke-virtual/range {v28 .. v28}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_e

    move-object/from16 v22, v28

    .line 394
    .local v22, "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_4
    if-eqz v29, :cond_10

    invoke-virtual/range {v29 .. v29}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_10

    move-object/from16 v24, v29

    .line 395
    .local v24, "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_5
    if-eqz v30, :cond_12

    invoke-virtual/range {v30 .. v30}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_12

    move-object/from16 v26, v30

    .line 396
    .local v26, "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_6
    if-eqz v31, :cond_14

    invoke-virtual/range {v31 .. v31}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_14

    move-object/from16 v27, v31

    .line 399
    .local v27, "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_7
    if-eqz v5, :cond_16

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_16

    move-object v6, v5

    .line 400
    .local v6, "eastSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_8
    if-eqz v7, :cond_18

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_18

    move-object v8, v7

    .line 402
    .local v8, "eastSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_9
    if-eqz v22, :cond_1a

    invoke-virtual/range {v22 .. v22}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_1a

    move-object/from16 v23, v22

    .line 403
    .local v23, "westSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_a
    if-eqz v24, :cond_1c

    invoke-virtual/range {v24 .. v24}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_1c

    move-object/from16 v25, v24

    .line 405
    .local v25, "westSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_b
    if-eqz v6, :cond_5

    if-eqz v6, :cond_5

    if-eqz v23, :cond_5

    if-eqz v25, :cond_5

    .line 408
    new-instance v36, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v37, 0xc6

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    sget-object v38, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v6, v8, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 410
    new-instance v36, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v37, 0xc7

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    sget-object v38, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v23

    move-object/from16 v3, v25

    move-object/from16 v4, v38

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 412
    new-instance v36, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v37, 0xc8

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    sget-object v38, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v6, v8, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 414
    new-instance v36, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v37, 0xc9

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    sget-object v38, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v23

    move-object/from16 v3, v25

    move-object/from16 v4, v38

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 417
    new-instance v36, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v37, 0xca

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    sget-object v38, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v8, v6, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 419
    new-instance v36, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v37, 0xcb

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    sget-object v38, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v25

    move-object/from16 v3, v23

    move-object/from16 v4, v38

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 421
    new-instance v36, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v37, 0xcc

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    sget-object v38, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v8, v6, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 423
    new-instance v36, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v37, 0xcd

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    sget-object v38, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v25

    move-object/from16 v3, v23

    move-object/from16 v4, v38

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 427
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-nez v36, :cond_0

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-nez v36, :cond_0

    new-instance v36, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v37, 0xce

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    sget-object v38, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v8, v6, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 429
    :cond_0
    invoke-virtual/range {v23 .. v23}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-nez v36, :cond_1

    invoke-virtual/range {v25 .. v25}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-nez v36, :cond_1

    new-instance v36, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v37, 0xcf

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    sget-object v38, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v25

    move-object/from16 v3, v23

    move-object/from16 v4, v38

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 433
    :cond_1
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-nez v36, :cond_2

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-nez v36, :cond_2

    new-instance v36, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v37, 0xd0

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    sget-object v38, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v6, v8, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 435
    :cond_2
    invoke-virtual/range {v23 .. v23}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-nez v36, :cond_3

    invoke-virtual/range {v25 .. v25}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-nez v36, :cond_3

    new-instance v36, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v37, 0xd1

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    sget-object v38, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v23

    move-object/from16 v3, v25

    move-object/from16 v4, v38

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 437
    :cond_3
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-nez v36, :cond_4

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-nez v36, :cond_4

    new-instance v36, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v37, 0xd2

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    sget-object v38, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v6, v8, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 439
    :cond_4
    invoke-virtual/range {v23 .. v23}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-nez v36, :cond_5

    invoke-virtual/range {v25 .. v25}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-nez v36, :cond_5

    new-instance v36, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v37, 0xd3

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    sget-object v38, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v23

    move-object/from16 v3, v25

    move-object/from16 v4, v38

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 441
    :cond_5
    return-object v20

    .line 388
    .end local v5    # "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v6    # "eastSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v7    # "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v8    # "eastSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v9    # "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v10    # "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v22    # "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v23    # "westSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v24    # "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v25    # "westSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v26    # "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v27    # "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_6
    if-eqz v18, :cond_7

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_7

    move-object/from16 v5, v18

    goto/16 :goto_0

    :cond_7
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 389
    .restart local v5    # "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_8
    if-eqz v17, :cond_9

    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_9

    move-object/from16 v7, v17

    goto/16 :goto_1

    :cond_9
    const/4 v7, 0x0

    goto/16 :goto_1

    .line 390
    .restart local v7    # "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_a
    if-eqz v16, :cond_b

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_b

    move-object/from16 v9, v16

    goto/16 :goto_2

    :cond_b
    const/4 v9, 0x0

    goto/16 :goto_2

    .line 391
    .restart local v9    # "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_c
    if-eqz v15, :cond_d

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_d

    move-object v10, v15

    goto/16 :goto_3

    :cond_d
    const/4 v10, 0x0

    goto/16 :goto_3

    .line 393
    .restart local v10    # "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_e
    if-eqz v35, :cond_f

    invoke-virtual/range {v35 .. v35}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_f

    move-object/from16 v22, v35

    goto/16 :goto_4

    :cond_f
    const/16 v22, 0x0

    goto/16 :goto_4

    .line 394
    .restart local v22    # "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_10
    if-eqz v34, :cond_11

    invoke-virtual/range {v34 .. v34}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_11

    move-object/from16 v24, v34

    goto/16 :goto_5

    :cond_11
    const/16 v24, 0x0

    goto/16 :goto_5

    .line 395
    .restart local v24    # "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_12
    if-eqz v33, :cond_13

    invoke-virtual/range {v33 .. v33}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_13

    move-object/from16 v26, v33

    goto/16 :goto_6

    :cond_13
    const/16 v26, 0x0

    goto/16 :goto_6

    .line 396
    .restart local v26    # "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_14
    if-eqz v32, :cond_15

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_15

    move-object/from16 v27, v32

    goto/16 :goto_7

    :cond_15
    const/16 v27, 0x0

    goto/16 :goto_7

    .line 399
    .restart local v27    # "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_16
    if-eqz v10, :cond_17

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_17

    move-object v6, v10

    goto/16 :goto_8

    :cond_17
    const/4 v6, 0x0

    goto/16 :goto_8

    .line 400
    .restart local v6    # "eastSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_18
    if-eqz v9, :cond_19

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_19

    move-object v8, v9

    goto/16 :goto_9

    :cond_19
    const/4 v8, 0x0

    goto/16 :goto_9

    .line 402
    .restart local v8    # "eastSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_1a
    if-eqz v27, :cond_1b

    invoke-virtual/range {v27 .. v27}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_1b

    move-object/from16 v23, v27

    goto/16 :goto_a

    :cond_1b
    const/16 v23, 0x0

    goto/16 :goto_a

    .line 403
    .restart local v23    # "westSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_1c
    if-eqz v26, :cond_1d

    invoke-virtual/range {v26 .. v26}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v36

    if-eqz v36, :cond_1d

    move-object/from16 v25, v26

    goto/16 :goto_b

    :cond_1d
    const/16 v25, 0x0

    goto/16 :goto_b
.end method

.method public static getPlayoffsSeriesFinal(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;
    .locals 40
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    .line 445
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 447
    .local v20, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v19, Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v37

    move-object/from16 v0, v19

    move-object/from16 v1, v37

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Playoffs;-><init>(Landroid/content/Context;)V

    .line 448
    .local v19, "filter":Lcom/blank/bm15/model/object/crud/Playoffs;
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Playoffs;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 449
    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v21

    .line 452
    .local v21, "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    const/16 v37, 0x1

    const/16 v38, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v11

    .line 453
    .local v11, "eastTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x1

    const/16 v38, 0x2

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v12

    .line 454
    .local v12, "eastTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x1

    const/16 v38, 0x3

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v13

    .line 455
    .local v13, "eastTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x1

    const/16 v38, 0x4

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v14

    .line 456
    .local v14, "eastTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x1

    const/16 v38, 0x5

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v15

    .line 457
    .local v15, "eastTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x1

    const/16 v38, 0x6

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v16

    .line 458
    .local v16, "eastTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x1

    const/16 v38, 0x7

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v17

    .line 459
    .local v17, "eastTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x1

    const/16 v38, 0x8

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v18

    .line 461
    .local v18, "eastTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x2

    const/16 v38, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v29

    .line 462
    .local v29, "westTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x2

    const/16 v38, 0x2

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v30

    .line 463
    .local v30, "westTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x2

    const/16 v38, 0x3

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v31

    .line 464
    .local v31, "westTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x2

    const/16 v38, 0x4

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v32

    .line 465
    .local v32, "westTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x2

    const/16 v38, 0x5

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v33

    .line 466
    .local v33, "westTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x2

    const/16 v38, 0x6

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v34

    .line 467
    .local v34, "westTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x2

    const/16 v38, 0x7

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v35

    .line 468
    .local v35, "westTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v37, 0x2

    const/16 v38, 0x8

    move-object/from16 v0, v21

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v36

    .line 471
    .local v36, "westTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    if-eqz v11, :cond_3

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_3

    move-object v5, v11

    .line 472
    .local v5, "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_0
    if-eqz v12, :cond_5

    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_5

    move-object v7, v12

    .line 473
    .local v7, "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_1
    if-eqz v13, :cond_7

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_7

    move-object v9, v13

    .line 474
    .local v9, "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_2
    if-eqz v14, :cond_9

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_9

    move-object v10, v14

    .line 476
    .local v10, "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_3
    if-eqz v29, :cond_b

    invoke-virtual/range {v29 .. v29}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_b

    move-object/from16 v23, v29

    .line 477
    .local v23, "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_4
    if-eqz v30, :cond_d

    invoke-virtual/range {v30 .. v30}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_d

    move-object/from16 v25, v30

    .line 478
    .local v25, "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_5
    if-eqz v31, :cond_f

    invoke-virtual/range {v31 .. v31}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_f

    move-object/from16 v27, v31

    .line 479
    .local v27, "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_6
    if-eqz v32, :cond_11

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_11

    move-object/from16 v28, v32

    .line 482
    .local v28, "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_7
    if-eqz v5, :cond_13

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_13

    move-object v6, v5

    .line 483
    .local v6, "eastSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_8
    if-eqz v7, :cond_15

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_15

    move-object v8, v7

    .line 485
    .local v8, "eastSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_9
    if-eqz v23, :cond_17

    invoke-virtual/range {v23 .. v23}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_17

    move-object/from16 v24, v23

    .line 486
    .local v24, "westSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_a
    if-eqz v25, :cond_19

    invoke-virtual/range {v25 .. v25}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_19

    move-object/from16 v26, v25

    .line 489
    .local v26, "westSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_b
    if-eqz v6, :cond_1b

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_1b

    move-object v4, v6

    .line 491
    .local v4, "eastConference":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_c
    if-eqz v24, :cond_1d

    invoke-virtual/range {v24 .. v24}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_1d

    move-object/from16 v22, v24

    .line 493
    .local v22, "westConference":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_d
    if-eqz v4, :cond_2

    if-eqz v22, :cond_2

    .line 496
    new-instance v37, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v38, 0xd5

    invoke-static/range {v38 .. v38}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v38

    sget-object v39, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v22

    move-object/from16 v3, v39

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 498
    new-instance v37, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v38, 0xd7

    invoke-static/range {v38 .. v38}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v38

    sget-object v39, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v22

    move-object/from16 v3, v39

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 502
    new-instance v37, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v38, 0xd9

    invoke-static/range {v38 .. v38}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v38

    sget-object v39, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v22

    move-object/from16 v3, v39

    invoke-direct {v0, v1, v2, v4, v3}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 504
    new-instance v37, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v38, 0xdb

    invoke-static/range {v38 .. v38}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v38

    sget-object v39, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v22

    move-object/from16 v3, v39

    invoke-direct {v0, v1, v2, v4, v3}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 508
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsChampion()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-nez v37, :cond_0

    invoke-virtual/range {v22 .. v22}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsChampion()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-nez v37, :cond_0

    new-instance v37, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v38, 0xdd

    invoke-static/range {v38 .. v38}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v38

    sget-object v39, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v22

    move-object/from16 v3, v39

    invoke-direct {v0, v1, v2, v4, v3}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 512
    :cond_0
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsChampion()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-nez v37, :cond_1

    invoke-virtual/range {v22 .. v22}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsChampion()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-nez v37, :cond_1

    new-instance v37, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v38, 0xdf

    invoke-static/range {v38 .. v38}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v38

    sget-object v39, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v22

    move-object/from16 v3, v39

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 514
    :cond_1
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsChampion()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-nez v37, :cond_2

    invoke-virtual/range {v22 .. v22}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsChampion()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-nez v37, :cond_2

    new-instance v37, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v38, 0xe1

    invoke-static/range {v38 .. v38}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v38

    sget-object v39, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v22

    move-object/from16 v3, v39

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 516
    :cond_2
    return-object v20

    .line 471
    .end local v4    # "eastConference":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v5    # "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v6    # "eastSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v7    # "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v8    # "eastSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v9    # "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v10    # "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v22    # "westConference":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v23    # "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v24    # "westSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v25    # "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v26    # "westSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v27    # "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v28    # "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_3
    if-eqz v18, :cond_4

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_4

    move-object/from16 v5, v18

    goto/16 :goto_0

    :cond_4
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 472
    .restart local v5    # "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_5
    if-eqz v17, :cond_6

    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_6

    move-object/from16 v7, v17

    goto/16 :goto_1

    :cond_6
    const/4 v7, 0x0

    goto/16 :goto_1

    .line 473
    .restart local v7    # "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_7
    if-eqz v16, :cond_8

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_8

    move-object/from16 v9, v16

    goto/16 :goto_2

    :cond_8
    const/4 v9, 0x0

    goto/16 :goto_2

    .line 474
    .restart local v9    # "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_9
    if-eqz v15, :cond_a

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_a

    move-object v10, v15

    goto/16 :goto_3

    :cond_a
    const/4 v10, 0x0

    goto/16 :goto_3

    .line 476
    .restart local v10    # "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_b
    if-eqz v36, :cond_c

    invoke-virtual/range {v36 .. v36}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_c

    move-object/from16 v23, v36

    goto/16 :goto_4

    :cond_c
    const/16 v23, 0x0

    goto/16 :goto_4

    .line 477
    .restart local v23    # "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_d
    if-eqz v35, :cond_e

    invoke-virtual/range {v35 .. v35}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_e

    move-object/from16 v25, v35

    goto/16 :goto_5

    :cond_e
    const/16 v25, 0x0

    goto/16 :goto_5

    .line 478
    .restart local v25    # "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_f
    if-eqz v34, :cond_10

    invoke-virtual/range {v34 .. v34}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_10

    move-object/from16 v27, v34

    goto/16 :goto_6

    :cond_10
    const/16 v27, 0x0

    goto/16 :goto_6

    .line 479
    .restart local v27    # "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_11
    if-eqz v33, :cond_12

    invoke-virtual/range {v33 .. v33}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_12

    move-object/from16 v28, v33

    goto/16 :goto_7

    :cond_12
    const/16 v28, 0x0

    goto/16 :goto_7

    .line 482
    .restart local v28    # "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_13
    if-eqz v10, :cond_14

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_14

    move-object v6, v10

    goto/16 :goto_8

    :cond_14
    const/4 v6, 0x0

    goto/16 :goto_8

    .line 483
    .restart local v6    # "eastSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_15
    if-eqz v9, :cond_16

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_16

    move-object v8, v9

    goto/16 :goto_9

    :cond_16
    const/4 v8, 0x0

    goto/16 :goto_9

    .line 485
    .restart local v8    # "eastSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_17
    if-eqz v28, :cond_18

    invoke-virtual/range {v28 .. v28}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_18

    move-object/from16 v24, v28

    goto/16 :goto_a

    :cond_18
    const/16 v24, 0x0

    goto/16 :goto_a

    .line 486
    .restart local v24    # "westSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_19
    if-eqz v27, :cond_1a

    invoke-virtual/range {v27 .. v27}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_1a

    move-object/from16 v26, v27

    goto/16 :goto_b

    :cond_1a
    const/16 v26, 0x0

    goto/16 :goto_b

    .line 489
    .restart local v26    # "westSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_1b
    if-eqz v8, :cond_1c

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_1c

    move-object v4, v8

    goto/16 :goto_c

    :cond_1c
    const/4 v4, 0x0

    goto/16 :goto_c

    .line 491
    .restart local v4    # "eastConference":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_1d
    if-eqz v26, :cond_1e

    invoke-virtual/range {v26 .. v26}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v37

    if-eqz v37, :cond_1e

    move-object/from16 v22, v26

    goto/16 :goto_d

    :cond_1e
    const/16 v22, 0x0

    goto/16 :goto_d
.end method

.method private static getPlayoffsSeriesQuarters(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;
    .locals 27
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    .line 163
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 165
    .local v14, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v13, Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-direct {v13, v0}, Lcom/blank/bm15/model/object/crud/Playoffs;-><init>(Landroid/content/Context;)V

    .line 166
    .local v13, "filter":Lcom/blank/bm15/model/object/crud/Playoffs;
    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Lcom/blank/bm15/model/object/crud/Playoffs;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 167
    invoke-static {v13}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v15

    .line 169
    .local v15, "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    const/16 v24, 0x1

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v5

    .line 170
    .local v5, "eastTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x1

    const/16 v25, 0x2

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v6

    .line 171
    .local v6, "eastTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x1

    const/16 v25, 0x3

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v7

    .line 172
    .local v7, "eastTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x1

    const/16 v25, 0x4

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v8

    .line 173
    .local v8, "eastTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x1

    const/16 v25, 0x5

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v9

    .line 174
    .local v9, "eastTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x1

    const/16 v25, 0x6

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v10

    .line 175
    .local v10, "eastTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x1

    const/16 v25, 0x7

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v11

    .line 176
    .local v11, "eastTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x1

    const/16 v25, 0x8

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v12

    .line 178
    .local v12, "eastTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x2

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v16

    .line 179
    .local v16, "westTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x2

    const/16 v25, 0x2

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v17

    .line 180
    .local v17, "westTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x2

    const/16 v25, 0x3

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v18

    .line 181
    .local v18, "westTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x2

    const/16 v25, 0x4

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v19

    .line 182
    .local v19, "westTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x2

    const/16 v25, 0x5

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v20

    .line 183
    .local v20, "westTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x2

    const/16 v25, 0x6

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v21

    .line 184
    .local v21, "westTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x2

    const/16 v25, 0x7

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v22

    .line 185
    .local v22, "westTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v24, 0x2

    const/16 v25, 0x8

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-static {v15, v0, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v23

    .line 187
    .local v23, "westTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    if-eqz v5, :cond_17

    if-eqz v6, :cond_17

    if-eqz v7, :cond_17

    if-eqz v8, :cond_17

    .line 188
    if-eqz v9, :cond_17

    if-eqz v10, :cond_17

    if-eqz v11, :cond_17

    if-eqz v12, :cond_17

    .line 189
    if-eqz v16, :cond_17

    if-eqz v17, :cond_17

    if-eqz v18, :cond_17

    if-eqz v19, :cond_17

    .line 190
    if-eqz v20, :cond_17

    if-eqz v21, :cond_17

    if-eqz v22, :cond_17

    if-eqz v23, :cond_17

    .line 193
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xa8

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v5, v12, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xa8

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v6, v11, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xa8

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v16

    move-object/from16 v3, v23

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xa8

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v17

    move-object/from16 v3, v22

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xa9

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v7, v10, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xa9

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v8, v9, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xa9

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v18

    move-object/from16 v3, v21

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xa9

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xaa

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v5, v12, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xaa

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v6, v11, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xaa

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v16

    move-object/from16 v3, v23

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xaa

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v17

    move-object/from16 v3, v22

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 208
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xab

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v7, v10, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 209
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xab

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v8, v9, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xab

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v18

    move-object/from16 v3, v21

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xab

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xac

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v12, v5, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xac

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v11, v6, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xac

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v23

    move-object/from16 v3, v16

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xac

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v22

    move-object/from16 v3, v17

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xad

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v10, v7, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xad

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v9, v8, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 221
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xad

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v21

    move-object/from16 v3, v18

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xad

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v20

    move-object/from16 v3, v19

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xae

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v12, v5, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xae

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v11, v6, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 226
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xae

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v23

    move-object/from16 v3, v16

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xae

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v22

    move-object/from16 v3, v17

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xaf

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v10, v7, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 230
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xaf

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v9, v8, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xaf

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v21

    move-object/from16 v3, v18

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xaf

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v20

    move-object/from16 v3, v19

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 236
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_0

    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_0

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb0

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v12, v5, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 237
    :cond_0
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_1

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_1

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb0

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v11, v6, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    :cond_1
    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_2

    invoke-virtual/range {v23 .. v23}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_2

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb0

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v23

    move-object/from16 v3, v16

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    :cond_2
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_3

    invoke-virtual/range {v22 .. v22}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_3

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb0

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v22

    move-object/from16 v3, v17

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    :cond_3
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_4

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_4

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v10, v7, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    :cond_4
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_5

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_5

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v9, v8, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 243
    :cond_5
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_6

    invoke-virtual/range {v21 .. v21}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_6

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v21

    move-object/from16 v3, v18

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 244
    :cond_6
    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_7

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_7

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v20

    move-object/from16 v3, v19

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 247
    :cond_7
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_8

    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_8

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb2

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v5, v12, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 248
    :cond_8
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_9

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_9

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb2

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v6, v11, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 249
    :cond_9
    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_a

    invoke-virtual/range {v23 .. v23}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_a

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb2

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v16

    move-object/from16 v3, v23

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 250
    :cond_a
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_b

    invoke-virtual/range {v22 .. v22}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_b

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb2

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v17

    move-object/from16 v3, v22

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    :cond_b
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_c

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_c

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb3

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v7, v10, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 253
    :cond_c
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_d

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_d

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb3

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v8, v9, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 254
    :cond_d
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_e

    invoke-virtual/range {v21 .. v21}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_e

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb3

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v18

    move-object/from16 v3, v21

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 255
    :cond_e
    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_f

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_f

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb3

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 257
    :cond_f
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_10

    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_10

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb4

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v5, v12, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 258
    :cond_10
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_11

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb4

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v6, v11, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 259
    :cond_11
    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_12

    invoke-virtual/range {v23 .. v23}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_12

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb4

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v16

    move-object/from16 v3, v23

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 260
    :cond_12
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_13

    invoke-virtual/range {v22 .. v22}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_13

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb4

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v17

    move-object/from16 v3, v22

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    :cond_13
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_14

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_14

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb5

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v7, v10, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 263
    :cond_14
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_15

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_15

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb5

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v8, v9, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 264
    :cond_15
    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_16

    invoke-virtual/range {v21 .. v21}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_16

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb5

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v18

    move-object/from16 v3, v21

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 265
    :cond_16
    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_17

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_17

    new-instance v24, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v25, 0xb5

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    sget-object v26, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 267
    :cond_17
    return-object v14
.end method

.method private static getPlayoffsSeriesSemis(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;
    .locals 35
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchdayCalendar;",
            ">;"
        }
    .end annotation

    .prologue
    .line 271
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 273
    .local v18, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchdayCalendar;>;"
    new-instance v17, Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v32

    move-object/from16 v0, v17

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Playoffs;-><init>(Landroid/content/Context;)V

    .line 274
    .local v17, "filter":Lcom/blank/bm15/model/object/crud/Playoffs;
    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Playoffs;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 275
    invoke-static/range {v17 .. v17}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v19

    .line 278
    .local v19, "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    const/16 v32, 0x1

    const/16 v33, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v9

    .line 279
    .local v9, "eastTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x1

    const/16 v33, 0x2

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v10

    .line 280
    .local v10, "eastTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x1

    const/16 v33, 0x3

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v11

    .line 281
    .local v11, "eastTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x1

    const/16 v33, 0x4

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v12

    .line 282
    .local v12, "eastTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x1

    const/16 v33, 0x5

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v13

    .line 283
    .local v13, "eastTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x1

    const/16 v33, 0x6

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v14

    .line 284
    .local v14, "eastTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x1

    const/16 v33, 0x7

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v15

    .line 285
    .local v15, "eastTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x1

    const/16 v33, 0x8

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v16

    .line 287
    .local v16, "eastTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x2

    const/16 v33, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v24

    .line 288
    .local v24, "westTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x2

    const/16 v33, 0x2

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v25

    .line 289
    .local v25, "westTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x2

    const/16 v33, 0x3

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v26

    .line 290
    .local v26, "westTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x2

    const/16 v33, 0x4

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v27

    .line 291
    .local v27, "westTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x2

    const/16 v33, 0x5

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v28

    .line 292
    .local v28, "westTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x2

    const/16 v33, 0x6

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v29

    .line 293
    .local v29, "westTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x2

    const/16 v33, 0x7

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v30

    .line 294
    .local v30, "westTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v32, 0x2

    const/16 v33, 0x8

    move-object/from16 v0, v19

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManagePlayoffs;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v31

    .line 297
    .local v31, "westTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    if-eqz v9, :cond_c

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_c

    move-object v5, v9

    .line 298
    .local v5, "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_0
    if-eqz v10, :cond_e

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_e

    move-object v6, v10

    .line 299
    .local v6, "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_1
    if-eqz v11, :cond_10

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_10

    move-object v7, v11

    .line 300
    .local v7, "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_2
    if-eqz v12, :cond_12

    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_12

    move-object v8, v12

    .line 302
    .local v8, "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_3
    if-eqz v24, :cond_14

    invoke-virtual/range {v24 .. v24}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_14

    move-object/from16 v20, v24

    .line 303
    .local v20, "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_4
    if-eqz v25, :cond_16

    invoke-virtual/range {v25 .. v25}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_16

    move-object/from16 v21, v25

    .line 304
    .local v21, "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_5
    if-eqz v26, :cond_18

    invoke-virtual/range {v26 .. v26}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_18

    move-object/from16 v22, v26

    .line 305
    .local v22, "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_6
    if-eqz v27, :cond_1a

    invoke-virtual/range {v27 .. v27}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_1a

    move-object/from16 v23, v27

    .line 307
    .local v23, "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_7
    if-eqz v5, :cond_b

    if-eqz v6, :cond_b

    if-eqz v7, :cond_b

    if-eqz v8, :cond_b

    .line 308
    if-eqz v20, :cond_b

    if-eqz v21, :cond_b

    if-eqz v22, :cond_b

    if-eqz v23, :cond_b

    .line 311
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xb7

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v5, v8, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 312
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xb7

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v6, v7, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 314
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xb8

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v20

    move-object/from16 v3, v23

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 315
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xb8

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 317
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xb9

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v5, v8, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 318
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xb9

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v6, v7, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 320
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xba

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v20

    move-object/from16 v3, v23

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 321
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xba

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 324
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xbb

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v8, v5, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 325
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xbb

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v7, v6, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 327
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xbc

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v23

    move-object/from16 v3, v20

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 328
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xbc

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v22

    move-object/from16 v3, v21

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 330
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xbd

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v8, v5, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 331
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xbd

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v7, v6, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 333
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xbe

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v23

    move-object/from16 v3, v20

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 334
    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xbe

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v22

    move-object/from16 v3, v21

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 338
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_0

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_0

    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xbf

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v8, v5, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 339
    :cond_0
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_1

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_1

    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xbf

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v7, v6, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 341
    :cond_1
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_2

    invoke-virtual/range {v23 .. v23}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_2

    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xc0

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v23

    move-object/from16 v3, v20

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 342
    :cond_2
    invoke-virtual/range {v21 .. v21}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_3

    invoke-virtual/range {v22 .. v22}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_3

    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xc0

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v22

    move-object/from16 v3, v21

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 346
    :cond_3
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_4

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_4

    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xc1

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v5, v8, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 347
    :cond_4
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_5

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_5

    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xc1

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v6, v7, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 349
    :cond_5
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_6

    invoke-virtual/range {v23 .. v23}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_6

    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xc2

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v20

    move-object/from16 v3, v23

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 350
    :cond_6
    invoke-virtual/range {v21 .. v21}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_7

    invoke-virtual/range {v22 .. v22}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_7

    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xc2

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 352
    :cond_7
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_8

    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xc3

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v5, v8, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 353
    :cond_8
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_9

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_9

    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xc3

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v6, v7, v2}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 355
    :cond_9
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_a

    invoke-virtual/range {v23 .. v23}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_a

    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xc4

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v20

    move-object/from16 v3, v23

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 356
    :cond_a
    invoke-virtual/range {v21 .. v21}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_b

    invoke-virtual/range {v22 .. v22}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-nez v32, :cond_b

    new-instance v32, Lcom/blank/bm15/model/object/other/MatchdayCalendar;

    const/16 v33, 0xc4

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    sget-object v34, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/model/object/other/MatchdayCalendar;-><init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 358
    :cond_b
    return-object v18

    .line 297
    .end local v5    # "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v6    # "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v7    # "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v8    # "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v20    # "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v21    # "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v22    # "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v23    # "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_c
    if-eqz v16, :cond_d

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_d

    move-object/from16 v5, v16

    goto/16 :goto_0

    :cond_d
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 298
    .restart local v5    # "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_e
    if-eqz v15, :cond_f

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_f

    move-object v6, v15

    goto/16 :goto_1

    :cond_f
    const/4 v6, 0x0

    goto/16 :goto_1

    .line 299
    .restart local v6    # "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_10
    if-eqz v14, :cond_11

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_11

    move-object v7, v14

    goto/16 :goto_2

    :cond_11
    const/4 v7, 0x0

    goto/16 :goto_2

    .line 300
    .restart local v7    # "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_12
    if-eqz v13, :cond_13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_13

    move-object v8, v13

    goto/16 :goto_3

    :cond_13
    const/4 v8, 0x0

    goto/16 :goto_3

    .line 302
    .restart local v8    # "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_14
    if-eqz v31, :cond_15

    invoke-virtual/range {v31 .. v31}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_15

    move-object/from16 v20, v31

    goto/16 :goto_4

    :cond_15
    const/16 v20, 0x0

    goto/16 :goto_4

    .line 303
    .restart local v20    # "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_16
    if-eqz v30, :cond_17

    invoke-virtual/range {v30 .. v30}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_17

    move-object/from16 v21, v30

    goto/16 :goto_5

    :cond_17
    const/16 v21, 0x0

    goto/16 :goto_5

    .line 304
    .restart local v21    # "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_18
    if-eqz v29, :cond_19

    invoke-virtual/range {v29 .. v29}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_19

    move-object/from16 v22, v29

    goto/16 :goto_6

    :cond_19
    const/16 v22, 0x0

    goto/16 :goto_6

    .line 305
    .restart local v22    # "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_1a
    if-eqz v28, :cond_1b

    invoke-virtual/range {v28 .. v28}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v32

    if-eqz v32, :cond_1b

    move-object/from16 v23, v28

    goto/16 :goto_7

    :cond_1b
    const/16 v23, 0x0

    goto/16 :goto_7
.end method

.method public static manage(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 24
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 27
    const/16 v3, 0xa7

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v3, v4, :cond_0

    .line 29
    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getClassification(Lcom/blank/bm15/model/object/crud/Game;I)Ljava/util/List;

    move-result-object v13

    .line 30
    .local v13, "eastClassificationList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    const/4 v3, 0x2

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getClassification(Lcom/blank/bm15/model/object/crud/Game;I)Ljava/util/List;

    move-result-object v22

    .line 31
    .local v22, "westClassificationList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .local v17, "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .local v2, "newsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/News;>;"
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .local v16, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    const/4 v11, 0x1

    .line 36
    .local v11, "east":I
    const/16 v20, 0x1

    .line 37
    .local v20, "west":I
    const-string v18, "\n"

    .line 38
    .local v18, "playoffsNewsTeamEast":Ljava/lang/String;
    const-string v19, "\n"

    .line 39
    .local v19, "playoffsNewsTeamWest":Ljava/lang/String;
    const/4 v14, 0x0

    .local v14, "i":I
    move/from16 v21, v20

    .end local v20    # "west":I
    .local v21, "west":I
    move v12, v11

    .end local v11    # "east":I
    .local v12, "east":I
    :goto_0
    const/16 v3, 0xf

    if-lt v14, v3, :cond_2

    .line 71
    invoke-static/range {v17 .. v17}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 72
    invoke-static/range {v16 .. v16}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 74
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const v5, 0x7f02003e

    const v6, 0x7f050117

    const v7, 0x7f050118

    const/4 v3, 0x1

    new-array v8, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v18, v8, v3

    move-object/from16 v3, p0

    invoke-static/range {v2 .. v8}, Lcom/blank/bm15/model/core/ManagePlayoffs;->createNewsAndAdd(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Game;IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;

    .line 75
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const v5, 0x7f02003e

    const v6, 0x7f050119

    const v7, 0x7f05011a

    const/4 v3, 0x1

    new-array v8, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v19, v8, v3

    move-object/from16 v3, p0

    invoke-static/range {v2 .. v8}, Lcom/blank/bm15/model/core/ManagePlayoffs;->createNewsAndAdd(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Game;IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;

    .line 78
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const v5, 0x7f020041

    const v6, 0x7f050139

    const v7, 0x7f05013a

    const/4 v3, 0x1

    new-array v8, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->getPlayerOfYearNewsBody(Lcom/blank/bm15/model/object/crud/Game;)Ljava/lang/String;

    move-result-object v23

    aput-object v23, v8, v3

    move-object/from16 v3, p0

    invoke-static/range {v2 .. v8}, Lcom/blank/bm15/model/core/ManagePlayoffs;->createNewsAndAdd(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Game;IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;

    .line 79
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const v5, 0x7f020041

    const v6, 0x7f05013b

    const v7, 0x7f05013c

    const/4 v3, 0x1

    new-array v8, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment;->getRookieOfYearNewsBody(Lcom/blank/bm15/model/object/crud/Game;)Ljava/lang/String;

    move-result-object v23

    aput-object v23, v8, v3

    move-object/from16 v3, p0

    invoke-static/range {v2 .. v8}, Lcom/blank/bm15/model/core/ManagePlayoffs;->createNewsAndAdd(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Game;IIII[Ljava/lang/Object;)Lcom/blank/bm15/model/object/crud/News;

    .line 81
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 84
    .end local v2    # "newsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/News;>;"
    .end local v12    # "east":I
    .end local v13    # "eastClassificationList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    .end local v14    # "i":I
    .end local v16    # "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    .end local v17    # "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    .end local v18    # "playoffsNewsTeamEast":Ljava/lang/String;
    .end local v19    # "playoffsNewsTeamWest":Ljava/lang/String;
    .end local v21    # "west":I
    .end local v22    # "westClassificationList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    :cond_0
    const/16 v3, 0xa7

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-gt v3, v4, :cond_1

    .line 85
    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/model/core/ManagePlayoffs;->createPlayoffsMatches(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 86
    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/model/core/ManagePlayoffs;->removeUnnecessaryPlayoffsMatches(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 88
    :cond_1
    return-void

    .line 40
    .restart local v2    # "newsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/News;>;"
    .restart local v12    # "east":I
    .restart local v13    # "eastClassificationList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    .restart local v14    # "i":I
    .restart local v16    # "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    .restart local v17    # "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    .restart local v18    # "playoffsNewsTeamEast":Ljava/lang/String;
    .restart local v19    # "playoffsNewsTeamWest":Ljava/lang/String;
    .restart local v21    # "west":I
    .restart local v22    # "westClassificationList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    :cond_2
    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/blank/bm15/model/object/other/Classification;

    .line 41
    .local v9, "auxEast":Lcom/blank/bm15/model/object/other/Classification;
    move-object/from16 v0, v22

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/blank/bm15/model/object/other/Classification;

    .line 43
    .local v10, "auxWest":Lcom/blank/bm15/model/object/other/Classification;
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/other/Classification;->getIsClassified()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 44
    move-object/from16 v0, p0

    invoke-static {v0, v9, v12}, Lcom/blank/bm15/model/core/ManagePlayoffs;->createPlayoff(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/other/Classification;I)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v11, v12, 0x1

    .end local v12    # "east":I
    .restart local v11    # "east":I
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/other/Classification;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 46
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_3

    .line 57
    :goto_2
    invoke-virtual {v10}, Lcom/blank/bm15/model/object/other/Classification;->getIsClassified()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 58
    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v10, v1}, Lcom/blank/bm15/model/core/ManagePlayoffs;->createPlayoff(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/other/Classification;I)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v20, v21, 0x1

    .end local v21    # "west":I
    .restart local v20    # "west":I
    move/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/other/Classification;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 60
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_6

    .line 39
    :goto_4
    add-int/lit8 v14, v14, 0x1

    move/from16 v21, v20

    .end local v20    # "west":I
    .restart local v21    # "west":I
    move v12, v11

    .end local v11    # "east":I
    .restart local v12    # "east":I
    goto/16 :goto_0

    .line 46
    .end local v12    # "east":I
    .restart local v11    # "east":I
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/blank/bm15/model/object/crud/Player;

    .line 47
    .local v15, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v4, 0x2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v15, v4}, Lcom/blank/bm15/model/object/crud/Player;->setLoyalty(Ljava/lang/Integer;)V

    .line 48
    move-object/from16 v0, v16

    invoke-interface {v0, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 51
    .end local v11    # "east":I
    .end local v15    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .restart local v12    # "east":I
    :cond_4
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_5

    move v11, v12

    .end local v12    # "east":I
    .restart local v11    # "east":I
    goto/16 :goto_2

    .end local v11    # "east":I
    .restart local v12    # "east":I
    :cond_5
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/blank/bm15/model/object/crud/Player;

    .line 52
    .restart local v15    # "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v15, v4}, Lcom/blank/bm15/model/object/crud/Player;->setLoyalty(Ljava/lang/Integer;)V

    .line 53
    move-object/from16 v0, v16

    invoke-interface {v0, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 60
    .end local v12    # "east":I
    .end local v15    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .end local v21    # "west":I
    .restart local v11    # "east":I
    .restart local v20    # "west":I
    :cond_6
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/blank/bm15/model/object/crud/Player;

    .line 61
    .restart local v15    # "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v4, 0x2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v15, v4}, Lcom/blank/bm15/model/object/crud/Player;->setLoyalty(Ljava/lang/Integer;)V

    .line 62
    move-object/from16 v0, v16

    invoke-interface {v0, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 65
    .end local v15    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .end local v20    # "west":I
    .restart local v21    # "west":I
    :cond_7
    invoke-virtual {v9}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_8

    move/from16 v20, v21

    .end local v21    # "west":I
    .restart local v20    # "west":I
    goto/16 :goto_4

    .end local v20    # "west":I
    .restart local v21    # "west":I
    :cond_8
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/blank/bm15/model/object/crud/Player;

    .line 66
    .restart local v15    # "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v15, v4}, Lcom/blank/bm15/model/object/crud/Player;->setLoyalty(Ljava/lang/Integer;)V

    .line 67
    move-object/from16 v0, v16

    invoke-interface {v0, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6
.end method

.method private static removeUnnecessaryPlayoffsMatches(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 7
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 105
    const/4 v1, 0x0

    .line 106
    .local v1, "gamesWon":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xb6

    if-ge v5, v6, :cond_3

    .line 107
    const/4 v1, 0x4

    .line 116
    :cond_0
    :goto_0
    if-lez v1, :cond_2

    .line 117
    new-instance v0, Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/object/crud/Playoffs;-><init>(Landroid/content/Context;)V

    .line 118
    .local v0, "filter":Lcom/blank/bm15/model/object/crud/Playoffs;
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 119
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/blank/bm15/model/object/crud/Playoffs;->setSeriesGamesWon(Ljava/lang/Integer;)V

    .line 122
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v4

    .line 123
    .local v4, "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_6

    .line 130
    .end local v0    # "filter":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v4    # "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    :cond_2
    return-void

    .line 108
    :cond_3
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xc5

    if-ge v5, v6, :cond_4

    .line 109
    const/16 v1, 0x8

    .line 110
    goto :goto_0

    :cond_4
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xd4

    if-ge v5, v6, :cond_5

    .line 111
    const/16 v1, 0xc

    .line 112
    goto :goto_0

    :cond_5
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xea

    if-ge v5, v6, :cond_0

    .line 113
    const/16 v1, 0x10

    goto :goto_0

    .line 123
    .restart local v0    # "filter":Lcom/blank/bm15/model/object/crud/Playoffs;
    .restart local v4    # "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    :cond_6
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/crud/Playoffs;

    .line 124
    .local v3, "playoffs":Lcom/blank/bm15/model/object/crud/Playoffs;
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDaoExtra;->getMatchesToDeleteByPlayoffs(Lcom/blank/bm15/model/object/crud/Playoffs;)Ljava/util/List;

    move-result-object v2

    .line 125
    .local v2, "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 126
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    goto :goto_1
.end method
