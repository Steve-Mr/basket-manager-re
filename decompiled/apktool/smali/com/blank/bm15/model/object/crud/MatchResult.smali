.class public Lcom/blank/bm15/model/object/crud/MatchResult;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "MatchResult.java"


# instance fields
.field private blocks:Ljava/lang/Double;

.field private foulsMade:Ljava/lang/Double;

.field private game:Lcom/blank/bm15/model/object/crud/Game;

.field private match:Lcom/blank/bm15/model/object/crud/Match;

.field private matchday:Ljava/lang/Integer;

.field private minutesPlayed:Ljava/lang/Integer;

.field private name:Ljava/lang/String;

.field private passesKo:Ljava/lang/Double;

.field private passesOk:Ljava/lang/Double;

.field private player:Lcom/blank/bm15/model/object/crud/Player;

.field private rebounds:Ljava/lang/Double;

.field private shotsExteriorDoubleKo:Ljava/lang/Double;

.field private shotsExteriorDoubleOk:Ljava/lang/Double;

.field private shotsExteriorTripleKo:Ljava/lang/Double;

.field private shotsExteriorTripleOk:Ljava/lang/Double;

.field private shotsFreeKo:Ljava/lang/Double;

.field private shotsFreeOk:Ljava/lang/Double;

.field private shotsInteriorKo:Ljava/lang/Double;

.field private shotsInteriorOk:Ljava/lang/Double;

.field private steals:Ljava/lang/Double;

.field private tempMatches:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 40
    return-void
.end method


# virtual methods
.method public addBlock()V
    .locals 1

    .prologue
    .line 334
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocks()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setBlocks(Ljava/lang/Double;)V

    .line 335
    return-void
.end method

.method public addFoulMade()V
    .locals 1

    .prologue
    .line 330
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getFoulsMade()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setFoulsMade(Ljava/lang/Double;)V

    .line 331
    return-void
.end method

.method public addMatchResult(Lcom/blank/bm15/model/object/crud/MatchResult;)V
    .locals 2
    .param p1, "other"    # Lcom/blank/bm15/model/object/crud/MatchResult;

    .prologue
    .line 282
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocksInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocksInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setBlocks(Ljava/lang/Double;)V

    .line 283
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getFoulsMadeInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getFoulsMadeInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setFoulsMade(Ljava/lang/Double;)V

    .line 284
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMinutesPlayed()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMinutesPlayed()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setMinutesPlayed(Ljava/lang/Integer;)V

    .line 285
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesKoInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesKoInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setPassesKo(Ljava/lang/Double;)V

    .line 286
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOkInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOkInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setPassesOk(Ljava/lang/Double;)V

    .line 287
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getReboundsInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getReboundsInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setRebounds(Ljava/lang/Double;)V

    .line 288
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorDoubleKoInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorDoubleKoInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsExteriorDoubleKo(Ljava/lang/Double;)V

    .line 289
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorDoubleOkInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorDoubleOkInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsExteriorDoubleOk(Ljava/lang/Double;)V

    .line 290
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorTripleKoInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorTripleKoInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsExteriorTripleKo(Ljava/lang/Double;)V

    .line 291
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorTripleOkInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorTripleOkInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsExteriorTripleOk(Ljava/lang/Double;)V

    .line 292
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsFreeKoInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsFreeKoInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsFreeKo(Ljava/lang/Double;)V

    .line 293
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsFreeOkInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsFreeOkInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsFreeOk(Ljava/lang/Double;)V

    .line 294
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsInteriorKoInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsInteriorKoInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsInteriorKo(Ljava/lang/Double;)V

    .line 295
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsInteriorOkInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsInteriorOkInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsInteriorOk(Ljava/lang/Double;)V

    .line 296
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getStealsInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getStealsInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setSteals(Ljava/lang/Double;)V

    .line 297
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setMatches(Ljava/lang/Integer;)V

    .line 298
    return-void
.end method

.method public addPassKO()V
    .locals 1

    .prologue
    .line 350
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesKo()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setPassesKo(Ljava/lang/Double;)V

    .line 351
    return-void
.end method

