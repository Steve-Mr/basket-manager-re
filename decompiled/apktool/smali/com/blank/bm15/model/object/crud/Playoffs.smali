.class public Lcom/blank/bm15/model/object/crud/Playoffs;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "Playoffs.java"


# instance fields
.field private conference:Ljava/lang/Integer;

.field private game:Lcom/blank/bm15/model/object/crud/Game;

.field private gamesWon:Ljava/lang/Integer;

.field private pointsDiff:Ljava/lang/Integer;

.field private pointsScored:Ljava/lang/Integer;

.field private position:Ljava/lang/Integer;

.field private seriesGamesWon:Ljava/lang/Integer;

.field private team:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 23
    return-void
.end method


# virtual methods
.method public addSeriesGamesWon()V
    .locals 1

    .prologue
    .line 112
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Playoffs;->setSeriesGamesWon(Ljava/lang/Integer;)V

    .line 113
    return-void
.end method

.method public getConference()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->conference:Ljava/lang/Integer;

    return-object v0
.end method

.method public getGame()Lcom/blank/bm15/model/object/crud/Game;
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->game:Lcom/blank/bm15/model/object/crud/Game;

    if-nez v0, :cond_1

    .line 82
    new-instance v0, Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 86
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->game:Lcom/blank/bm15/model/object/crud/Game;

    return-object v0

    .line 83
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getGamesWon()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->gamesWon:Ljava/lang/Integer;

    return-object v0
.end method

.method public getIsChampion()Ljava/lang/Boolean;
    .locals 2

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public getIsInSeriesConferenceFinal()Ljava/lang/Boolean;
    .locals 2

    .prologue
    .line 120
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x8

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public getIsInSeriesSemis()Ljava/lang/Boolean;
    .locals 2

    .prologue
    .line 116
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public getIsInSeriesWorldFinal()Ljava/lang/Boolean;
    .locals 2

    .prologue
    .line 124
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0xc

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public getPointsDiff()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->pointsDiff:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPointsScored()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->pointsScored:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPosition()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->position:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSeriesGamesWon()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->seriesGamesWon:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 71
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->seriesGamesWon:Ljava/lang/Integer;

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->seriesGamesWon:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTeam()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->team:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_1

    .line 95
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->team:Lcom/blank/bm15/model/object/crud/Team;

    .line 96
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 100
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->team:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0

    .line 97
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public setConference(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "conference"    # Ljava/lang/Integer;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->conference:Ljava/lang/Integer;

    .line 35
    return-void
.end method

.method public setGame(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 0
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 91
    return-void
.end method

.method public setGamesWon(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "gamesWon"    # Ljava/lang/Integer;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->gamesWon:Ljava/lang/Integer;

    .line 51
    return-void
.end method

.method public setPointsDiff(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "pointsDiff"    # Ljava/lang/Integer;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->pointsDiff:Ljava/lang/Integer;

    .line 59
    return-void
.end method

.method public setPointsScored(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "pointsScored"    # Ljava/lang/Integer;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->pointsScored:Ljava/lang/Integer;

    .line 67
    return-void
.end method

.method public setPosition(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "position"    # Ljava/lang/Integer;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->position:Ljava/lang/Integer;

    .line 43
    return-void
.end method

.method public setSeriesGamesWon(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "seriesGamesWon"    # Ljava/lang/Integer;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->seriesGamesWon:Ljava/lang/Integer;

    .line 78
    return-void
.end method

.method public setTeam(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Playoffs;->team:Lcom/blank/bm15/model/object/crud/Team;

    .line 105
    return-void
.end method
