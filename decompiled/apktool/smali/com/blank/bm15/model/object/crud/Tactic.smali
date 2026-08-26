.class public Lcom/blank/bm15/model/object/crud/Tactic;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "Tactic.java"


# instance fields
.field private game:Lcom/blank/bm15/model/object/crud/Game;

.field private lineupReserveCenter:Ljava/lang/Integer;

.field private lineupReservePointGuard:Ljava/lang/Integer;

.field private lineupReservePowerForward:Ljava/lang/Integer;

.field private lineupReserveShootingGuard:Ljava/lang/Integer;

.field private lineupReserveSmallForward:Ljava/lang/Integer;

.field private lineupTitularCenter:Ljava/lang/Integer;

.field private lineupTitularPointGuard:Ljava/lang/Integer;

.field private lineupTitularPowerForward:Ljava/lang/Integer;

.field private lineupTitularShootingGuard:Ljava/lang/Integer;

.field private lineupTitularSmallForward:Ljava/lang/Integer;

.field private tacticBenchImportance:Ljava/lang/Integer;

.field private tacticGameType:Ljava/lang/Integer;

.field private tacticShotIntPercent:Ljava/lang/Integer;

.field private tacticShotTriplePercent:Ljava/lang/Integer;

.field private tacticStarOne:Ljava/lang/Integer;

.field private tacticStarThree:Ljava/lang/Integer;

.field private tacticStarTwo:Ljava/lang/Integer;

.field private team:Lcom/blank/bm15/model/object/crud/Team;

.field private tempPlayers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 43
    return-void
.end method

.method private findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;
    .locals 4
    .param p1, "idPlayer"    # Ljava/lang/Integer;

    .prologue
    .line 494
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 499
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 494
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 495
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v2, v3, :cond_0

    goto :goto_0
.end method