.method public addPassOK()V
    .locals 1

    .prologue
    .line 346
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOk()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setPassesOk(Ljava/lang/Double;)V

    .line 347
    return-void
.end method

.method public addRebound()V
    .locals 1

    .prologue
    .line 342
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getRebounds()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setRebounds(Ljava/lang/Double;)V

    .line 343
    return-void
.end method

.method public addShotExteriorDoubleKo()V
    .locals 1

    .prologue
    .line 374
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorDoubleKo()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsExteriorDoubleKo(Ljava/lang/Double;)V

    .line 375
    return-void
.end method

.method public addShotExteriorDoubleOk()V
    .locals 1

    .prologue
    .line 370
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorDoubleOk()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsExteriorDoubleOk(Ljava/lang/Double;)V

    .line 371
    return-void
.end method

.method public addShotExteriorTripleKo()V
    .locals 1

    .prologue
    .line 382
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorTripleKo()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsExteriorTripleKo(Ljava/lang/Double;)V

    .line 383
    return-void
.end method

.method public addShotExteriorTripleOk()V
    .locals 1

    .prologue
    .line 378
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorTripleOk()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsExteriorTripleOk(Ljava/lang/Double;)V

    .line 379
    return-void
.end method

.method public addShotsFreeKo()V
    .locals 1

    .prologue
    .line 358
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsFreeKo()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsFreeKo(Ljava/lang/Double;)V

    .line 359
    return-void
.end method

.method public addShotsFreeOk()V
    .locals 1

    .prologue
    .line 354
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsFreeOk()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsFreeOk(Ljava/lang/Double;)V

    .line 355
    return-void
.end method

.method public addShotsInteriorKo()V
    .locals 1

    .prologue
    .line 366
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsInteriorKo()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsInteriorKo(Ljava/lang/Double;)V

    .line 367
    return-void
.end method

.method public addShotsInteriorOk()V
    .locals 1

    .prologue
    .line 362
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsInteriorOk()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setShotsInteriorOk(Ljava/lang/Double;)V

    .line 363
    return-void
.end method

.method public addSteal()V
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getSteals()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setSteals(Ljava/lang/Double;)V

    .line 339
    return-void
.end method

.method public getBlocks()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->blocks:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 75
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->blocks:Ljava/lang/Double;

    .line 77
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->blocks:Ljava/lang/Double;

    return-object v0
.end method

.method public getBlocksInt()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 386
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocks()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getFoulsMade()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->foulsMade:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 86
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->foulsMade:Ljava/lang/Double;

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->foulsMade:Ljava/lang/Double;

    return-object v0
.end method

.method public getFoulsMadeInt()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 390
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getFoulsMade()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getGame()Lcom/blank/bm15/model/object/crud/Game;
    .locals 2

    .prologue
    .line 228
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->game:Lcom/blank/bm15/model/object/crud/Game;

    if-nez v0, :cond_1

    .line 229
    new-instance v0, Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 233
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->game:Lcom/blank/bm15/model/object/crud/Game;

    return-object v0

    .line 230
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getMatch()Lcom/blank/bm15/model/object/crud/Match;
    .locals 2

    .prologue
    .line 241
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->match:Lcom/blank/bm15/model/object/crud/Match;

    if-nez v0, :cond_1

    .line 242
    new-instance v0, Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->match:Lcom/blank/bm15/model/object/crud/Match;

    .line 246
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->match:Lcom/blank/bm15/model/object/crud/Match;

    return-object v0

    .line 243
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->match:Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Match;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 244
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->match:Lcom/blank/bm15/model/object/crud/Match;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getMatchday()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->matchday:Ljava/lang/Integer;

    return-object v0
.end method

.method public getMatches()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 267
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->tempMatches:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 268
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->tempMatches:Ljava/lang/Integer;

    .line 270
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->tempMatches:Ljava/lang/Integer;

    return-object v0
.end method

.method public getMinutesPlayed()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->minutesPlayed:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 64
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->minutesPlayed:Ljava/lang/Integer;

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->minutesPlayed:Ljava/lang/Integer;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPassesKo()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 107
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->passesKo:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 108
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->passesKo:Ljava/lang/Double;

    .line 110
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->passesKo:Ljava/lang/Double;

    return-object v0
