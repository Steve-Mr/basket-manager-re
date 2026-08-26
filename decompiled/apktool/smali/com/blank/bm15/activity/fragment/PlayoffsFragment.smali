.class public Lcom/blank/bm15/activity/fragment/PlayoffsFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "PlayoffsFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method private createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V
    .locals 7
    .param p2, "teamA"    # Lcom/blank/bm15/model/object/crud/Playoffs;
    .param p3, "teamB"    # Lcom/blank/bm15/model/object/crud/Playoffs;
    .param p4, "modifier"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchPlayoffs;",
            ">;",
            "Lcom/blank/bm15/model/object/crud/Playoffs;",
            "Lcom/blank/bm15/model/object/crud/Playoffs;",
            "I)V"
        }
    .end annotation

    .prologue
    .local p1, "matchPlayoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchPlayoffs;>;"
    const/4 v4, 0x4

    .line 249
    new-instance v1, Lcom/blank/bm15/model/object/other/MatchPlayoffs;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-direct {v1, v5}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;-><init>(Landroid/content/Context;)V

    .line 251
    .local v1, "matchPlayoffs":Lcom/blank/bm15/model/object/other/MatchPlayoffs;
    const/4 v0, 0x0

    .line 252
    .local v0, "localTeam":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/4 v3, 0x0

    .line 254
    .local v3, "visitorTeam":Lcom/blank/bm15/model/object/crud/Playoffs;
    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    .line 255
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getGamesWon()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getGamesWon()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-le v5, v6, :cond_6

    .line 256
    move-object v0, p2

    .line 257
    move-object v3, p3

    .line 280
    :cond_0
    :goto_0
    if-eqz v0, :cond_2

    .line 281
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->setTeamLocal(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 282
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPosition()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->setTeamLocalPositionConference(Ljava/lang/Integer;)V

    .line 283
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    sub-int v2, v5, p4

    .line 284
    .local v2, "seriesGamesWon":I
    if-le v2, v4, :cond_1

    move v2, v4

    .end local v2    # "seriesGamesWon":I
    :cond_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->setResultLocal(Ljava/lang/Integer;)V

    .line 286
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-nez v5, :cond_2

    .line 287
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getConference()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->setConference(Ljava/lang/Integer;)V

    .line 292
    :cond_2
    if-eqz v3, :cond_3

    .line 293
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->setTeamVisitor(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 294
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPosition()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->setTeamVisitorPositionConference(Ljava/lang/Integer;)V

    .line 295
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    sub-int v2, v5, p4

    .line 296
    .restart local v2    # "seriesGamesWon":I
    if-le v2, v4, :cond_b

    :goto_1
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->setResultVisitor(Ljava/lang/Integer;)V

    .line 298
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_3

    .line 299
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getConference()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->setConference(Ljava/lang/Integer;)V

    .line 303
    .end local v2    # "seriesGamesWon":I
    :cond_3
    if-nez v0, :cond_4

    if-eqz v3, :cond_5

    .line 304
    :cond_4
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 306
    :cond_5
    return-void

    .line 258
    :cond_6
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getGamesWon()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getGamesWon()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ge v5, v6, :cond_7

    .line 259
    move-object v0, p3

    .line 260
    move-object v3, p2

    .line 261
    goto/16 :goto_0

    .line 262
    :cond_7
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPointsDiff()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPointsDiff()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-le v5, v6, :cond_8

    .line 263
    move-object v0, p2

    .line 264
    move-object v3, p3

    .line 265
    goto/16 :goto_0

    :cond_8
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPointsDiff()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPointsDiff()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ge v5, v6, :cond_9

    .line 266
    move-object v0, p3

    .line 267
    move-object v3, p2

    .line 268
    goto/16 :goto_0

    .line 269
    :cond_9
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPointsScored()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPointsScored()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-lt v5, v6, :cond_a

    .line 270
    move-object v0, p2

    .line 271
    move-object v3, p3

    .line 272
    goto/16 :goto_0

    .line 273
    :cond_a
    move-object v0, p3

    .line 274
    move-object v3, p2

    goto/16 :goto_0

    .restart local v2    # "seriesGamesWon":I
    :cond_b
    move v4, v2

    .line 296
    goto/16 :goto_1
.end method

.method private getAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    .locals 7

    .prologue
    const v6, 0x7f030020

    .line 44
    new-instance v1, Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/blank/bm15/model/object/crud/Playoffs;-><init>(Landroid/content/Context;)V

    .line 45
    .local v1, "filter":Lcom/blank/bm15/model/object/crud/Playoffs;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Playoffs;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 46
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v2

    .line 48
    .local v2, "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    new-instance v3, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;-><init>(Landroid/content/Context;)V

    .line 49
    .local v3, "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    const/4 v0, 0x0

    .line 51
    .local v0, "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;
    invoke-direct {p0, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getFinalMatch(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 52
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;

    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {p0, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getFinalMatch(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v0, v4, v6, v5}, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 53
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f050153

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 56
    :cond_0
    invoke-direct {p0, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getConferenceMatchs(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 57
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;

    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {p0, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getConferenceMatchs(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v0, v4, v6, v5}, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 58
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f050154

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 61
    :cond_1
    invoke-direct {p0, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getSemisMatchs(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    .line 62
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;

    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {p0, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getSemisMatchs(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v0, v4, v6, v5}, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 63
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f050155

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 66
    :cond_2
    invoke-direct {p0, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getQuarterMatchs(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 67
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;

    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {p0, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getQuarterMatchs(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v0, v4, v6, v5}, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 68
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f050156

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 71
    :cond_3
    return-object v3
.end method

.method private getConferenceMatchs(Ljava/util/List;)Ljava/util/List;
    .locals 36
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Playoffs;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchPlayoffs;",
            ">;"
        }
    .end annotation

    .prologue
    .line 152
    .local p1, "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    const/16 v34, 0x1

    const/16 v35, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v11

    .line 153
    .local v11, "eastTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x1

    const/16 v35, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v12

    .line 154
    .local v12, "eastTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x1

    const/16 v35, 0x3

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v13

    .line 155
    .local v13, "eastTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x1

    const/16 v35, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v14

    .line 156
    .local v14, "eastTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x1

    const/16 v35, 0x5

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v15

    .line 157
    .local v15, "eastTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x1

    const/16 v35, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v16

    .line 158
    .local v16, "eastTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x1

    const/16 v35, 0x7

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v17

    .line 159
    .local v17, "eastTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x1

    const/16 v35, 0x8

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v18

    .line 161
    .local v18, "eastTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x2

    const/16 v35, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v26

    .line 162
    .local v26, "westTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x2

    const/16 v35, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v27

    .line 163
    .local v27, "westTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x2

    const/16 v35, 0x3

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v28

    .line 164
    .local v28, "westTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x2

    const/16 v35, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v29

    .line 165
    .local v29, "westTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x2

    const/16 v35, 0x5

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v30

    .line 166
    .local v30, "westTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x2

    const/16 v35, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v31

    .line 167
    .local v31, "westTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x2

    const/16 v35, 0x7

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v32

    .line 168
    .local v32, "westTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v34, 0x2

    const/16 v35, 0x8

    move-object/from16 v0, p1

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v33

    .line 171
    .local v33, "westTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    if-eqz v11, :cond_0

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_0

    move-object v5, v11

    .line 172
    .local v5, "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_0
    if-eqz v12, :cond_2

    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_2

    move-object v7, v12

    .line 173
    .local v7, "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_1
    if-eqz v13, :cond_4

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_4

    move-object v9, v13

    .line 174
    .local v9, "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_2
    if-eqz v14, :cond_6

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_6

    move-object v10, v14

    .line 176
    .local v10, "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_3
    if-eqz v26, :cond_8

    invoke-virtual/range {v26 .. v26}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_8

    move-object/from16 v20, v26

    .line 177
    .local v20, "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_4
    if-eqz v27, :cond_a

    invoke-virtual/range {v27 .. v27}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_a

    move-object/from16 v22, v27

    .line 178
    .local v22, "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_5
    if-eqz v28, :cond_c

    invoke-virtual/range {v28 .. v28}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_c

    move-object/from16 v24, v28

    .line 179
    .local v24, "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_6
    if-eqz v29, :cond_e

    invoke-virtual/range {v29 .. v29}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_e

    move-object/from16 v25, v29

    .line 182
    .local v25, "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_7
    if-eqz v5, :cond_10

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_10

    move-object v6, v5

    .line 183
    .local v6, "eastSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_8
    if-eqz v7, :cond_12

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_12

    move-object v8, v7

    .line 185
    .local v8, "eastSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_9
    if-eqz v20, :cond_14

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_14

    move-object/from16 v21, v20

    .line 186
    .local v21, "westSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_a
    if-eqz v22, :cond_16

    invoke-virtual/range {v22 .. v22}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_16

    move-object/from16 v23, v22

    .line 189
    .local v23, "westSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_b
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 190
    .local v19, "matchPlayoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchPlayoffs;>;"
    const/16 v34, 0x8

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v34

    invoke-direct {v0, v1, v6, v8, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 191
    const/16 v34, 0x8

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v21

    move-object/from16 v3, v23

    move/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 192
    new-instance v34, Lcom/blank/bm15/model/comparator/MatchPlayoffsComparator;

    invoke-direct/range {v34 .. v34}, Lcom/blank/bm15/model/comparator/MatchPlayoffsComparator;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v34

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 194
    return-object v19

    .line 171
    .end local v5    # "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v6    # "eastSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v7    # "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v8    # "eastSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v9    # "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v10    # "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v19    # "matchPlayoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchPlayoffs;>;"
    .end local v20    # "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v21    # "westSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v22    # "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v23    # "westSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v24    # "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v25    # "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_0
    if-eqz v18, :cond_1

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_1

    move-object/from16 v5, v18

    goto/16 :goto_0

    :cond_1
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 172
    .restart local v5    # "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_2
    if-eqz v17, :cond_3

    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_3

    move-object/from16 v7, v17

    goto/16 :goto_1

    :cond_3
    const/4 v7, 0x0

    goto/16 :goto_1

    .line 173
    .restart local v7    # "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_4
    if-eqz v16, :cond_5

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_5

    move-object/from16 v9, v16

    goto/16 :goto_2

    :cond_5
    const/4 v9, 0x0

    goto/16 :goto_2

    .line 174
    .restart local v9    # "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_6
    if-eqz v15, :cond_7

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_7

    move-object v10, v15

    goto/16 :goto_3

    :cond_7
    const/4 v10, 0x0

    goto/16 :goto_3

    .line 176
    .restart local v10    # "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_8
    if-eqz v33, :cond_9

    invoke-virtual/range {v33 .. v33}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_9

    move-object/from16 v20, v33

    goto/16 :goto_4

    :cond_9
    const/16 v20, 0x0

    goto/16 :goto_4

    .line 177
    .restart local v20    # "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_a
    if-eqz v32, :cond_b

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_b

    move-object/from16 v22, v32

    goto/16 :goto_5

    :cond_b
    const/16 v22, 0x0

    goto/16 :goto_5

    .line 178
    .restart local v22    # "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_c
    if-eqz v31, :cond_d

    invoke-virtual/range {v31 .. v31}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_d

    move-object/from16 v24, v31

    goto/16 :goto_6

    :cond_d
    const/16 v24, 0x0

    goto/16 :goto_6

    .line 179
    .restart local v24    # "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_e
    if-eqz v30, :cond_f

    invoke-virtual/range {v30 .. v30}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_f

    move-object/from16 v25, v30

    goto/16 :goto_7

    :cond_f
    const/16 v25, 0x0

    goto/16 :goto_7

    .line 182
    .restart local v25    # "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_10
    if-eqz v10, :cond_11

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_11

    move-object v6, v10

    goto/16 :goto_8

    :cond_11
    const/4 v6, 0x0

    goto/16 :goto_8

    .line 183
    .restart local v6    # "eastSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_12
    if-eqz v9, :cond_13

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_13

    move-object v8, v9

    goto/16 :goto_9

    :cond_13
    const/4 v8, 0x0

    goto/16 :goto_9

    .line 185
    .restart local v8    # "eastSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_14
    if-eqz v25, :cond_15

    invoke-virtual/range {v25 .. v25}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_15

    move-object/from16 v21, v25

    goto/16 :goto_a

    :cond_15
    const/16 v21, 0x0

    goto/16 :goto_a

    .line 186
    .restart local v21    # "westSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_16
    if-eqz v24, :cond_17

    invoke-virtual/range {v24 .. v24}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v34

    if-eqz v34, :cond_17

    move-object/from16 v23, v24

    goto/16 :goto_b

    :cond_17
    const/16 v23, 0x0

    goto/16 :goto_b
.end method

.method private getFinalMatch(Ljava/util/List;)Ljava/util/List;
    .locals 37
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Playoffs;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchPlayoffs;",
            ">;"
        }
    .end annotation

    .prologue
    .line 199
    .local p1, "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    const/16 v35, 0x1

    const/16 v36, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v11

    .line 200
    .local v11, "eastTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x1

    const/16 v36, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v12

    .line 201
    .local v12, "eastTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x1

    const/16 v36, 0x3

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v13

    .line 202
    .local v13, "eastTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x1

    const/16 v36, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v14

    .line 203
    .local v14, "eastTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x1

    const/16 v36, 0x5

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v15

    .line 204
    .local v15, "eastTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x1

    const/16 v36, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v16

    .line 205
    .local v16, "eastTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x1

    const/16 v36, 0x7

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v17

    .line 206
    .local v17, "eastTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x1

    const/16 v36, 0x8

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v18

    .line 208
    .local v18, "eastTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x2

    const/16 v36, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v27

    .line 209
    .local v27, "westTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x2

    const/16 v36, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v28

    .line 210
    .local v28, "westTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x2

    const/16 v36, 0x3

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v29

    .line 211
    .local v29, "westTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x2

    const/16 v36, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v30

    .line 212
    .local v30, "westTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x2

    const/16 v36, 0x5

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v31

    .line 213
    .local v31, "westTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x2

    const/16 v36, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v32

    .line 214
    .local v32, "westTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x2

    const/16 v36, 0x7

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v33

    .line 215
    .local v33, "westTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v35, 0x2

    const/16 v36, 0x8

    move-object/from16 v0, p1

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v34

    .line 218
    .local v34, "westTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    if-eqz v11, :cond_0

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_0

    move-object v5, v11

    .line 219
    .local v5, "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_0
    if-eqz v12, :cond_2

    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_2

    move-object v7, v12

    .line 220
    .local v7, "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_1
    if-eqz v13, :cond_4

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_4

    move-object v9, v13

    .line 221
    .local v9, "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_2
    if-eqz v14, :cond_6

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_6

    move-object v10, v14

    .line 223
    .local v10, "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_3
    if-eqz v27, :cond_8

    invoke-virtual/range {v27 .. v27}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_8

    move-object/from16 v21, v27

    .line 224
    .local v21, "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_4
    if-eqz v28, :cond_a

    invoke-virtual/range {v28 .. v28}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_a

    move-object/from16 v23, v28

    .line 225
    .local v23, "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_5
    if-eqz v29, :cond_c

    invoke-virtual/range {v29 .. v29}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_c

    move-object/from16 v25, v29

    .line 226
    .local v25, "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_6
    if-eqz v30, :cond_e

    invoke-virtual/range {v30 .. v30}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_e

    move-object/from16 v26, v30

    .line 229
    .local v26, "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_7
    if-eqz v5, :cond_10

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_10

    move-object v6, v5

    .line 230
    .local v6, "eastSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_8
    if-eqz v7, :cond_12

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_12

    move-object v8, v7

    .line 232
    .local v8, "eastSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_9
    if-eqz v21, :cond_14

    invoke-virtual/range {v21 .. v21}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_14

    move-object/from16 v22, v21

    .line 233
    .local v22, "westSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_a
    if-eqz v23, :cond_16

    invoke-virtual/range {v23 .. v23}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_16

    move-object/from16 v24, v23

    .line 236
    .local v24, "westSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_b
    if-eqz v6, :cond_18

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_18

    move-object v4, v6

    .line 238
    .local v4, "eastConference":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_c
    if-eqz v22, :cond_1a

    invoke-virtual/range {v22 .. v22}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_1a

    move-object/from16 v20, v22

    .line 241
    .local v20, "westConference":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_d
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 242
    .local v19, "matchPlayoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchPlayoffs;>;"
    const/16 v35, 0xc

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    move/from16 v3, v35

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 243
    new-instance v35, Lcom/blank/bm15/model/comparator/MatchPlayoffsComparator;

    invoke-direct/range {v35 .. v35}, Lcom/blank/bm15/model/comparator/MatchPlayoffsComparator;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v35

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 245
    return-object v19

    .line 218
    .end local v4    # "eastConference":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v5    # "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v6    # "eastSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v7    # "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v8    # "eastSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v9    # "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v10    # "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v19    # "matchPlayoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchPlayoffs;>;"
    .end local v20    # "westConference":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v21    # "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v22    # "westSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v23    # "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v24    # "westSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v25    # "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v26    # "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_0
    if-eqz v18, :cond_1

    invoke-virtual/range {v18 .. v18}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_1

    move-object/from16 v5, v18

    goto/16 :goto_0

    :cond_1
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 219
    .restart local v5    # "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_2
    if-eqz v17, :cond_3

    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_3

    move-object/from16 v7, v17

    goto/16 :goto_1

    :cond_3
    const/4 v7, 0x0

    goto/16 :goto_1

    .line 220
    .restart local v7    # "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_4
    if-eqz v16, :cond_5

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_5

    move-object/from16 v9, v16

    goto/16 :goto_2

    :cond_5
    const/4 v9, 0x0

    goto/16 :goto_2

    .line 221
    .restart local v9    # "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_6
    if-eqz v15, :cond_7

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_7

    move-object v10, v15

    goto/16 :goto_3

    :cond_7
    const/4 v10, 0x0

    goto/16 :goto_3

    .line 223
    .restart local v10    # "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_8
    if-eqz v34, :cond_9

    invoke-virtual/range {v34 .. v34}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_9

    move-object/from16 v21, v34

    goto/16 :goto_4

    :cond_9
    const/16 v21, 0x0

    goto/16 :goto_4

    .line 224
    .restart local v21    # "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_a
    if-eqz v33, :cond_b

    invoke-virtual/range {v33 .. v33}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_b

    move-object/from16 v23, v33

    goto/16 :goto_5

    :cond_b
    const/16 v23, 0x0

    goto/16 :goto_5

    .line 225
    .restart local v23    # "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_c
    if-eqz v32, :cond_d

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_d

    move-object/from16 v25, v32

    goto/16 :goto_6

    :cond_d
    const/16 v25, 0x0

    goto/16 :goto_6

    .line 226
    .restart local v25    # "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_e
    if-eqz v31, :cond_f

    invoke-virtual/range {v31 .. v31}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_f

    move-object/from16 v26, v31

    goto/16 :goto_7

    :cond_f
    const/16 v26, 0x0

    goto/16 :goto_7

    .line 229
    .restart local v26    # "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_10
    if-eqz v10, :cond_11

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_11

    move-object v6, v10

    goto/16 :goto_8

    :cond_11
    const/4 v6, 0x0

    goto/16 :goto_8

    .line 230
    .restart local v6    # "eastSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_12
    if-eqz v9, :cond_13

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_13

    move-object v8, v9

    goto/16 :goto_9

    :cond_13
    const/4 v8, 0x0

    goto/16 :goto_9

    .line 232
    .restart local v8    # "eastSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_14
    if-eqz v26, :cond_15

    invoke-virtual/range {v26 .. v26}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_15

    move-object/from16 v22, v26

    goto/16 :goto_a

    :cond_15
    const/16 v22, 0x0

    goto/16 :goto_a

    .line 233
    .restart local v22    # "westSemis1845":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_16
    if-eqz v25, :cond_17

    invoke-virtual/range {v25 .. v25}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_17

    move-object/from16 v24, v25

    goto/16 :goto_b

    :cond_17
    const/16 v24, 0x0

    goto/16 :goto_b

    .line 236
    .restart local v24    # "westSemis2736":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_18
    if-eqz v8, :cond_19

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_19

    move-object v4, v8

    goto/16 :goto_c

    :cond_19
    const/4 v4, 0x0

    goto/16 :goto_c

    .line 238
    .restart local v4    # "eastConference":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_1a
    if-eqz v24, :cond_1b

    invoke-virtual/range {v24 .. v24}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v35

    if-eqz v35, :cond_1b

    move-object/from16 v20, v24

    goto/16 :goto_d

    :cond_1b
    const/16 v20, 0x0

    goto/16 :goto_d
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
    .line 309
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 314
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 309
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Playoffs;

    .line 310
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

.method private getQuarterMatchs(Ljava/util/List;)Ljava/util/List;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Playoffs;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchPlayoffs;",
            ">;"
        }
    .end annotation

    .prologue
    .line 75
    .local p1, "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    const/16 v20, 0x1

    const/16 v21, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v3

    .line 76
    .local v3, "eastTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x1

    const/16 v21, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v4

    .line 77
    .local v4, "eastTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x1

    const/16 v21, 0x3

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v5

    .line 78
    .local v5, "eastTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x1

    const/16 v21, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v6

    .line 79
    .local v6, "eastTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x1

    const/16 v21, 0x5

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v7

    .line 80
    .local v7, "eastTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x1

    const/16 v21, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v8

    .line 81
    .local v8, "eastTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x1

    const/16 v21, 0x7

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v9

    .line 82
    .local v9, "eastTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x1

    const/16 v21, 0x8

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v10

    .line 84
    .local v10, "eastTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x2

    const/16 v21, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v12

    .line 85
    .local v12, "westTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x2

    const/16 v21, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v13

    .line 86
    .local v13, "westTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x2

    const/16 v21, 0x3

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v14

    .line 87
    .local v14, "westTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x2

    const/16 v21, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v15

    .line 88
    .local v15, "westTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x2

    const/16 v21, 0x5

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v16

    .line 89
    .local v16, "westTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x2

    const/16 v21, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v17

    .line 90
    .local v17, "westTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x2

    const/16 v21, 0x7

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v18

    .line 91
    .local v18, "westTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v20, 0x2

    const/16 v21, 0x8

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v19

    .line 94
    .local v19, "westTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 95
    .local v11, "matchPlayoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchPlayoffs;>;"
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v11, v3, v10, v1}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 96
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v11, v4, v9, v1}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 97
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v11, v5, v8, v1}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 98
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v11, v6, v7, v1}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 99
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v11, v12, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 100
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v20

    invoke-direct {v0, v11, v13, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 101
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v20

    invoke-direct {v0, v11, v14, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 102
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move/from16 v2, v20

    invoke-direct {v0, v11, v15, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 103
    new-instance v20, Lcom/blank/bm15/model/comparator/MatchPlayoffsComparator;

    invoke-direct/range {v20 .. v20}, Lcom/blank/bm15/model/comparator/MatchPlayoffsComparator;-><init>()V

    move-object/from16 v0, v20

    invoke-static {v11, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 105
    return-object v11
.end method

.method private getSemisMatchs(Ljava/util/List;)Ljava/util/List;
    .locals 32
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Playoffs;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchPlayoffs;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    .local p1, "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Playoffs;>;"
    const/16 v30, 0x1

    const/16 v31, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v9

    .line 111
    .local v9, "eastTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x1

    const/16 v31, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v10

    .line 112
    .local v10, "eastTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x1

    const/16 v31, 0x3

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v11

    .line 113
    .local v11, "eastTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x1

    const/16 v31, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v12

    .line 114
    .local v12, "eastTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x1

    const/16 v31, 0x5

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v13

    .line 115
    .local v13, "eastTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x1

    const/16 v31, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v14

    .line 116
    .local v14, "eastTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x1

    const/16 v31, 0x7

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v15

    .line 117
    .local v15, "eastTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x1

    const/16 v31, 0x8

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v16

    .line 119
    .local v16, "eastTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x2

    const/16 v31, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v22

    .line 120
    .local v22, "westTeam1":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x2

    const/16 v31, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v23

    .line 121
    .local v23, "westTeam2":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x2

    const/16 v31, 0x3

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v24

    .line 122
    .local v24, "westTeam3":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x2

    const/16 v31, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v25

    .line 123
    .local v25, "westTeam4":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x2

    const/16 v31, 0x5

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v26

    .line 124
    .local v26, "westTeam5":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x2

    const/16 v31, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v27

    .line 125
    .local v27, "westTeam6":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x2

    const/16 v31, 0x7

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v28

    .line 126
    .local v28, "westTeam7":Lcom/blank/bm15/model/object/crud/Playoffs;
    const/16 v30, 0x2

    const/16 v31, 0x8

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getPlayoffs(Ljava/util/List;II)Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v29

    .line 129
    .local v29, "westTeam8":Lcom/blank/bm15/model/object/crud/Playoffs;
    if-eqz v9, :cond_0

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_0

    move-object v5, v9

    .line 130
    .local v5, "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_0
    if-eqz v10, :cond_2

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_2

    move-object v6, v10

    .line 131
    .local v6, "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_1
    if-eqz v11, :cond_4

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_4

    move-object v7, v11

    .line 132
    .local v7, "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_2
    if-eqz v12, :cond_6

    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_6

    move-object v8, v12

    .line 134
    .local v8, "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_3
    if-eqz v22, :cond_8

    invoke-virtual/range {v22 .. v22}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_8

    move-object/from16 v18, v22

    .line 135
    .local v18, "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_4
    if-eqz v23, :cond_a

    invoke-virtual/range {v23 .. v23}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_a

    move-object/from16 v19, v23

    .line 136
    .local v19, "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_5
    if-eqz v24, :cond_c

    invoke-virtual/range {v24 .. v24}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_c

    move-object/from16 v20, v24

    .line 137
    .local v20, "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_6
    if-eqz v25, :cond_e

    invoke-virtual/range {v25 .. v25}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_e

    move-object/from16 v21, v25

    .line 140
    .local v21, "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :goto_7
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 141
    .local v17, "matchPlayoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchPlayoffs;>;"
    const/16 v30, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v30

    invoke-direct {v0, v1, v5, v8, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 142
    const/16 v30, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v30

    invoke-direct {v0, v1, v6, v7, v2}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 143
    const/16 v30, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v21

    move/from16 v4, v30

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 144
    const/16 v30, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    move/from16 v4, v30

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->createMatchPlayoffs(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;I)V

    .line 145
    new-instance v30, Lcom/blank/bm15/model/comparator/MatchPlayoffsComparator;

    invoke-direct/range {v30 .. v30}, Lcom/blank/bm15/model/comparator/MatchPlayoffsComparator;-><init>()V

    move-object/from16 v0, v17

    move-object/from16 v1, v30

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 147
    return-object v17

    .line 129
    .end local v5    # "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v6    # "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v7    # "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v8    # "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v17    # "matchPlayoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchPlayoffs;>;"
    .end local v18    # "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v19    # "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v20    # "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    .end local v21    # "westSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_0
    if-eqz v16, :cond_1

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_1

    move-object/from16 v5, v16

    goto/16 :goto_0

    :cond_1
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 130
    .restart local v5    # "eastSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_2
    if-eqz v15, :cond_3

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_3

    move-object v6, v15

    goto/16 :goto_1

    :cond_3
    const/4 v6, 0x0

    goto/16 :goto_1

    .line 131
    .restart local v6    # "eastSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_4
    if-eqz v14, :cond_5

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_5

    move-object v7, v14

    goto/16 :goto_2

    :cond_5
    const/4 v7, 0x0

    goto/16 :goto_2

    .line 132
    .restart local v7    # "eastSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_6
    if-eqz v13, :cond_7

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_7

    move-object v8, v13

    goto/16 :goto_3

    :cond_7
    const/4 v8, 0x0

    goto/16 :goto_3

    .line 134
    .restart local v8    # "eastSemis45":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_8
    if-eqz v29, :cond_9

    invoke-virtual/range {v29 .. v29}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_9

    move-object/from16 v18, v29

    goto/16 :goto_4

    :cond_9
    const/16 v18, 0x0

    goto/16 :goto_4

    .line 135
    .restart local v18    # "westSemis18":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_a
    if-eqz v28, :cond_b

    invoke-virtual/range {v28 .. v28}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_b

    move-object/from16 v19, v28

    goto/16 :goto_5

    :cond_b
    const/16 v19, 0x0

    goto/16 :goto_5

    .line 136
    .restart local v19    # "westSemis27":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_c
    if-eqz v27, :cond_d

    invoke-virtual/range {v27 .. v27}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_d

    move-object/from16 v20, v27

    goto/16 :goto_6

    :cond_d
    const/16 v20, 0x0

    goto/16 :goto_6

    .line 137
    .restart local v20    # "westSemis36":Lcom/blank/bm15/model/object/crud/Playoffs;
    :cond_e
    if-eqz v26, :cond_f

    invoke-virtual/range {v26 .. v26}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v30

    if-eqz v30, :cond_f

    move-object/from16 v21, v26

    goto/16 :goto_7

    :cond_f
    const/16 v21, 0x0

    goto/16 :goto_7
.end method

.method public static final newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/PlayoffsFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I
    .param p1, "navigationMode"    # Ljava/lang/Integer;

    .prologue
    .line 24
    new-instance v1, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;-><init>()V

    .line 26
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/PlayoffsFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 27
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 28
    sget-object v2, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->NAVIGATION_MODE:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 29
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 31
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 36
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 39
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->rootView:Landroid/view/View;

    const v2, 0x7f0b0034

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    .line 40
    .local v0, "listView":Landroid/widget/ListView;
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->getAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 41
    return-void
.end method
