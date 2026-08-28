.class public Lcom/blank/bm15/model/core/ManageDraft;
.super Ljava/lang/Object;
.source "ManageDraft.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static calculatePositionSecond(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;
    .locals 8
    .param p0, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    const/4 v7, 0x5

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 320
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    .line 321
    .local v0, "aux":Ljava/lang/Integer;
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 322
    .local v1, "posicionSecundaria":Ljava/lang/Integer;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0x8

    if-le v3, v4, :cond_0

    .line 323
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 326
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x3

    if-ge v3, v4, :cond_1

    .line 327
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v5, :cond_2

    .line 328
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 340
    :cond_1
    :goto_0
    return-object v1

    .line 329
    :cond_2
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v7, :cond_3

    .line 330
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 331
    goto :goto_0

    .line 332
    :cond_3
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 333
    .local v2, "random":I
    if-ne v2, v6, :cond_4

    .line 334
    const/4 v2, -0x1

    .line 336
    :cond_4
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v3, v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0
.end method

.method private static changeSpecialPlayer(Lcom/blank/bm15/model/object/crud/Player;)I
    .locals 9
    .param p0, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x4

    const/4 v6, 0x5

    const/4 v5, 0x3

    const/4 v4, 0x1

    .line 242
    const/4 v1, 0x0

    .line 243
    .local v1, "specialBono":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPotential(Ljava/lang/Integer;)V

    .line 245
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x32

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 246
    .local v0, "random":I
    if-ne v0, v4, :cond_0

    .line 247
    const/4 v1, 0x2

    .line 248
    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPotential(Ljava/lang/Integer;)V

    .line 249
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionSecond(Ljava/lang/Integer;)V

    .line 250
    const/16 v2, 0x12

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setAge(Ljava/lang/Integer;)V

    .line 252
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x14

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 253
    if-ne v0, v4, :cond_1

    .line 254
    const-string v2, "Spud Webb"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 255
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    .line 316
    :cond_0
    :goto_0
    return v1

    .line 256
    :cond_1
    if-ne v0, v8, :cond_2

    .line 257
    const-string v2, "Magic Johnson"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 258
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto :goto_0

    .line 259
    :cond_2
    if-ne v0, v5, :cond_3

    .line 260
    const-string v2, "Allen Iverson"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 261
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto :goto_0

    .line 262
    :cond_3
    if-ne v0, v7, :cond_4

    .line 263
    const-string v2, "Oscar Robertson"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 264
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto :goto_0

    .line 265
    :cond_4
    if-ne v0, v6, :cond_5

    .line 266
    const-string v2, "John Stockton"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 267
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto :goto_0

    .line 268
    :cond_5
    const/4 v2, 0x6

    if-ne v0, v2, :cond_6

    .line 269
    const-string v2, "Pete Maravich"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 270
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto :goto_0

    .line 271
    :cond_6
    const/4 v2, 0x7

    if-ne v0, v2, :cond_7

    .line 272
    const-string v2, "Isiah Thomas"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 273
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto :goto_0

    .line 274
    :cond_7
    const/16 v2, 0x8

    if-ne v0, v2, :cond_8

    .line 275
    const-string v2, "Michael Jordan"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 276
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto :goto_0

    .line 277
    :cond_8
    const/16 v2, 0x9

    if-ne v0, v2, :cond_9

    .line 278
    const-string v2, "Larry Bird"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 279
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto :goto_0

    .line 280
    :cond_9
    const/16 v2, 0xa

    if-ne v0, v2, :cond_a

    .line 281
    const-string v2, "Scottie Pippen"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 282
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 283
    :cond_a
    const/16 v2, 0xb

    if-ne v0, v2, :cond_b

    .line 284
    const-string v2, "Len Bias"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 285
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 286
    :cond_b
    const/16 v2, 0xc

    if-ne v0, v2, :cond_c

    .line 287
    const-string v2, "Julius Erving"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 288
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 289
    :cond_c
    const/16 v2, 0xd

    if-ne v0, v2, :cond_d

    .line 290
    const-string v2, "Dominique Wilkins"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 291
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 292
    :cond_d
    const/16 v2, 0xe

    if-ne v0, v2, :cond_e

    .line 293
    const-string v2, "Charles Barkley"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 294
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 295
    :cond_e
    const/16 v2, 0xf

    if-ne v0, v2, :cond_f

    .line 296
    const-string v2, "Karl Malone"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 297
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 298
    :cond_f
    const/16 v2, 0x10

    if-ne v0, v2, :cond_10

    .line 299
    const-string v2, "Kevin McHale"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 300
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 301
    :cond_10
    const/16 v2, 0x11

    if-ne v0, v2, :cond_11

    .line 302
    const-string v2, "Shaquille O\u2019Neal"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 303
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 304
    :cond_11
    const/16 v2, 0x12

    if-ne v0, v2, :cond_12

    .line 305
    const-string v2, "Wilt Chamberlain"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 306
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 307
    :cond_12
    const/16 v2, 0x13

    if-ne v0, v2, :cond_13

    .line 308
    const-string v2, "Hakeem Olajuwon"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 309
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 310
    :cond_13
    const/16 v2, 0x14

    if-ne v0, v2, :cond_0

    .line 311
    const-string v2, "Kareem AbdulJabbar"

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 312
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    goto/16 :goto_0
.end method

