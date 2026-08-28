.class public Lcom/blank/bm15/model/object/crud/League;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "League.java"


# instance fields
.field private game:Lcom/blank/bm15/model/object/crud/Game;

.field private gamesLost:Ljava/lang/Integer;

.field private gamesWon:Ljava/lang/Integer;

.field private pointsAllowed:Ljava/lang/Integer;

.field private pointsScored:Ljava/lang/Integer;

.field private team:Lcom/blank/bm15/model/object/crud/Team;


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
    .line 71
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->game:Lcom/blank/bm15/model/object/crud/Game;

    if-nez v0, :cond_1

    .line 72
    new-instance v0, Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/League;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 76
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->game:Lcom/blank/bm15/model/object/crud/Game;

    return-object v0

    .line 73
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getGamesLost()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->gamesLost:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 39
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->gamesLost:Ljava/lang/Integer;

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->gamesLost:Ljava/lang/Integer;

    return-object v0
.end method

.method public getGamesWon()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->gamesWon:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 28
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->gamesWon:Ljava/lang/Integer;

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->gamesWon:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPointsAllowed()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->pointsAllowed:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 61
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->pointsAllowed:Ljava/lang/Integer;

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->pointsAllowed:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPointsScored()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->pointsScored:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 50
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->pointsScored:Ljava/lang/Integer;

    .line 52
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->pointsScored:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTeam()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->team:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_1

    .line 85
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/League;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->team:Lcom/blank/bm15/model/object/crud/Team;

    .line 89
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->team:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0

    .line 86
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 87
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/League;->team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public setGame(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 0
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/League;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 81
    return-void
.end method

.method public setGamesLost(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "gamesLost"    # Ljava/lang/Integer;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/League;->gamesLost:Ljava/lang/Integer;

    .line 46
    return-void
.end method

.method public setGamesWon(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "gamesWon"    # Ljava/lang/Integer;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/League;->gamesWon:Ljava/lang/Integer;

    .line 35
    return-void
.end method

.method public setPointsAllowed(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "pointsAllowed"    # Ljava/lang/Integer;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/League;->pointsAllowed:Ljava/lang/Integer;

    .line 68
    return-void
.end method

.method public setPointsScored(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "pointsScored"    # Ljava/lang/Integer;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/League;->pointsScored:Ljava/lang/Integer;

    .line 57
    return-void
.end method

.method public setTeam(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/League;->team:Lcom/blank/bm15/model/object/crud/Team;

    .line 94
    return-void
.end method