# virtual methods
.method public getGame()Lcom/blank/bm15/model/object/crud/Game;
    .locals 2

    .prologue
    .line 198
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->game:Lcom/blank/bm15/model/object/crud/Game;

    if-nez v0, :cond_1

    .line 199
    new-instance v0, Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 203
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->game:Lcom/blank/bm15/model/object/crud/Game;

    return-object v0

    .line 200
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 201
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getLineupReserveCenter()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupReserveCenter:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLineupReservePointGuard()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupReservePointGuard:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLineupReservePowerForward()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupReservePowerForward:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLineupReserveShootingGuard()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupReserveShootingGuard:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLineupReserveSmallForward()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupReserveSmallForward:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLineupTitularCenter()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupTitularCenter:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLineupTitularPointGuard()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupTitularPointGuard:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLineupTitularPowerForward()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupTitularPowerForward:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLineupTitularShootingGuard()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupTitularShootingGuard:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLineupTitularSmallForward()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupTitularSmallForward:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPlayers()Ljava/util/List;
    .locals 6
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
    .line 224
    iget-object v3, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tempPlayers:Ljava/util/List;

    if-nez v3, :cond_0

    .line 225
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 226
    .local v0, "filter":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 227
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tempPlayers:Ljava/util/List;

    .line 229
    iget-object v3, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tempPlayers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 268
    .end local v0    # "filter":Lcom/blank/bm15/model/object/crud/Player;
    :cond_0
    iget-object v3, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tempPlayers:Ljava/util/List;

    return-object v3

    .line 229
    .restart local v0    # "filter":Lcom/blank/bm15/model/object/crud/Player;
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Player;

    .line 230
    .local v1, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 231
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 233
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarOne()Ljava/lang/Integer;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarOne()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_2

    .line 234
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setIsStarOne(Ljava/lang/Boolean;)V

    .line 238
    :goto_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarTwo()Ljava/lang/Integer;

    move-result-object v4

    if-eqz v4, :cond_3

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarTwo()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_3

    .line 239
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setIsStarTwo(Ljava/lang/Boolean;)V

    .line 243
    :goto_2
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarThree()Ljava/lang/Integer;

    move-result-object v4

    if-eqz v4, :cond_4

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarThree()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_4

    .line 244
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setIsStarThree(Ljava/lang/Boolean;)V

    .line 249
    :goto_3
    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setPositionMatch(Ljava/lang/Integer;)V

    .line 251
    invoke-virtual {p0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v2

    .line 252
    .local v2, "position":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_5

    .line 253
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setIsTitular(Ljava/lang/Boolean;)V

    .line 254
    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionMatch(Ljava/lang/Integer;)V

    .line 259
    :goto_4
    invoke-virtual {p0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v2

    .line 260
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_6

    .line 261
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setIsReserve(Ljava/lang/Boolean;)V

    .line 262
    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionMatch(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 236
    .end local v2    # "position":Ljava/lang/Integer;
    :cond_2
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setIsStarOne(Ljava/lang/Boolean;)V

    goto :goto_1

    .line 241
    :cond_3
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setIsStarTwo(Ljava/lang/Boolean;)V

    goto :goto_2

    .line 246
    :cond_4
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setIsStarThree(Ljava/lang/Boolean;)V

    goto :goto_3

    .line 256
    .restart local v2    # "position":Ljava/lang/Integer;
    :cond_5
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setIsTitular(Ljava/lang/Boolean;)V

    goto :goto_4

    .line 264
    :cond_6
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setIsReserve(Ljava/lang/Boolean;)V

    goto/16 :goto_0
.end method

.method public getPlayersInLineup()Ljava/util/List;
    .locals 4
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
    .line 281
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersTitulars()Ljava/util/List;

    move-result-object v1

    .line 283
    .local v1, "players":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersReserves()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 287
    return-object v1

    .line 283
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 284
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getPlayersRemains()Ljava/util/List;
    .locals 6
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
    .line 387
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 389
    .local v1, "remains":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v2

    new-instance v3, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v4, 0x6

    const/4 v5, 0x1

    invoke-direct {v3, v4, v5}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 390
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 396
    return-object v1

    .line 390
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 391
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-nez v3, :cond_0

    .line 392
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getPlayersReserves()Ljava/util/List;
    .locals 4
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
    const/4 v3, 0x0

    .line 339
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 342
    .local v1, "reserves":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReservePointGuard()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 343
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReservePointGuard()Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 344
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    if-nez v0, :cond_5

    .line 345
    invoke-virtual {p0, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReservePointGuard(Ljava/lang/Integer;)V

    .line 350
    .end local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveShootingGuard()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 351
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveShootingGuard()Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 352
    .restart local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    if-nez v0, :cond_6

    .line 353
    invoke-virtual {p0, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveShootingGuard(Ljava/lang/Integer;)V

    .line 358
    .end local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveSmallForward()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 359
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveSmallForward()Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 360
    .restart local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    if-nez v0, :cond_7

    .line 361
    invoke-virtual {p0, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveSmallForward(Ljava/lang/Integer;)V

    .line 366
    .end local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_2
    :goto_2
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReservePowerForward()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 367
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReservePowerForward()Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 368
    .restart local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    if-nez v0, :cond_8

    .line 369
    invoke-virtual {p0, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReservePowerForward(Ljava/lang/Integer;)V

    .line 374
    .end local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_3
    :goto_3
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveCenter()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 375
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveCenter()Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 376
    .restart local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    if-nez v0, :cond_9

    .line 377
    invoke-virtual {p0, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveCenter(Ljava/lang/Integer;)V

    .line 383
    .end local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_4
    :goto_4
    return-object v1

    .line 347
    .restart local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_5
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 355
    :cond_6
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 363
    :cond_7
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 371
    :cond_8
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 379
    :cond_9
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4
.end method

.method public getPlayersTitulars()Ljava/util/List;
    .locals 4
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
    const/4 v3, 0x0

    .line 291
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 294
    .local v1, "titulars":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularPointGuard()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 295
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularPointGuard()Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 296
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    if-nez v0, :cond_5

    .line 297
    invoke-virtual {p0, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularPointGuard(Ljava/lang/Integer;)V

    .line 302
    .end local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularShootingGuard()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 303
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularShootingGuard()Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 304
    .restart local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    if-nez v0, :cond_6

    .line 305
    invoke-virtual {p0, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularShootingGuard(Ljava/lang/Integer;)V

    .line 310
    .end local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularSmallForward()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 311
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularSmallForward()Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 312
    .restart local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    if-nez v0, :cond_7

    .line 313
    invoke-virtual {p0, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularSmallForward(Ljava/lang/Integer;)V

    .line 318
    .end local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_2
    :goto_2
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularPowerForward()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 319
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularPowerForward()Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 320
    .restart local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    if-nez v0, :cond_8

    .line 321
    invoke-virtual {p0, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularPowerForward(Ljava/lang/Integer;)V

    .line 326
    .end local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_3
    :goto_3
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularCenter()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 327
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularCenter()Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 328
    .restart local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    if-nez v0, :cond_9

    .line 329
    invoke-virtual {p0, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularCenter(Ljava/lang/Integer;)V

    .line 335
    .end local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_4
    :goto_4
    return-object v1

    .line 299
    .restart local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_5
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 307
    :cond_6
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 315
    :cond_7
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 323
    :cond_8
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 331
    :cond_9
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4
.end method

.method public getReservePlayer(I)Lcom/blank/bm15/model/object/crud/Player;
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 476
    const/4 v0, 0x0

    .line 478
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v1, 0x1

    if-ne v1, p1, :cond_1

    .line 479
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReservePointGuard()Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 490
    :cond_0
    :goto_0
    return-object v0

    .line 480
    :cond_1
    const/4 v1, 0x2

    if-ne v1, p1, :cond_2

    .line 481
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveShootingGuard()Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 482
    goto :goto_0

    :cond_2
    const/4 v1, 0x3

    if-ne v1, p1, :cond_3

    .line 483
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveSmallForward()Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 484
    goto :goto_0

    :cond_3
    const/4 v1, 0x4

    if-ne v1, p1, :cond_4

    .line 485
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReservePowerForward()Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 486
    goto :goto_0

    :cond_4
    const/4 v1, 0x5

    if-ne v1, p1, :cond_0

    .line 487
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveCenter()Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    goto :goto_0
.end method

.method public getReservePosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;
    .locals 2
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 429
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReservePointGuard()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReservePointGuard()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 430
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 440
    :goto_0
    return-object v0

    .line 431
    :cond_0
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveShootingGuard()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveShootingGuard()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 432
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 433
    :cond_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveSmallForward()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveSmallForward()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 434
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 435
    :cond_2
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReservePowerForward()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReservePowerForward()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 436
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 437
    :cond_3
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveCenter()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveCenter()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_4

    .line 438
    const/4 v0, 0x5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 440
    :cond_4
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0
.end method

.method public getTacticBenchImportance()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticBenchImportance:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 131
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticBenchImportance:Ljava/lang/Integer;

    .line 133
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticBenchImportance:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTacticGameType()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticGameType:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 142
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticGameType:Ljava/lang/Integer;

    .line 144
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticGameType:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTacticShotIntPercent()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticShotIntPercent:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 153
    const/16 v0, 0x28

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticShotIntPercent:Ljava/lang/Integer;

    .line 155
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticShotIntPercent:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTacticShotTriplePercent()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticShotTriplePercent:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 164
    const/16 v0, 0x28

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticShotTriplePercent:Ljava/lang/Integer;

    .line 166
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticShotTriplePercent:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTacticStarOne()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 174
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticStarOne:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTacticStarThree()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticStarThree:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTacticStarTwo()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticStarTwo:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTeam()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 211
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->team:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_1

    .line 212
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->team:Lcom/blank/bm15/model/object/crud/Team;

    .line 216
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->team:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0

    .line 213
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 214
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getTitularPlayer(I)Lcom/blank/bm15/model/object/crud/Player;
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 458
    const/4 v0, 0x0

    .line 460
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v1, 0x1

    if-ne v1, p1, :cond_1

    .line 461
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularPointGuard()Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 472
    :cond_0
    :goto_0
    return-object v0

    .line 462
    :cond_1
    const/4 v1, 0x2

    if-ne v1, p1, :cond_2

    .line 463
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularShootingGuard()Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 464
    goto :goto_0

    :cond_2
    const/4 v1, 0x3

    if-ne v1, p1, :cond_3

    .line 465
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularSmallForward()Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 466
    goto :goto_0

    :cond_3
    const/4 v1, 0x4

    if-ne v1, p1, :cond_4

    .line 467
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularPowerForward()Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 468
    goto :goto_0

    :cond_4
    const/4 v1, 0x5

    if-ne v1, p1, :cond_0

    .line 469
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularCenter()Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->findPlayer(Ljava/lang/Integer;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    goto :goto_0
.end method

.method public getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;
    .locals 2
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 400
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularPointGuard()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularPointGuard()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 401
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 411
    :goto_0
    return-object v0

    .line 402
    :cond_0
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularShootingGuard()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularShootingGuard()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 403
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 404
    :cond_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularSmallForward()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularSmallForward()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 405
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 406
    :cond_2
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularPowerForward()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularPowerForward()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 407
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 408
    :cond_3
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularCenter()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularCenter()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_4

    .line 409
    const/4 v0, 0x5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 411
    :cond_4
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0
.end method

.method public reloadPlayers()V
    .locals 1

    .prologue
    .line 276
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tempPlayers:Ljava/util/List;

    .line 277
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    .line 278
    return-void
.end method

.method public setGame(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 0
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 207
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 208
    return-void
.end method

.method public setLineupReserveCenter(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "lineupReserveCenter"    # Ljava/lang/Integer;

    .prologue
    .line 126
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupReserveCenter:Ljava/lang/Integer;

    .line 127
    return-void
.end method

.method public setLineupReservePointGuard(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "lineupReservePointGuard"    # Ljava/lang/Integer;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupReservePointGuard:Ljava/lang/Integer;

    .line 95
    return-void
.end method

.method public setLineupReservePowerForward(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "lineupReservePowerForward"    # Ljava/lang/Integer;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupReservePowerForward:Ljava/lang/Integer;

    .line 119
    return-void
.end method

.method public setLineupReserveShootingGuard(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "lineupReserveShootingGuard"    # Ljava/lang/Integer;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupReserveShootingGuard:Ljava/lang/Integer;

    .line 103
    return-void
.end method

.method public setLineupReserveSmallForward(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "lineupReserveSmallForward"    # Ljava/lang/Integer;

    .prologue
    .line 110
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupReserveSmallForward:Ljava/lang/Integer;

    .line 111
    return-void
.end method

.method public setLineupTitularCenter(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "lineupTitularCenter"    # Ljava/lang/Integer;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupTitularCenter:Ljava/lang/Integer;

    .line 87
    return-void
.end method

.method public setLineupTitularPointGuard(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "lineupTitularPointGuard"    # Ljava/lang/Integer;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupTitularPointGuard:Ljava/lang/Integer;

    .line 55
    return-void
.end method

.method public setLineupTitularPowerForward(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "lineupTitularPowerForward"    # Ljava/lang/Integer;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupTitularPowerForward:Ljava/lang/Integer;

    .line 79
    return-void
.end method

.method public setLineupTitularShootingGuard(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "lineupTitularShootingGuard"    # Ljava/lang/Integer;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupTitularShootingGuard:Ljava/lang/Integer;

    .line 63
    return-void
.end method

.method public setLineupTitularSmallForward(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "lineupTitularSmallForward"    # Ljava/lang/Integer;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->lineupTitularSmallForward:Ljava/lang/Integer;

    .line 71
    return-void
.end method

.method public setReservePosition(Lcom/blank/bm15/model/object/crud/Player;I)V
    .locals 1
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;
    .param p2, "position"    # I

    .prologue
    .line 444
    const/4 v0, 0x1

    if-ne v0, p2, :cond_1

    .line 445
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReservePointGuard(Ljava/lang/Integer;)V

    .line 455
    :cond_0
    :goto_0
    return-void

    .line 446
    :cond_1
    const/4 v0, 0x2

    if-ne v0, p2, :cond_2

    .line 447
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveShootingGuard(Ljava/lang/Integer;)V

    goto :goto_0

    .line 448
    :cond_2
    const/4 v0, 0x3

    if-ne v0, p2, :cond_3

    .line 449
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveSmallForward(Ljava/lang/Integer;)V

    goto :goto_0

    .line 450
    :cond_3
    const/4 v0, 0x4

    if-ne v0, p2, :cond_4

    .line 451
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReservePowerForward(Ljava/lang/Integer;)V

    goto :goto_0

    .line 452
    :cond_4
    const/4 v0, 0x5

    if-ne v0, p2, :cond_0

    .line 453
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveCenter(Ljava/lang/Integer;)V

    goto :goto_0
.end method

.method public setTacticBenchImportance(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "tacticBenchImportance"    # Ljava/lang/Integer;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticBenchImportance:Ljava/lang/Integer;

    .line 138
    return-void
.end method

.method public setTacticGameType(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "tacticGameType"    # Ljava/lang/Integer;

    .prologue
    .line 148
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticGameType:Ljava/lang/Integer;

    .line 149
    return-void
.end method

.method public setTacticShotIntPercent(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "tacticShotIntPercent"    # Ljava/lang/Integer;

    .prologue
    .line 159
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticShotIntPercent:Ljava/lang/Integer;

    .line 160
    return-void
.end method

.method public setTacticShotTriplePercent(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "tacticShotTriplePercent"    # Ljava/lang/Integer;

    .prologue
    .line 170
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticShotTriplePercent:Ljava/lang/Integer;

    .line 171
    return-void
.end method

.method public setTacticStarOne(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "tacticStarOne"    # Ljava/lang/Integer;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticStarOne:Ljava/lang/Integer;

    .line 179
    return-void
.end method

.method public setTacticStarThree(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "tacticStarThree"    # Ljava/lang/Integer;

    .prologue
    .line 194
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticStarThree:Ljava/lang/Integer;

    .line 195
    return-void
.end method

.method public setTacticStarTwo(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "tacticStarTwo"    # Ljava/lang/Integer;

    .prologue
    .line 186
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->tacticStarTwo:Ljava/lang/Integer;

    .line 187
    return-void
.end method

.method public setTeam(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 220
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Tactic;->team:Lcom/blank/bm15/model/object/crud/Team;

    .line 221
    return-void
.end method

.method public setTitularPosition(Lcom/blank/bm15/model/object/crud/Player;I)V
    .locals 1
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;
    .param p2, "position"    # I

    .prologue
    .line 415
    const/4 v0, 0x1

    if-ne v0, p2, :cond_1

    .line 416
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularPointGuard(Ljava/lang/Integer;)V

    .line 426
    :cond_0
    :goto_0
    return-void

    .line 417
    :cond_1
    const/4 v0, 0x2

    if-ne v0, p2, :cond_2

    .line 418
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularShootingGuard(Ljava/lang/Integer;)V

    goto :goto_0

    .line 419
    :cond_2
    const/4 v0, 0x3

    if-ne v0, p2, :cond_3

    .line 420
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularSmallForward(Ljava/lang/Integer;)V

    goto :goto_0

    .line 421
    :cond_3
    const/4 v0, 0x4

    if-ne v0, p2, :cond_4

    .line 422
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularPowerForward(Ljava/lang/Integer;)V

    goto :goto_0

    .line 423
    :cond_4
    const/4 v0, 0x5

    if-ne v0, p2, :cond_0

    .line 424
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularCenter(Ljava/lang/Integer;)V

    goto :goto_0
.end method
