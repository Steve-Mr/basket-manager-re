.class public Lcom/blank/bm15/model/core/ManageSeasons;
.super Ljava/lang/Object;
.source "ManageSeasons.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static varargs createNews(Lcom/blank/bm15/model/object/crud/Game;IIII[Ljava/lang/Object;)V
    .locals 2
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "matchday"    # I
    .param p2, "type"    # I
    .param p3, "title"    # I
    .param p4, "body"    # I
    .param p5, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 243
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 244
    .local v0, "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 245
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 246
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 247
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 248
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 250
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 251
    return-void
.end method

.method public static creatingNewSeason(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 15
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    const/4 v5, 0x1

    const/4 v1, 0x0

    const/4 v4, 0x0

    .line 186
    new-instance v9, Lcom/blank/bm15/model/object/crud/League;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v9, v0}, Lcom/blank/bm15/model/object/crud/League;-><init>(Landroid/content/Context;)V

    .line 187
    .local v9, "leagueFilter":Lcom/blank/bm15/model/object/crud/League;
    invoke-virtual {v9, p0}, Lcom/blank/bm15/model/object/crud/League;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 188
    invoke-static {v9}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v10

    .line 189
    .local v10, "leagueList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/League;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 190
    .local v7, "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 210
    invoke-static {v10}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 211
    invoke-static {v7}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 212
    invoke-static {p0}, Lcom/blank/bm15/model/core/Create;->updateDraftRoundValues(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 215
    new-instance v12, Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v12, v0}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 216
    .local v12, "matchFilter":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {v12, p0}, Lcom/blank/bm15/model/object/crud/Match;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 217
    invoke-static {v12}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v13

    .line 218
    .local v13, "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 219
    .local v14, "matchToDeleteList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 236
    invoke-static {v13}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 237
    invoke-static {v14}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 239
    const v2, 0x7f02003a

    const v3, 0x7f05013f

    const v4, 0x7f050140

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentSeason()Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v1

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/blank/bm15/model/core/ManageSeasons;->createNews(Lcom/blank/bm15/model/object/crud/Game;IIII[Ljava/lang/Object;)V

    .line 240
    return-void

    .line 190
    .end local v12    # "matchFilter":Lcom/blank/bm15/model/object/crud/Match;
    .end local v13    # "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    .end local v14    # "matchToDeleteList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/crud/League;

    .line 191
    .local v8, "league":Lcom/blank/bm15/model/object/crud/League;
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v8, v2}, Lcom/blank/bm15/model/object/crud/League;->setGamesLost(Ljava/lang/Integer;)V

    .line 192
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v8, v2}, Lcom/blank/bm15/model/object/crud/League;->setGamesWon(Ljava/lang/Integer;)V

    .line 193
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v8, v2}, Lcom/blank/bm15/model/object/crud/League;->setPointsAllowed(Ljava/lang/Integer;)V

    .line 194
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v8, v2}, Lcom/blank/bm15/model/object/crud/League;->setPointsScored(Ljava/lang/Integer;)V

    .line 196
    new-instance v6, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v6, v2}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    .line 197
    .local v6, "draftRound":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-virtual {v6, p0}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 198
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/League;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v6, v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamOwner(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 199
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/League;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v6, v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamUser(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 200
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v6, v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->setRound(Ljava/lang/Integer;)V

    .line 201
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    new-instance v6, Lcom/blank/bm15/model/object/crud/DraftRound;

    .end local v6    # "draftRound":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v6, v2}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    .line 204
    .restart local v6    # "draftRound":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-virtual {v6, p0}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 205
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/League;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v6, v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamOwner(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 206
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/League;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v6, v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamUser(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 207
    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v6, v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->setRound(Ljava/lang/Integer;)V

    .line 208
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 219
    .end local v6    # "draftRound":Lcom/blank/bm15/model/object/crud/DraftRound;
    .end local v8    # "league":Lcom/blank/bm15/model/object/crud/League;
    .restart local v12    # "matchFilter":Lcom/blank/bm15/model/object/crud/Match;
    .restart local v13    # "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    .restart local v14    # "matchToDeleteList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/blank/bm15/model/object/crud/Match;

    .line 220
    .local v11, "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xa7

    if-ge v2, v3, :cond_2

    .line 221
    invoke-virtual {v11, v4}, Lcom/blank/bm15/model/object/crud/Match;->setName(Ljava/lang/String;)V

    .line 222
    invoke-virtual {v11, v4}, Lcom/blank/bm15/model/object/crud/Match;->setLocalExtension(Ljava/lang/Integer;)V

    .line 223
    invoke-virtual {v11, v4}, Lcom/blank/bm15/model/object/crud/Match;->setLocalQuarterFirst(Ljava/lang/Integer;)V

    .line 224
    invoke-virtual {v11, v4}, Lcom/blank/bm15/model/object/crud/Match;->setLocalQuarterFourth(Ljava/lang/Integer;)V

    .line 225
    invoke-virtual {v11, v4}, Lcom/blank/bm15/model/object/crud/Match;->setLocalQuarterSecond(Ljava/lang/Integer;)V

    .line 226
    invoke-virtual {v11, v4}, Lcom/blank/bm15/model/object/crud/Match;->setLocalQuarterThird(Ljava/lang/Integer;)V

    .line 227
    invoke-virtual {v11, v4}, Lcom/blank/bm15/model/object/crud/Match;->setVisitorExtension(Ljava/lang/Integer;)V

    .line 228
    invoke-virtual {v11, v4}, Lcom/blank/bm15/model/object/crud/Match;->setVisitorQuarterFirst(Ljava/lang/Integer;)V

    .line 229
    invoke-virtual {v11, v4}, Lcom/blank/bm15/model/object/crud/Match;->setVisitorQuarterFourth(Ljava/lang/Integer;)V

    .line 230
    invoke-virtual {v11, v4}, Lcom/blank/bm15/model/object/crud/Match;->setVisitorQuarterSecond(Ljava/lang/Integer;)V

    .line 231
    invoke-virtual {v11, v4}, Lcom/blank/bm15/model/object/crud/Match;->setVisitorQuarterThird(Ljava/lang/Integer;)V

    goto/16 :goto_1

    .line 233
    :cond_2
    invoke-interface {v14, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1
.end method

.method public static deletingOldSeason(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 6
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 163
    new-instance v1, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v1, v5}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 164
    .local v1, "matchResultFilter":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-virtual {v1, p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 165
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 167
    new-instance v2, Lcom/blank/bm15/model/object/crud/Offer;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v2, v5}, Lcom/blank/bm15/model/object/crud/Offer;-><init>(Landroid/content/Context;)V

    .line 168
    .local v2, "offerFilter":Lcom/blank/bm15/model/object/crud/Offer;
    invoke-virtual {v2, p0}, Lcom/blank/bm15/model/object/crud/Offer;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 169
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 171
    new-instance v4, Lcom/blank/bm15/model/object/crud/Trade;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/blank/bm15/model/object/crud/Trade;-><init>(Landroid/content/Context;)V

    .line 172
    .local v4, "trade":Lcom/blank/bm15/model/object/crud/Trade;
    invoke-virtual {v4, p0}, Lcom/blank/bm15/model/object/crud/Trade;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 173
    invoke-static {v4}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 175
    new-instance v3, Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v3, v5}, Lcom/blank/bm15/model/object/crud/Playoffs;-><init>(Landroid/content/Context;)V

    .line 176
    .local v3, "playoffsFilter":Lcom/blank/bm15/model/object/crud/Playoffs;
    invoke-virtual {v3, p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 177
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 179
    new-instance v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    .line 180
    .local v0, "draftRound":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 181
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 182
    return-void
.end method

.method public static updatingPlayers(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 24
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 28
    new-instance v4, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v4, v0}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 29
    .local v4, "filter":Lcom/blank/bm15/model/object/crud/Player;
    move-object/from16 v0, p0

    invoke-virtual {v4, v0}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 30
    invoke-static {v4}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v8

    .line 31
    .local v8, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .local v10, "removePlayersList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_0
    :goto_0
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-nez v20, :cond_4

    .line 74
    invoke-static {v8}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 77
    new-instance v6, Lcom/blank/bm15/model/object/crud/News;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v6, v0}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 78
    .local v6, "newsFilter":Lcom/blank/bm15/model/object/crud/News;
    move-object/from16 v0, p0

    invoke-virtual {v6, v0}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 79
    invoke-static {v6}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 81
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v19

    if-nez v19, :cond_3

    .line 82
    const-string v12, ""

    .line 83
    .local v12, "retiredPlayersUser":Ljava/lang/String;
    const-string v11, ""

    .line 84
    .local v11, "retiredPlayersOther":Ljava/lang/String;
    const-string v17, ""

    .line 85
    .local v17, "teamName":Ljava/lang/String;
    const-string v18, " "

    .line 87
    .local v18, "years":Ljava/lang/String;
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_1
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-nez v20, :cond_d

    .line 108
    invoke-static {v10}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 111
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v19

    if-lez v19, :cond_1

    .line 112
    new-instance v5, Lcom/blank/bm15/model/object/crud/News;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v5, v0}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 113
    .local v5, "news":Lcom/blank/bm15/model/object/crud/News;
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 114
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 115
    const v19, 0x7f02003a

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 116
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v19

    const v20, 0x7f05011f

    invoke-virtual/range {v19 .. v20}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 117
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v19

    const v20, 0x7f050123

    invoke-virtual/range {v19 .. v20}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object v12, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 118
    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 121
    .end local v5    # "news":Lcom/blank/bm15/model/object/crud/News;
    :cond_1
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v19

    if-lez v19, :cond_2

    .line 122
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v20

    const v21, 0x7f050121

    invoke-virtual/range {v20 .. v21}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "\n"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 123
    .local v2, "body":Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, "\n"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v20

    const v21, 0x7f050122

    invoke-virtual/range {v20 .. v21}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v20

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v21

    sub-int v20, v20, v21

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 124
    new-instance v5, Lcom/blank/bm15/model/object/crud/News;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v5, v0}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 125
    .restart local v5    # "news":Lcom/blank/bm15/model/object/crud/News;
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 126
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 127
    const v19, 0x7f02003a

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 128
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v19

    const v20, 0x7f050120

    invoke-virtual/range {v19 .. v20}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 129
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v19

    const v20, 0x7f050123

    invoke-virtual/range {v19 .. v20}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object v2, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 130
    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 133
    .end local v2    # "body":Ljava/lang/String;
    .end local v5    # "news":Lcom/blank/bm15/model/object/crud/News;
    :cond_2
    new-instance v15, Lcom/blank/bm15/model/object/crud/Tactic;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Lcom/blank/bm15/model/object/crud/Tactic;-><init>(Landroid/content/Context;)V

    .line 134
    .local v15, "tacticFilter":Lcom/blank/bm15/model/object/crud/Tactic;
    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 135
    invoke-static {v15}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v16

    .line 136
    .local v16, "tacticList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Tactic;>;"
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_2
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-nez v20, :cond_12

    .line 157
    invoke-static/range {v16 .. v16}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 159
    .end local v11    # "retiredPlayersOther":Ljava/lang/String;
    .end local v12    # "retiredPlayersUser":Ljava/lang/String;
    .end local v15    # "tacticFilter":Lcom/blank/bm15/model/object/crud/Tactic;
    .end local v16    # "tacticList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Tactic;>;"
    .end local v17    # "teamName":Ljava/lang/String;
    .end local v18    # "years":Ljava/lang/String;
    :cond_3
    return-void

    .line 33
    .end local v6    # "newsFilter":Lcom/blank/bm15/model/object/crud/News;
    :cond_4
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/blank/bm15/model/object/crud/Player;

    .line 34
    .local v7, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v9, 0x5

    .line 36
    .local v9, "probability":I
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v20

    const/16 v21, 0x1f4

    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_a

    .line 37
    const/4 v9, 0x1

    .line 46
    :cond_5
    :goto_3
    const/4 v3, 0x0

    .line 47
    .local v3, "extraProbabilityForFreeAgents":I
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v20

    if-nez v20, :cond_6

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v20

    const/16 v21, 0x28a

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_6

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    const/16 v21, 0x19

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_6

    .line 48
    const/4 v3, 0x3

    .line 50
    :cond_6
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    add-int/lit8 v20, v20, 0x28

    add-int v20, v20, v9

    add-int v13, v20, v3

    .line 52
    .local v13, "retirement":I
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    const/16 v21, 0x28

    move/from16 v0, v20

    move/from16 v1, v21

    if-gt v0, v1, :cond_7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    const/16 v21, 0x16

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_9

    int-to-double v0, v13

    move-wide/from16 v20, v0

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v22

    cmpl-double v20, v20, v22

    if-lez v20, :cond_9

    .line 54
    :cond_7
    const/16 v20, 0x1

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    const/16 v21, 0x5

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move/from16 v0, v20

    if-le v0, v9, :cond_8

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    const/16 v21, 0x28

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_9

    .line 55
    :cond_8
    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    :cond_9
    const/16 v20, 0x1e

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    const/16 v21, 0x46

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Lcom/blank/bm15/model/object/crud/Player;->setStateForm(Ljava/lang/Integer;)V

    .line 60
    const/16 v20, 0x63

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Lcom/blank/bm15/model/object/crud/Player;->setStateEnergy(Ljava/lang/Integer;)V

    .line 61
    const/16 v20, 0x0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Lcom/blank/bm15/model/object/crud/Player;->setStateInjury(Ljava/lang/Integer;)V

    .line 64
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    add-int/lit8 v20, v20, 0x1

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Lcom/blank/bm15/model/object/crud/Player;->setAge(Ljava/lang/Integer;)V

    .line 67
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getYearsExperience()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    add-int/lit8 v20, v20, 0x1

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Lcom/blank/bm15/model/object/crud/Player;->setYearsExperience(Ljava/lang/Integer;)V

    .line 70
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getYearsContract()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    if-lez v20, :cond_0

    .line 71
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getYearsContract()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    add-int/lit8 v20, v20, -0x1

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Lcom/blank/bm15/model/object/crud/Player;->setYearsContract(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 38
    .end local v3    # "extraProbabilityForFreeAgents":I
    .end local v13    # "retirement":I
    :cond_a
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v20

    const/16 v21, 0x226

    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_b

    .line 39
    const/4 v9, 0x2

    .line 40
    goto/16 :goto_3

    :cond_b
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v20

    const/16 v21, 0x258

    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_c

    .line 41
    const/4 v9, 0x3

    .line 42
    goto/16 :goto_3

    :cond_c
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v20

    const/16 v21, 0x28a

    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_5

    .line 43
    const/4 v9, 0x4

    goto/16 :goto_3

    .line 87
    .end local v7    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .end local v9    # "probability":I
    .restart local v6    # "newsFilter":Lcom/blank/bm15/model/object/crud/News;
    .restart local v11    # "retiredPlayersOther":Ljava/lang/String;
    .restart local v12    # "retiredPlayersUser":Ljava/lang/String;
    .restart local v17    # "teamName":Ljava/lang/String;
    .restart local v18    # "years":Ljava/lang/String;
    :cond_d
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/blank/bm15/model/object/crud/Player;

    .line 88
    .restart local v7    # "player":Lcom/blank/bm15/model/object/crud/Player;
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v21

    const v22, 0x7f050150

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 89
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v20

    if-eqz v20, :cond_f

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_f

    .line 90
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v20

    if-nez v20, :cond_e

    .line 91
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 92
    goto/16 :goto_1

    .line 93
    :cond_e
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, "\n"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 95
    goto/16 :goto_1

    .line 96
    :cond_f
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v20

    if-nez v20, :cond_10

    .line 97
    new-instance v20, Ljava/lang/StringBuilder;

    const-string v21, "("

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v21

    const v22, 0x7f050029

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ") "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 101
    :goto_4
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v20

    if-nez v20, :cond_11

    .line 102
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 103
    goto/16 :goto_1

    .line 99
    :cond_10
    new-instance v20, Ljava/lang/StringBuilder;

    const-string v21, "("

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ") "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    goto :goto_4

    .line 104
    :cond_11
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, "\n"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    goto/16 :goto_1

    .line 136
    .end local v7    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .restart local v15    # "tacticFilter":Lcom/blank/bm15/model/object/crud/Tactic;
    .restart local v16    # "tacticList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Tactic;>;"
    :cond_12
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/blank/bm15/model/object/crud/Tactic;

    .line 137
    .local v14, "tactic":Lcom/blank/bm15/model/object/crud/Tactic;
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularPointGuard(Ljava/lang/Integer;)V

    .line 138
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularShootingGuard(Ljava/lang/Integer;)V

    .line 139
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularSmallForward(Ljava/lang/Integer;)V

    .line 140
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularPowerForward(Ljava/lang/Integer;)V

    .line 141
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularCenter(Ljava/lang/Integer;)V

    .line 143
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReservePointGuard(Ljava/lang/Integer;)V

    .line 144
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveShootingGuard(Ljava/lang/Integer;)V

    .line 145
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveSmallForward(Ljava/lang/Integer;)V

    .line 146
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReservePowerForward(Ljava/lang/Integer;)V

    .line 147
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveCenter(Ljava/lang/Integer;)V

    .line 149
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticBenchImportance(Ljava/lang/Integer;)V

    .line 150
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticGameType(Ljava/lang/Integer;)V

    .line 151
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticShotIntPercent(Ljava/lang/Integer;)V

    .line 152
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticShotTriplePercent(Ljava/lang/Integer;)V

    .line 153
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarOne(Ljava/lang/Integer;)V

    .line 154
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarTwo(Ljava/lang/Integer;)V

    .line 155
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarThree(Ljava/lang/Integer;)V

    goto/16 :goto_2
.end method