.method private static createDraftPlayers(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 3
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 356
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 358
    .local v0, "addPlayerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v2, 0x5a

    if-lt v1, v2, :cond_0

    .line 362
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 363
    return-void

    .line 359
    :cond_0
    const/4 v2, 0x2

    if-ge v1, v2, :cond_1

    const/4 v2, 0x1

    :goto_1
    invoke-static {p0, v2}, Lcom/blank/bm15/model/core/ManageDraft;->createPlayer(Lcom/blank/bm15/model/object/crud/Game;Z)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 358
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 359
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private static createNews(Lcom/blank/bm15/model/object/crud/Game;IIILjava/lang/String;)V
    .locals 2
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "matchday"    # I
    .param p2, "type"    # I
    .param p3, "title"    # I
    .param p4, "body"    # Ljava/lang/String;

    .prologue
    .line 366
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 367
    .local v0, "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 368
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 369
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 370
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 371
    invoke-virtual {v0, p4}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 373
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 374
    return-void
.end method

.method public static createPlayer(Lcom/blank/bm15/model/object/crud/Game;Z)Lcom/blank/bm15/model/object/crud/Player;
    .locals 11
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "special"    # Z

    .prologue
    const/4 v10, 0x5

    const/4 v9, 0x1

    const/4 v6, 0x0

    const/16 v8, 0x20

    const/16 v7, 0xf

    .line 201
    new-instance v3, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 202
    .local v3, "team":Lcom/blank/bm15/model/object/crud/Team;
    const/4 v4, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/blank/bm15/model/object/crud/Team;->setId(Ljava/lang/Integer;)V

    .line 204
    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 205
    .local v1, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v1, p0}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 206
    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 207
    invoke-static {}, Lcom/blank/bm15/model/generator/Names;->getFullName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 208
    const/4 v4, 0x2

    invoke-static {v4}, Lcom/blank/bm15/model/util/Util;->getRandomPotential(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setPotential(Ljava/lang/Integer;)V

    .line 209
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    .line 210
    invoke-static {v1}, Lcom/blank/bm15/model/core/ManageDraft;->calculatePositionSecond(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setPositionSecond(Ljava/lang/Integer;)V

    .line 211
    const/16 v4, 0x12

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v5, 0x17

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setAge(Ljava/lang/Integer;)V

    .line 212
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setStateInjury(Ljava/lang/Integer;)V

    .line 213
    const/16 v4, 0x63

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setStateEnergy(Ljava/lang/Integer;)V

    .line 214
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    .line 215
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setLoyalty(Ljava/lang/Integer;)V

    .line 216
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setYearsExperience(Ljava/lang/Integer;)V

    .line 217
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setYearsContract(Ljava/lang/Integer;)V

    .line 218
    const/16 v4, 0x1e

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v5, 0x46

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setStateForm(Ljava/lang/Integer;)V

    .line 220
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0x12

    if-le v4, v5, :cond_0

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x6

    if-le v4, v5, :cond_0

    .line 221
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setAge(Ljava/lang/Integer;)V

    .line 224
    :cond_0
    const/4 v2, 0x0

    .line 225
    .local v2, "specialBono":I
    if-eqz p1, :cond_1

    .line 226
    invoke-static {v1}, Lcom/blank/bm15/model/core/ManageDraft;->changeSpecialPlayer(Lcom/blank/bm15/model/object/crud/Player;)I

    move-result v2

    .line 228
    :cond_1
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v5, 0xa

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 229
    .local v0, "baseSkill":I
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4, v9}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v4, v0

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    add-int/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setSkillPhysique(Ljava/lang/Integer;)V

    .line 230
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x2

    invoke-static {v4, v5}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v4, v0

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    add-int/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setSkillBlock(Ljava/lang/Integer;)V

    .line 231
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x3

    invoke-static {v4, v5}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v4, v0

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    add-int/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setSkillSteal(Ljava/lang/Integer;)V

    .line 232
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x4

    invoke-static {v4, v5}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v4, v0

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    add-int/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setSkillRebound(Ljava/lang/Integer;)V

    .line 233
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4, v10}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v4, v0

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    add-int/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setSkillPass(Ljava/lang/Integer;)V

    .line 234
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x6

    invoke-static {v4, v5}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v4, v0

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    add-int/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotInterior(Ljava/lang/Integer;)V

    .line 235
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x7

    invoke-static {v4, v5}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v4, v0

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    add-int/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotExterior(Ljava/lang/Integer;)V

    .line 236
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0x8

    invoke-static {v4, v5}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v4, v0

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    add-int/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotFree(Ljava/lang/Integer;)V

    .line 238
    return-object v1
