.class public Lcom/blank/bm15/model/object/crud/Trade;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "Trade.java"


# instance fields
.field private answer:Ljava/lang/Boolean;

.field private draftRoundA1:Lcom/blank/bm15/model/object/crud/DraftRound;

.field private draftRoundA2:Lcom/blank/bm15/model/object/crud/DraftRound;

.field private draftRoundA3:Lcom/blank/bm15/model/object/crud/DraftRound;

.field private draftRoundB1:Lcom/blank/bm15/model/object/crud/DraftRound;

.field private draftRoundB2:Lcom/blank/bm15/model/object/crud/DraftRound;

.field private draftRoundB3:Lcom/blank/bm15/model/object/crud/DraftRound;

.field private game:Lcom/blank/bm15/model/object/crud/Game;

.field private playerA1:Lcom/blank/bm15/model/object/crud/Player;

.field private playerA2:Lcom/blank/bm15/model/object/crud/Player;

.field private playerA3:Lcom/blank/bm15/model/object/crud/Player;

.field private playerB1:Lcom/blank/bm15/model/object/crud/Player;

.field private playerB2:Lcom/blank/bm15/model/object/crud/Player;

.field private playerB3:Lcom/blank/bm15/model/object/crud/Player;

.field private teamA:Lcom/blank/bm15/model/object/crud/Team;

.field private teamB:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Lcom/blank/bm15/model/object/crud/Trade;)V
    .locals 1
    .param p1, "trade"    # Lcom/blank/bm15/model/object/crud/Trade;

    .prologue
    .line 38
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 40
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamA()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->teamA:Lcom/blank/bm15/model/object/crud/Team;

    .line 41
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA1:Lcom/blank/bm15/model/object/crud/Player;

    .line 42
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA2:Lcom/blank/bm15/model/object/crud/Player;

    .line 43
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA3:Lcom/blank/bm15/model/object/crud/Player;

    .line 44
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA1:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 45
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA2:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 46
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA3:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 47
    return-void
.end method


