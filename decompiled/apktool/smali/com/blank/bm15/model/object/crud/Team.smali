.class public Lcom/blank/bm15/model/object/crud/Team;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "Team.java"


# instance fields
.field private color:Ljava/lang/Integer;

.field private conference:Ljava/lang/Integer;

.field private division:Ljava/lang/Integer;

.field private fullName:Ljava/lang/String;

.field private game:Lcom/blank/bm15/model/object/crud/Game;

.field private name:Ljava/lang/String;

.field private salaryCap:Ljava/lang/Integer;

.field private tempDraftRound1:Lcom/blank/bm15/model/object/crud/DraftRound;

.field private tempDraftRound2:Lcom/blank/bm15/model/object/crud/DraftRound;

.field private tempLeague:Lcom/blank/bm15/model/object/crud/League;

.field private tempPlayoffs:Lcom/blank/bm15/model/object/crud/Playoffs;

.field private tempTactic:Lcom/blank/bm15/model/object/crud/Tactic;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 32
    return-void
.end method

.method private getPlayersAverageSkillsAll(Ljava/util/List;Ljava/lang/Boolean;)Ljava/lang/Double;
    .locals 8
    .param p2, "isAttack"    # Ljava/lang/Boolean;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ">;",
            "Ljava/lang/Boolean;",
            ")",
            "Ljava/lang/Double;"
        }
    .end annotation

    .prologue
    .line 422
    .local p1, "players":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    const-wide/16 v0, 0x0

    .line 423
    .local v0, "average":D
    const/4 v2, 0x0

    .line 425
    .local v2, "i":I
    new-instance v4, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v5, 0x0

    const/4 v6, -0x1

    invoke-direct {v4, v5, v6}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {p1, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 426
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 437
    if-nez v2, :cond_3

    .line 438
    const-wide/16 v4, 0x0

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    .line 440
    :goto_1
    return-object v4

    .line 426
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    .line 427
    .local v3, "player":Lcom/blank/bm15/model/object/crud/Player;
    if-nez p2, :cond_1

    .line 428
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    add-double/2addr v0, v6

    .line 434
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 429
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 430
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAttack()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    add-double/2addr v0, v6

    .line 431
    goto :goto_2

    .line 432
    :cond_2
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillDefense()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    add-double/2addr v0, v6

    goto :goto_2

    .line 440
    .end local v3    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_3
    int-to-double v4, v2

    div-double v4, v0, v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    goto :goto_1
.end method


# virtual methods
.method public addSalaryCap(Ljava/lang/Integer;)V
    .locals 2
    .param p1, "amount"    # Ljava/lang/Integer;

    .prologue
    .line 183
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 184
    return-void
.end method

.method public getColor()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->color:Ljava/lang/Integer;

    return-object v0
.end method

.method public getConference()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->conference:Ljava/lang/Integer;

    return-object v0
.end method

.method public getDivision()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->division:Ljava/lang/Integer;

    return-object v0
.end method

.method public getDraftRound1()Lcom/blank/bm15/model/object/crud/DraftRound;
    .locals 2

    .prologue
    .line 129
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempDraftRound1:Lcom/blank/bm15/model/object/crud/DraftRound;

    if-nez v0, :cond_0

    .line 130
    new-instance v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempDraftRound1:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 131
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempDraftRound1:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 132
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempDraftRound1:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamOwner(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 133
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempDraftRound1:Lcom/blank/bm15/model/object/crud/DraftRound;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/DraftRound;->setRound(Ljava/lang/Integer;)V

    .line 134
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempDraftRound1:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->get(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempDraftRound1:Lcom/blank/bm15/model/object/crud/DraftRound;

    return-object v0
.end method

.method public getDraftRound2()Lcom/blank/bm15/model/object/crud/DraftRound;
    .locals 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempDraftRound2:Lcom/blank/bm15/model/object/crud/DraftRound;

    if-nez v0, :cond_0

    .line 141
    new-instance v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempDraftRound2:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 142
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempDraftRound2:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 143
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempDraftRound2:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamOwner(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 144
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempDraftRound2:Lcom/blank/bm15/model/object/crud/DraftRound;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/DraftRound;->setRound(Ljava/lang/Integer;)V

    .line 145
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempDraftRound2:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->get(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempDraftRound2:Lcom/blank/bm15/model/object/crud/DraftRound;

    return-object v0
.end method

.method public getFullName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->fullName:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 48
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->fullName:Ljava/lang/String;

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->fullName:Ljava/lang/String;

    return-object v0
.end method

.method public getGame()Lcom/blank/bm15/model/object/crud/Game;
    .locals 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->game:Lcom/blank/bm15/model/object/crud/Game;

    if-nez v0, :cond_1

    .line 97
    new-instance v0, Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 101
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->game:Lcom/blank/bm15/model/object/crud/Game;

    return-object v0

    .line 98
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getLeague()Lcom/blank/bm15/model/object/crud/League;
    .locals 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempLeague:Lcom/blank/bm15/model/object/crud/League;

    if-nez v0, :cond_0

    .line 120
    new-instance v0, Lcom/blank/bm15/model/object/crud/League;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/League;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempLeague:Lcom/blank/bm15/model/object/crud/League;

    .line 121
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempLeague:Lcom/blank/bm15/model/object/crud/League;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/League;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 122
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempLeague:Lcom/blank/bm15/model/object/crud/League;

    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/League;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 123
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempLeague:Lcom/blank/bm15/model/object/crud/League;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->get(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 125
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempLeague:Lcom/blank/bm15/model/object/crud/League;

    return-object v0
.end method

.method public getMoreInjuries()Ljava/lang/Boolean;
    .locals 4

    .prologue
    .line 172
    const/4 v1, 0x0

    .line 173
    .local v1, "playersOk":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

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

    .line 179
    const/16 v2, 0xc

    if-ge v2, v1, :cond_2

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    :goto_1
    return-object v2

    .line 173
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 174
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-nez v3, :cond_0

    .line 175
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 179
    .end local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_2
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    goto :goto_1
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNumPlayersOfPosition(I)I
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 199
    const/4 v0, 0x0

    .line 201
    .local v0, "num":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

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

    .line 209
    return v0

    .line 201
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Player;

    .line 202
    .local v1, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, p1, :cond_2

    .line 203
    add-int/lit8 v0, v0, 0x1

    .line 204
    goto :goto_0

    :cond_2
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, p1, :cond_0

    .line 205
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getPlayersAverageRemains()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 410
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersRemains()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageSkillsAll(Ljava/util/List;Ljava/lang/Boolean;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getPlayersAverageRemainsAttack()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 414
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersRemains()Ljava/util/List;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {p0, v0, v1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageSkillsAll(Ljava/util/List;Ljava/lang/Boolean;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getPlayersAverageRemainsDefense()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 418
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersRemains()Ljava/util/List;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p0, v0, v1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageSkillsAll(Ljava/util/List;Ljava/lang/Boolean;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getPlayersAverageReserves()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 398
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersReserves()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageSkillsAll(Ljava/util/List;Ljava/lang/Boolean;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getPlayersAverageReservesAttack()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 402
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersReserves()Ljava/util/List;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {p0, v0, v1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageSkillsAll(Ljava/util/List;Ljava/lang/Boolean;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getPlayersAverageReservesDefense()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 406
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersReserves()Ljava/util/List;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p0, v0, v1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageSkillsAll(Ljava/util/List;Ljava/lang/Boolean;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getPlayersAverageTitulars()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 386
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersTitulars()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageSkillsAll(Ljava/util/List;Ljava/lang/Boolean;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getPlayersAverageTitularsAttack()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 390
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersTitulars()Ljava/util/List;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {p0, v0, v1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageSkillsAll(Ljava/util/List;Ljava/lang/Boolean;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getPlayersAverageTitularsDefense()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 394
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersTitulars()Ljava/util/List;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p0, v0, v1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageSkillsAll(Ljava/util/List;Ljava/lang/Boolean;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getPlayoffs()Lcom/blank/bm15/model/object/crud/Playoffs;
    .locals 2

    .prologue
    .line 151
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempPlayoffs:Lcom/blank/bm15/model/object/crud/Playoffs;

    if-nez v0, :cond_0

    .line 152
    new-instance v0, Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Playoffs;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempPlayoffs:Lcom/blank/bm15/model/object/crud/Playoffs;

    .line 153
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempPlayoffs:Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Playoffs;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 154
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempPlayoffs:Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 155
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempPlayoffs:Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->get(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 157
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempPlayoffs:Lcom/blank/bm15/model/object/crud/Playoffs;

    return-object v0
.end method

.method public getSalaryCap()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->salaryCap:Ljava/lang/Integer;

    return-object v0
.end method

.method public getShortFullName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 165
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getFullName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\s"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    .line 166
    .local v0, "shortFullName":Ljava/lang/String;
    const/4 v1, 0x0

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 168
    return-object v0
.end method

.method public getTactic()Lcom/blank/bm15/model/object/crud/Tactic;
    .locals 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempTactic:Lcom/blank/bm15/model/object/crud/Tactic;

    if-nez v0, :cond_0

    .line 110
    new-instance v0, Lcom/blank/bm15/model/object/crud/Tactic;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempTactic:Lcom/blank/bm15/model/object/crud/Tactic;

    .line 111
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempTactic:Lcom/blank/bm15/model/object/crud/Tactic;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 112
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempTactic:Lcom/blank/bm15/model/object/crud/Tactic;

    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/Tactic;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 113
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempTactic:Lcom/blank/bm15/model/object/crud/Tactic;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->get(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->tempTactic:Lcom/blank/bm15/model/object/crud/Tactic;

    return-object v0
.end method

.method public getTeamAverageAge()Ljava/lang/Double;
    .locals 12

    .prologue
    const-wide/16 v10, 0x0

    .line 261
    const-wide/16 v0, 0x0

    .line 262
    .local v0, "average":D
    const-wide/16 v2, 0x0

    .line 263
    .local v2, "divisor":D
    const/4 v4, 0x0

    .line 265
    .local v4, "i":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v6

    new-instance v7, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v8, 0x0

    const/4 v9, -0x1

    invoke-direct {v7, v8, v9}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 266
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_0

    .line 283
    if-nez v4, :cond_4

    .line 284
    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    .line 286
    :goto_1
    return-object v6

    .line 266
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/model/object/crud/Player;

    .line 267
    .local v5, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v7, 0x3

    if-ge v4, v7, :cond_1

    .line 268
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    mul-int/lit8 v7, v7, 0xa

    int-to-double v8, v7

    add-double/2addr v0, v8

    .line 269
    const-wide/high16 v8, 0x4024000000000000L    # 10.0

    add-double/2addr v2, v8

    .line 280
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 270
    :cond_1
    const/4 v7, 0x6

    if-ge v4, v7, :cond_2

    .line 271
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    mul-int/lit8 v7, v7, 0x5

    int-to-double v8, v7

    add-double/2addr v0, v8

    .line 272
    const-wide/high16 v8, 0x4014000000000000L    # 5.0

    add-double/2addr v2, v8

    .line 273
    goto :goto_2

    :cond_2
    const/16 v7, 0xa

    if-ge v4, v7, :cond_3

    .line 274
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    mul-int/lit8 v7, v7, 0x2

    int-to-double v8, v7

    add-double/2addr v0, v8

    .line 275
    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    add-double/2addr v2, v8

    .line 276
    goto :goto_2

    .line 277
    :cond_3
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    mul-int/lit8 v7, v7, 0x0

    int-to-double v8, v7

    add-double/2addr v0, v8

    .line 278
    add-double/2addr v2, v10

    goto :goto_2

    .line 286
    .end local v5    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_4
    div-double v6, v0, v2

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    goto :goto_1
.end method

.method public getTeamAveragePotential()Ljava/lang/Double;
    .locals 12

    .prologue
    .line 291
    const-wide/16 v0, 0x0

    .line 292
    .local v0, "average":D
    const-wide/16 v2, 0x0

    .line 293
    .local v2, "divisor":D
    const/4 v4, 0x0

    .line 295
    .local v4, "i":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v6

    new-instance v7, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v8, 0x0

    const/4 v9, -0x1

    invoke-direct {v7, v8, v9}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 296
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_0

    .line 314
    if-nez v4, :cond_4

    .line 315
    const-wide/16 v6, 0x0

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    .line 317
    :goto_1
    return-object v6

    .line 296
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/model/object/crud/Player;

    .line 297
    .local v5, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v7, 0x3

    if-ge v4, v7, :cond_2

    .line 298
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    mul-int/lit8 v7, v7, 0xa

    int-to-double v8, v7

    add-double/2addr v0, v8

    .line 299
    const-wide/high16 v8, 0x4024000000000000L    # 10.0

    add-double/2addr v2, v8

    .line 311
    :cond_1
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 300
    :cond_2
    const/4 v7, 0x6

    if-ge v4, v7, :cond_3

    .line 301
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    mul-int/lit8 v7, v7, 0x5

    int-to-double v8, v7

    add-double/2addr v0, v8

    .line 302
    const-wide/high16 v8, 0x4014000000000000L    # 5.0

    add-double/2addr v2, v8

    .line 303
    goto :goto_2

    :cond_3
    const/16 v7, 0xa

    if-ge v4, v7, :cond_1

    .line 304
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    mul-int/lit8 v7, v7, 0x2

    int-to-double v8, v7

    add-double/2addr v0, v8

    .line 305
    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    add-double/2addr v2, v8

    goto :goto_2

    .line 317
    .end local v5    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_4
    const-wide/high16 v6, 0x4010000000000000L    # 4.0

    div-double v8, v0, v2

    const-wide/high16 v10, 0x4018000000000000L    # 6.0

    sub-double/2addr v8, v10

    mul-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    goto :goto_1
.end method

.method public getTeamAverageSkillAll()Ljava/lang/Double;
    .locals 4

    .prologue
    .line 322
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTeamAverageSkillAttack()Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTeamAverageSkillDefense()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    add-double/2addr v0, v2

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getTeamAverageSkillAttack()Ljava/lang/Double;
    .locals 12

    .prologue
    .line 326
    const-wide/16 v0, 0x0

    .line 327
    .local v0, "average":D
    const-wide/16 v2, 0x0

    .line 328
    .local v2, "divisor":D
    const/4 v4, 0x0

    .line 330
    .local v4, "i":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v6

    new-instance v7, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v8, 0x0

    const/4 v9, -0x1

    invoke-direct {v7, v8, v9}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 331
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_0

    .line 348
    if-nez v4, :cond_4

    .line 349
    const-wide/16 v6, 0x0

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    .line 351
    :goto_1
    return-object v6

    .line 331
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/model/object/crud/Player;

    .line 332
    .local v5, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v7, 0x3

    if-ge v4, v7, :cond_1

    .line 333
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAttack()Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const-wide/high16 v10, 0x4024000000000000L    # 10.0

    mul-double/2addr v8, v10

    add-double/2addr v0, v8

    .line 334
    const-wide/high16 v8, 0x4024000000000000L    # 10.0

    add-double/2addr v2, v8

    .line 345
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 335
    :cond_1
    const/4 v7, 0x6

    if-ge v4, v7, :cond_2

    .line 336
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAttack()Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const-wide/high16 v10, 0x4014000000000000L    # 5.0

    mul-double/2addr v8, v10

    add-double/2addr v0, v8

    .line 337
    const-wide/high16 v8, 0x4014000000000000L    # 5.0

    add-double/2addr v2, v8

    .line 338
    goto :goto_2

    :cond_2
    const/16 v7, 0xa

    if-ge v4, v7, :cond_3

    .line 339
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAttack()Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const-wide/high16 v10, 0x4000000000000000L    # 2.0

    mul-double/2addr v8, v10

    add-double/2addr v0, v8

    .line 340
    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    add-double/2addr v2, v8

    .line 341
    goto :goto_2

    .line 342
    :cond_3
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAttack()Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const-wide/16 v10, 0x0

    mul-double/2addr v8, v10

    add-double/2addr v0, v8

    .line 343
    const-wide/16 v8, 0x0

    add-double/2addr v2, v8

    goto :goto_2

    .line 351
    .end local v5    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_4
    div-double v6, v0, v2

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    goto :goto_1
.end method

.method public getTeamAverageSkillDefense()Ljava/lang/Double;
    .locals 12

    .prologue
    .line 356
    const-wide/16 v0, 0x0

    .line 357
    .local v0, "average":D
    const-wide/16 v2, 0x0

    .line 358
    .local v2, "divisor":D
    const/4 v4, 0x0

    .line 360
    .local v4, "i":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v6

    new-instance v7, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v8, 0x0

    const/4 v9, -0x1

    invoke-direct {v7, v8, v9}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 361
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_0

    .line 378
    if-nez v4, :cond_4

    .line 379
    const-wide/16 v6, 0x0

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    .line 381
    :goto_1
    return-object v6

    .line 361
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/model/object/crud/Player;

    .line 362
    .local v5, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v7, 0x3

    if-ge v4, v7, :cond_1

    .line 363
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillDefense()Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const-wide/high16 v10, 0x4024000000000000L    # 10.0

    mul-double/2addr v8, v10

    add-double/2addr v0, v8

    .line 364
    const-wide/high16 v8, 0x4024000000000000L    # 10.0

    add-double/2addr v2, v8

    .line 375
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 365
    :cond_1
    const/4 v7, 0x6

    if-ge v4, v7, :cond_2

    .line 366
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillDefense()Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const-wide/high16 v10, 0x4014000000000000L    # 5.0

    mul-double/2addr v8, v10

    add-double/2addr v0, v8

    .line 367
    const-wide/high16 v8, 0x4014000000000000L    # 5.0

    add-double/2addr v2, v8

    .line 368
    goto :goto_2

    :cond_2
    const/16 v7, 0xa

    if-ge v4, v7, :cond_3

    .line 369
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillDefense()Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const-wide/high16 v10, 0x4000000000000000L    # 2.0

    mul-double/2addr v8, v10

    add-double/2addr v0, v8

    .line 370
    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    add-double/2addr v2, v8

    .line 371
    goto :goto_2

    .line 372
    :cond_3
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillDefense()Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const-wide/16 v10, 0x0

    mul-double/2addr v8, v10

    add-double/2addr v0, v8

    .line 373
    const-wide/16 v8, 0x0

    add-double/2addr v2, v8

    goto :goto_2

    .line 381
    .end local v5    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_4
    div-double v6, v0, v2

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    goto :goto_1
.end method

.method public getTeamAverageValue()Ljava/lang/Double;
    .locals 12

    .prologue
    .line 231
    const-wide/16 v0, 0x0

    .line 232
    .local v0, "average":D
    const-wide/16 v2, 0x0

    .line 233
    .local v2, "divisor":D
    const/4 v4, 0x0

    .line 235
    .local v4, "i":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v6

    new-instance v7, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v8, 0x0

    const/4 v9, -0x1

    invoke-direct {v7, v8, v9}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 236
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_0

    .line 253
    if-nez v4, :cond_4

    .line 254
    const-wide/16 v6, 0x0

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    .line 256
    :goto_1
    return-object v6

    .line 236
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/model/object/crud/Player;

    .line 237
    .local v5, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v7, 0x3

    if-ge v4, v7, :cond_1

    .line 238
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getValue()Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const-wide/high16 v10, 0x4024000000000000L    # 10.0

    mul-double/2addr v8, v10

    add-double/2addr v0, v8

    .line 239
    const-wide/high16 v8, 0x4024000000000000L    # 10.0

    add-double/2addr v2, v8

    .line 250
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 240
    :cond_1
    const/4 v7, 0x6

    if-ge v4, v7, :cond_2

    .line 241
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getValue()Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const-wide/high16 v10, 0x4014000000000000L    # 5.0

    mul-double/2addr v8, v10

    add-double/2addr v0, v8

    .line 242
    const-wide/high16 v8, 0x4014000000000000L    # 5.0

    add-double/2addr v2, v8

    .line 243
    goto :goto_2

    :cond_2
    const/16 v7, 0xa

    if-ge v4, v7, :cond_3

    .line 244
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getValue()Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const-wide/high16 v10, 0x4000000000000000L    # 2.0

    mul-double/2addr v8, v10

    add-double/2addr v0, v8

    .line 245
    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    add-double/2addr v2, v8

    .line 246
    goto :goto_2

    .line 247
    :cond_3
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getValue()Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const-wide/16 v10, 0x0

    mul-double/2addr v8, v10

    add-double/2addr v0, v8

    .line 248
    const-wide/16 v8, 0x0

    add-double/2addr v2, v8

    goto :goto_2

    .line 256
    .end local v5    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_4
    div-double v6, v0, v2

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    goto :goto_1
.end method

.method public getTeamAverageValueOfThreeBestPlayersByPosition(I)D
    .locals 8
    .param p1, "position"    # I

    .prologue
    .line 213
    const-wide/16 v0, 0x0

    .line 214
    .local v0, "average":D
    const/4 v2, 0x0

    .line 216
    .local v2, "i":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v4

    new-instance v5, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v6, 0x0

    const/4 v7, -0x1

    invoke-direct {v5, v6, v7}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v4, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 217
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 227
    :goto_0
    const-wide/high16 v4, 0x4008000000000000L    # 3.0

    div-double v4, v0, v4

    return-wide v4

    .line 217
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    .line 218
    .local v3, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eq v5, p1, :cond_2

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v5, p1, :cond_3

    .line 219
    :cond_2
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getValue()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    add-double/2addr v0, v6

    .line 220
    add-int/lit8 v2, v2, 0x1

    .line 222
    :cond_3
    const/4 v5, 0x3

    if-ne v2, v5, :cond_0

    goto :goto_0
.end method

.method public getTeamSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;
    .locals 5
    .param p1, "renewPlayer"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 187
    const/4 v1, 0x0

    .line 189
    .local v1, "salary":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

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

    .line 195
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    return-object v2

    .line 189
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 190
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eq v3, v4, :cond_0

    .line 191
    :cond_2
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v1, v3

    goto :goto_0
.end method

.method public setColor(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "color"    # Ljava/lang/Integer;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Team;->color:Ljava/lang/Integer;

    .line 93
    return-void
.end method

.method public setConference(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "conference"    # Ljava/lang/Integer;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Team;->conference:Ljava/lang/Integer;

    .line 63
    return-void
.end method

.method public setDivision(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "division"    # Ljava/lang/Integer;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Team;->division:Ljava/lang/Integer;

    .line 71
    return-void
.end method

.method public setFullName(Ljava/lang/String;)V
    .locals 0
    .param p1, "fullName"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Team;->fullName:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public setGame(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 0
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Team;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 106
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Team;->name:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public setSalaryCap(Ljava/lang/Integer;)V
    .locals 2
    .param p1, "salaryCap"    # Ljava/lang/Integer;

    .prologue
    .line 78
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sget-object v1, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_MIN:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 79
    sget-object v0, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_MIN:Ljava/lang/Integer;

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->salaryCap:Ljava/lang/Integer;

    .line 85
    :goto_0
    return-void

    .line 80
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sget-object v1, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_MAX:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-le v0, v1, :cond_1

    .line 81
    sget-object v0, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_MAX:Ljava/lang/Integer;

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Team;->salaryCap:Ljava/lang/Integer;

    goto :goto_0

    .line 83
    :cond_1
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Team;->salaryCap:Ljava/lang/Integer;

    goto :goto_0
.end method
