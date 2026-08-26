.class public Lcom/blank/bm15/model/core/Create;
.super Ljava/lang/Object;
.source "Create.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createAllMatches(Lcom/blank/bm15/model/object/crud/Game;Ljava/util/List;)V
    .locals 1
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Team;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 537
    .local p1, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    invoke-static {p0, p1}, Lcom/blank/bm15/model/generator/SeasonCalendar;->getMatchList(Lcom/blank/bm15/model/object/crud/Game;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 538
    .local v0, "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 539
    return-void
.end method

.method private static createAllPlayers(Lcom/blank/bm15/model/object/crud/Game;Ljava/util/List;Ljava/io/InputStream;)V
    .locals 7
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p2, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Team;",
            ">;",
            "Ljava/io/InputStream;",
            ")V"
        }
    .end annotation

    .prologue
    .line 542
    .local p1, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    invoke-static {p0, p2}, Lcom/blank/bm15/model/core/Create;->createPlayersByFile(Lcom/blank/bm15/model/object/crud/Game;Ljava/io/InputStream;)Ljava/util/List;

    move-result-object v1

    .line 544
    .local v1, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 555
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 556
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v3}, Lcom/blank/bm15/model/object/crud/Game;->setCreateOnlinePlayersOk(Ljava/lang/Boolean;)V

    .line 559
    :cond_1
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 560
    return-void

    .line 544
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 545
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 546
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 547
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Team;

    .line 548
    .local v2, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 549
    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    goto :goto_0
.end method

