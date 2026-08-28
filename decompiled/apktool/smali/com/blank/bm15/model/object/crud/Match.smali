.class public Lcom/blank/bm15/model/object/crud/Match;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "Match.java"


# instance fields
.field private game:Lcom/blank/bm15/model/object/crud/Game;

.field private localExtension:Ljava/lang/Integer;

.field private localQuarterFirst:Ljava/lang/Integer;

.field private localQuarterFourth:Ljava/lang/Integer;

.field private localQuarterSecond:Ljava/lang/Integer;

.field private localQuarterThird:Ljava/lang/Integer;

.field private matchday:Ljava/lang/Integer;

.field private name:Ljava/lang/String;

.field private teamLocal:Lcom/blank/bm15/model/object/crud/Team;

.field private teamVisitor:Lcom/blank/bm15/model/object/crud/Team;

.field private visitorExtension:Ljava/lang/Integer;

.field private visitorQuarterFirst:Ljava/lang/Integer;

.field private visitorQuarterFourth:Ljava/lang/Integer;

.field private visitorQuarterSecond:Ljava/lang/Integer;

.field private visitorQuarterThird:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 31
    return-void
.end method


# virtual methods
.method public getFinalResultLocal()Ljava/lang/Integer;
    .locals 2

    .prologue
    .line 207
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getLocalQuarterFirst()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getLocalQuarterSecond()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getLocalQuarterThird()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getLocalQuarterFourth()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getLocalExtension()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getFinalResultVisitor()Ljava/lang/Integer;
    .locals 2

    .prologue
    .line 211
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorQuarterFirst()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorQuarterSecond()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorQuarterThird()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorQuarterFourth()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorExtension()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getGame()Lcom/blank/bm15/model/object/crud/Game;
    .locals 2

    .prologue
    .line 164
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->game:Lcom/blank/bm15/model/object/crud/Game;

    if-nez v0, :cond_1

    .line 165
    new-instance v0, Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 169
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->game:Lcom/blank/bm15/model/object/crud/Game;

    return-object v0

    .line 166
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 167
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getIsMathOfUserTeam(Lcom/blank/bm15/model/object/crud/Game;)Ljava/lang/Boolean;
    .locals 2
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 237
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public getLocalExtension()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localExtension:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 99
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localExtension:Ljava/lang/Integer;

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localExtension:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLocalQuarterFirst()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterFirst:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 55
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterFirst:Ljava/lang/Integer;

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterFirst:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLocalQuarterFourth()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterFourth:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 88
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterFourth:Ljava/lang/Integer;

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterFourth:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLocalQuarterSecond()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterSecond:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 66
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterSecond:Ljava/lang/Integer;

    .line 68
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterSecond:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLocalQuarterThird()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterThird:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 77
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterThird:Ljava/lang/Integer;

    .line 79
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterThird:Ljava/lang/Integer;

    return-object v0
.end method

.method public getMatchday()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->matchday:Ljava/lang/Integer;

    return-object v0
.end method

.method public getMaxAst()Lcom/blank/bm15/model/object/crud/Player;
    .locals 8

    .prologue
    .line 321
    const/4 v1, 0x0

    .line 322
    .local v1, "maxAstPlayer":Lcom/blank/bm15/model/object/crud/Player;
    const-wide/16 v2, 0x0

    .line 324
    .local v2, "maxAst":D
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_3

    .line 330
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_4

    .line 337
    if-nez v1, :cond_2

    .line 338
    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    .end local v1    # "maxAstPlayer":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v1, v5}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 339
    .restart local v1    # "maxAstPlayer":Lcom/blank/bm15/model/object/crud/Player;
    new-instance v0, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 340
    .local v0, "fakeMatchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    const-wide/16 v6, 0x0

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->setPassesOk(Ljava/lang/Double;)V

    .line 341
    invoke-virtual {v1, v0}, Lcom/blank/bm15/model/object/crud/Player;->setCurrentMatchResult(Lcom/blank/bm15/model/object/crud/MatchResult;)V

    .line 344
    .end local v0    # "fakeMatchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    :cond_2
    return-object v1

    .line 324
    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/model/object/crud/Player;

    .line 325
    .local v4, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOk()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    cmpg-double v6, v2, v6

    if-gez v6, :cond_0

    .line 326
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOk()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    .line 327
    move-object v1, v4

    goto :goto_0

    .line 330
    .end local v4    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_4
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/model/object/crud/Player;

    .line 331
    .restart local v4    # "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOk()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    cmpg-double v6, v2, v6

    if-gez v6, :cond_1

    .line 332
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOk()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    .line 333
    move-object v1, v4

    goto/16 :goto_1
