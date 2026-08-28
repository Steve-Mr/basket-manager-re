.class public Lcom/blank/bm15/model/core/Play;
.super Landroid/os/AsyncTask;
.source "Play.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private dialog:Landroid/app/ProgressDialog;

.field private game:Lcom/blank/bm15/model/object/crud/Game;

.field private simulate:Lcom/blank/bm15/model/core/Simulate;

.field private toMatchday:I


# direct methods
.method public constructor <init>(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 1
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 35
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/blank/bm15/model/core/Play;-><init>(Lcom/blank/bm15/model/object/crud/Game;I)V

    .line 36
    return-void
.end method

.method public constructor <init>(Lcom/blank/bm15/model/object/crud/Game;I)V
    .locals 0
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p2, "toMatchday"    # I

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 40
    iput p2, p0, Lcom/blank/bm15/model/core/Play;->toMatchday:I

    .line 41
    return-void
.end method

.method private arePlayersInyuredInTeam()Ljava/lang/Boolean;
    .locals 3

    .prologue
    .line 199
    iget-object v1, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->reloadPlayers()V

    .line 200
    iget-object v1, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersInLineup()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 206
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    return-object v1

    .line 200
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 201
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eqz v2, :cond_0

    .line 202
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 13
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    const v8, 0x7f05005d

    const v7, 0x7f05005c

    const/4 v12, 0x2

    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 65
    const/4 v1, 0x0

    .line 67
    .local v1, "i":I
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xe2

    if-ne v5, v6, :cond_0

    .line 69
    new-array v5, v12, [Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v11

    iget-object v6, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f05005b

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {p0, v5}, Lcom/blank/bm15/model/core/Play;->publishProgress([Ljava/lang/Object;)V

    .line 70
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/ManageSeasons;->updatingPlayers(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 162
    :goto_0
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    iget-object v6, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/blank/bm15/model/object/crud/Game;->setCurrentMatchday(Ljava/lang/Integer;)V

    .line 164
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 166
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v5

    .line 72
    :cond_0
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xe3

    if-ne v5, v6, :cond_1

    .line 74
    new-array v5, v12, [Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v11

    iget-object v6, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {p0, v5}, Lcom/blank/bm15/model/core/Play;->publishProgress([Ljava/lang/Object;)V

    .line 75
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/ManageRenewals;->manage(Lcom/blank/bm15/model/object/crud/Game;)V

    goto :goto_0

    .line 77
    :cond_1
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xe4

    if-ne v5, v6, :cond_2

    .line 79
    new-array v5, v12, [Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v11

    iget-object v6, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {p0, v5}, Lcom/blank/bm15/model/core/Play;->publishProgress([Ljava/lang/Object;)V

    .line 80
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/ManageOffers;->manage(Lcom/blank/bm15/model/object/crud/Game;)V

    goto :goto_0

    .line 82
    :cond_2
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xe5

    if-ne v5, v6, :cond_3

    .line 84
    new-array v5, v12, [Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v11

    iget-object v6, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {p0, v5}, Lcom/blank/bm15/model/core/Play;->publishProgress([Ljava/lang/Object;)V

    .line 85
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/ManageOffers;->manage(Lcom/blank/bm15/model/object/crud/Game;)V

    goto/16 :goto_0

    .line 87
    :cond_3
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xe6

    if-ne v5, v6, :cond_4

    .line 89
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/ManageOffers;->manage(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 90
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/ManageRenewals;->finishRenewals(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 91
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/Create;->updateDraftRoundValues(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 94
    new-instance v2, Lcom/blank/bm15/model/object/crud/News;

    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v2, v5}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 95
    .local v2, "news":Lcom/blank/bm15/model/object/crud/News;
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v2, v5}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 96
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 97
    const v5, 0x7f020040

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 98
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f05013d

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 99
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f05013e

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 100
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto/16 :goto_0

    .line 101
    .end local v2    # "news":Lcom/blank/bm15/model/object/crud/News;
    :cond_4
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xe7

    if-ne v5, v6, :cond_5

    .line 104
    new-array v5, v12, [Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v11

    iget-object v6, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {p0, v5}, Lcom/blank/bm15/model/core/Play;->publishProgress([Ljava/lang/Object;)V

    .line 105
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/ManageDraft;->manageRound1(Lcom/blank/bm15/model/object/crud/Game;)V

    goto/16 :goto_0

    .line 107
    :cond_5
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xe8

    if-ne v5, v6, :cond_6

    .line 109
    new-array v5, v12, [Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v11

    iget-object v6, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {p0, v5}, Lcom/blank/bm15/model/core/Play;->publishProgress([Ljava/lang/Object;)V

    .line 110
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/ManageDraft;->manageRound2(Lcom/blank/bm15/model/object/crud/Game;)V

    goto/16 :goto_0

    .line 112
    :cond_6
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xe9

    if-ne v5, v6, :cond_7

    .line 114
    new-array v5, v12, [Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v11

    iget-object v6, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f05005e

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {p0, v5}, Lcom/blank/bm15/model/core/Play;->publishProgress([Ljava/lang/Object;)V

    .line 115
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/ManageDraft;->finishDraft(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 116
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "FILTER_FREE_AGENTS"

    invoke-static {v5, v6, v11}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->setInt(Landroid/content/Context;Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 118
    :cond_7
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xea

    if-ne v5, v6, :cond_a

    .line 120
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 121
    .local v0, "filter":Lcom/blank/bm15/model/object/crud/Team;
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0, v5}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 122
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v4

    .line 123
    .local v4, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    new-instance v5, Lcom/blank/bm15/model/comparator/TeamComparator;

    invoke-direct {v5, v11, v10}, Lcom/blank/bm15/model/comparator/TeamComparator;-><init>(II)V

    invoke-static {v4, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 124
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_8
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_9

    .line 132
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/blank/bm15/model/object/crud/Game;->setCurrentMatchday(Ljava/lang/Integer;)V

    .line 133
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    iget-object v6, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentSeason()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/blank/bm15/model/object/crud/Game;->setCurrentSeason(Ljava/lang/Integer;)V

    .line 136
    new-array v5, v12, [Ljava/lang/String;

    add-int/lit8 v6, v1, 0x1

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v11

    iget-object v6, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f05005a

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {p0, v5}, Lcom/blank/bm15/model/core/Play;->publishProgress([Ljava/lang/Object;)V

    .line 137
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/ManageSeasons;->deletingOldSeason(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 138
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/ManageSeasons;->creatingNewSeason(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 141
    iput v11, p0, Lcom/blank/bm15/model/core/Play;->toMatchday:I

    goto/16 :goto_0

    .line 124
    :cond_9
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/crud/Team;

    .line 125
    .local v3, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iget-object v7, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-eq v6, v7, :cond_8

    .line 126
    new-array v6, v12, [Ljava/lang/String;

    add-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v11

    iget-object v7, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v7

    const v8, 0x7f050059

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    new-array v8, v10, [Ljava/lang/Object;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-virtual {p0, v6}, Lcom/blank/bm15/model/core/Play;->publishProgress([Ljava/lang/Object;)V

    .line 127
    iget-object v6, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v6, v3}, Lcom/blank/bm15/model/core/ManageFreeAgency;->manage(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;)V

    goto/16 :goto_1

    .line 144
    .end local v0    # "filter":Lcom/blank/bm15/model/object/crud/Team;
    .end local v3    # "team":Lcom/blank/bm15/model/object/crud/Team;
    .end local v4    # "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    :cond_a
    const/4 v1, 0x0

    :goto_2
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->simulate:Lcom/blank/bm15/model/core/Simulate;

    invoke-virtual {v5}, Lcom/blank/bm15/model/core/Simulate;->getMatchListSize()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-lt v1, v5, :cond_c

    .line 149
    new-array v5, v12, [Ljava/lang/String;

    add-int/lit8 v6, v1, 0x1

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v11

    iget-object v6, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f050058

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {p0, v5}, Lcom/blank/bm15/model/core/Play;->publishProgress([Ljava/lang/Object;)V

    .line 150
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->simulate:Lcom/blank/bm15/model/core/Simulate;

    invoke-virtual {v5}, Lcom/blank/bm15/model/core/Simulate;->saveAll()V

    .line 152
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0x5c

    if-gt v5, v6, :cond_d

    .line 153
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/ManageOffers;->manage(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 158
    :cond_b
    :goto_3
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/ManageDevelopment;->manage(Lcom/blank/bm15/model/object/crud/Game;)V

    goto/16 :goto_0

    .line 145
    :cond_c
    new-array v5, v12, [Ljava/lang/String;

    add-int/lit8 v6, v1, 0x1

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v11

    iget-object v6, p0, Lcom/blank/bm15/model/core/Play;->simulate:Lcom/blank/bm15/model/core/Simulate;

    invoke-virtual {v6, v1}, Lcom/blank/bm15/model/core/Simulate;->playMatchOfPosition(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {p0, v5}, Lcom/blank/bm15/model/core/Play;->publishProgress([Ljava/lang/Object;)V

    .line 144
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 155
    :cond_d
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xa7

    if-lt v5, v6, :cond_b

    .line 156
    iget-object v5, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v5}, Lcom/blank/bm15/model/core/ManagePlayoffs;->manage(Lcom/blank/bm15/model/object/crud/Game;)V

    goto :goto_3
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/blank/bm15/model/core/Play;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 6
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    const/4 v5, 0x0

    const/16 v4, 0xf

    const/4 v3, 0x0

    .line 178
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 180
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget v1, p0, Lcom/blank/bm15/model/core/Play;->toMatchday:I

    if-ge v0, v1, :cond_2

    iget v0, p0, Lcom/blank/bm15/model/core/Play;->toMatchday:I

    const/16 v1, 0xea

    if-gt v0, v1, :cond_2

    .line 181
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "AUTO_LINEUP"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/util/BlankPreferences;->getBoolean(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/core/Lineup;->setBetterLineup(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 183
    new-instance v0, Lcom/blank/bm15/model/core/Play;

    iget-object v1, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    iget v2, p0, Lcom/blank/bm15/model/core/Play;->toMatchday:I

    invoke-direct {v0, v1, v2}, Lcom/blank/bm15/model/core/Play;-><init>(Lcom/blank/bm15/model/object/crud/Game;I)V

    new-array v1, v3, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/core/Play;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 196
    :goto_0
    return-void

    .line 185
    :cond_0
    invoke-direct {p0}, Lcom/blank/bm15/model/core/Play;->arePlayersInyuredInTeam()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 186
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1, v5}, Lcom/blank/bm15/activity/base/BaseActivity;->addNavigation(Landroid/content/Context;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 187
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/blank/bm15/activity/HomeActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 189
    :cond_1
    new-instance v0, Lcom/blank/bm15/model/core/Play;

    iget-object v1, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    iget v2, p0, Lcom/blank/bm15/model/core/Play;->toMatchday:I

    invoke-direct {v0, v1, v2}, Lcom/blank/bm15/model/core/Play;-><init>(Lcom/blank/bm15/model/object/crud/Game;I)V

    new-array v1, v3, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/core/Play;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 193
    :cond_2
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1, v5}, Lcom/blank/bm15/activity/base/BaseActivity;->addNavigation(Landroid/content/Context;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 194
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/blank/bm15/activity/HomeActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/blank/bm15/model/core/Play;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 44
    new-instance v0, Lcom/blank/bm15/model/core/Simulate;

    iget-object v1, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/core/Simulate;-><init>(Lcom/blank/bm15/model/object/crud/Game;)V

    iput-object v0, p0, Lcom/blank/bm15/model/core/Play;->simulate:Lcom/blank/bm15/model/core/Simulate;

    .line 46
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    .line 47
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    const-string v1, "..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 48
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 49
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v4}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 50
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v5}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 51
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0xea

    if-ne v0, v1, :cond_0

    .line 52
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0500b2

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v2, v4, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentSeason()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 53
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    const/16 v1, 0x1e

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMax(I)V

    .line 61
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 62
    return-void

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0xe2

    if-ge v0, v1, :cond_1

    .line 55
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0500b1

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    iget-object v3, p0, Lcom/blank/bm15/model/core/Play;->simulate:Lcom/blank/bm15/model/core/Simulate;

    invoke-virtual {v3}, Lcom/blank/bm15/model/core/Simulate;->getMatchListSize()Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 56
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/blank/bm15/model/core/Play;->simulate:Lcom/blank/bm15/model/core/Simulate;

    invoke-virtual {v1}, Lcom/blank/bm15/model/core/Simulate;->getMatchListSize()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMax(I)V

    goto :goto_0

    .line 58
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/blank/bm15/model/core/Play;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0500b3

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 59
    iget-object v0, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v4}, Landroid/app/ProgressDialog;->setMax(I)V

    goto :goto_0
.end method

.method protected bridge varargs synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/blank/bm15/model/core/Play;->onProgressUpdate([Ljava/lang/String;)V

    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/String;)V
    .locals 3
    .param p1, "values"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 170
    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 171
    .local v0, "progress":I
    iget-object v1, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v0}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 172
    array-length v1, p1

    if-le v1, v2, :cond_0

    .line 173
    iget-object v1, p0, Lcom/blank/bm15/model/core/Play;->dialog:Landroid/app/ProgressDialog;

    aget-object v2, p1, v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 175
    :cond_0
    return-void
.end method