.method private static createAllTeams(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;
    .locals 10
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Team;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x5

    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 145
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .local v3, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 147
    .local v1, "leagueList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/League;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 149
    .local v0, "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 150
    .local v2, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 151
    const-string v4, "BOS"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 152
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E1_T1:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 153
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 154
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 155
    const v4, 0x7f060036

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 156
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 157
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 161
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 162
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 163
    const-string v4, "BRO"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 164
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E1_T2:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 165
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 166
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 167
    const v4, 0x7f060046

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 168
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 169
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 173
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 174
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 175
    const-string v4, "NYK"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 176
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E1_T3:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 177
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 178
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 179
    const v4, 0x7f060048

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 180
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 181
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 183
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 185
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 186
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 187
    const-string v4, "PHI"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 188
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E1_T4:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 189
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 190
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 191
    const v4, 0x7f06004b

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 192
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 193
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 197
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 198
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 199
    const-string v4, "TOR"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 200
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E1_T5:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 201
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 202
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 203
    const v4, 0x7f060050

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 204
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 205
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 209
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 210
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 211
    const-string v4, "CHI"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 212
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E2_T1:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 213
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 214
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 215
    const v4, 0x7f060038

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 216
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 217
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 221
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 222
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 223
    const-string v4, "CLE"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 224
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E2_T2:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 225
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 226
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 227
    const v4, 0x7f060039

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 228
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 229
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 233
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 234
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 235
    const-string v4, "DET"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 236
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E2_T3:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 237
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 238
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 239
    const v4, 0x7f06003c

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 240
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 241
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 243
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 245
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 246
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 247
    const-string v4, "IND"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 248
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E2_T4:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 249
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 250
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 251
    const v4, 0x7f06003f

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 252
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 253
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 255
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 257
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 258
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 259
    const-string v4, "MIL"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 260
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E2_T5:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 261
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 262
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 263
    const v4, 0x7f060044

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 264
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 265
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 267
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 269
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 270
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 271
    const-string v4, "ATL"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 272
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E3_T1:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 273
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 274
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 275
    const v4, 0x7f060035

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 276
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 277
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 279
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 281
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 282
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 283
    const-string v4, "CHA"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 284
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E3_T2:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 285
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 286
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 287
    const v4, 0x7f060037

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 288
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 289
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 291
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 293
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 294
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 295
    const-string v4, "MIA"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 296
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E3_T3:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 297
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 298
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 299
    const v4, 0x7f060043

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 300
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 301
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 303
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 305
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 306
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 307
    const-string v4, "ORL"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 308
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E3_T4:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 309
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 310
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 311
    const v4, 0x7f06004a

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 312
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 313
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 315
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 317
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 318
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 319
    const-string v4, "WAS"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 320
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_E3_T5:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 321
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 322
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 323
    const v4, 0x7f060052

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 324
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 325
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 327
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 329
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 330
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 331
    const-string v4, "DAL"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 332
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W1_T1:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 333
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 334
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 335
    const v4, 0x7f06003a

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 336
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 337
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 339
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 341
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 342
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 343
    const-string v4, "HOU"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 344
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W1_T2:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 345
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 346
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 347
    const v4, 0x7f06003e

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 348
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 349
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 351
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 353
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 354
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 355
    const-string v4, "MEM"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 356
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W1_T3:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 357
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 358
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 359
    const v4, 0x7f060042

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 360
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 361
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 363
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 365
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 366
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 367
    const-string v4, "NOR"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 368
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W1_T4:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 369
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 370
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 371
    const v4, 0x7f060047

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 372
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 373
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 375
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 377
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 378
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 379
    const-string v4, "SAN"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 380
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W1_T5:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 381
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 382
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 383
    const v4, 0x7f06004f

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 384
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 385
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 387
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 389
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 390
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 391
    const-string v4, "DEN"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 392
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W2_T1:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 393
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 394
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 395
    const v4, 0x7f06003b

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 396
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 397
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 399
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 401
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 402
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 403
    const-string v4, "MIN"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 404
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W2_T2:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 405
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 406
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 407
    const v4, 0x7f060045

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 408
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 409
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 411
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 413
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 414
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 415
    const-string v4, "POR"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 416
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W2_T3:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 417
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 418
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 419
    const v4, 0x7f06004d

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 420
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 421
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 423
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 425
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 426
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 427
    const-string v4, "OKC"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 428
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W2_T4:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 429
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 430
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 431
    const v4, 0x7f060049

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 432
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 433
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 435
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 437
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 438
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 439
    const-string v4, "UTA"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 440
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W2_T5:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 441
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 442
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 443
    const v4, 0x7f060051

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 444
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 445
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 447
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 449
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 450
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 451
    const-string v4, "GSW"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 452
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W3_T1:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 453
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 454
    const/4 v4, 0x6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 455
    const v4, 0x7f06003d

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 456
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 457
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 459
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 461
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 462
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 463
    const-string v4, "LAC"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 464
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W3_T2:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 465
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 466
    const/4 v4, 0x6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 467
    const v4, 0x7f060040

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 468
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 469
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 471
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 473
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 474
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 475
    const-string v4, "LAL"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 476
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W3_T3:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 477
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 478
    const/4 v4, 0x6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 479
    const v4, 0x7f060041

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 480
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 481
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 483
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 485
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 486
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 487
    const-string v4, "PHO"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 488
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W3_T4:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 489
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 490
    const/4 v4, 0x6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 491
    const v4, 0x7f06004c

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 492
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 493
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 495
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 497
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    .end local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 498
    .restart local v2    # "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 499
    const-string v4, "SAC"

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 500
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_TEAM_W3_T5:Ljava/lang/Integer;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setSalaryCap(Ljava/lang/Integer;)V

    .line 501
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setConference(Ljava/lang/Integer;)V

    .line 502
    const/4 v4, 0x6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 503
    const v4, 0x7f06004e

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Team;->setColor(Ljava/lang/Integer;)V

    .line 504
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 505
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 507
    invoke-static {p0, v2, v1, v0}, Lcom/blank/bm15/model/core/Create;->createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V

    .line 509
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 510
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 512
    return-object v3
.end method

.method private static createChallenges(Landroid/app/Activity;Ljava/util/List;)V
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Team;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 925
    .local p1, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    new-instance v0, Lcom/blank/bm15/model/object/crud/Challenge;

    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/Challenge;-><init>(Landroid/content/Context;)V

    .line 926
    .local v0, "challenge":Lcom/blank/bm15/model/object/crud/Challenge;
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getAll(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v1

    .line 928
    .local v1, "challengeList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Challenge;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 929
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 934
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 936
    :cond_0
    return-void

    .line 929
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Team;

    .line 930
    .local v2, "team":Lcom/blank/bm15/model/object/crud/Team;
    new-instance v0, Lcom/blank/bm15/model/object/crud/Challenge;

    .end local v0    # "challenge":Lcom/blank/bm15/model/object/crud/Challenge;
    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/Challenge;-><init>(Landroid/content/Context;)V

    .line 931
    .restart local v0    # "challenge":Lcom/blank/bm15/model/object/crud/Challenge;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/blank/bm15/model/object/crud/Challenge;->setTeamName(Ljava/lang/String;)V

    .line 932
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private static createFirstNews(Landroid/app/Activity;Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 7
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x2

    const/4 v4, 0x0

    const v3, 0x7f020037

    .line 563
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 565
    .local v1, "newsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/blank/bm15/model/object/crud/News;>;"
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 566
    .local v0, "news":Lcom/blank/bm15/model/object/crud/News;
    const v2, 0x7f0500ef

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 567
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 568
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 569
    const v2, 0x7f0500ee

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 570
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 571
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 573
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    .end local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 574
    .restart local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    const v2, 0x7f0500f5

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 575
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 576
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 577
    const v2, 0x7f0500f4

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 578
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 579
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 581
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    .end local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 582
    .restart local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    const v2, 0x7f0500f7

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 583
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 584
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 585
    const v2, 0x7f0500f6

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 586
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 587
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 589
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    .end local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 590
    .restart local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    const v2, 0x7f0500f3

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 591
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 592
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 593
    const v2, 0x7f0500f2

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 594
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 595
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 597
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    .end local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 598
    .restart local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    const v2, 0x7f0500f1

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 599
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 600
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 601
    const v2, 0x7f0500f0

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 602
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 603
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 605
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    .end local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 606
    .restart local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    const v2, 0x7f0500f9

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 607
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 608
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 609
    const v2, 0x7f0500f8

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 610
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 611
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 613
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    .end local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 614
    .restart local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    const v2, 0x7f0500fb

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 615
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 616
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 617
    const v2, 0x7f0500fa

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 618
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 619
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 621
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    .end local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 622
    .restart local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    const v2, 0x7f0500fd

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 623
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 624
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 625
    const v2, 0x7f0500fc

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 626
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 627
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 629
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    .end local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 630
    .restart local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    const v2, 0x7f050101

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 631
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 632
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 633
    const v2, 0x7f050100

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 634
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 635
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 637
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    .end local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 638
    .restart local v0    # "news":Lcom/blank/bm15/model/object/crud/News;
    const v2, 0x7f0500ff

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 639
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 640
    const/4 v2, 0x6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 641
    const v2, 0x7f0500fe

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 642
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 643
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 647
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 648
    return-void
.end method

.method private static createLeagueAndDraft(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            "Lcom/blank/bm15/model/object/crud/Team;",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/League;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/DraftRound;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 516
    .local p2, "leagueList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/League;>;"
    .local p3, "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    new-instance v1, Lcom/blank/bm15/model/object/crud/League;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/League;-><init>(Landroid/content/Context;)V

    .line 517
    .local v1, "league":Lcom/blank/bm15/model/object/crud/League;
    invoke-virtual {v1, p0}, Lcom/blank/bm15/model/object/crud/League;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 518
    invoke-virtual {v1, p1}, Lcom/blank/bm15/model/object/crud/League;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 519
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 521
    new-instance v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    .line 522
    .local v0, "draftRound":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 523
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamOwner(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 524
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamUser(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 525
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->setRound(Ljava/lang/Integer;)V

    .line 526
    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 528
    new-instance v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    .end local v0    # "draftRound":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    .line 529
    .restart local v0    # "draftRound":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 530
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamOwner(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 531
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamUser(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 532
    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->setRound(Ljava/lang/Integer;)V

    .line 533
    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 534
    return-void
.end method

.method private static createPlayer(Lcom/blank/bm15/model/object/crud/Game;Ljava/lang/String;IIIIIIIIIIIIIIILjava/lang/String;)Lcom/blank/bm15/model/object/crud/Player;
    .locals 4
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "age"    # I
    .param p3, "yearsContract"    # I
    .param p4, "salary"    # I
    .param p5, "positionFirst"    # I
    .param p6, "positionSecond"    # I
    .param p7, "physique"    # I
    .param p8, "block"    # I
    .param p9, "steal"    # I
    .param p10, "rebound"    # I
    .param p11, "pass"    # I
    .param p12, "shotInt"    # I
    .param p13, "shotExt"    # I
    .param p14, "shotFre"    # I
    .param p15, "potential"    # I
    .param p16, "yearsExperience"    # I
    .param p17, "team"    # Ljava/lang/String;

    .prologue
    .line 722
    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 723
    .local v1, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v1, p1}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 724
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setYearsContract(Ljava/lang/Integer;)V

    .line 725
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    .line 726
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setLoyalty(Ljava/lang/Integer;)V

    .line 727
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    .line 728
    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionSecond(Ljava/lang/Integer;)V

    .line 729
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    move-object/from16 v0, p17

    invoke-virtual {v2, v0}, Lcom/blank/bm15/model/object/crud/Team;->setName(Ljava/lang/String;)V

    .line 730
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setAge(Ljava/lang/Integer;)V

    .line 731
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setStateInjury(Ljava/lang/Integer;)V

    .line 732
    const/16 v2, 0x1e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x46

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setStateForm(Ljava/lang/Integer;)V

    .line 733
    const/16 v2, 0x63

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setStateEnergy(Ljava/lang/Integer;)V

    .line 734
    invoke-static {p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillPhysique(Ljava/lang/Integer;)V

    .line 735
    invoke-static {p8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillBlock(Ljava/lang/Integer;)V

    .line 736
    invoke-static {p9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillSteal(Ljava/lang/Integer;)V

    .line 737
    invoke-static {p10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillRebound(Ljava/lang/Integer;)V

    .line 738
    invoke-static {p11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillPass(Ljava/lang/Integer;)V

    .line 739
    invoke-static/range {p12 .. p12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotInterior(Ljava/lang/Integer;)V

    .line 740
    invoke-static/range {p13 .. p13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotExterior(Ljava/lang/Integer;)V

    .line 741
    invoke-static/range {p14 .. p14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotFree(Ljava/lang/Integer;)V

    .line 742
    invoke-static/range {p15 .. p15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPotential(Ljava/lang/Integer;)V

    .line 743
    invoke-static/range {p16 .. p16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setYearsExperience(Ljava/lang/Integer;)V

    .line 745
    return-object v1
.end method

.method private static createPlayersByFile(Lcom/blank/bm15/model/object/crud/Game;Ljava/io/InputStream;)Ljava/util/List;
    .locals 35
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            "Ljava/io/InputStream;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ">;"
        }
    .end annotation

    .prologue
    .line 651
    new-instance v28, Ljava/util/ArrayList;

    invoke-direct/range {v28 .. v28}, Ljava/util/ArrayList;-><init>()V

    .line 652
    .local v28, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v23, Ljava/util/ArrayList;

    invoke-direct/range {v23 .. v23}, Ljava/util/ArrayList;-><init>()V

    .line 654
    .local v23, "fieldNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v30, 0x0

    .line 656
    .local v30, "reader":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v31, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    move-object/from16 v0, p1

    invoke-direct {v3, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v31

    invoke-direct {v0, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 658
    .end local v30    # "reader":Ljava/io/BufferedReader;
    .local v31, "reader":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v32, Lcom/blank/bm15/model/object/other/Roster;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v3

    move-object/from16 v0, v32

    invoke-direct {v0, v3}, Lcom/blank/bm15/model/object/other/Roster;-><init>(Landroid/content/Context;)V

    .line 659
    .local v32, "roster":Lcom/blank/bm15/model/object/other/Roster;
    const/16 v34, 0x0

    .line 660
    .local v34, "value":Ljava/lang/String;
    const/16 v33, 0x0

    .line 661
    .local v33, "st":Ljava/util/StringTokenizer;
    const/16 v25, 0x0

    .line 663
    .local v25, "i":I
    invoke-static/range {v32 .. v32}, Lcom/blank/bm15/dao/BlankDao;->getOrderedFields(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v24

    .line 664
    .local v24, "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    :cond_0
    :goto_0
    invoke-virtual/range {v31 .. v31}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v27

    .local v27, "line":Ljava/lang/String;
    if-nez v27, :cond_2

    .line 693
    invoke-virtual/range {v31 .. v31}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 697
    if-eqz v31, :cond_8

    .line 699
    :try_start_2
    invoke-virtual/range {v31 .. v31}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    move-object/from16 v30, v31

    .line 705
    .end local v24    # "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .end local v25    # "i":I
    .end local v27    # "line":Ljava/lang/String;
    .end local v31    # "reader":Ljava/io/BufferedReader;
    .end local v32    # "roster":Lcom/blank/bm15/model/object/other/Roster;
    .end local v33    # "st":Ljava/util/StringTokenizer;
    .end local v34    # "value":Ljava/lang/String;
    .restart local v30    # "reader":Ljava/io/BufferedReader;
    :cond_1
    :goto_1
    return-object v28

    .line 665
    .end local v30    # "reader":Ljava/io/BufferedReader;
    .restart local v24    # "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .restart local v25    # "i":I
    .restart local v27    # "line":Ljava/lang/String;
    .restart local v31    # "reader":Ljava/io/BufferedReader;
    .restart local v32    # "roster":Lcom/blank/bm15/model/object/other/Roster;
    .restart local v33    # "st":Ljava/util/StringTokenizer;
    .restart local v34    # "value":Ljava/lang/String;
    :cond_2
    :try_start_3
    new-instance v33, Ljava/util/StringTokenizer;

    .end local v33    # "st":Ljava/util/StringTokenizer;
    const-string v3, ";"

    move-object/from16 v0, v33

    move-object/from16 v1, v27

    invoke-direct {v0, v1, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 666
    .restart local v33    # "st":Ljava/util/StringTokenizer;
    if-nez v34, :cond_3

    .line 667
    :goto_2
    invoke-virtual/range {v33 .. v33}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 668
    invoke-virtual/range {v33 .. v33}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v34

    .line 669
    move-object/from16 v0, v23

    move-object/from16 v1, v34

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    .line 694
    .end local v24    # "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .end local v25    # "i":I
    .end local v27    # "line":Ljava/lang/String;
    .end local v32    # "roster":Lcom/blank/bm15/model/object/other/Roster;
    .end local v33    # "st":Ljava/util/StringTokenizer;
    .end local v34    # "value":Ljava/lang/String;
    :catch_0
    move-exception v21

    move-object/from16 v30, v31

    .line 695
    .end local v31    # "reader":Ljava/io/BufferedReader;
    .local v21, "e":Ljava/lang/Exception;
    .restart local v30    # "reader":Ljava/io/BufferedReader;
    :goto_3
    :try_start_4
    const-string v3, "createPlayersByFile"

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 697
    if-eqz v30, :cond_1

    .line 699
    :try_start_5
    invoke-virtual/range {v30 .. v30}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    .line 700
    :catch_1
    move-exception v21

    .line 701
    .local v21, "e":Ljava/io/IOException;
    const-string v3, "createPlayersByFile"

    invoke-virtual/range {v21 .. v21}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 672
    .end local v21    # "e":Ljava/io/IOException;
    .end local v30    # "reader":Ljava/io/BufferedReader;
    .restart local v24    # "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .restart local v25    # "i":I
    .restart local v27    # "line":Ljava/lang/String;
    .restart local v31    # "reader":Ljava/io/BufferedReader;
    .restart local v32    # "roster":Lcom/blank/bm15/model/object/other/Roster;
    .restart local v33    # "st":Ljava/util/StringTokenizer;
    .restart local v34    # "value":Ljava/lang/String;
    :cond_3
    :try_start_6
    new-instance v32, Lcom/blank/bm15/model/object/other/Roster;

    .end local v32    # "roster":Lcom/blank/bm15/model/object/other/Roster;
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v3

    move-object/from16 v0, v32

    invoke-direct {v0, v3}, Lcom/blank/bm15/model/object/other/Roster;-><init>(Landroid/content/Context;)V

    .line 673
    .restart local v32    # "roster":Lcom/blank/bm15/model/object/other/Roster;
    const/16 v25, 0x0

    move/from16 v26, v25

    .line 674
    .end local v25    # "i":I
    .local v26, "i":I
    :goto_4
    invoke-virtual/range {v33 .. v33}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_4

    .line 688
    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getAge()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getYearsContract()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getSalary()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 689
    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getSkillPhysique()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getSkillBlock()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v11

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getSkillSteal()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getSkillRebound()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getSkillPass()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v14

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getSkillShotInterior()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v15

    .line 690
    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getSkillShotExterior()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v16

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getSkillShotFree()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v17

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getPotential()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v18

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getYearsExperience()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v19

    invoke-virtual/range {v32 .. v32}, Lcom/blank/bm15/model/object/other/Roster;->getTeam()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v3, p0

    .line 688
    invoke-static/range {v3 .. v20}, Lcom/blank/bm15/model/core/Create;->createPlayer(Lcom/blank/bm15/model/object/crud/Game;Ljava/lang/String;IIIIIIIIIIIIIIILjava/lang/String;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v3

    move-object/from16 v0, v28

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move/from16 v25, v26

    .end local v26    # "i":I
    .restart local v25    # "i":I
    goto/16 :goto_0

    .line 675
    .end local v25    # "i":I
    .restart local v26    # "i":I
    :cond_4
    add-int/lit8 v25, v26, 0x1

    .end local v26    # "i":I
    .restart local v25    # "i":I
    move-object/from16 v0, v23

    move/from16 v1, v26

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Ljava/lang/String;

    .line 676
    .local v29, "name":Ljava/lang/String;
    invoke-virtual/range {v33 .. v33}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v34

    .line 678
    invoke-static/range {v34 .. v34}, Lcom/blank/bm15/dao/utils/BlankObj;->isNullOrEmpty(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_6

    .line 679
    move-object/from16 v0, v24

    move-object/from16 v1, v29

    invoke-static {v0, v1}, Lcom/blank/bm15/model/core/Create;->getField(Ljava/util/List;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v22

    .line 680
    .local v22, "field":Ljava/lang/reflect/Field;
    invoke-virtual/range {v22 .. v22}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v3

    const-class v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 681
    move-object/from16 v0, v22

    move-object/from16 v1, v32

    move-object/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    move/from16 v26, v25

    .line 682
    .end local v25    # "i":I
    .restart local v26    # "i":I
    goto/16 :goto_4

    .end local v26    # "i":I
    .restart local v25    # "i":I
    :cond_5
    invoke-virtual/range {v22 .. v22}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v3

    const-class v4, Ljava/lang/Integer;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 683
    invoke-static/range {v34 .. v34}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v0, v22

    move-object/from16 v1, v32

    invoke-virtual {v0, v1, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .end local v22    # "field":Ljava/lang/reflect/Field;
    :cond_6
    move/from16 v26, v25

    .end local v25    # "i":I
    .restart local v26    # "i":I
    goto/16 :goto_4

    .line 696
    .end local v24    # "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .end local v26    # "i":I
    .end local v27    # "line":Ljava/lang/String;
    .end local v29    # "name":Ljava/lang/String;
    .end local v31    # "reader":Ljava/io/BufferedReader;
    .end local v32    # "roster":Lcom/blank/bm15/model/object/other/Roster;
    .end local v33    # "st":Ljava/util/StringTokenizer;
    .end local v34    # "value":Ljava/lang/String;
    .restart local v30    # "reader":Ljava/io/BufferedReader;
    :catchall_0
    move-exception v3

    .line 697
    :goto_5
    if-eqz v30, :cond_7

    .line 699
    :try_start_7
    invoke-virtual/range {v30 .. v30}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    .line 704
    :cond_7
    :goto_6
    throw v3

    .line 700
    :catch_2
    move-exception v21

    .line 701
    .restart local v21    # "e":Ljava/io/IOException;
    const-string v4, "createPlayersByFile"

    invoke-virtual/range {v21 .. v21}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    .line 700
    .end local v21    # "e":Ljava/io/IOException;
    .end local v30    # "reader":Ljava/io/BufferedReader;
    .restart local v24    # "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .restart local v25    # "i":I
    .restart local v27    # "line":Ljava/lang/String;
    .restart local v31    # "reader":Ljava/io/BufferedReader;
    .restart local v32    # "roster":Lcom/blank/bm15/model/object/other/Roster;
    .restart local v33    # "st":Ljava/util/StringTokenizer;
    .restart local v34    # "value":Ljava/lang/String;
    :catch_3
    move-exception v21

    .line 701
    .restart local v21    # "e":Ljava/io/IOException;
    const-string v3, "createPlayersByFile"

    invoke-virtual/range {v21 .. v21}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .end local v21    # "e":Ljava/io/IOException;
    :cond_8
    move-object/from16 v30, v31

    .end local v31    # "reader":Ljava/io/BufferedReader;
    .restart local v30    # "reader":Ljava/io/BufferedReader;
    goto/16 :goto_1

    .line 696
    .end local v24    # "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .end local v25    # "i":I
    .end local v27    # "line":Ljava/lang/String;
    .end local v30    # "reader":Ljava/io/BufferedReader;
    .end local v32    # "roster":Lcom/blank/bm15/model/object/other/Roster;
    .end local v33    # "st":Ljava/util/StringTokenizer;
    .end local v34    # "value":Ljava/lang/String;
    .restart local v31    # "reader":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v3

    move-object/from16 v30, v31

    .end local v31    # "reader":Ljava/io/BufferedReader;
    .restart local v30    # "reader":Ljava/io/BufferedReader;
    goto :goto_5

    .line 694
    :catch_4
    move-exception v21

    goto/16 :goto_3
.end method

.method public static createRosterFile(Landroid/content/Context;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 130
    new-instance v0, Lcom/blank/bm15/model/object/crud/Game;

    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    .line 131
    .local v0, "game":Lcom/blank/bm15/model/object/crud/Game;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const/high16 v6, 0x7f040000

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/blank/bm15/model/core/Create;->createPlayersByFile(Lcom/blank/bm15/model/object/crud/Game;Ljava/io/InputStream;)Ljava/util/List;

    move-result-object v2

    .line 132
    .local v2, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .local v4, "rosterList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Roster;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_0

    .line 141
    invoke-static {v4}, Lcom/blank/bm15/model/core/Create;->createRostersFile(Ljava/util/List;)V

    .line 142
    return-void

    .line 135
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Player;

    .line 136
    .local v1, "player":Lcom/blank/bm15/model/object/crud/Player;
    new-instance v3, Lcom/blank/bm15/model/object/other/Roster;

    invoke-direct {v3, p0}, Lcom/blank/bm15/model/object/other/Roster;-><init>(Landroid/content/Context;)V

    .line 137
    .local v3, "roster":Lcom/blank/bm15/model/object/other/Roster;
    invoke-virtual {v3, v1}, Lcom/blank/bm15/model/object/other/Roster;->loadPlayer(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 138
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private static createRostersFile(Ljava/util/List;)V
    .locals 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 850
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->isEmpty()Z

    move-result v20

    if-nez v20, :cond_2

    .line 851
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/blank/bm15/dao/utils/BlankBase;

    .line 852
    .local v14, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {v14}, Lcom/blank/bm15/dao/BlankDao;->getOrderedFields(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v10

    .line 853
    .local v10, "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v7

    .line 855
    .local v7, "colCount":I
    const-string v11, "rosters.csv"

    .line 856
    .local v11, "fileName":Ljava/lang/String;
    invoke-virtual {v14}, Lcom/blank/bm15/dao/utils/BlankBase;->getContext()Landroid/content/Context;

    move-result-object v20

    invoke-virtual {v14}, Lcom/blank/bm15/dao/utils/BlankBase;->getContext()Landroid/content/Context;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v21

    move-object/from16 v0, v21

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->labelRes:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v17

    .line 858
    .local v17, "subfolder":Ljava/lang/String;
    const/4 v5, 0x0

    .line 860
    .local v5, "bfw":Ljava/io/BufferedWriter;
    new-instance v16, Ljava/io/File;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "/"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 861
    .local v16, "sdCardDir":Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->exists()Z

    move-result v20

    if-nez v20, :cond_0

    .line 862
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->mkdir()Z

    .line 865
    :cond_0
    new-instance v15, Ljava/io/File;

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 866
    .local v15, "saveFile":Ljava/io/File;
    invoke-virtual {v15}, Ljava/io/File;->exists()Z

    move-result v20

    if-eqz v20, :cond_1

    .line 867
    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    .line 868
    new-instance v15, Ljava/io/File;

    .end local v15    # "saveFile":Ljava/io/File;
    move-object/from16 v0, v16

    invoke-direct {v15, v0, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 872
    .restart local v15    # "saveFile":Ljava/io/File;
    :cond_1
    :try_start_0
    new-instance v6, Ljava/io/BufferedWriter;

    new-instance v20, Ljava/io/OutputStreamWriter;

    new-instance v21, Ljava/io/FileOutputStream;

    const/16 v22, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-direct {v0, v15, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    invoke-direct/range {v20 .. v21}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    move-object/from16 v0, v20

    invoke-direct {v6, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 874
    .end local v5    # "bfw":Ljava/io/BufferedWriter;
    .local v6, "bfw":Ljava/io/BufferedWriter;
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    if-lt v12, v7, :cond_3

    .line 887
    :try_start_1
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->newLine()V

    .line 889
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_1
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-nez v21, :cond_6

    .line 906
    invoke-virtual {v14}, Lcom/blank/bm15/dao/utils/BlankBase;->getContext()Landroid/content/Context;

    move-result-object v20

    invoke-virtual {v14}, Lcom/blank/bm15/dao/utils/BlankBase;->getContext()Landroid/content/Context;

    move-result-object v21

    const v22, 0x7f050057

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v21

    const/16 v22, 0x0

    invoke-static/range {v20 .. v22}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v18

    .line 907
    .local v18, "toast":Landroid/widget/Toast;
    const/16 v20, 0x11

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/Toast;->setGravity(III)V

    .line 908
    invoke-virtual/range {v18 .. v18}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 912
    if-eqz v6, :cond_2

    .line 914
    :try_start_2
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->flush()V

    .line 915
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 922
    .end local v6    # "bfw":Ljava/io/BufferedWriter;
    .end local v7    # "colCount":I
    .end local v10    # "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .end local v11    # "fileName":Ljava/lang/String;
    .end local v12    # "i":I
    .end local v14    # "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    .end local v15    # "saveFile":Ljava/io/File;
    .end local v16    # "sdCardDir":Ljava/io/File;
    .end local v17    # "subfolder":Ljava/lang/String;
    .end local v18    # "toast":Landroid/widget/Toast;
    :cond_2
    :goto_2
    return-void

    .line 875
    .restart local v6    # "bfw":Ljava/io/BufferedWriter;
    .restart local v7    # "colCount":I
    .restart local v10    # "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .restart local v11    # "fileName":Ljava/lang/String;
    .restart local v12    # "i":I
    .restart local v14    # "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    .restart local v15    # "saveFile":Ljava/io/File;
    .restart local v16    # "sdCardDir":Ljava/io/File;
    .restart local v17    # "subfolder":Ljava/lang/String;
    :cond_3
    :try_start_3
    invoke-interface {v10, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/reflect/Field;

    .line 876
    .local v9, "field":Ljava/lang/reflect/Field;
    sget-object v20, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v9, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 877
    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v13

    .line 879
    .local v13, "name":Ljava/lang/String;
    const-string v20, "id"

    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_4

    .line 880
    add-int/lit8 v20, v7, -0x1

    move/from16 v0, v20

    if-eq v12, v0, :cond_5

    .line 881
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v21, 0x3b

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 874
    :cond_4
    :goto_3
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 883
    :cond_5
    invoke-virtual {v6, v13}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_3

    .line 909
    .end local v9    # "field":Ljava/lang/reflect/Field;
    .end local v13    # "name":Ljava/lang/String;
    :catch_0
    move-exception v8

    move-object v5, v6

    .line 910
    .end local v6    # "bfw":Ljava/io/BufferedWriter;
    .end local v12    # "i":I
    .restart local v5    # "bfw":Ljava/io/BufferedWriter;
    .local v8, "e":Ljava/lang/Exception;
    :goto_4
    :try_start_4
    const-string v20, "createRosterFile"

    invoke-virtual {v8}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 912
    if-eqz v5, :cond_2

    .line 914
    :try_start_5
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->flush()V

    .line 915
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_2

    .line 916
    :catch_1
    move-exception v8

    .line 917
    .local v8, "e":Ljava/io/IOException;
    const-string v20, "createRosterFile"

    invoke-virtual {v8}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 889
    .end local v5    # "bfw":Ljava/io/BufferedWriter;
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v6    # "bfw":Ljava/io/BufferedWriter;
    .restart local v12    # "i":I
    :cond_6
    :try_start_6
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/dao/utils/BlankBase;

    .line 890
    .local v4, "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    const/4 v12, 0x0

    :goto_5
    if-lt v12, v7, :cond_8

    .line 903
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->newLine()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_1

    .line 911
    .end local v4    # "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    :catchall_0
    move-exception v20

    move-object v5, v6

    .line 912
    .end local v6    # "bfw":Ljava/io/BufferedWriter;
    .end local v12    # "i":I
    .restart local v5    # "bfw":Ljava/io/BufferedWriter;
    :goto_6
    if-eqz v5, :cond_7

    .line 914
    :try_start_7
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->flush()V

    .line 915
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    .line 920
    :cond_7
    :goto_7
    throw v20

    .line 891
    .end local v5    # "bfw":Ljava/io/BufferedWriter;
    .restart local v4    # "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    .restart local v6    # "bfw":Ljava/io/BufferedWriter;
    .restart local v12    # "i":I
    :cond_8
    :try_start_8
    invoke-interface {v10, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/reflect/Field;

    .line 892
    .restart local v9    # "field":Ljava/lang/reflect/Field;
    sget-object v21, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 893
    invoke-virtual {v9, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    .line 895
    .local v19, "value":Ljava/lang/Object;
    const-string v21, "id"

    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_9

    .line 896
    add-int/lit8 v21, v7, -0x1

    move/from16 v0, v21

    if-eq v12, v0, :cond_a

    .line 897
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v22, 0x3b

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 890
    :cond_9
    :goto_8
    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    .line 899
    :cond_a
    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_8

    .line 916
    .end local v4    # "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    .end local v6    # "bfw":Ljava/io/BufferedWriter;
    .end local v9    # "field":Ljava/lang/reflect/Field;
    .end local v12    # "i":I
    .end local v19    # "value":Ljava/lang/Object;
    .restart local v5    # "bfw":Ljava/io/BufferedWriter;
    :catch_2
    move-exception v8

    .line 917
    .restart local v8    # "e":Ljava/io/IOException;
    const-string v21, "createRosterFile"

    invoke-virtual {v8}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7

    .line 916
    .end local v5    # "bfw":Ljava/io/BufferedWriter;
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v6    # "bfw":Ljava/io/BufferedWriter;
    .restart local v12    # "i":I
    .restart local v18    # "toast":Landroid/widget/Toast;
    :catch_3
    move-exception v8

    .line 917
    .restart local v8    # "e":Ljava/io/IOException;
    const-string v20, "createRosterFile"

    invoke-virtual {v8}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 911
    .end local v6    # "bfw":Ljava/io/BufferedWriter;
    .end local v8    # "e":Ljava/io/IOException;
    .end local v12    # "i":I
    .end local v18    # "toast":Landroid/widget/Toast;
    .restart local v5    # "bfw":Ljava/io/BufferedWriter;
    :catchall_1
    move-exception v20

    goto :goto_6

    .line 909
    :catch_4
    move-exception v8

    goto/16 :goto_4
.end method

.method public static deleteGame(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 12
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 71
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->delete(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 74
    new-instance v9, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v9, v11}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 75
    .local v9, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v9, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 76
    invoke-static {v9}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 79
    new-instance v8, Lcom/blank/bm15/model/object/crud/Tactic;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v8, v11}, Lcom/blank/bm15/model/object/crud/Tactic;-><init>(Landroid/content/Context;)V

    .line 80
    .local v8, "tactic":Lcom/blank/bm15/model/object/crud/Tactic;
    invoke-virtual {v8, p0}, Lcom/blank/bm15/model/object/crud/Tactic;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 81
    invoke-static {v8}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 84
    new-instance v1, Lcom/blank/bm15/model/object/crud/League;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v1, v11}, Lcom/blank/bm15/model/object/crud/League;-><init>(Landroid/content/Context;)V

    .line 85
    .local v1, "league":Lcom/blank/bm15/model/object/crud/League;
    invoke-virtual {v1, p0}, Lcom/blank/bm15/model/object/crud/League;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 86
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 89
    new-instance v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v0, v11}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    .line 90
    .local v0, "draftRound":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 91
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 94
    new-instance v6, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v6, v11}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 95
    .local v6, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v6, p0}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 96
    invoke-static {v6}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 99
    new-instance v2, Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v2, v11}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 100
    .local v2, "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Match;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 101
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 104
    new-instance v3, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v3, v11}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 105
    .local v3, "matchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-virtual {v3, p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 106
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 109
    new-instance v4, Lcom/blank/bm15/model/object/crud/News;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v4, v11}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 110
    .local v4, "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual {v4, p0}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 111
    invoke-static {v4}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 114
    new-instance v5, Lcom/blank/bm15/model/object/crud/Offer;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v5, v11}, Lcom/blank/bm15/model/object/crud/Offer;-><init>(Landroid/content/Context;)V

    .line 115
    .local v5, "offer":Lcom/blank/bm15/model/object/crud/Offer;
    invoke-virtual {v5, p0}, Lcom/blank/bm15/model/object/crud/Offer;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 116
    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 119
    new-instance v10, Lcom/blank/bm15/model/object/crud/Trade;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v10, v11}, Lcom/blank/bm15/model/object/crud/Trade;-><init>(Landroid/content/Context;)V

    .line 120
    .local v10, "trade":Lcom/blank/bm15/model/object/crud/Trade;
    invoke-virtual {v10, p0}, Lcom/blank/bm15/model/object/crud/Trade;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 121
    invoke-static {v10}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 124
    new-instance v7, Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v7, v11}, Lcom/blank/bm15/model/object/crud/Playoffs;-><init>(Landroid/content/Context;)V

    .line 125
    .local v7, "playoffs":Lcom/blank/bm15/model/object/crud/Playoffs;
    invoke-virtual {v7, p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 126
    invoke-static {v7}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 127
    return-void
.end method

.method private static getField(Ljava/util/List;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Field;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 709
    .local p0, "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 715
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 709
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    .line 710
    .local v0, "field":Ljava/lang/reflect/Field;
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 711
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method

.method public static newGame(Landroid/app/Activity;Ljava/lang/String;Ljava/io/InputStream;)Lcom/blank/bm15/model/object/crud/Game;
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "is"    # Ljava/io/InputStream;

    .prologue
    .line 53
    new-instance v0, Lcom/blank/bm15/model/object/crud/Game;

    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    .line 54
    .local v0, "game":Lcom/blank/bm15/model/object/crud/Game;
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/Game;->setName(Ljava/lang/String;)V

    .line 55
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/Game;->setCurrentMatchday(Ljava/lang/Integer;)V

    .line 56
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 58
    invoke-static {v0}, Lcom/blank/bm15/model/core/Create;->createAllTeams(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;

    move-result-object v1

    .line 59
    .local v1, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    invoke-static {v0, v1, p2}, Lcom/blank/bm15/model/core/Create;->createAllPlayers(Lcom/blank/bm15/model/object/crud/Game;Ljava/util/List;Ljava/io/InputStream;)V

    .line 60
    invoke-static {v0, v1}, Lcom/blank/bm15/model/core/Create;->createAllMatches(Lcom/blank/bm15/model/object/crud/Game;Ljava/util/List;)V

    .line 61
    invoke-static {p0, v0}, Lcom/blank/bm15/model/core/Create;->createFirstNews(Landroid/app/Activity;Lcom/blank/bm15/model/object/crud/Game;)V

    .line 62
    invoke-static {p0, v1}, Lcom/blank/bm15/model/core/Create;->createChallenges(Landroid/app/Activity;Ljava/util/List;)V

    .line 64
    invoke-static {v0}, Lcom/blank/bm15/model/core/Create;->updateDraftRoundValues(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 66
    return-object v0
.end method

.method public static updateDraftRoundValues(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 12
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 939
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 941
    .local v2, "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/16 v8, 0xe6

    if-eq v7, v8, :cond_2

    .line 942
    new-instance v3, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v3, v7}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 943
    .local v3, "filter":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v3, p0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 944
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v6

    .line 945
    .local v6, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    new-instance v7, Lcom/blank/bm15/model/comparator/TeamComparator;

    const/4 v8, 0x0

    const/4 v9, -0x1

    invoke-direct {v7, v8, v9}, Lcom/blank/bm15/model/comparator/TeamComparator;-><init>(II)V

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 947
    const/4 v4, 0x1

    .line 948
    .local v4, "marketValue":I
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_1

    .line 966
    .end local v3    # "filter":Lcom/blank/bm15/model/object/crud/Team;
    .end local v6    # "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    :cond_0
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 967
    return-void

    .line 948
    .restart local v3    # "filter":Lcom/blank/bm15/model/object/crud/Team;
    .restart local v6    # "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    :cond_1
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/model/object/crud/Team;

    .line 949
    .local v5, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getDraftRound1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v8

    int-to-double v10, v4

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/blank/bm15/model/object/crud/DraftRound;->setMarketValue(Ljava/lang/Double;)V

    .line 950
    add-int/lit8 v4, v4, 0x3

    .line 951
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getDraftRound1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v8

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 954
    .end local v3    # "filter":Lcom/blank/bm15/model/object/crud/Team;
    .end local v4    # "marketValue":I
    .end local v5    # "team":Lcom/blank/bm15/model/object/crud/Team;
    .end local v6    # "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    :cond_2
    new-instance v3, Lcom/blank/bm15/model/object/other/Classification;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v3, v7}, Lcom/blank/bm15/model/object/other/Classification;-><init>(Landroid/content/Context;)V

    .line 955
    .local v3, "filter":Lcom/blank/bm15/model/object/other/Classification;
    invoke-virtual {v3, p0}, Lcom/blank/bm15/model/object/other/Classification;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 956
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDaoExtra;->getDraft(Lcom/blank/bm15/model/object/other/Classification;)Ljava/util/List;

    move-result-object v0

    .line 958
    .local v0, "auxAllList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    const/16 v4, 0x82

    .line 959
    .restart local v4    # "marketValue":I
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/other/Classification;

    .line 960
    .local v1, "classification":Lcom/blank/bm15/model/object/other/Classification;
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Team;->getDraftRound1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v8

    int-to-double v10, v4

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/blank/bm15/model/object/crud/DraftRound;->setMarketValue(Ljava/lang/Double;)V

    .line 961
    add-int/lit8 v4, v4, -0x4

    .line 962
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Team;->getDraftRound1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v8

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method