.end method

.method public getMaxBlk()Lcom/blank/bm15/model/object/crud/Player;
    .locals 8

    .prologue
    .line 375
    const/4 v1, 0x0

    .line 376
    .local v1, "maxBlkPlayer":Lcom/blank/bm15/model/object/crud/Player;
    const-wide/16 v2, 0x0

    .line 378
    .local v2, "maxBlk":D
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_3

    .line 384
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_4

    .line 391
    if-nez v1, :cond_2

    .line 392
    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    .end local v1    # "maxBlkPlayer":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v1, v5}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 393
    .restart local v1    # "maxBlkPlayer":Lcom/blank/bm15/model/object/crud/Player;
    new-instance v0, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 394
    .local v0, "fakeMatchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    const-wide/16 v6, 0x0

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->setBlocks(Ljava/lang/Double;)V

    .line 395
    invoke-virtual {v1, v0}, Lcom/blank/bm15/model/object/crud/Player;->setCurrentMatchResult(Lcom/blank/bm15/model/object/crud/MatchResult;)V

    .line 398
    .end local v0    # "fakeMatchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    :cond_2
    return-object v1

    .line 378
    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/model/object/crud/Player;

    .line 379
    .local v4, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocks()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    cmpg-double v6, v2, v6

    if-gez v6, :cond_0

    .line 380
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocks()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    .line 381
    move-object v1, v4

    goto :goto_0

    .line 384
    .end local v4    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_4
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/model/object/crud/Player;

    .line 385
    .restart local v4    # "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocks()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    cmpg-double v6, v2, v6

    if-gez v6, :cond_1

    .line 386
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocks()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    .line 387
    move-object v1, v4

    goto/16 :goto_1
.end method

.method public getMaxPts()Lcom/blank/bm15/model/object/crud/Player;
    .locals 5

    .prologue
    .line 270
    const/4 v1, 0x0

    .line 271
    .local v1, "maxPtsPlayer":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v0, 0x0

    .line 273
    .local v0, "maxPts":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_3

    .line 279
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_4

    .line 286
    if-nez v1, :cond_2

    .line 287
    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    .end local v1    # "maxPtsPlayer":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 290
    .restart local v1    # "maxPtsPlayer":Lcom/blank/bm15/model/object/crud/Player;
    :cond_2
    return-object v1

    .line 273
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Player;

    .line 274
    .local v2, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ge v0, v4, :cond_0

    .line 275
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 276
    move-object v1, v2

    goto :goto_0

    .line 279
    .end local v2    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_4
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Player;

    .line 280
    .restart local v2    # "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ge v0, v4, :cond_1

    .line 281
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 282
    move-object v1, v2

    goto :goto_1
.end method

.method public getMaxReb()Lcom/blank/bm15/model/object/crud/Player;
    .locals 8

    .prologue
    .line 294
    const/4 v1, 0x0

    .line 295
    .local v1, "maxRebPlayer":Lcom/blank/bm15/model/object/crud/Player;
    const-wide/16 v2, 0x0

    .line 297
    .local v2, "maxReb":D
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_3

    .line 303
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_4

    .line 310
    if-nez v1, :cond_2

    .line 311
    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    .end local v1    # "maxRebPlayer":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v1, v5}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 312
    .restart local v1    # "maxRebPlayer":Lcom/blank/bm15/model/object/crud/Player;
    new-instance v0, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 313
    .local v0, "fakeMatchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    const-wide/16 v6, 0x0

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->setRebounds(Ljava/lang/Double;)V

    .line 314
    invoke-virtual {v1, v0}, Lcom/blank/bm15/model/object/crud/Player;->setCurrentMatchResult(Lcom/blank/bm15/model/object/crud/MatchResult;)V

    .line 317
    .end local v0    # "fakeMatchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    :cond_2
    return-object v1

    .line 297
    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/model/object/crud/Player;

    .line 298
    .local v4, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getRebounds()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    cmpg-double v6, v2, v6

    if-gez v6, :cond_0

    .line 299
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getRebounds()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    .line 300
    move-object v1, v4

    goto :goto_0

    .line 303
    .end local v4    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_4
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/model/object/crud/Player;

    .line 304
    .restart local v4    # "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getRebounds()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    cmpg-double v6, v2, v6

    if-gez v6, :cond_1

    .line 305
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getRebounds()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    .line 306
    move-object v1, v4

    goto/16 :goto_1