.end method

.method public getPassesKoInt()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 398
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesKo()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getPassesOk()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->passesOk:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 97
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->passesOk:Ljava/lang/Double;

    .line 99
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->passesOk:Ljava/lang/Double;

    return-object v0
.end method

.method public getPassesOkInt()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 394
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOk()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getPer()Ljava/lang/Double;
    .locals 6

    .prologue
    .line 311
    const-wide/high16 v0, -0x3fa7000000000000L    # -100.0

    .line 312
    .local v0, "per":D
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMinutesPlayed()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-lez v2, :cond_0

    .line 313
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getStealsInt()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit8 v2, v2, 0x36

    .line 314
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorTripleOkInt()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/lit8 v3, v3, 0x34

    .line 313
    add-int/2addr v2, v3

    .line 315
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsInteriorOkInt()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorDoubleOkInt()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v3, v4

    mul-int/lit8 v3, v3, 0x55

    .line 313
    add-int/2addr v2, v3

    .line 316
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsFreeOkInt()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/lit8 v3, v3, 0x2f

    .line 313
    add-int/2addr v2, v3

    .line 317
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocksInt()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/lit8 v3, v3, 0x27

    .line 313
    add-int/2addr v2, v3

    .line 318
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOkInt()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/lit8 v3, v3, 0x23

    .line 313
    add-int/2addr v2, v3

    .line 319
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getReboundsInt()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/lit8 v3, v3, 0x1b

    .line 313
    add-int/2addr v2, v3

    .line 320
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getFoulsMadeInt()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/lit8 v3, v3, 0x11

    .line 313
    sub-int/2addr v2, v3

    .line 321
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsFreeKoInt()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/lit8 v3, v3, 0x14

    .line 313
    sub-int/2addr v2, v3

    .line 322
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsInteriorKoInt()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorDoubleKoInt()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v3, v4

    mul-int/lit8 v3, v3, 0x27

    .line 313
    sub-int/2addr v2, v3

    .line 323
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorTripleKoInt()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/lit8 v3, v3, 0x27

    .line 313
    sub-int/2addr v2, v3

    .line 324
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesKoInt()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/lit8 v3, v3, 0x36

    .line 313
    sub-int/2addr v2, v3

    int-to-double v2, v2

    .line 324
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMinutesPlayed()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-double v4, v4

    .line 313
    div-double v0, v2, v4

    .line 326
    :cond_0
    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    return-object v2
.end method

.method public getPlayer()Lcom/blank/bm15/model/object/crud/Player;
    .locals 2

    .prologue
    .line 254
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->player:Lcom/blank/bm15/model/object/crud/Player;

    if-nez v0, :cond_1

    .line 255
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->player:Lcom/blank/bm15/model/object/crud/Player;

    .line 259
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->player:Lcom/blank/bm15/model/object/crud/Player;

    return-object v0

    .line 256
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 257
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getPoints()Ljava/lang/Integer;
    .locals 4

    .prologue
    .line 301
    const-wide/16 v0, 0x0

    .line 302
    .local v0, "points":D
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsFreeOkInt()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit8 v2, v2, 0x1

    int-to-double v2, v2

    add-double/2addr v0, v2

    .line 303
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsInteriorOkInt()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    int-to-double v2, v2

    add-double/2addr v0, v2

    .line 304
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorDoubleOkInt()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    int-to-double v2, v2

    add-double/2addr v0, v2

    .line 305
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorTripleOkInt()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit8 v2, v2, 0x3

    int-to-double v2, v2

    add-double/2addr v0, v2

    .line 307
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-static {v2}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v2

    return-object v2
.end method

.method public getRebounds()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 118
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->rebounds:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 119
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->rebounds:Ljava/lang/Double;

    .line 121
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->rebounds:Ljava/lang/Double;

    return-object v0
.end method

