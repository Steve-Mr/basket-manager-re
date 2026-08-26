.class public Lcom/blank/bm15/model/object/crud/Game;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "Game.java"


# instance fields
.field private currentMatchday:Ljava/lang/Integer;

.field private currentSeason:Ljava/lang/Integer;

.field private name:Ljava/lang/String;

.field private tempCreateOnlinePlayersOk:Ljava/lang/Boolean;

.field private userTeam:Lcom/blank/bm15/model/object/crud/Team;


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
.method public getCreateOnlinePlayersOk()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->tempCreateOnlinePlayersOk:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 73
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->tempCreateOnlinePlayersOk:Ljava/lang/Boolean;

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->tempCreateOnlinePlayersOk:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCurrentMatchday()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->currentMatchday:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 48
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->currentMatchday:Ljava/lang/Integer;

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->currentMatchday:Ljava/lang/Integer;

    return-object v0
.end method

.method public getCurrentSeason()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->currentSeason:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 37
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->currentSeason:Ljava/lang/Integer;

    .line 39
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->currentSeason:Ljava/lang/Integer;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getUserTeam()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->userTeam:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_1

    .line 59
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->userTeam:Lcom/blank/bm15/model/object/crud/Team;

    .line 64
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->userTeam:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0

    .line 60
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->userTeam:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->userTeam:Lcom/blank/bm15/model/object/crud/Team;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 62
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Game;->userTeam:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    goto :goto_0
.end method

.method public setCreateOnlinePlayersOk(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "tempCreateOnlinePlayersOk"    # Ljava/lang/Boolean;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Game;->tempCreateOnlinePlayersOk:Ljava/lang/Boolean;

    .line 80
    return-void
.end method

.method public setCurrentMatchday(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "currentMatchday"    # Ljava/lang/Integer;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Game;->currentMatchday:Ljava/lang/Integer;

    .line 55
    return-void
.end method

.method public setCurrentSeason(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "currentSeason"    # Ljava/lang/Integer;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Game;->currentSeason:Ljava/lang/Integer;

    .line 44
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Game;->name:Ljava/lang/String;

    .line 33
    return-void
.end method

.method public setUserTeam(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "userTeam"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Game;->userTeam:Lcom/blank/bm15/model/object/crud/Team;

    .line 69
    return-void
.end method
