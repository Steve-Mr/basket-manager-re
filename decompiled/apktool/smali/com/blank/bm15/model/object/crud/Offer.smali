.class public Lcom/blank/bm15/model/object/crud/Offer;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "Offer.java"


# instance fields
.field private answer:Ljava/lang/Boolean;

.field private game:Lcom/blank/bm15/model/object/crud/Game;

.field private matchday:Ljava/lang/Integer;

.field private player:Lcom/blank/bm15/model/object/crud/Player;

.field private salary:Ljava/lang/Integer;

.field private team:Lcom/blank/bm15/model/object/crud/Team;

.field private years:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 21
    return-void
.end method


# virtual methods
.method public getAnswer()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->answer:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getGame()Lcom/blank/bm15/model/object/crud/Game;
    .locals 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->game:Lcom/blank/bm15/model/object/crud/Game;

    if-nez v0, :cond_1

    .line 61
    new-instance v0, Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Offer;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 65
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->game:Lcom/blank/bm15/model/object/crud/Game;

    return-object v0

    .line 62
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getMatchday()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->matchday:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPlayer()Lcom/blank/bm15/model/object/crud/Player;
    .locals 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->player:Lcom/blank/bm15/model/object/crud/Player;

    if-nez v0, :cond_1

    .line 87
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Offer;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->player:Lcom/blank/bm15/model/object/crud/Player;

    .line 92
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->player:Lcom/blank/bm15/model/object/crud/Player;

    return-object v0

    .line 88
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getSalary()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->salary:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTeam()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->team:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_1

    .line 74
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Offer;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->team:Lcom/blank/bm15/model/object/crud/Team;

    .line 78
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->team:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0

    .line 75
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getYears()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Offer;->years:Ljava/lang/Integer;

    return-object v0
.end method

.method public setAnswer(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "answer"    # Ljava/lang/Boolean;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Offer;->answer:Ljava/lang/Boolean;

    .line 57
    return-void
.end method

.method public setGame(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 0
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Offer;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 70
    return-void
.end method

.method public setMatchday(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "matchday"    # Ljava/lang/Integer;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Offer;->matchday:Ljava/lang/Integer;

    .line 49
    return-void
.end method

.method public setPlayer(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Offer;->player:Lcom/blank/bm15/model/object/crud/Player;

    .line 97
    return-void
.end method

.method public setSalary(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "salary"    # Ljava/lang/Integer;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Offer;->salary:Ljava/lang/Integer;

    .line 33
    return-void
.end method

.method public setTeam(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Offer;->team:Lcom/blank/bm15/model/object/crud/Team;

    .line 83
    return-void
.end method

.method public setYears(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "years"    # Ljava/lang/Integer;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Offer;->years:Ljava/lang/Integer;

    .line 41
    return-void
.end method
