.class public Lcom/blank/bm15/model/object/crud/News;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "News.java"


# instance fields
.field private body:Ljava/lang/String;

.field private game:Lcom/blank/bm15/model/object/crud/Game;

.field private matchday:Ljava/lang/Integer;

.field private player1:Lcom/blank/bm15/model/object/crud/Player;

.field private player2:Lcom/blank/bm15/model/object/crud/Player;

.field private player3:Lcom/blank/bm15/model/object/crud/Player;

.field private player4:Lcom/blank/bm15/model/object/crud/Player;

.field private team1:Lcom/blank/bm15/model/object/crud/Team;

.field private team2:Lcom/blank/bm15/model/object/crud/Team;

.field private title:Ljava/lang/String;

.field private type:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 25
    return-void
.end method


# virtual methods
.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->body:Ljava/lang/String;

    return-object v0
.end method

.method public getGame()Lcom/blank/bm15/model/object/crud/Game;
    .locals 2

    .prologue
    .line 142
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->game:Lcom/blank/bm15/model/object/crud/Game;

    if-nez v0, :cond_1

    .line 143
    new-instance v0, Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/News;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 147
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->game:Lcom/blank/bm15/model/object/crud/Game;

    return-object v0

    .line 144
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getMatchday()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->matchday:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPlayer1()Lcom/blank/bm15/model/object/crud/Player;
    .locals 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player1:Lcom/blank/bm15/model/object/crud/Player;

    if-nez v0, :cond_1

    .line 91
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/News;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player1:Lcom/blank/bm15/model/object/crud/Player;

    .line 95
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player1:Lcom/blank/bm15/model/object/crud/Player;

    return-object v0

    .line 92
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player1:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player1:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getPlayer2()Lcom/blank/bm15/model/object/crud/Player;
    .locals 2

    .prologue
    .line 103
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player2:Lcom/blank/bm15/model/object/crud/Player;

    if-nez v0, :cond_1

    .line 104
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/News;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player2:Lcom/blank/bm15/model/object/crud/Player;

    .line 108
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player2:Lcom/blank/bm15/model/object/crud/Player;

    return-object v0

    .line 105
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player2:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player2:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getPlayer3()Lcom/blank/bm15/model/object/crud/Player;
    .locals 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player3:Lcom/blank/bm15/model/object/crud/Player;

    if-nez v0, :cond_1

    .line 117
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/News;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player3:Lcom/blank/bm15/model/object/crud/Player;

    .line 121
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player3:Lcom/blank/bm15/model/object/crud/Player;

    return-object v0

    .line 118
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player3:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player3:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getPlayer4()Lcom/blank/bm15/model/object/crud/Player;
    .locals 2

    .prologue
    .line 129
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player4:Lcom/blank/bm15/model/object/crud/Player;

    if-nez v0, :cond_1

    .line 130
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/News;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player4:Lcom/blank/bm15/model/object/crud/Player;

    .line 134
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player4:Lcom/blank/bm15/model/object/crud/Player;

    return-object v0

    .line 131
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player4:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->player4:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getTeam1()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->team1:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_1

    .line 65
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/News;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->team1:Lcom/blank/bm15/model/object/crud/Team;

    .line 69
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->team1:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0

    .line 66
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->team1:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->team1:Lcom/blank/bm15/model/object/crud/Team;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getTeam2()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->team2:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_1

    .line 78
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/News;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->team2:Lcom/blank/bm15/model/object/crud/Team;

    .line 82
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->team2:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0

    .line 79
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->team2:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->team2:Lcom/blank/bm15/model/object/crud/Team;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/News;->type:Ljava/lang/Integer;

    return-object v0
.end method

.method public setBody(Ljava/lang/String;)V
    .locals 0
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/News;->body:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public setGame(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 0
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 151
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/News;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 152
    return-void
.end method

.method public setMatchday(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "matchday"    # Ljava/lang/Integer;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/News;->matchday:Ljava/lang/Integer;

    .line 61
    return-void
.end method

.method public setPlayer1(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0
    .param p1, "player1"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/News;->player1:Lcom/blank/bm15/model/object/crud/Player;

    .line 100
    return-void
.end method

.method public setPlayer2(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0
    .param p1, "player2"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/News;->player2:Lcom/blank/bm15/model/object/crud/Player;

    .line 113
    return-void
.end method

.method public setPlayer3(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0
    .param p1, "player3"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 125
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/News;->player3:Lcom/blank/bm15/model/object/crud/Player;

    .line 126
    return-void
.end method

.method public setPlayer4(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0
    .param p1, "player4"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/News;->player4:Lcom/blank/bm15/model/object/crud/Player;

    .line 139
    return-void
.end method

.method public setTeam1(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "team1"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/News;->team1:Lcom/blank/bm15/model/object/crud/Team;

    .line 74
    return-void
.end method

.method public setTeam2(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "team2"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/News;->team2:Lcom/blank/bm15/model/object/crud/Team;

    .line 87
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/News;->title:Ljava/lang/String;

    .line 37
    return-void
.end method

.method public setType(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/Integer;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/News;->type:Ljava/lang/Integer;

    .line 53
    return-void
.end method