# virtual methods
.method public getAnswer()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->answer:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getDraftRoundA1()Lcom/blank/bm15/model/object/crud/DraftRound;
    .locals 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA1:Lcom/blank/bm15/model/object/crud/DraftRound;

    if-nez v0, :cond_1

    .line 128
    new-instance v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA1:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 132
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA1:Lcom/blank/bm15/model/object/crud/DraftRound;

    return-object v0

    .line 129
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA1:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/DraftRound;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA1:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getDraftRoundA2()Lcom/blank/bm15/model/object/crud/DraftRound;
    .locals 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA2:Lcom/blank/bm15/model/object/crud/DraftRound;

    if-nez v0, :cond_1

    .line 141
    new-instance v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA2:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 145
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA2:Lcom/blank/bm15/model/object/crud/DraftRound;

    return-object v0

    .line 142
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA2:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/DraftRound;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA2:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getDraftRoundA3()Lcom/blank/bm15/model/object/crud/DraftRound;
    .locals 2

    .prologue
    .line 153
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA3:Lcom/blank/bm15/model/object/crud/DraftRound;

    if-nez v0, :cond_1

    .line 154
    new-instance v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA3:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 158
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA3:Lcom/blank/bm15/model/object/crud/DraftRound;

    return-object v0

    .line 155
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA3:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/DraftRound;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA3:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getDraftRoundB1()Lcom/blank/bm15/model/object/crud/DraftRound;
    .locals 2

    .prologue
    .line 205
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB1:Lcom/blank/bm15/model/object/crud/DraftRound;

    if-nez v0, :cond_1

    .line 206
    new-instance v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB1:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 210
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB1:Lcom/blank/bm15/model/object/crud/DraftRound;

    return-object v0

    .line 207
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB1:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/DraftRound;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB1:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getDraftRoundB2()Lcom/blank/bm15/model/object/crud/DraftRound;
    .locals 2

    .prologue
    .line 218
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB2:Lcom/blank/bm15/model/object/crud/DraftRound;

    if-nez v0, :cond_1

    .line 219
    new-instance v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB2:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 223
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB2:Lcom/blank/bm15/model/object/crud/DraftRound;

    return-object v0

    .line 220
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB2:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/DraftRound;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 221
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB2:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getDraftRoundB3()Lcom/blank/bm15/model/object/crud/DraftRound;
    .locals 2

    .prologue
    .line 231
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB3:Lcom/blank/bm15/model/object/crud/DraftRound;

    if-nez v0, :cond_1

    .line 232
    new-instance v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB3:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 236
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB3:Lcom/blank/bm15/model/object/crud/DraftRound;

    return-object v0

    .line 233
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB3:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/DraftRound;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 234
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB3:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getGame()Lcom/blank/bm15/model/object/crud/Game;
    .locals 2

    .prologue
    .line 244
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->game:Lcom/blank/bm15/model/object/crud/Game;

    if-nez v0, :cond_1

    .line 245
    new-instance v0, Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 249
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->game:Lcom/blank/bm15/model/object/crud/Game;

    return-object v0

    .line 246
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 247
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getNumPlayersOfPosition(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 261
    const/4 v0, 0x0

    .line 263
    .local v0, "result":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v1, p1, :cond_0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, p1, :cond_1

    .line 264
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 266
    :cond_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v1, p1, :cond_2

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, p1, :cond_3

    .line 267
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 269
    :cond_3
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v1, p1, :cond_4

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, p1, :cond_5

    .line 270
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 272
    :cond_5
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_7

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v1, p1, :cond_6

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, p1, :cond_7

    .line 273
    :cond_6
    add-int/lit8 v0, v0, 0x1

    .line 275
    :cond_7
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_9

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v1, p1, :cond_8

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, p1, :cond_9

    .line 276
    :cond_8
    add-int/lit8 v0, v0, 0x1

    .line 278
    :cond_9
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_b

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v1, p1, :cond_a

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, p1, :cond_b

    .line 279
    :cond_a
    add-int/lit8 v0, v0, 0x1

    .line 282
    :cond_b
    return v0
.end method

.method public getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;
    .locals 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA1:Lcom/blank/bm15/model/object/crud/Player;

    if-nez v0, :cond_1

    .line 89
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA1:Lcom/blank/bm15/model/object/crud/Player;

    .line 93
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA1:Lcom/blank/bm15/model/object/crud/Player;

    return-object v0

    .line 90
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA1:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA1:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;
    .locals 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA2:Lcom/blank/bm15/model/object/crud/Player;

    if-nez v0, :cond_1

    .line 102
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA2:Lcom/blank/bm15/model/object/crud/Player;

    .line 106
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA2:Lcom/blank/bm15/model/object/crud/Player;

    return-object v0

    .line 103
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA2:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA2:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;
    .locals 2

    .prologue
    .line 114
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA3:Lcom/blank/bm15/model/object/crud/Player;

    if-nez v0, :cond_1

    .line 115
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA3:Lcom/blank/bm15/model/object/crud/Player;

    .line 119
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA3:Lcom/blank/bm15/model/object/crud/Player;

    return-object v0

    .line 116
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA3:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 117
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA3:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getPlayerB1()Lcom/blank/bm15/model/object/crud/Player;
    .locals 2

    .prologue
    .line 166
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB1:Lcom/blank/bm15/model/object/crud/Player;

    if-nez v0, :cond_1

    .line 167
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB1:Lcom/blank/bm15/model/object/crud/Player;

    .line 171
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB1:Lcom/blank/bm15/model/object/crud/Player;

    return-object v0

    .line 168
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB1:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB1:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getPlayerB2()Lcom/blank/bm15/model/object/crud/Player;
    .locals 2

    .prologue
    .line 179
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB2:Lcom/blank/bm15/model/object/crud/Player;

    if-nez v0, :cond_1

    .line 180
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB2:Lcom/blank/bm15/model/object/crud/Player;

    .line 184
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB2:Lcom/blank/bm15/model/object/crud/Player;

    return-object v0

    .line 181
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB2:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB2:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getPlayerB3()Lcom/blank/bm15/model/object/crud/Player;
    .locals 2

    .prologue
    .line 192
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB3:Lcom/blank/bm15/model/object/crud/Player;

    if-nez v0, :cond_1

    .line 193
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB3:Lcom/blank/bm15/model/object/crud/Player;

    .line 197
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB3:Lcom/blank/bm15/model/object/crud/Player;

    return-object v0

    .line 194
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB3:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB3:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getTeamA()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 62
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->teamA:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_1

    .line 63
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->teamA:Lcom/blank/bm15/model/object/crud/Team;

    .line 67
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->teamA:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0

    .line 64
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->teamA:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->teamA:Lcom/blank/bm15/model/object/crud/Team;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getTeamB()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->teamB:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_1

    .line 76
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Trade;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->teamB:Lcom/blank/bm15/model/object/crud/Team;

    .line 80
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->teamB:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0

    .line 77
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->teamB:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Trade;->teamB:Lcom/blank/bm15/model/object/crud/Team;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public setAnswer(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "answer"    # Ljava/lang/Boolean;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->answer:Ljava/lang/Boolean;

    .line 59
    return-void
.end method

.method public setDraftRoundA1(Lcom/blank/bm15/model/object/crud/DraftRound;)V
    .locals 0
    .param p1, "draftRoundA1"    # Lcom/blank/bm15/model/object/crud/DraftRound;

    .prologue
    .line 136
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA1:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 137
    return-void
.end method

.method public setDraftRoundA2(Lcom/blank/bm15/model/object/crud/DraftRound;)V
    .locals 0
    .param p1, "draftRoundA2"    # Lcom/blank/bm15/model/object/crud/DraftRound;

    .prologue
    .line 149
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA2:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 150
    return-void
.end method

.method public setDraftRoundA3(Lcom/blank/bm15/model/object/crud/DraftRound;)V
    .locals 0
    .param p1, "draftRoundA3"    # Lcom/blank/bm15/model/object/crud/DraftRound;

    .prologue
    .line 162
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundA3:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 163
    return-void
.end method

.method public setDraftRoundB1(Lcom/blank/bm15/model/object/crud/DraftRound;)V
    .locals 0
    .param p1, "draftRoundB1"    # Lcom/blank/bm15/model/object/crud/DraftRound;

    .prologue
    .line 214
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB1:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 215
    return-void
.end method

.method public setDraftRoundB2(Lcom/blank/bm15/model/object/crud/DraftRound;)V
    .locals 0
    .param p1, "draftRoundB2"    # Lcom/blank/bm15/model/object/crud/DraftRound;

    .prologue
    .line 227
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB2:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 228
    return-void
.end method

.method public setDraftRoundB3(Lcom/blank/bm15/model/object/crud/DraftRound;)V
    .locals 0
    .param p1, "draftRoundB3"    # Lcom/blank/bm15/model/object/crud/DraftRound;

    .prologue
    .line 240
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->draftRoundB3:Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 241
    return-void
.end method

.method public setGame(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 0
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 253
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 254
    return-void
.end method

.method public setPlayerA1(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0
    .param p1, "playerA1"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA1:Lcom/blank/bm15/model/object/crud/Player;

    .line 98
    return-void
.end method

.method public setPlayerA2(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0
    .param p1, "playerA2"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 110
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA2:Lcom/blank/bm15/model/object/crud/Player;

    .line 111
    return-void
.end method

.method public setPlayerA3(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0
    .param p1, "playerA3"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 123
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerA3:Lcom/blank/bm15/model/object/crud/Player;

    .line 124
    return-void
.end method

.method public setPlayerB1(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0
    .param p1, "playerB1"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 175
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB1:Lcom/blank/bm15/model/object/crud/Player;

    .line 176
    return-void
.end method

.method public setPlayerB2(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0
    .param p1, "playerB2"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 188
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB2:Lcom/blank/bm15/model/object/crud/Player;

    .line 189
    return-void
.end method

.method public setPlayerB3(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0
    .param p1, "playerB3"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 201
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->playerB3:Lcom/blank/bm15/model/object/crud/Player;

    .line 202
    return-void
.end method

.method public setTeamA(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "teamA"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->teamA:Lcom/blank/bm15/model/object/crud/Team;

    .line 72
    return-void
.end method

.method public setTeamB(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "teamB"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Trade;->teamB:Lcom/blank/bm15/model/object/crud/Team;

    .line 85
    return-void
.end method