.method public getReboundsInt()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 402
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getRebounds()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotOnePointKO()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 446
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsFreeKoInt()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotOnePointOK()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 442
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsFreeOkInt()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotOnePointTotals()Ljava/lang/Integer;
    .locals 2

    .prologue
    .line 450
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotOnePointOK()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotOnePointKO()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotThreePointsKO()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 470
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorTripleKoInt()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotThreePointsOK()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 466
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorTripleOkInt()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotThreePointsTotals()Ljava/lang/Integer;
    .locals 2

    .prologue
    .line 474
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotThreePointsOK()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotThreePointsKO()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotTwoPointsKO()Ljava/lang/Integer;
    .locals 2

    .prologue
    .line 458
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsInteriorKoInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorDoubleKoInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotTwoPointsOK()Ljava/lang/Integer;
    .locals 2

    .prologue
    .line 454
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsInteriorOkInt()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorDoubleOkInt()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotTwoPointsTotals()Ljava/lang/Integer;
    .locals 2

    .prologue
    .line 462
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotTwoPointsOK()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotTwoPointsKO()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotsExteriorDoubleKo()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 195
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorDoubleKo:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 196
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorDoubleKo:Ljava/lang/Double;

    .line 198
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorDoubleKo:Ljava/lang/Double;

    return-object v0
.end method

.method public getShotsExteriorDoubleKoInt()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 430
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorDoubleKo()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotsExteriorDoubleOk()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 184
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorDoubleOk:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 185
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorDoubleOk:Ljava/lang/Double;

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorDoubleOk:Ljava/lang/Double;

    return-object v0
.end method

.method public getShotsExteriorDoubleOkInt()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 426
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorDoubleOk()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotsExteriorTripleKo()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 217
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorTripleKo:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 218
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorTripleKo:Ljava/lang/Double;

    .line 220
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorTripleKo:Ljava/lang/Double;

    return-object v0
.end method

.method public getShotsExteriorTripleKoInt()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 438
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorTripleKo()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotsExteriorTripleOk()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 206
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorTripleOk:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 207
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorTripleOk:Ljava/lang/Double;

    .line 209
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorTripleOk:Ljava/lang/Double;

    return-object v0
.end method

.method public getShotsExteriorTripleOkInt()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 434
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsExteriorTripleOk()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotsFreeKo()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 151
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsFreeKo:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 152
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsFreeKo:Ljava/lang/Double;

    .line 154
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsFreeKo:Ljava/lang/Double;

    return-object v0
.end method

.method public getShotsFreeKoInt()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 414
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsFreeKo()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotsFreeOk()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsFreeOk:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 141
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsFreeOk:Ljava/lang/Double;

    .line 143
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsFreeOk:Ljava/lang/Double;

    return-object v0
.end method

.method public getShotsFreeOkInt()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 410
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsFreeOk()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotsInteriorKo()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 173
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsInteriorKo:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 174
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsInteriorKo:Ljava/lang/Double;

    .line 176
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsInteriorKo:Ljava/lang/Double;

    return-object v0
.end method

.method public getShotsInteriorKoInt()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 422
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsInteriorKo()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getShotsInteriorOk()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsInteriorOk:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 163
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsInteriorOk:Ljava/lang/Double;

    .line 165
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsInteriorOk:Ljava/lang/Double;

    return-object v0
.end method

.method public getShotsInteriorOkInt()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 418
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotsInteriorOk()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getSteals()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 129
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->steals:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 130
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->steals:Ljava/lang/Double;

    .line 132
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->steals:Ljava/lang/Double;

    return-object v0
.end method

.method public getStealsInt()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 406
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getSteals()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public setBlocks(Ljava/lang/Double;)V
    .locals 2
    .param p1, "blocks"    # Ljava/lang/Double;

    .prologue
    .line 81
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->blocks:Ljava/lang/Double;

    .line 82
    return-void
.end method

.method public setFoulsMade(Ljava/lang/Double;)V
    .locals 2
    .param p1, "foulsMade"    # Ljava/lang/Double;

    .prologue
    .line 92
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->foulsMade:Ljava/lang/Double;

    .line 93
    return-void
.end method

