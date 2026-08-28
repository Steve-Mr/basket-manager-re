.class public Lcom/blank/bm15/model/object/crud/DraftRound;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "DraftRound.java"


# instance fields
.field private game:Lcom/blank/bm15/model/object/crud/Game;

.field private marketValue:Ljava/lang/Double;

.field private position:Ljava/lang/Integer;

.field private round:Ljava/lang/Integer;

.field private teamOwner:Lcom/blank/bm15/model/object/crud/Team;

.field private teamUser:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 20
    return-void
.end method


# virtual methods
.method public getGame()Lcom/blank/bm15/model/object/crud/Game;
    .locals 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->game:Lcom/blank/bm15/model/object/crud/Game;

    if-nez v0, :cond_1

    .line 51
    new-instance v0, Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/DraftRound;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 55
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->game:Lcom/blank/bm15/model/object/crud/Game;

    return-object v0

    .line 52
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getMarketValue()Ljava/lang/Double;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->marketValue:Ljava/lang/Double;

    return-object v0
.end method

.method public getPosition()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->position:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 32
    const/16 v0, 0x64

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->position:Ljava/lang/Integer;

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->position:Ljava/lang/Integer;

    return-object v0
.end method

.method public getRound()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->round:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTeamOwner()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->teamOwner:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_1

    .line 64
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/DraftRound;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->teamOwner:Lcom/blank/bm15/model/object/crud/Team;

    .line 68
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->teamOwner:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0

    .line 65
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->teamOwner:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->teamOwner:Lcom/blank/bm15/model/object/crud/Team;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getTeamUser()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 76
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->teamUser:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_1

    .line 77
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/DraftRound;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->teamUser:Lcom/blank/bm15/model/object/crud/Team;

    .line 81
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->teamUser:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0

    .line 78
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->teamUser:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->teamUser:Lcom/blank/bm15/model/object/crud/Team;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public setGame(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 0
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 60
    return-void
.end method

.method public setMarketValue(Ljava/lang/Double;)V
    .locals 0
    .param p1, "marketValue"    # Ljava/lang/Double;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->marketValue:Ljava/lang/Double;

    .line 47
    return-void
.end method

.method public setPosition(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "position"    # Ljava/lang/Integer;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->position:Ljava/lang/Integer;

    .line 39
    return-void
.end method

.method public setRound(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "round"    # Ljava/lang/Integer;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->round:Ljava/lang/Integer;

    .line 28
    return-void
.end method

.method public setTeamOwner(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "teamOwner"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->teamOwner:Lcom/blank/bm15/model/object/crud/Team;

    .line 73
    return-void
.end method

.method public setTeamUser(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "teamUser"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/DraftRound;->teamUser:Lcom/blank/bm15/model/object/crud/Team;

    .line 86
    return-void
.end method