.end method

.method public getMaxStl()Lcom/blank/bm15/model/object/crud/Player;
    .locals 8

    .prologue
    .line 348
    const/4 v1, 0x0

    .line 349
    .local v1, "maxStlPlayer":Lcom/blank/bm15/model/object/crud/Player;
    const-wide/16 v2, 0x0

    .line 351
    .local v2, "maxStl":D
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_3

    .line 357
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_4

    .line 364
    if-nez v1, :cond_2

    .line 365
    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    .end local v1    # "maxStlPlayer":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v1, v5}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 366
    .restart local v1    # "maxStlPlayer":Lcom/blank/bm15/model/object/crud/Player;
    new-instance v0, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 367
    .local v0, "fakeMatchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    const-wide/16 v6, 0x0

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->setSteals(Ljava/lang/Double;)V

    .line 368
    invoke-virtual {v1, v0}, Lcom/blank/bm15/model/object/crud/Player;->setCurrentMatchResult(Lcom/blank/bm15/model/object/crud/MatchResult;)V

    .line 371
    .end local v0    # "fakeMatchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    :cond_2
    return-object v1

    .line 351
    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/model/object/crud/Player;

    .line 352
    .local v4, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getSteals()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    cmpg-double v6, v2, v6

    if-gez v6, :cond_0

    .line 353
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getSteals()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    .line 354
    move-object v1, v4

    goto :goto_0

    .line 357
    .end local v4    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_4
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/model/object/crud/Player;

    .line 358
    .restart local v4    # "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getSteals()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    cmpg-double v6, v2, v6

    if-gez v6, :cond_1

    .line 359
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->getSteals()Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    .line 360
    move-object v1, v4

    goto/16 :goto_1
.end method

.method public getMvp()Lcom/blank/bm15/model/object/crud/Player;
    .locals 8

    .prologue
    .line 249
    const/4 v2, 0x0

    .line 250
    .local v2, "mvpPlayer":Lcom/blank/bm15/model/object/crud/Player;
    const-wide/16 v0, 0x0

    .line 252
    .local v0, "mvpPer":D
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamWinner()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_2

    .line 262
    if-nez v2, :cond_1

    .line 263
    new-instance v2, Lcom/blank/bm15/model/object/crud/Player;

    .end local v2    # "mvpPlayer":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 266
    .restart local v2    # "mvpPlayer":Lcom/blank/bm15/model/object/crud/Player;
    :cond_1
    return-object v2

    .line 252
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    .line 253
    .local v3, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 254
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMinutesPlayed()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0x18

    if-lt v5, v6, :cond_0

    .line 255
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPer()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    cmpg-double v5, v0, v6

    if-gez v5, :cond_0

    .line 257
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPer()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    .line 258
    move-object v2, v3

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 177
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->teamLocal:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_1

    .line 178
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->teamLocal:Lcom/blank/bm15/model/object/crud/Team;

    .line 182
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->teamLocal:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0

    .line 179
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->teamLocal:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->teamLocal:Lcom/blank/bm15/model/object/crud/Team;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 190
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->teamVisitor:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_1

    .line 191
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->teamVisitor:Lcom/blank/bm15/model/object/crud/Team;

    .line 195
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->teamVisitor:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0

    .line 192
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->teamVisitor:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 193
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->teamVisitor:Lcom/blank/bm15/model/object/crud/Team;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getTeamWinner()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 241
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-le v0, v1, :cond_0

    .line 242
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    .line 244
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    goto :goto_0
.end method

