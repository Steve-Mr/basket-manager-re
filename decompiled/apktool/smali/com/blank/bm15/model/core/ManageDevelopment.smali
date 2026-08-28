.class public Lcom/blank/bm15/model/core/ManageDevelopment;
.super Ljava/lang/Object;
.source "ManageDevelopment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static changePotential(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 4
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 156
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int v0, v1, v2

    .line 157
    .local v0, "newPotential":I
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 158
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/blank/bm15/model/object/crud/Player;->setPotential(Ljava/lang/Integer;)V

    .line 160
    :cond_0
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
    .line 244
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 245
    .local v0, "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 246
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 247
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 248
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 249
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 251
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 252
    return-void
.end method

.method private static developDecrement(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 2
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 152
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/blank/bm15/model/core/ManageDevelopment;->developRulete(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;ZI)V

    .line 153
    return-void
.end method

.method private static developIncrement(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 2
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 148
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/blank/bm15/model/core/ManageDevelopment;->developRulete(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;ZI)V

    .line 149
    return-void
.end method

.method private static developRulete(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;ZI)V
    .locals 9
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;
    .param p2, "increment"    # Z
    .param p3, "recursivity"    # I

    .prologue
    const/16 v8, 0x8

    const/16 v7, 0x63

    const/4 v3, -0x1

    const/4 v6, 0x3

    const/4 v2, 0x1

    .line 163
    invoke-static {p1, v8}, Lcom/blank/bm15/model/core/ManageDevelopment;->getSumBaseOfPositions(Lcom/blank/bm15/model/object/crud/Player;I)I

    move-result v1

    .line 164
    .local v1, "total":I
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 166
    .local v0, "random":I
    invoke-static {p1, v2}, Lcom/blank/bm15/model/core/ManageDevelopment;->getSumBaseOfPositions(Lcom/blank/bm15/model/object/crud/Player;I)I

    move-result v4

    if-gt v0, v4, :cond_3

    .line 167
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPhysique()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v7, :cond_1

    if-ge p3, v6, :cond_1

    .line 168
    add-int/lit8 p3, p3, 0x1

    invoke-static {p0, p1, p2, p3}, Lcom/blank/bm15/model/core/ManageDevelopment;->developRulete(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;ZI)V

    .line 215
    :cond_0
    :goto_0
    return-void

    .line 170
    :cond_1
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPhysique()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz p2, :cond_2

    :goto_1
    add-int/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillPhysique(Ljava/lang/Integer;)V

    goto :goto_0

    :cond_2
    move v2, v3

    goto :goto_1

    .line 172
    :cond_3
    const/4 v4, 0x2

    invoke-static {p1, v4}, Lcom/blank/bm15/model/core/ManageDevelopment;->getSumBaseOfPositions(Lcom/blank/bm15/model/object/crud/Player;I)I

    move-result v4

    if-gt v0, v4, :cond_6

    .line 173
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillBlock()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v7, :cond_4

    if-ge p3, v6, :cond_4

    .line 174
    add-int/lit8 p3, p3, 0x1

    invoke-static {p0, p1, p2, p3}, Lcom/blank/bm15/model/core/ManageDevelopment;->developRulete(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;ZI)V

    goto :goto_0

    .line 176
    :cond_4
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillBlock()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz p2, :cond_5

    :goto_2
    add-int/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillBlock(Ljava/lang/Integer;)V

    goto :goto_0

    :cond_5
    move v2, v3

    goto :goto_2

    .line 178
    :cond_6
    invoke-static {p1, v6}, Lcom/blank/bm15/model/core/ManageDevelopment;->getSumBaseOfPositions(Lcom/blank/bm15/model/object/crud/Player;I)I

    move-result v4

    if-gt v0, v4, :cond_9

    .line 179
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillSteal()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v7, :cond_7

    if-ge p3, v6, :cond_7

    .line 180
    add-int/lit8 p3, p3, 0x1

    invoke-static {p0, p1, p2, p3}, Lcom/blank/bm15/model/core/ManageDevelopment;->developRulete(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;ZI)V

    goto :goto_0

    .line 182
    :cond_7
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillSteal()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz p2, :cond_8

    :goto_3
    add-int/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillSteal(Ljava/lang/Integer;)V

    goto :goto_0

    :cond_8
    move v2, v3

    goto :goto_3

    .line 184
    :cond_9
    const/4 v4, 0x4

    invoke-static {p1, v4}, Lcom/blank/bm15/model/core/ManageDevelopment;->getSumBaseOfPositions(Lcom/blank/bm15/model/object/crud/Player;I)I

    move-result v4

    if-gt v0, v4, :cond_c

    .line 185
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillRebound()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v7, :cond_a

    if-ge p3, v6, :cond_a

    .line 186
    add-int/lit8 p3, p3, 0x1

    invoke-static {p0, p1, p2, p3}, Lcom/blank/bm15/model/core/ManageDevelopment;->developRulete(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;ZI)V

    goto/16 :goto_0

    .line 188
    :cond_a
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillRebound()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz p2, :cond_b

    :goto_4
    add-int/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillRebound(Ljava/lang/Integer;)V

    goto/16 :goto_0

    :cond_b
    move v2, v3

    goto :goto_4

    .line 190
    :cond_c
    const/4 v4, 0x5

    invoke-static {p1, v4}, Lcom/blank/bm15/model/core/ManageDevelopment;->getSumBaseOfPositions(Lcom/blank/bm15/model/object/crud/Player;I)I

    move-result v4

    if-gt v0, v4, :cond_f

    .line 191
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPass()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v7, :cond_d

    if-ge p3, v6, :cond_d

    .line 192
    add-int/lit8 p3, p3, 0x1

    invoke-static {p0, p1, p2, p3}, Lcom/blank/bm15/model/core/ManageDevelopment;->developRulete(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;ZI)V

    goto/16 :goto_0

    .line 194
    :cond_d
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPass()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz p2, :cond_e

    :goto_5
    add-int/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillPass(Ljava/lang/Integer;)V

    goto/16 :goto_0

    :cond_e
    move v2, v3

    goto :goto_5

    .line 196
    :cond_f
    const/4 v4, 0x6

    invoke-static {p1, v4}, Lcom/blank/bm15/model/core/ManageDevelopment;->getSumBaseOfPositions(Lcom/blank/bm15/model/object/crud/Player;I)I

    move-result v4

    if-gt v0, v4, :cond_12

    .line 197
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotInterior()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v7, :cond_10

    if-ge p3, v6, :cond_10

    .line 198
    add-int/lit8 p3, p3, 0x1

    invoke-static {p0, p1, p2, p3}, Lcom/blank/bm15/model/core/ManageDevelopment;->developRulete(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;ZI)V

    goto/16 :goto_0

    .line 200
    :cond_10
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotInterior()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz p2, :cond_11

    :goto_6
    add-int/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotInterior(Ljava/lang/Integer;)V

    goto/16 :goto_0

    :cond_11
    move v2, v3

    goto :goto_6

    .line 202
    :cond_12
    const/4 v4, 0x7

    invoke-static {p1, v4}, Lcom/blank/bm15/model/core/ManageDevelopment;->getSumBaseOfPositions(Lcom/blank/bm15/model/object/crud/Player;I)I

    move-result v4

    if-gt v0, v4, :cond_15

    .line 203
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotExterior()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v7, :cond_13

    if-ge p3, v6, :cond_13

    .line 204
    add-int/lit8 p3, p3, 0x1

    invoke-static {p0, p1, p2, p3}, Lcom/blank/bm15/model/core/ManageDevelopment;->developRulete(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;ZI)V

    goto/16 :goto_0

    .line 206
    :cond_13
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotExterior()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz p2, :cond_14

    :goto_7
    add-int/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotExterior(Ljava/lang/Integer;)V

    goto/16 :goto_0

    :cond_14
    move v2, v3

    goto :goto_7

    .line 208
    :cond_15
    invoke-static {p1, v8}, Lcom/blank/bm15/model/core/ManageDevelopment;->getSumBaseOfPositions(Lcom/blank/bm15/model/object/crud/Player;I)I

    move-result v4

    if-gt v0, v4, :cond_0

    .line 209
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotFree()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v7, :cond_16

    if-ge p3, v6, :cond_16

    .line 210
    add-int/lit8 p3, p3, 0x1

    invoke-static {p0, p1, p2, p3}, Lcom/blank/bm15/model/core/ManageDevelopment;->developRulete(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;ZI)V

    goto/16 :goto_0

    .line 212
    :cond_16
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotFree()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz p2, :cond_17

    :goto_8
    add-int/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotFree(Ljava/lang/Integer;)V

    goto/16 :goto_0

    :cond_17
    move v2, v3

    goto :goto_8
.end method

.method private static getPlayersToDevelop(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;
    .locals 10
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ">;"
        }
    .end annotation

    .prologue
    .line 125
    new-instance v5, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v5, v8}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 126
    .local v5, "pFilter":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v5, p0}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 127
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 128
    .local v7, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v0

    .line 130
    .local v0, "auxPlayerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    const-string v3, ""

    .line 131
    .local v3, "idPlayer":Ljava/lang/String;
    const-string v4, ""

    .line 132
    .local v4, "idPlayerEnd":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v8}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 133
    .local v1, "idCurrentMatchday":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 135
    .local v2, "idCurrentMatchdayEnd":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_1

    .line 144
    return-object v7

    .line 135
    :cond_1
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/blank/bm15/model/object/crud/Player;

    .line 136
    .local v6, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v9}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 137
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v3, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 139
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 140
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private static getSumBaseOfPositions(Lcom/blank/bm15/model/object/crud/Player;I)I
    .locals 9
    .param p0, "player"    # Lcom/blank/bm15/model/object/crud/Player;
    .param p1, "numSkill"    # I

    .prologue
    const/4 v8, 0x5

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 218
    const/4 v1, 0x0

    .line 220
    .local v1, "result":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    if-le v0, p1, :cond_0

    .line 240
    return v1

    .line 221
    :cond_0
    if-ne v0, v4, :cond_2

    .line 222
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2, v4}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0xf

    add-int/2addr v1, v2

    .line 220
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 223
    :cond_2
    if-ne v0, v5, :cond_3

    .line 224
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2, v5}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0xf

    add-int/2addr v1, v2

    .line 225
    goto :goto_1

    :cond_3
    if-ne v0, v6, :cond_4

    .line 226
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2, v6}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0xf

    add-int/2addr v1, v2

    .line 227
    goto :goto_1

    :cond_4
    if-ne v0, v7, :cond_5

    .line 228
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2, v7}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0xf

    add-int/2addr v1, v2

    .line 229
    goto :goto_1

    :cond_5
    if-ne v0, v8, :cond_6

    .line 230
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2, v8}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0xf

    add-int/2addr v1, v2

    .line 231
    goto :goto_1

    :cond_6
    const/4 v2, 0x6

    if-ne v0, v2, :cond_7

    .line 232
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x6

    invoke-static {v2, v3}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0xf

    add-int/2addr v1, v2

    .line 233
    goto :goto_1

    :cond_7
    const/4 v2, 0x7

    if-ne v0, v2, :cond_8

    .line 234
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x7

    invoke-static {v2, v3}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0xf

    add-int/2addr v1, v2

    .line 235
    goto/16 :goto_1

    :cond_8
    const/16 v2, 0x8

    if-ne v0, v2, :cond_1

    .line 236
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x8

    invoke-static {v2, v3}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0xf

    add-int/2addr v1, v2

    goto/16 :goto_1
