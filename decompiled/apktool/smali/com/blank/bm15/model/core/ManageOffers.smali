.class public Lcom/blank/bm15/model/core/ManageOffers;
.super Ljava/lang/Object;
.source "ManageOffers.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static manage(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 17
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 18
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .local v8, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .local v4, "newsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/News;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .local v6, "offerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    const/16 v13, 0xe4

    if-eq v12, v13, :cond_0

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    const/16 v13, 0xe5

    if-eq v12, v13, :cond_0

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    const/16 v13, 0xe6

    if-eq v12, v13, :cond_0

    const/4 v12, 0x0

    :goto_0
    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    .line 24
    .local v10, "renewal":Ljava/lang/Boolean;
    new-instance v2, Lcom/blank/bm15/model/object/crud/Offer;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v12

    invoke-direct {v2, v12}, Lcom/blank/bm15/model/object/crud/Offer;-><init>(Landroid/content/Context;)V

    .line 25
    .local v2, "filter":Lcom/blank/bm15/model/object/crud/Offer;
    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Lcom/blank/bm15/model/object/crud/Offer;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 26
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v2, v12}, Lcom/blank/bm15/model/object/crud/Offer;->setMatchday(Ljava/lang/Integer;)V

    .line 27
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v1

    .line 28
    .local v1, "currentOfferList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_1

    .line 69
    invoke-static {v8}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 70
    invoke-static {v4}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 71
    invoke-static {v6}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 72
    return-void

    .line 21
    .end local v1    # "currentOfferList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    .end local v2    # "filter":Lcom/blank/bm15/model/object/crud/Offer;
    .end local v10    # "renewal":Ljava/lang/Boolean;
    :cond_0
    const/4 v12, 0x1

    goto :goto_0

    .line 28
    .restart local v1    # "currentOfferList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    .restart local v2    # "filter":Lcom/blank/bm15/model/object/crud/Offer;
    .restart local v10    # "renewal":Ljava/lang/Boolean;
    :cond_1
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/model/object/crud/Offer;

    .line 29
    .local v5, "offer":Lcom/blank/bm15/model/object/crud/Offer;
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Offer;->getPlayer()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v7

    .line 31
    .local v7, "player":Lcom/blank/bm15/model/object/crud/Player;
    new-instance v3, Lcom/blank/bm15/model/object/crud/News;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v3, v13}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 32
    .local v3, "news":Lcom/blank/bm15/model/object/crud/News;
    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 33
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v3, v13}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 34
    const v13, 0x7f020040

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v3, v13}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 35
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v13

    const v14, 0x7f050063

    invoke-virtual {v13, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 37
    const/4 v9, 0x0

    .line 38
    .local v9, "plusSalaryCapRenewal":I
    const/4 v11, 0x0

    .line 39
    .local v11, "teamSalary":I
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    if-eqz v13, :cond_2

    .line 40
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Offer;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    mul-int/lit8 v13, v13, 0x14

    div-int/lit8 v9, v13, 0x64

    .line 41
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Offer;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v13

    invoke-virtual {v13, v7}, Lcom/blank/bm15/model/object/crud/Team;->getTeamSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v11

    .line 46
    :goto_2
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Offer;->getAnswer()Ljava/lang/Boolean;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Offer;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    add-int/2addr v13, v9

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Offer;->getSalary()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    add-int/2addr v14, v11

    if-le v13, v14, :cond_3

    .line 47
    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->delete(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 49
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Offer;->getSalary()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v7, v13}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    .line 50
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Offer;->getYears()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v7, v13}, Lcom/blank/bm15/model/object/crud/Player;->setYearsContract(Ljava/lang/Integer;)V

    .line 51
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Offer;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v13

    invoke-virtual {v7, v13}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 52
    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v13

    const v14, 0x7f050064

    invoke-virtual {v13, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Offer;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Team;->getFullName()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 67
    :goto_3
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 43
    :cond_2
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Offer;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Lcom/blank/bm15/model/object/crud/Team;->getTeamSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v11

    goto :goto_2

    .line 56
    :cond_3
    sget-object v13, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v5, v13}, Lcom/blank/bm15/model/object/crud/Offer;->setAnswer(Ljava/lang/Boolean;)V

    .line 57
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    const/16 v14, 0xa

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/16 v15, 0x14

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    add-int/2addr v13, v14

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v5, v13}, Lcom/blank/bm15/model/object/crud/Offer;->setSalary(Ljava/lang/Integer;)V

    .line 60
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    if-eqz v13, :cond_4

    .line 61
    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->delete(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 65
    :goto_4
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v13

    const v14, 0x7f050065

    invoke-virtual {v13, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Offer;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Team;->getFullName()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    goto :goto_3

    .line 63
    :cond_4
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4
.end method
