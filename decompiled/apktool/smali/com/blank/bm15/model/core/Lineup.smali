.class public Lcom/blank/bm15/model/core/Lineup;
.super Ljava/lang/Object;
.source "Lineup.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getBestPlayer(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;
    .locals 9
    .param p0, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    const/4 v8, 0x0

    .line 256
    const-wide/16 v4, 0x0

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 257
    .local v1, "bestValue":Ljava/lang/Double;
    const/4 v0, 0x0

    .line 259
    .local v0, "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersRemains()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 268
    return-object v0

    .line 259
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Player;

    .line 260
    .local v2, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-nez v4, :cond_0

    .line 261
    invoke-virtual {v2, v8}, Lcom/blank/bm15/model/object/crud/Player;->getMatchValue(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    cmpl-double v4, v4, v6

    if-lez v4, :cond_0

    .line 262
    invoke-virtual {v2, v8}, Lcom/blank/bm15/model/object/crud/Player;->getMatchValue(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v1

    .line 263
    move-object v0, v2

    goto :goto_0
.end method

.method private static getBestPlayerForPositionFirst(Lcom/blank/bm15/model/object/crud/Team;II)Lcom/blank/bm15/model/object/crud/Player;
    .locals 9
    .param p0, "team"    # Lcom/blank/bm15/model/object/crud/Team;
    .param p1, "pos"    # I
    .param p2, "minEnergy"    # I

    .prologue
    const/4 v8, 0x0

    .line 238
    const-wide/16 v4, 0x0

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 239
    .local v1, "bestValue":Ljava/lang/Double;
    const/4 v0, 0x0

    .line 241
    .local v0, "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersRemains()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 252
    return-object v0

    .line 241
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Player;

    .line 242
    .local v2, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, p1, :cond_0

    .line 243
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-nez v4, :cond_0

    .line 244
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lt v4, p2, :cond_0

    .line 245
    invoke-virtual {v2, v8}, Lcom/blank/bm15/model/object/crud/Player;->getMatchValue(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    cmpl-double v4, v4, v6

    if-lez v4, :cond_0

    .line 246
    invoke-virtual {v2, v8}, Lcom/blank/bm15/model/object/crud/Player;->getMatchValue(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v1

    .line 247
    move-object v0, v2

    goto :goto_0
.end method

.method private static getPlayersWithTwoPositions(Lcom/blank/bm15/model/object/crud/Team;I)Ljava/util/List;
    .locals 4
    .param p0, "team"    # Lcom/blank/bm15/model/object/crud/Team;
    .param p1, "minEnergy"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Team;",
            "I)",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ">;"
        }
    .end annotation

    .prologue
    .line 272
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 274
    .local v1, "players":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersRemains()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 282
    return-object v1

    .line 274
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 275
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eqz v3, :cond_0

    .line 276
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-nez v3, :cond_0

    .line 277
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-lt v3, p1, :cond_0

    .line 278
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public static removeAll(Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Boolean;)V
    .locals 2
    .param p0, "team"    # Lcom/blank/bm15/model/object/crud/Team;
    .param p1, "save"    # Ljava/lang/Boolean;

    .prologue
    const/4 v1, 0x0

    .line 46
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    .line 48
    .local v0, "tactic":Lcom/blank/bm15/model/object/crud/Tactic;
    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularPointGuard(Ljava/lang/Integer;)V

    .line 49
    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularShootingGuard(Ljava/lang/Integer;)V

    .line 50
    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularSmallForward(Ljava/lang/Integer;)V

    .line 51
    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularPowerForward(Ljava/lang/Integer;)V

    .line 52
    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularCenter(Ljava/lang/Integer;)V

    .line 54
    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReservePointGuard(Ljava/lang/Integer;)V

    .line 55
    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveShootingGuard(Ljava/lang/Integer;)V

    .line 56
    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveSmallForward(Ljava/lang/Integer;)V

    .line 57
    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReservePowerForward(Ljava/lang/Integer;)V

    .line 58
    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveCenter(Ljava/lang/Integer;)V

    .line 60
    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarOne(Ljava/lang/Integer;)V

    .line 61
    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarTwo(Ljava/lang/Integer;)V

    .line 62
    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarThree(Ljava/lang/Integer;)V

    .line 65
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 66
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 68
    :cond_0
    return-void
.end method

.method public static setBetterLineup(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 24
    .param p0, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 71
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v17

    .line 72
    .local v17, "tactic":Lcom/blank/bm15/model/object/crud/Tactic;
    const/16 v19, 0x2d

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    const/16 v20, 0x37

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v16

    .line 73
    .local v16, "randomTitulars":Ljava/lang/Integer;
    const/16 v19, 0x19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    const/16 v20, 0x23

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v15

    .line 75
    .local v15, "randomReserves":Ljava/lang/Integer;
    const/4 v13, 0x0

    .line 76
    .local v13, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/16 v18, 0x0

    .line 77
    .local v18, "worst":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v4, 0x0

    .line 78
    .local v4, "auxFirst":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v5, 0x0

    .line 80
    .local v5, "auxSecond":Lcom/blank/bm15/model/object/crud/Player;
    sget-object v19, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/blank/bm15/model/core/Lineup;->removeAll(Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Boolean;)V

    .line 83
    const/16 v19, 0x1

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayerForPositionFirst(Lcom/blank/bm15/model/object/crud/Team;II)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    .line 84
    if-nez v13, :cond_d

    const/16 v19, 0x0

    :goto_0
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularPointGuard(Ljava/lang/Integer;)V

    .line 85
    const/16 v19, 0x2

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayerForPositionFirst(Lcom/blank/bm15/model/object/crud/Team;II)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    .line 86
    if-nez v13, :cond_e

    const/16 v19, 0x0

    :goto_1
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularShootingGuard(Ljava/lang/Integer;)V

    .line 87
    const/16 v19, 0x3

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayerForPositionFirst(Lcom/blank/bm15/model/object/crud/Team;II)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    .line 88
    if-nez v13, :cond_f

    const/16 v19, 0x0

    :goto_2
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularSmallForward(Ljava/lang/Integer;)V

    .line 89
    const/16 v19, 0x4

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayerForPositionFirst(Lcom/blank/bm15/model/object/crud/Team;II)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    .line 90
    if-nez v13, :cond_10

    const/16 v19, 0x0

    :goto_3
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularPowerForward(Ljava/lang/Integer;)V

    .line 91
    const/16 v19, 0x5

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayerForPositionFirst(Lcom/blank/bm15/model/object/crud/Team;II)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    .line 92
    if-nez v13, :cond_11

    const/16 v19, 0x0

    :goto_4
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularCenter(Ljava/lang/Integer;)V

    .line 95
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-static {v0, v1}, Lcom/blank/bm15/model/core/Lineup;->getPlayersWithTwoPositions(Lcom/blank/bm15/model/object/crud/Team;I)Ljava/util/List;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_0
    :goto_5
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-nez v20, :cond_12

    .line 119
    const/16 v19, 0x1

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayerForPositionFirst(Lcom/blank/bm15/model/object/crud/Team;II)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    .line 120
    if-nez v13, :cond_17

    const/16 v19, 0x0

    :goto_6
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReservePointGuard(Ljava/lang/Integer;)V

    .line 121
    const/16 v19, 0x2

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayerForPositionFirst(Lcom/blank/bm15/model/object/crud/Team;II)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    .line 122
    if-nez v13, :cond_18

    const/16 v19, 0x0

    :goto_7
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveShootingGuard(Ljava/lang/Integer;)V

    .line 123
    const/16 v19, 0x3

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayerForPositionFirst(Lcom/blank/bm15/model/object/crud/Team;II)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    .line 124
    if-nez v13, :cond_19

    const/16 v19, 0x0

    :goto_8
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveSmallForward(Ljava/lang/Integer;)V

    .line 125
    const/16 v19, 0x4

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayerForPositionFirst(Lcom/blank/bm15/model/object/crud/Team;II)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    .line 126
    if-nez v13, :cond_1a

    const/16 v19, 0x0

    :goto_9
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReservePowerForward(Ljava/lang/Integer;)V

    .line 127
    const/16 v19, 0x5

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayerForPositionFirst(Lcom/blank/bm15/model/object/crud/Team;II)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    .line 128
    if-nez v13, :cond_1b

    const/16 v19, 0x0

    :goto_a
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveCenter(Ljava/lang/Integer;)V

    .line 131
    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-static {v0, v1}, Lcom/blank/bm15/model/core/Lineup;->getPlayersWithTwoPositions(Lcom/blank/bm15/model/object/crud/Team;I)Ljava/util/List;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_1
    :goto_b
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-nez v20, :cond_1c

    .line 155
    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/model/core/Lineup;->validateTeam(Lcom/blank/bm15/model/object/crud/Team;)Z

    move-result v19

    if-nez v19, :cond_b

    .line 156
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularPointGuard()Ljava/lang/Integer;

    move-result-object v19

    if-nez v19, :cond_2

    .line 157
    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayer(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    .line 158
    .local v6, "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    if-eqz v6, :cond_2

    .line 159
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularPointGuard(Ljava/lang/Integer;)V

    .line 162
    .end local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    :cond_2
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularShootingGuard()Ljava/lang/Integer;

    move-result-object v19

    if-nez v19, :cond_3

    .line 163
    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayer(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    .line 164
    .restart local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    if-eqz v6, :cond_3

    .line 165
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularShootingGuard(Ljava/lang/Integer;)V

    .line 168
    .end local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    :cond_3
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularSmallForward()Ljava/lang/Integer;

    move-result-object v19

    if-nez v19, :cond_4

    .line 169
    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayer(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    .line 170
    .restart local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    if-eqz v6, :cond_4

    .line 171
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularSmallForward(Ljava/lang/Integer;)V

    .line 174
    .end local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    :cond_4
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularPowerForward()Ljava/lang/Integer;

    move-result-object v19

    if-nez v19, :cond_5

    .line 175
    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayer(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    .line 176
    .restart local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    if-eqz v6, :cond_5

    .line 177
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularPowerForward(Ljava/lang/Integer;)V

    .line 180
    .end local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    :cond_5
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularCenter()Ljava/lang/Integer;

    move-result-object v19

    if-nez v19, :cond_6

    .line 181
    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayer(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    .line 182
    .restart local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    if-eqz v6, :cond_6

    .line 183
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularCenter(Ljava/lang/Integer;)V

    .line 186
    .end local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    :cond_6
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReservePointGuard()Ljava/lang/Integer;

    move-result-object v19

    if-nez v19, :cond_7

    .line 187
    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayer(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    .line 188
    .restart local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    if-eqz v6, :cond_7

    .line 189
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReservePointGuard(Ljava/lang/Integer;)V

    .line 192
    .end local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    :cond_7
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveShootingGuard()Ljava/lang/Integer;

    move-result-object v19

    if-nez v19, :cond_8

    .line 193
    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayer(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    .line 194
    .restart local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    if-eqz v6, :cond_8

    .line 195
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveShootingGuard(Ljava/lang/Integer;)V

    .line 198
    .end local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    :cond_8
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveSmallForward()Ljava/lang/Integer;

    move-result-object v19

    if-nez v19, :cond_9

    .line 199
    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayer(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    .line 200
    .restart local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    if-eqz v6, :cond_9

    .line 201
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveSmallForward(Ljava/lang/Integer;)V

    .line 204
    .end local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    :cond_9
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReservePowerForward()Ljava/lang/Integer;

    move-result-object v19

    if-nez v19, :cond_a

    .line 205
    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayer(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    .line 206
    .restart local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    if-eqz v6, :cond_a

    .line 207
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReservePowerForward(Ljava/lang/Integer;)V

    .line 210
    .end local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    :cond_a
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveCenter()Ljava/lang/Integer;

    move-result-object v19

    if-nez v19, :cond_b

    .line 211
    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/model/core/Lineup;->getBestPlayer(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    .line 212
    .restart local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    if-eqz v6, :cond_b

    .line 213
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveCenter(Ljava/lang/Integer;)V

    .line 218
    .end local v6    # "bestPlayer":Lcom/blank/bm15/model/object/crud/Player;
    :cond_b
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersInLineup()Ljava/util/List;

    move-result-object v7

    .line 219
    .local v7, "lineupPlayers":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v19, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/16 v20, 0x0

    const/16 v21, -0x1

    invoke-direct/range {v19 .. v21}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    move-object/from16 v0, v19

    invoke-static {v7, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 220
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_c
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-nez v20, :cond_21

    .line 233
    :cond_c
    invoke-static/range {v17 .. v17}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 234
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Tactic;->reloadPlayers()V

    .line 235
    return-void

    .line 84
    .end local v7    # "lineupPlayers":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    :cond_d
    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    goto/16 :goto_0

    .line 86
    :cond_e
    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    goto/16 :goto_1

    .line 88
    :cond_f
    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    goto/16 :goto_2

    .line 90
    :cond_10
    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    goto/16 :goto_3

    .line 92
    :cond_11
    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    goto/16 :goto_4

    .line 95
    :cond_12
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/blank/bm15/model/object/crud/Player;

    .line 96
    .local v14, "playerWithTwoPositions":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPlayer(I)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v4

    .line 97
    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPlayer(I)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v5

    .line 99
    if-nez v4, :cond_13

    .line 100
    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v14, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setTitularPosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto/16 :goto_5

    .line 101
    :cond_13
    if-nez v5, :cond_14

    .line 102
    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v14, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setTitularPosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto/16 :goto_5

    .line 104
    :cond_14
    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Player;->getMatchValue(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v20

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Lcom/blank/bm15/model/object/crud/Player;->getMatchValue(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v22

    sub-double v8, v20, v22

    .line 105
    .local v8, "difFirst":D
    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Player;->getMatchValue(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v20

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v5, v0}, Lcom/blank/bm15/model/object/crud/Player;->getMatchValue(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v22

    sub-double v10, v20, v22

    .line 107
    .local v10, "difSecond":D
    const-wide/16 v20, 0x0

    cmpl-double v20, v8, v20

    if-gtz v20, :cond_15

    const-wide/16 v20, 0x0

    cmpl-double v20, v10, v20

    if-lez v20, :cond_0

    .line 108
    :cond_15
    cmpl-double v20, v8, v10

    if-ltz v20, :cond_16

    .line 109
    move-object/from16 v18, v4

    .line 113
    :goto_d
    invoke-virtual/range {v17 .. v18}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v14, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setTitularPosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto/16 :goto_5

    .line 111
    :cond_16
    move-object/from16 v18, v5

    goto :goto_d

    .line 120
    .end local v8    # "difFirst":D
    .end local v10    # "difSecond":D
    .end local v14    # "playerWithTwoPositions":Lcom/blank/bm15/model/object/crud/Player;
    :cond_17
    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    goto/16 :goto_6

    .line 122
    :cond_18
    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    goto/16 :goto_7

    .line 124
    :cond_19
    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    goto/16 :goto_8

    .line 126
    :cond_1a
    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    goto/16 :goto_9

    .line 128
    :cond_1b
    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v19

    goto/16 :goto_a

    .line 131
    :cond_1c
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/blank/bm15/model/object/crud/Player;

    .line 132
    .restart local v14    # "playerWithTwoPositions":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePlayer(I)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v4

    .line 133
    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePlayer(I)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v5

    .line 135
    if-nez v4, :cond_1d

    .line 136
    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v14, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setReservePosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto/16 :goto_b

    .line 137
    :cond_1d
    if-nez v5, :cond_1e

    .line 138
    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v14, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setReservePosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto/16 :goto_b

    .line 140
    :cond_1e
    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Player;->getMatchValue(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v20

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Lcom/blank/bm15/model/object/crud/Player;->getMatchValue(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v22

    sub-double v8, v20, v22

    .line 141
    .restart local v8    # "difFirst":D
    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/blank/bm15/model/object/crud/Player;->getMatchValue(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v20

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v5, v0}, Lcom/blank/bm15/model/object/crud/Player;->getMatchValue(Ljava/lang/Integer;)Ljava/lang/Double;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v22

    sub-double v10, v20, v22

    .line 143
    .restart local v10    # "difSecond":D
    const-wide/16 v20, 0x0

    cmpl-double v20, v8, v20

    if-gtz v20, :cond_1f

    const-wide/16 v20, 0x0

    cmpl-double v20, v10, v20

    if-lez v20, :cond_1

    .line 144
    :cond_1f
    cmpl-double v20, v8, v10

    if-ltz v20, :cond_20

    .line 145
    move-object/from16 v18, v4

    .line 149
    :goto_e
    invoke-virtual/range {v17 .. v18}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v14, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setReservePosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto/16 :goto_b

    .line 147
    :cond_20
    move-object/from16 v18, v5

    goto :goto_e

    .line 220
    .end local v8    # "difFirst":D
    .end local v10    # "difSecond":D
    .end local v14    # "playerWithTwoPositions":Lcom/blank/bm15/model/object/crud/Player;
    .restart local v7    # "lineupPlayers":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    :cond_21
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/blank/bm15/model/object/crud/Player;

    .line 221
    .local v12, "obj":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarOne()Ljava/lang/Integer;

    move-result-object v20

    if-nez v20, :cond_22

    .line 222
    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarOne(Ljava/lang/Integer;)V

    goto/16 :goto_c

    .line 223
    :cond_22
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarTwo()Ljava/lang/Integer;

    move-result-object v20

    if-nez v20, :cond_23

    .line 224
    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarTwo(Ljava/lang/Integer;)V

    goto/16 :goto_c

    .line 225
    :cond_23
    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarThree()Ljava/lang/Integer;

    move-result-object v20

    if-nez v20, :cond_c

    .line 226
    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarThree(Ljava/lang/Integer;)V

    goto/16 :goto_c
.end method

.method private static validatePlayerInTeam(Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 4
    .param p0, "team"    # Lcom/blank/bm15/model/object/crud/Team;
    .param p1, "matchPositionPlayerId"    # Ljava/lang/Integer;

    .prologue
    .line 286
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_1

    .line 287
    :cond_0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 296
    :goto_0
    return-object v1

    .line 289
    :cond_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_3

    .line 296
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 289
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 290
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 291
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v2, v3, :cond_2

    .line 292
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_2

    .line 293
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static validateTeam(Lcom/blank/bm15/model/object/crud/Team;)Z
    .locals 2
    .param p0, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 18
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    .line 20
    .local v0, "tactic":Lcom/blank/bm15/model/object/crud/Tactic;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularPointGuard()Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/blank/bm15/model/core/Lineup;->validatePlayerInTeam(Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    .line 21
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 42
    :goto_0
    return v1

    .line 22
    :cond_0
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularShootingGuard()Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/blank/bm15/model/core/Lineup;->validatePlayerInTeam(Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_1

    .line 23
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_0

    .line 24
    :cond_1
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularSmallForward()Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/blank/bm15/model/core/Lineup;->validatePlayerInTeam(Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_2

    .line 25
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_0

    .line 26
    :cond_2
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularPowerForward()Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/blank/bm15/model/core/Lineup;->validatePlayerInTeam(Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_3

    .line 27
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_0

    .line 28
    :cond_3
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupTitularCenter()Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/blank/bm15/model/core/Lineup;->validatePlayerInTeam(Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_4

    .line 29
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_0

    .line 30
    :cond_4
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReservePointGuard()Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/blank/bm15/model/core/Lineup;->validatePlayerInTeam(Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_5

    .line 31
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_0

    .line 32
    :cond_5
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveShootingGuard()Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/blank/bm15/model/core/Lineup;->validatePlayerInTeam(Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_6

    .line 33
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_0

    .line 34
    :cond_6
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveSmallForward()Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/blank/bm15/model/core/Lineup;->validatePlayerInTeam(Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_7

    .line 35
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto/16 :goto_0

    .line 36
    :cond_7
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReservePowerForward()Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/blank/bm15/model/core/Lineup;->validatePlayerInTeam(Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_8

    .line 37
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto/16 :goto_0

    .line 38
    :cond_8
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getLineupReserveCenter()Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/blank/bm15/model/core/Lineup;->validatePlayerInTeam(Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_9

    .line 39
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto/16 :goto_0

    .line 42
    :cond_9
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto/16 :goto_0
.end method