.end method

.method public static finishDraft(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 9
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 69
    const/4 v4, 0x2

    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-static {p0, v4, v5}, Lcom/blank/bm15/model/core/ManageDraft;->playDraft(Lcom/blank/bm15/model/object/crud/Game;IZ)V

    .line 71
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 72
    .local v0, "filter":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 73
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getDraftPlayers(Lcom/blank/bm15/model/object/crud/Player;)Ljava/util/List;

    move-result-object v3

    .line 74
    .local v3, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v4, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v5, 0x0

    const/4 v6, -0x1

    invoke-direct {v4, v5, v6}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v3, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 76
    const/4 v1, 0x0

    .line 77
    .local v1, "i":I
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 84
    :goto_0
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 86
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const v5, 0x7f02003a

    const v6, 0x7f05012a

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v7

    const v8, 0x7f05012b

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {p0, v4, v5, v6, v7}, Lcom/blank/bm15/model/core/ManageDraft;->createNews(Lcom/blank/bm15/model/object/crud/Game;IIILjava/lang/String;)V

    .line 87
    return-void

    .line 77
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Player;

    .line 78
    .local v2, "player":Lcom/blank/bm15/model/object/crud/Player;
    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 80
    add-int/lit8 v1, v1, 0x1

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0xf

    if-le v1, v5, :cond_0

    goto :goto_0
.end method

.method public static getDraftClassification(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;
    .locals 13
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/Classification;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v12, 0x3

    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 144
    new-instance v5, Lcom/blank/bm15/model/object/other/Classification;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v5, v8}, Lcom/blank/bm15/model/object/other/Classification;-><init>(Landroid/content/Context;)V

    .line 145
    .local v5, "classification":Lcom/blank/bm15/model/object/other/Classification;
    invoke-virtual {v5, p0}, Lcom/blank/bm15/model/object/other/Classification;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 146
    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDaoExtra;->getDraft(Lcom/blank/bm15/model/object/other/Classification;)Ljava/util/List;

    move-result-object v4

    .line 148
    .local v4, "auxAllList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 149
    .local v0, "aux1List":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    invoke-interface {v4, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    invoke-interface {v4, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    invoke-interface {v4, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    invoke-static {v0}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 155
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .local v1, "aux2List":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    const/4 v8, 0x4

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    const/4 v8, 0x5

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    const/4 v8, 0x6

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    const/4 v8, 0x7

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    invoke-static {v1}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 162
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 163
    .local v2, "aux3List":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    const/16 v8, 0x8

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 164
    const/16 v8, 0x9

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    const/16 v8, 0xa

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    const/16 v8, 0xb

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    invoke-static {v2}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 169
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 170
    .local v3, "aux4List":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    const/16 v8, 0xc

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    const/16 v8, 0xd

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    const/16 v8, 0xe

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    const/16 v8, 0xf

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    invoke-static {v3}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 176
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 177
    .local v7, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 182
    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 183
    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    invoke-interface {v2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    invoke-interface {v2, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    invoke-interface {v2, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 189
    invoke-interface {v3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    invoke-interface {v3, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    invoke-interface {v3, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    invoke-interface {v3, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    const/16 v6, 0x10

    .local v6, "i":I
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    if-lt v6, v8, :cond_0

    .line 197
    return-object v7

    .line 194
    :cond_0
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/other/Classification;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    add-int/lit8 v6, v6, 0x1

    goto :goto_0
.end method

.method public static manageRound1(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 12
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    const/4 v11, 0x1

    .line 25
    invoke-static {p0}, Lcom/blank/bm15/model/core/ManageDraft;->createDraftPlayers(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 27
    const/4 v3, 0x1

    .line 28
    .local v3, "i":I
    const-string v0, ""

    .line 29
    .local v0, "body":Ljava/lang/String;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .local v2, "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    invoke-static {p0}, Lcom/blank/bm15/model/core/ManageDraft;->getDraftClassification(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_0

    .line 40
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 42
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const v6, 0x7f02003a

    const v7, 0x7f050126

    invoke-static {p0, v5, v6, v7, v0}, Lcom/blank/bm15/model/core/ManageDraft;->createNews(Lcom/blank/bm15/model/object/crud/Game;IIILjava/lang/String;)V

    .line 44
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-static {p0, v11, v5}, Lcom/blank/bm15/model/core/ManageDraft;->playDraft(Lcom/blank/bm15/model/object/crud/Game;IZ)V

    .line 45
    return-void

    .line 30
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/other/Classification;

    .line 31
    .local v1, "classification":Lcom/blank/bm15/model/object/other/Classification;
    const-string v6, ""

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 32
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 35
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v7

    const v8, 0x7f050128

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    new-array v8, v11, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getDraftRound1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 37
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getDraftRound1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v6

    add-int/lit8 v4, v3, 0x1

    .end local v3    # "i":I
    .local v4, "i":I
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/blank/bm15/model/object/crud/DraftRound;->setPosition(Ljava/lang/Integer;)V

    .line 38
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getDraftRound1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v3, v4

    .end local v4    # "i":I
    .restart local v3    # "i":I
    goto/16 :goto_0
.end method

.method public static manageRound2(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 11
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 48
    const/4 v3, 0x1

    .line 49
    .local v3, "i":I
    const-string v0, ""

    .line 50
    .local v0, "body":Ljava/lang/String;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .local v2, "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    invoke-static {p0}, Lcom/blank/bm15/model/core/ManageDraft;->getDraftClassification(Lcom/blank/bm15/model/object/crud/Game;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_0

    .line 61
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 63
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const v6, 0x7f02003a

    const v7, 0x7f050127

    invoke-static {p0, v5, v6, v7, v0}, Lcom/blank/bm15/model/core/ManageDraft;->createNews(Lcom/blank/bm15/model/object/crud/Game;IIILjava/lang/String;)V

    .line 65
    const/4 v5, 0x2

    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-static {p0, v5, v6}, Lcom/blank/bm15/model/core/ManageDraft;->playDraft(Lcom/blank/bm15/model/object/crud/Game;IZ)V

    .line 66
    return-void

    .line 51
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/other/Classification;

    .line 52
    .local v1, "classification":Lcom/blank/bm15/model/object/other/Classification;
    const-string v6, ""

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 53
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 56
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v7

    const v8, 0x7f050128

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getDraftRound2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 58
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getDraftRound2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v6

    add-int/lit8 v4, v3, 0x1

    .end local v3    # "i":I
    .local v4, "i":I
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/blank/bm15/model/object/crud/DraftRound;->setPosition(Ljava/lang/Integer;)V

    .line 59
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getDraftRound2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v3, v4

    .end local v4    # "i":I
    .restart local v3    # "i":I
    goto/16 :goto_0
.end method

.method private static needsThatPlayer(Lcom/blank/bm15/model/object/crud/Player;IIIII)Z
    .locals 1
    .param p0, "player"    # Lcom/blank/bm15/model/object/crud/Player;
    .param p1, "pos1"    # I
    .param p2, "pos2"    # I
    .param p3, "pos3"    # I
    .param p4, "pos4"    # I
    .param p5, "pos5"    # I

    .prologue
    .line 344
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, p1, :cond_0

    .line 345
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, p2, :cond_0

    .line 346
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, p3, :cond_0

    .line 347
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, p4, :cond_0

    .line 348
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, p5, :cond_1

    .line 349
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 352
    :goto_0
    return v0

    :cond_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_0
.end method

.method public static playDraft(Lcom/blank/bm15/model/object/crud/Game;IZ)V
    .locals 17
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "round"    # I
    .param p2, "breakOnTeamOfUser"    # Z

    .prologue
    .line 90
    new-instance v8, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v8, v1}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    .line 91
    .local v8, "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    move-object/from16 v0, p0

    invoke-virtual {v8, v0}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 92
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v8, v1}, Lcom/blank/bm15/model/object/crud/DraftRound;->setRound(Ljava/lang/Integer;)V

    .line 93
    invoke-static {v8}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v9

    .line 94
    .local v9, "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 95
    .local v10, "draftRoundToDeleteList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    new-instance v1, Lcom/blank/bm15/model/comparator/DraftRoundComparator;

    const/4 v14, 0x0

    const/4 v15, 0x1

    invoke-direct {v1, v14, v15}, Lcom/blank/bm15/model/comparator/DraftRoundComparator;-><init>(II)V

    invoke-static {v9, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 97
    new-instance v12, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v12, v1}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 98
    .local v12, "playerFilter":Lcom/blank/bm15/model/object/crud/Player;
    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 99
    const/4 v13, 0x0

    .line 101
    .local v13, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_0
    :goto_0
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_2

    .line 140
    :cond_1
    invoke-static {v10}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 141
    return-void

    .line 101
    :cond_2
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 102
    .local v7, "draftRound":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-static {v12}, Lcom/blank/bm15/dao/BlankDaoExtra;->getDraftPlayers(Lcom/blank/bm15/model/object/crud/Player;)Ljava/util/List;

    move-result-object v13

    .line 103
    new-instance v1, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v15, 0x0

    const/16 v16, -0x1

    move/from16 v0, v16

    invoke-direct {v1, v15, v0}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v13, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 105
    const/4 v11, 0x0

    .line 106
    .local v11, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    if-ne v1, v15, :cond_3

    .line 107
    if-nez p2, :cond_1

    .line 132
    :goto_1
    if-eqz v11, :cond_0

    .line 133
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v11, v1}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 134
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/DraftRound;->getRound()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/DraftRound;->getPosition()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    invoke-static {v11, v1, v15}, Lcom/blank/bm15/model/core/ManageDraft;->setDraftPlayerSalaryAndYearsContract(Lcom/blank/bm15/model/object/crud/Player;II)V

    .line 135
    invoke-static {v11}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 137
    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 110
    :cond_3
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/DraftRound;->getPosition()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v15, 0x4

    if-ge v1, v15, :cond_4

    .line 111
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v15, 0x2

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-static {v1, v15}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "player":Lcom/blank/bm15/model/object/crud/Player;
    check-cast v11, Lcom/blank/bm15/model/object/crud/Player;

    .line 112
    .restart local v11    # "player":Lcom/blank/bm15/model/object/crud/Player;
    goto :goto_1

    .line 113
    :cond_4
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    const/4 v15, 0x1

    invoke-virtual {v1, v15}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v1

    const/4 v15, 0x1

    if-gt v1, v15, :cond_5

    const/4 v2, 0x1

    .line 114
    .local v2, "pos1":I
    :goto_2
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    const/4 v15, 0x2

    invoke-virtual {v1, v15}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v1

    const/4 v15, 0x1

    if-gt v1, v15, :cond_6

    const/4 v3, 0x2

    .line 115
    .local v3, "pos2":I
    :goto_3
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    const/4 v15, 0x3

    invoke-virtual {v1, v15}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v1

    const/4 v15, 0x1

    if-gt v1, v15, :cond_7

    const/4 v4, 0x3

    .line 116
    .local v4, "pos3":I
    :goto_4
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    const/4 v15, 0x4

    invoke-virtual {v1, v15}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v1

    const/4 v15, 0x1

    if-gt v1, v15, :cond_8

    const/4 v5, 0x4

    .line 117
    .local v5, "pos4":I
    :goto_5
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    const/4 v15, 0x5

    invoke-virtual {v1, v15}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v1

    const/4 v15, 0x1

    if-gt v1, v15, :cond_9

    const/4 v6, 0x5

    .line 119
    .local v6, "pos5":I
    :goto_6
    const/4 v1, 0x0

    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Player;

    invoke-static/range {v1 .. v6}, Lcom/blank/bm15/model/core/ManageDraft;->needsThatPlayer(Lcom/blank/bm15/model/object/crud/Player;IIIII)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 120
    const/4 v1, 0x0

    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "player":Lcom/blank/bm15/model/object/crud/Player;
    check-cast v11, Lcom/blank/bm15/model/object/crud/Player;

    .line 121
    .restart local v11    # "player":Lcom/blank/bm15/model/object/crud/Player;
    goto/16 :goto_1

    .line 113
    .end local v2    # "pos1":I
    .end local v3    # "pos2":I
    .end local v4    # "pos3":I
    .end local v5    # "pos4":I
    .end local v6    # "pos5":I
    :cond_5
    const/4 v2, 0x0

    goto :goto_2

    .line 114
    .restart local v2    # "pos1":I
    :cond_6
    const/4 v3, 0x0

    goto :goto_3

    .line 115
    .restart local v3    # "pos2":I
    :cond_7
    const/4 v4, 0x0

    goto :goto_4

    .line 116
    .restart local v4    # "pos3":I
    :cond_8
    const/4 v5, 0x0

    goto :goto_5

    .line 117
    .restart local v5    # "pos4":I
    :cond_9
    const/4 v6, 0x0

    goto :goto_6

    .line 121
    .restart local v6    # "pos5":I
    :cond_a
    const/4 v1, 0x1

    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Player;

    invoke-static/range {v1 .. v6}, Lcom/blank/bm15/model/core/ManageDraft;->needsThatPlayer(Lcom/blank/bm15/model/object/crud/Player;IIIII)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 122
    const/4 v1, 0x1

    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "player":Lcom/blank/bm15/model/object/crud/Player;
    check-cast v11, Lcom/blank/bm15/model/object/crud/Player;

    .line 123
    .restart local v11    # "player":Lcom/blank/bm15/model/object/crud/Player;
    goto/16 :goto_1

    :cond_b
    const/4 v1, 0x2

    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Player;

    invoke-static/range {v1 .. v6}, Lcom/blank/bm15/model/core/ManageDraft;->needsThatPlayer(Lcom/blank/bm15/model/object/crud/Player;IIIII)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 124
    const/4 v1, 0x2

    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "player":Lcom/blank/bm15/model/object/crud/Player;
    check-cast v11, Lcom/blank/bm15/model/object/crud/Player;

    .line 125
    .restart local v11    # "player":Lcom/blank/bm15/model/object/crud/Player;
    goto/16 :goto_1

    :cond_c
    const/4 v1, 0x3

    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Player;

    invoke-static/range {v1 .. v6}, Lcom/blank/bm15/model/core/ManageDraft;->needsThatPlayer(Lcom/blank/bm15/model/object/crud/Player;IIIII)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 126
    const/4 v1, 0x3

    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "player":Lcom/blank/bm15/model/object/crud/Player;
    check-cast v11, Lcom/blank/bm15/model/object/crud/Player;

    .line 127
    .restart local v11    # "player":Lcom/blank/bm15/model/object/crud/Player;
    goto/16 :goto_1

    .line 128
    :cond_d
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v15, 0x2

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-static {v1, v15}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "player":Lcom/blank/bm15/model/object/crud/Player;
    check-cast v11, Lcom/blank/bm15/model/object/crud/Player;

    .restart local v11    # "player":Lcom/blank/bm15/model/object/crud/Player;
    goto/16 :goto_1
.end method

.method public static setDraftPlayerSalaryAndYearsContract(Lcom/blank/bm15/model/object/crud/Player;II)V
    .locals 2
    .param p0, "player"    # Lcom/blank/bm15/model/object/crud/Player;
    .param p1, "round"    # I
    .param p2, "pick"    # I

    .prologue
    .line 377
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 378
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setYearsContract(Ljava/lang/Integer;)V

    .line 380
    packed-switch p2, :pswitch_data_0

    .line 446
    :goto_0
    return-void

    .line 381
    :pswitch_0
    const v0, 0x5b8d80

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto :goto_0

    .line 383
    :pswitch_1
    const v0, 0x53ec60

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto :goto_0

    .line 385
    :pswitch_2
    const v0, 0x44aa20

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto :goto_0

    .line 387
    :pswitch_3
    const v0, 0x40d990

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto :goto_0

    .line 389
    :pswitch_4
    const v0, 0x3d0900

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto :goto_0

    .line 391
    :pswitch_5
    const v0, 0x393870

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto :goto_0

    .line 393
    :pswitch_6
    const v0, 0x3567e0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto :goto_0

    .line 395
    :pswitch_7
    const v0, 0x319750

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto :goto_0

    .line 397
    :pswitch_8
    const v0, 0x2dc6c0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto :goto_0

    .line 399
    :pswitch_9
    const v0, 0x29f630

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto :goto_0

    .line 401
    :pswitch_a
    const v0, 0x2625a0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto :goto_0

    .line 403
    :pswitch_b
    const v0, 0x225510

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 405
    :pswitch_c
    const v0, 0x1e8480

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 407
    :pswitch_d
    const v0, 0x1b7740

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 409
    :pswitch_e
    const v0, 0x186a00

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 411
    :pswitch_f
    const v0, 0x155cc0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 413
    :pswitch_10
    const v0, 0x124f80

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 415
    :pswitch_11
    const v0, 0xf4240

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 417
    :pswitch_12
    const v0, 0xe7ef0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 419
    :pswitch_13
    const v0, 0xdbba0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 421
    :pswitch_14
    const v0, 0xcf850

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 423
    :pswitch_15
    const v0, 0xc3500

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 425
    :pswitch_16
    const v0, 0xb71b0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 427
    :pswitch_17
    const v0, 0xaae60

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 429
    :pswitch_18
    const v0, 0x9eb10

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 431
    :pswitch_19
    const v0, 0x927c0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 433
    :pswitch_1a
    const v0, 0x86470

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 435
    :pswitch_1b
    const v0, 0x7a120

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 437
    :pswitch_1c
    const v0, 0x6ddd0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 439
    :pswitch_1d
    const v0, 0x61a80

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 443
    :cond_0
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setYearsContract(Ljava/lang/Integer;)V

    .line 444
    const v0, 0x4a768

    mul-int/lit16 v1, p2, 0x1388

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 380
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
    .end packed-switch
.end method