.method public setGame(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 0
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 237
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 238
    return-void
.end method

.method public setMatch(Lcom/blank/bm15/model/object/crud/Match;)V
    .locals 0
    .param p1, "match"    # Lcom/blank/bm15/model/object/crud/Match;

    .prologue
    .line 250
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->match:Lcom/blank/bm15/model/object/crud/Match;

    .line 251
    return-void
.end method

.method public setMatchday(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "matchday"    # Ljava/lang/Integer;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->matchday:Ljava/lang/Integer;

    .line 60
    return-void
.end method

.method public setMatches(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "matches"    # Ljava/lang/Integer;

    .prologue
    .line 274
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->tempMatches:Ljava/lang/Integer;

    .line 275
    return-void
.end method

.method public setMinutesPlayed(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "minutesPlayed"    # Ljava/lang/Integer;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->minutesPlayed:Ljava/lang/Integer;

    .line 71
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->name:Ljava/lang/String;

    .line 52
    return-void
.end method

.method public setPassesKo(Ljava/lang/Double;)V
    .locals 2
    .param p1, "passesKo"    # Ljava/lang/Double;

    .prologue
    .line 114
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->passesKo:Ljava/lang/Double;

    .line 115
    return-void
.end method

.method public setPassesOk(Ljava/lang/Double;)V
    .locals 2
    .param p1, "passesOk"    # Ljava/lang/Double;

    .prologue
    .line 103
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->passesOk:Ljava/lang/Double;

    .line 104
    return-void
.end method

.method public setPlayer(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 263
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->player:Lcom/blank/bm15/model/object/crud/Player;

    .line 264
    return-void
.end method

.method public setRebounds(Ljava/lang/Double;)V
    .locals 2
    .param p1, "rebounds"    # Ljava/lang/Double;

    .prologue
    .line 125
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->rebounds:Ljava/lang/Double;

    .line 126
    return-void
.end method

.method public setShotsExteriorDoubleKo(Ljava/lang/Double;)V
    .locals 2
    .param p1, "shotsExteriorDoubleKo"    # Ljava/lang/Double;

    .prologue
    .line 202
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorDoubleKo:Ljava/lang/Double;

    .line 203
    return-void
.end method

.method public setShotsExteriorDoubleOk(Ljava/lang/Double;)V
    .locals 2
    .param p1, "shotsExteriorDoubleOk"    # Ljava/lang/Double;

    .prologue
    .line 191
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorDoubleOk:Ljava/lang/Double;

    .line 192
    return-void
.end method

.method public setShotsExteriorTripleKo(Ljava/lang/Double;)V
    .locals 2
    .param p1, "shotsExteriorTripleKo"    # Ljava/lang/Double;

    .prologue
    .line 224
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorTripleKo:Ljava/lang/Double;

    .line 225
    return-void
.end method

.method public setShotsExteriorTripleOk(Ljava/lang/Double;)V
    .locals 2
    .param p1, "shotsExteriorTripleOk"    # Ljava/lang/Double;

    .prologue
    .line 213
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsExteriorTripleOk:Ljava/lang/Double;

    .line 214
    return-void
.end method

.method public setShotsFreeKo(Ljava/lang/Double;)V
    .locals 2
    .param p1, "shotsFreeKo"    # Ljava/lang/Double;

    .prologue
    .line 158
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsFreeKo:Ljava/lang/Double;

    .line 159
    return-void
.end method

.method public setShotsFreeOk(Ljava/lang/Double;)V
    .locals 2
    .param p1, "shotsFreeOk"    # Ljava/lang/Double;

    .prologue
    .line 147
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsFreeOk:Ljava/lang/Double;

    .line 148
    return-void
.end method

.method public setShotsInteriorKo(Ljava/lang/Double;)V
    .locals 2
    .param p1, "shotsInteriorKo"    # Ljava/lang/Double;

    .prologue
    .line 180
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsInteriorKo:Ljava/lang/Double;

    .line 181
    return-void
.end method

.method public setShotsInteriorOk(Ljava/lang/Double;)V
    .locals 2
    .param p1, "shotsInteriorOk"    # Ljava/lang/Double;

    .prologue
    .line 169
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->shotsInteriorOk:Ljava/lang/Double;

    .line 170
    return-void
.end method

.method public setSteals(Ljava/lang/Double;)V
    .locals 2
    .param p1, "steals"    # Ljava/lang/Double;

    .prologue
    .line 136
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/MatchResult;->steals:Ljava/lang/Double;

    .line 137
    return-void
.end method