.end method

.method public static manage(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 28
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 21
    invoke-static/range {p0 .. p0}, Lcom/blank/bm15/model/core/ManageDevelopment;->getPlayersToDevelop(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;

    move-result-object v21

    .line 22
    .local v21, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    const/4 v10, 0x0

    .line 23
    .local v10, "matchResultList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/MatchResult;>;"
    new-instance v12, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v12, v2}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 24
    .local v12, "mrFilter":Lcom/blank/bm15/model/object/crud/MatchResult;
    const/4 v13, 0x0

    .line 26
    .local v13, "mrTotal":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v25

    :cond_0
    :goto_0
    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 121
    invoke-static/range {v21 .. v21}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 122
    return-void

    .line 26
    :cond_1
    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/blank/bm15/model/object/crud/Player;

    .line 27
    .local v20, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v15, 0x0

    .line 28
    .local v15, "oldPotential":I
    const/16 v16, 0x0

    .line 29
    .local v16, "oldRating":I
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v2, v3, :cond_2

    .line 30
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v15

    .line 31
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v2

    invoke-static {v2}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v16

    .line 34
    :cond_2
    move-object/from16 v0, v20

    invoke-virtual {v12, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setPlayer(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 35
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v12, v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->setMatchday(Ljava/lang/Integer;)V

    .line 36
    invoke-static {v12}, Lcom/blank/bm15/dao/BlankDaoExtra;->getDevelopPlayer(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v10

    .line 39
    new-instance v13, Lcom/blank/bm15/model/object/crud/MatchResult;

    .end local v13    # "mrTotal":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v13, v2}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 40
    .restart local v13    # "mrTotal":Lcom/blank/bm15/model/object/crud/MatchResult;
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v13, v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->setMatches(Ljava/lang/Integer;)V

    .line 41
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_a

    .line 46
    const/4 v9, 0x3

    .line 47
    .local v9, "loops":I
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x4

    if-gt v2, v3, :cond_b

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x1e

    if-ge v2, v3, :cond_b

    .line 48
    const/4 v9, 0x0

    .line 59
    :cond_3
    :goto_2
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    const-wide v26, 0x4056800000000000L    # 90.0

    cmpl-double v2, v2, v26

    if-lez v2, :cond_4

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x1e

    if-ge v2, v3, :cond_4

    .line 60
    add-int/lit8 v9, v9, -0x1

    .line 63
    :cond_4
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x15

    if-ge v2, v3, :cond_5

    .line 64
    add-int/lit8 v9, v9, 0x1

    .line 68
    :cond_5
    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_f

    const/4 v11, 0x0

    .line 69
    .local v11, "minutesAverage":I
    :goto_3
    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_10

    const-wide/16 v18, 0x0

    .line 71
    .local v18, "perAverage":D
    :goto_4
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_5
    if-lt v8, v9, :cond_11

    .line 92
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0xc8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_6

    .line 93
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/blank/bm15/model/core/ManageDevelopment;->changePotential(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;)V

    .line 97
    :cond_6
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x64

    if-gt v2, v3, :cond_7

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPhysique()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/2addr v3, v7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x2

    if-ge v2, v3, :cond_8

    .line 98
    :cond_7
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/blank/bm15/model/core/ManageDevelopment;->developDecrement(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;)V

    .line 102
    :cond_8
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 103
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eq v2, v15, :cond_9

    .line 104
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-le v2, v15, :cond_16

    const v4, 0x7f020039

    .line 105
    .local v4, "type":I
    :goto_6
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-le v2, v15, :cond_17

    const v5, 0x7f050135

    .line 106
    .local v5, "title":I
    :goto_7
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-le v2, v15, :cond_18

    const v6, 0x7f050136

    .line 108
    .local v6, "body":I
    :goto_8
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v2, 0x1

    new-array v7, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v26

    aput-object v26, v7, v2

    move-object/from16 v2, p0

    invoke-static/range {v2 .. v7}, Lcom/blank/bm15/model/core/ManageDevelopment;->createNews(Lcom/blank/bm15/model/object/crud/Game;IIII[Ljava/lang/Object;)V

    .line 111
    .end local v4    # "type":I
    .end local v5    # "title":I
    .end local v6    # "body":I
    :cond_9
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v2

    invoke-static {v2}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v14

    .line 112
    .local v14, "newRating":I
    move/from16 v0, v16

    if-eq v14, v0, :cond_0

    .line 113
    move/from16 v0, v16

    if-le v14, v0, :cond_19

    const v4, 0x7f020039

    .line 114
    .restart local v4    # "type":I
    :goto_9
    move/from16 v0, v16

    if-le v14, v0, :cond_1a

    const v5, 0x7f050131

    .line 115
    .restart local v5    # "title":I
    :goto_a
    move/from16 v0, v16

    if-le v14, v0, :cond_1b

    const v6, 0x7f050132

    .line 117
    .restart local v6    # "body":I
    :goto_b
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v2, 0x3

    new-array v7, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v26

    aput-object v26, v7, v2

    const/4 v2, 0x1

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-static/range {v26 .. v26}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    aput-object v26, v7, v2

    const/4 v2, 0x2

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-static/range {v26 .. v26}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    aput-object v26, v7, v2

    move-object/from16 v2, p0

    invoke-static/range {v2 .. v7}, Lcom/blank/bm15/model/core/ManageDevelopment;->createNews(Lcom/blank/bm15/model/object/crud/Game;IIII[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 41
    .end local v4    # "type":I
    .end local v5    # "title":I
    .end local v6    # "body":I
    .end local v8    # "i":I
    .end local v9    # "loops":I
    .end local v11    # "minutesAverage":I
    .end local v14    # "newRating":I
    .end local v18    # "perAverage":D
    :cond_a
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/blank/bm15/model/object/crud/MatchResult;

    .line 42
    .local v17, "other":Lcom/blank/bm15/model/object/crud/MatchResult;
    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->addMatchResult(Lcom/blank/bm15/model/object/crud/MatchResult;)V

    goto/16 :goto_1

    .line 49
    .end local v17    # "other":Lcom/blank/bm15/model/object/crud/MatchResult;
    .restart local v9    # "loops":I
    :cond_b
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x6

    if-gt v2, v3, :cond_c

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x1e

    if-ge v2, v3, :cond_c

    .line 50
    const/4 v9, 0x1

    .line 51
    goto/16 :goto_2

    :cond_c
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x8

    if-gt v2, v3, :cond_d

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x1e

    if-ge v2, v3, :cond_d

    .line 52
    const/4 v9, 0x2

    .line 53
    goto/16 :goto_2

    :cond_d
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x9

    if-gt v2, v3, :cond_e

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x1e

    if-ge v2, v3, :cond_e

    .line 54
    const/4 v9, 0x4

    .line 55
    goto/16 :goto_2

    :cond_e
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xa

    if-gt v2, v3, :cond_3

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x1e

    if-ge v2, v3, :cond_3

    .line 56
    const/4 v9, 0x5

    goto/16 :goto_2

    .line 68
    :cond_f
    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMinutesPlayed()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    div-int v11, v2, v3

    goto/16 :goto_3

    .line 69
    .restart local v11    # "minutesAverage":I
    :cond_10
    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPer()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    int-to-double v0, v7

    move-wide/from16 v26, v0

    div-double v18, v2, v26

    goto/16 :goto_4

    .line 72
    .restart local v8    # "i":I
    .restart local v18    # "perAverage":D
    :cond_11
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0xa

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v24

    .line 75
    .local v24, "randomPotential":I
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x1e

    if-lt v2, v3, :cond_12

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, -0x4

    move/from16 v0, v24

    if-ge v0, v2, :cond_15

    .line 76
    :cond_12
    move-wide/from16 v0, v18

    double-to-int v2, v0

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    rsub-int/lit8 v7, v7, 0x1e

    mul-int/2addr v3, v7

    add-int/2addr v3, v11

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/16 v7, 0x96

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v3, v7}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int v23, v2, v3

    .line 79
    .local v23, "randomDevelopment":I
    const/16 v2, 0x8a

    move/from16 v0, v23

    if-le v0, v2, :cond_14

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0xa

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x6

    if-ge v2, v3, :cond_13

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    const-wide/high16 v26, 0x4053000000000000L    # 76.0

    cmpl-double v2, v2, v26

    if-gez v2, :cond_14

    .line 80
    :cond_13
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/blank/bm15/model/core/ManageDevelopment;->developIncrement(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;)V

    .line 71
    .end local v23    # "randomDevelopment":I
    :cond_14
    :goto_c
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_5

    .line 82
    :cond_15
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x1e

    if-le v2, v3, :cond_14

    .line 83
    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v2, v11

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x8c

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v22

    .line 85
    .local v22, "random":I
    const/16 v2, 0x37

    move/from16 v0, v22

    if-ge v0, v2, :cond_14

    .line 86
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/blank/bm15/model/core/ManageDevelopment;->developDecrement(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;)V

    goto :goto_c

    .line 104
    .end local v22    # "random":I
    .end local v24    # "randomPotential":I
    :cond_16
    const v4, 0x7f020038

    goto/16 :goto_6

    .line 105
    .restart local v4    # "type":I
    :cond_17
    const v5, 0x7f050137

    goto/16 :goto_7

    .line 106
    .restart local v5    # "title":I
    :cond_18
    const v6, 0x7f050138

    goto/16 :goto_8

    .line 113
    .end local v4    # "type":I
    .end local v5    # "title":I
    .restart local v14    # "newRating":I
    :cond_19
    const v4, 0x7f020038

    goto/16 :goto_9

    .line 114
    .restart local v4    # "type":I
    :cond_1a
    const v5, 0x7f050133

    goto/16 :goto_a

    .line 115
    .restart local v5    # "title":I
    :cond_1b
    const v6, 0x7f050134

    goto/16 :goto_b
.end method