.method public getTotalPointsLocalPlayers()Ljava/lang/Integer;
    .locals 4

    .prologue
    .line 215
    const/4 v1, 0x0

    .line 217
    .local v1, "total":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 222
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    return-object v2

    .line 217
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 218
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 219
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v1, v3

    goto :goto_0
.end method

.method public getTotalPointsVisitorPlayers()Ljava/lang/Integer;
    .locals 4

    .prologue
    .line 226
    const/4 v1, 0x0

    .line 228
    .local v1, "total":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 233
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    return-object v2

    .line 228
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 229
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 230
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v1, v3

    goto :goto_0
.end method

.method public getVisitorExtension()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorExtension:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 154
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorExtension:Ljava/lang/Integer;

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorExtension:Ljava/lang/Integer;

    return-object v0
.end method

.method public getVisitorQuarterFirst()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterFirst:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 110
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterFirst:Ljava/lang/Integer;

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterFirst:Ljava/lang/Integer;

    return-object v0
.end method

.method public getVisitorQuarterFourth()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterFourth:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 143
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterFourth:Ljava/lang/Integer;

    .line 145
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterFourth:Ljava/lang/Integer;

    return-object v0
.end method

.method public getVisitorQuarterSecond()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterSecond:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 121
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterSecond:Ljava/lang/Integer;

    .line 123
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterSecond:Ljava/lang/Integer;

    return-object v0
.end method

.method public getVisitorQuarterThird()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterThird:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 132
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterThird:Ljava/lang/Integer;

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterThird:Ljava/lang/Integer;

    return-object v0
.end method

.method public setGame(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 0
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 173
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 174
    return-void
.end method

.method public setLocalExtension(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "localExtension"    # Ljava/lang/Integer;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->localExtension:Ljava/lang/Integer;

    .line 106
    return-void
.end method

.method public setLocalQuarterFirst(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "localQuarterFirst"    # Ljava/lang/Integer;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterFirst:Ljava/lang/Integer;

    .line 62
    return-void
.end method

.method public setLocalQuarterFourth(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "localQuarterFourth"    # Ljava/lang/Integer;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterFourth:Ljava/lang/Integer;

    .line 95
    return-void
.end method

.method public setLocalQuarterSecond(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "localQuarterSecond"    # Ljava/lang/Integer;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterSecond:Ljava/lang/Integer;

    .line 73
    return-void
.end method

.method public setLocalQuarterThird(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "localQuarterThird"    # Ljava/lang/Integer;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->localQuarterThird:Ljava/lang/Integer;

    .line 84
    return-void
.end method

.method public setMatchday(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "matchday"    # Ljava/lang/Integer;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->matchday:Ljava/lang/Integer;

    .line 51
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->name:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public setTeamLocal(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "teamLocal"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 186
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->teamLocal:Lcom/blank/bm15/model/object/crud/Team;

    .line 187
    return-void
.end method

.method public setTeamVisitor(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "teamVisitor"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 199
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->teamVisitor:Lcom/blank/bm15/model/object/crud/Team;

    .line 200
    return-void
.end method

.method public setVisitorExtension(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "visitorExtension"    # Ljava/lang/Integer;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorExtension:Ljava/lang/Integer;

    .line 161
    return-void
.end method

.method public setVisitorQuarterFirst(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "visitorQuarterFirst"    # Ljava/lang/Integer;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterFirst:Ljava/lang/Integer;

    .line 117
    return-void
.end method

.method public setVisitorQuarterFourth(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "visitorQuarterFourth"    # Ljava/lang/Integer;

    .prologue
    .line 149
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterFourth:Ljava/lang/Integer;

    .line 150
    return-void
.end method

.method public setVisitorQuarterSecond(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "visitorQuarterSecond"    # Ljava/lang/Integer;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterSecond:Ljava/lang/Integer;

    .line 128
    return-void
.end method

.method public setVisitorQuarterThird(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "visitorQuarterThird"    # Ljava/lang/Integer;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Match;->visitorQuarterThird:Ljava/lang/Integer;

    .line 139
    return-void
.end method
