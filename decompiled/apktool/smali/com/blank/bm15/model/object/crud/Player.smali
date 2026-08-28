.class public Lcom/blank/bm15/model/object/crud/Player;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "Player.java"


# instance fields
.field private age:Ljava/lang/Integer;

.field private game:Lcom/blank/bm15/model/object/crud/Game;

.field private loyalty:Ljava/lang/Integer;

.field private name:Ljava/lang/String;

.field private positionFirst:Ljava/lang/Integer;

.field private positionSecond:Ljava/lang/Integer;

.field private potential:Ljava/lang/Integer;

.field private salary:Ljava/lang/Integer;

.field private skillBlock:Ljava/lang/Integer;

.field private skillPass:Ljava/lang/Integer;

.field private skillPhysique:Ljava/lang/Integer;

.field private skillRebound:Ljava/lang/Integer;

.field private skillShotExterior:Ljava/lang/Integer;

.field private skillShotFree:Ljava/lang/Integer;

.field private skillShotInterior:Ljava/lang/Integer;

.field private skillSteal:Ljava/lang/Integer;

.field private stateEnergy:Ljava/lang/Integer;

.field private stateForm:Ljava/lang/Integer;

.field private stateInjury:Ljava/lang/Integer;

.field private team:Lcom/blank/bm15/model/object/crud/Team;

.field private tempBaseMatchAttackModifier:Ljava/lang/Integer;

.field private tempBaseMatchDefenseModifier:Ljava/lang/Integer;

.field private tempCurrentMatchResult:Lcom/blank/bm15/model/object/crud/MatchResult;

.field private tempIsReserve:Ljava/lang/Boolean;

.field private tempIsStarOne:Ljava/lang/Boolean;

.field private tempIsStarThree:Ljava/lang/Boolean;

.field private tempIsStarTwo:Ljava/lang/Boolean;

.field private tempIsTitular:Ljava/lang/Boolean;

.field private tempOfferList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Offer;",
            ">;"
        }
    .end annotation
.end field

.field private tempPositionMatch:Ljava/lang/Integer;

.field private yearsContract:Ljava/lang/Integer;

.field private yearsExperience:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 58
    return-void
.end method

.method private getAttackDivisor(I)Ljava/lang/Integer;
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 580
    const/4 v0, 0x5

    invoke-static {p1, v0}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 581
    const/4 v1, 0x6

    invoke-static {p1, v1}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 580
    add-int/2addr v0, v1

    .line 582
    const/4 v1, 0x7

    invoke-static {p1, v1}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 580
    add-int/2addr v0, v1

    .line 583
    const/16 v1, 0x8

    invoke-static {p1, v1}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 580
    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method private getAverageForPosition(Ljava/lang/Integer;ZZ)Ljava/lang/Double;
    .locals 7
    .param p1, "position"    # Ljava/lang/Integer;
    .param p2, "attack"    # Z
    .param p3, "defense"    # Z

    .prologue
    .line 546
    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 547
    .local v0, "average":Ljava/lang/Double;
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eqz v1, :cond_2

    .line 548
    if-eqz p2, :cond_0

    .line 549
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPass()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/2addr v1, v4

    .line 550
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotInterior()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v6, 0x6

    invoke-static {v5, v6}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    mul-int/2addr v4, v5

    .line 549
    add-int/2addr v1, v4

    .line 551
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotExterior()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v6, 0x7

    invoke-static {v5, v6}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    mul-int/2addr v4, v5

    .line 549
    add-int/2addr v1, v4

    .line 552
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotFree()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0x8

    invoke-static {v5, v6}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    mul-int/2addr v4, v5

    .line 549
    add-int/2addr v1, v4

    .line 553
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0, v4}, Lcom/blank/bm15/model/object/crud/Player;->getAttackDivisor(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    div-int/2addr v1, v4

    int-to-double v4, v1

    add-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 555
    :cond_0
    if-eqz p3, :cond_1

    .line 556
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPhysique()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x1

    invoke-static {v4, v5}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/2addr v1, v4

    .line 557
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getSkillBlock()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v6, 0x2

    invoke-static {v5, v6}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    mul-int/2addr v4, v5

    .line 556
    add-int/2addr v1, v4

    .line 558
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getSkillSteal()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v6, 0x3

    invoke-static {v5, v6}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    mul-int/2addr v4, v5

    .line 556
    add-int/2addr v1, v4

    .line 559
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getSkillRebound()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v6, 0x4

    invoke-static {v5, v6}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    mul-int/2addr v4, v5

    .line 556
    add-int/2addr v1, v4

    .line 560
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0, v4}, Lcom/blank/bm15/model/object/crud/Player;->getDefenseDivisor(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    div-int/2addr v1, v4

    int-to-double v4, v1

    add-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 562
    :cond_1
    if-eqz p2, :cond_4

    if-eqz p3, :cond_4

    .line 563
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    div-double/2addr v2, v4

    const-wide/high16 v4, 0x4033000000000000L    # 19.0

    sub-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 570
    :cond_2
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    const-wide v4, 0x4058c00000000000L    # 99.0

    cmpl-double v1, v2, v4

    if-lez v1, :cond_5

    .line 571
    const-wide v2, 0x4058c00000000000L    # 99.0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 575
    .end local v0    # "average":Ljava/lang/Double;
    :cond_3
    :goto_1
    return-object v0

    .line 566
    .restart local v0    # "average":Ljava/lang/Double;
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    const-wide/high16 v4, 0x3fe8000000000000L    # 0.75

    div-double/2addr v2, v4

    const-wide/high16 v4, 0x4033000000000000L    # 19.0

    sub-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_0

    .line 572
    :cond_5
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    const-wide/high16 v4, 0x4044000000000000L    # 40.0

    cmpg-double v1, v2, v4

    if-gez v1, :cond_3

    .line 573
    const-wide/high16 v2, 0x4044000000000000L    # 40.0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_1
.end method

.method public static getBaseOfPosition(II)Ljava/lang/Integer;
    .locals 6
    .param p0, "position"    # I
    .param p1, "skill"    # I

    .prologue
    const/4 v5, 0x5

    const/4 v4, 0x4

    const/4 v3, 0x3

    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 594
    if-ne p1, v1, :cond_4

    .line 595
    if-ne v1, p0, :cond_0

    .line 596
    const/16 v0, 0x19

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 692
    :goto_0
    return-object v0

    .line 597
    :cond_0
    if-ne v2, p0, :cond_1

    .line 598
    const/16 v0, 0x19

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 599
    :cond_1
    if-ne v3, p0, :cond_2

    .line 600
    const/16 v0, 0x1b

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 601
    :cond_2
    if-ne v4, p0, :cond_3

    .line 602
    const/16 v0, 0x1f

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 603
    :cond_3
    if-ne v5, p0, :cond_27

    .line 604
    const/16 v0, 0x1f

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 606
    :cond_4
    if-ne p1, v2, :cond_9

    .line 607
    if-ne v1, p0, :cond_5

    .line 608
    const/16 v0, 0xa

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 609
    :cond_5
    if-ne v2, p0, :cond_6

    .line 610
    const/16 v0, 0xf

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 611
    :cond_6
    if-ne v3, p0, :cond_7

    .line 612
    const/16 v0, 0x1b

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 613
    :cond_7
    if-ne v4, p0, :cond_8

    .line 614
    const/16 v0, 0x1f

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 615
    :cond_8
    if-ne v5, p0, :cond_27

    .line 616
    const/16 v0, 0x1f

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 618
    :cond_9
    if-ne p1, v3, :cond_e

    .line 619
    if-ne v1, p0, :cond_a

    .line 620
    const/16 v0, 0x1e

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 621
    :cond_a
    if-ne v2, p0, :cond_b

    .line 622
    const/16 v0, 0x1b

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 623
    :cond_b
    if-ne v3, p0, :cond_c

    .line 624
    const/16 v0, 0x1b

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 625
    :cond_c
    if-ne v4, p0, :cond_d

    .line 626
    const/16 v0, 0xf

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 627
    :cond_d
    if-ne v5, p0, :cond_27

    .line 628
    const/16 v0, 0xa

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 630
    :cond_e
    if-ne p1, v4, :cond_13

    .line 631
    if-ne v1, p0, :cond_f

    .line 632
    const/16 v0, 0x14

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 633
    :cond_f
    if-ne v2, p0, :cond_10

    .line 634
    const/16 v0, 0x14

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 635
    :cond_10
    if-ne v3, p0, :cond_11

    .line 636
    const/16 v0, 0x1b

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 637
    :cond_11
    if-ne v4, p0, :cond_12

    .line 638
    const/16 v0, 0x1f

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 639
    :cond_12
    if-ne v5, p0, :cond_27

    .line 640
    const/16 v0, 0x23

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 642
    :cond_13
    if-ne p1, v5, :cond_18

    .line 643
    if-ne v1, p0, :cond_14

    .line 644
    const/16 v0, 0x23

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 645
    :cond_14
    if-ne v2, p0, :cond_15

    .line 646
    const/16 v0, 0x1e

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 647
    :cond_15
    if-ne v3, p0, :cond_16

    .line 648
    const/16 v0, 0x1b

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 649
    :cond_16
    if-ne v4, p0, :cond_17

    .line 650
    const/16 v0, 0x12

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 651
    :cond_17
    if-ne v5, p0, :cond_27

    .line 652
    const/16 v0, 0x12

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 654
    :cond_18
    const/4 v0, 0x6

    if-ne p1, v0, :cond_1d

    .line 655
    if-ne v1, p0, :cond_19

    .line 656
    const/16 v0, 0xf

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 657
    :cond_19
    if-ne v2, p0, :cond_1a

    .line 658
    const/16 v0, 0x19

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 659
    :cond_1a
    if-ne v3, p0, :cond_1b

    .line 660
    const/16 v0, 0x1c

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 661
    :cond_1b
    if-ne v4, p0, :cond_1c

    .line 662
    const/16 v0, 0x21

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 663
    :cond_1c
    if-ne v5, p0, :cond_27

    .line 664
    const/16 v0, 0x23

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 666
    :cond_1d
    const/4 v0, 0x7

    if-ne p1, v0, :cond_22

    .line 667
    if-ne v1, p0, :cond_1e

    .line 668
    const/16 v0, 0x1e

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 669
    :cond_1e
    if-ne v2, p0, :cond_1f

    .line 670
    const/16 v0, 0x23

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 671
    :cond_1f
    if-ne v3, p0, :cond_20

    .line 672
    const/16 v0, 0x1c

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 673
    :cond_20
    if-ne v4, p0, :cond_21

    .line 674
    const/16 v0, 0x19

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 675
    :cond_21
    if-ne v5, p0, :cond_27

    .line 676
    const/16 v0, 0xf

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 678
    :cond_22
    const/16 v0, 0x8

    if-ne p1, v0, :cond_27

    .line 679
    if-ne v1, p0, :cond_23

    .line 680
    const/16 v0, 0x1e

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 681
    :cond_23
    if-ne v2, p0, :cond_24

    .line 682
    const/16 v0, 0x1e

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 683
    :cond_24
    if-ne v3, p0, :cond_25

    .line 684
    const/16 v0, 0x1c

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 685
    :cond_25
    if-ne v4, p0, :cond_26

    .line 686
    const/16 v0, 0x14

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 687
    :cond_26
    if-ne v5, p0, :cond_27

    .line 688
    const/16 v0, 0x14

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0

    .line 692
    :cond_27
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method private getDefenseDivisor(I)Ljava/lang/Integer;
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 587
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 588
    const/4 v1, 0x2

    invoke-static {p1, v1}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 587
    add-int/2addr v0, v1

    .line 589
    const/4 v1, 0x3

    invoke-static {p1, v1}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 587
    add-int/2addr v0, v1

    .line 590
    const/4 v1, 0x4

    invoke-static {p1, v1}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 587
    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getAge()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->age:Ljava/lang/Integer;

    return-object v0
.end method

.method public getAverageSkillAll()Ljava/lang/Double;
    .locals 3

    .prologue
    .line 530
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->getAverageForPosition(Ljava/lang/Integer;ZZ)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getAverageSkillAllByPosition(Ljava/lang/Integer;)Ljava/lang/Double;
    .locals 2
    .param p1, "position"    # Ljava/lang/Integer;

    .prologue
    .line 542
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->getAverageForPosition(Ljava/lang/Integer;ZZ)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getAverageSkillAttack()Ljava/lang/Double;
    .locals 3

    .prologue
    .line 534
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->getAverageForPosition(Ljava/lang/Integer;ZZ)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getAverageSkillDefense()Ljava/lang/Double;
    .locals 3

    .prologue
    .line 538
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->getAverageForPosition(Ljava/lang/Integer;ZZ)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getBaseMatchAttackModifier()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 338
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempBaseMatchAttackModifier:Ljava/lang/Integer;

    return-object v0
.end method

.method public getBaseMatchDefenseModifier()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 346
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempBaseMatchDefenseModifier:Ljava/lang/Integer;

    return-object v0
.end method

.method public getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;
    .locals 1

    .prologue
    .line 330
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempCurrentMatchResult:Lcom/blank/bm15/model/object/crud/MatchResult;

    return-object v0
.end method

.method public getGame()Lcom/blank/bm15/model/object/crud/Game;
    .locals 2

    .prologue
    .line 303
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->game:Lcom/blank/bm15/model/object/crud/Game;

    if-nez v0, :cond_1

    .line 304
    new-instance v0, Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 308
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->game:Lcom/blank/bm15/model/object/crud/Game;

    return-object v0

    .line 305
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 306
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getIsBestInPosition(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 8
    .param p1, "firstPosition"    # Ljava/lang/Boolean;

    .prologue
    .line 435
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v2

    :goto_0
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 436
    .local v1, "position":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    .line 443
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_1
    return-object v2

    .line 435
    .end local v1    # "position":I
    :cond_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v2

    goto :goto_0

    .line 436
    .restart local v1    # "position":I
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 437
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eq v3, v1, :cond_3

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v1, :cond_0

    .line 438
    :cond_3
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eq v3, v4, :cond_0

    .line 439
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getValue()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getValue()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    cmpl-double v3, v4, v6

    if-lez v3, :cond_0

    .line 440
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_1
.end method

.method public getIsInLineup()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 458
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getIsTitular()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getIsReserve()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public getIsReserve()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 409
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsReserve:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 410
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsReserve:Ljava/lang/Boolean;

    .line 412
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsReserve:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getIsStarOne()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 365
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsStarOne:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 366
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsStarOne:Ljava/lang/Boolean;

    .line 368
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsStarOne:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getIsStarThree()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsStarThree:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 388
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsStarThree:Ljava/lang/Boolean;

    .line 390
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsStarThree:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getIsStarTwo()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 376
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsStarTwo:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 377
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsStarTwo:Ljava/lang/Boolean;

    .line 379
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsStarTwo:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getIsTitular()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 398
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsTitular:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 399
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsTitular:Ljava/lang/Boolean;

    .line 401
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsTitular:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getIsUniqueInPosition(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 5
    .param p1, "firstPosition"    # Ljava/lang/Boolean;

    .prologue
    .line 447
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v2

    :goto_0
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 448
    .local v1, "position":I
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    .line 454
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_1
    return-object v2

    .line 447
    .end local v1    # "position":I
    :cond_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v2

    goto :goto_0

    .line 448
    .restart local v1    # "position":I
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 449
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eq v3, v1, :cond_3

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v1, :cond_0

    .line 450
    :cond_3
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eq v3, v4, :cond_0

    .line 451
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_1
.end method

.method public getLoyalty()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->loyalty:Ljava/lang/Integer;

    return-object v0
.end method

.method public getMarketValue()D
    .locals 10

    .prologue
    const-wide v6, 0x4051800000000000L    # 70.0

    const-wide/high16 v8, 0x4010000000000000L    # 4.0

    .line 474
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getValue()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    sub-double/2addr v2, v6

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getValue()Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    sub-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    mul-double/2addr v2, v4

    div-double/2addr v2, v8

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const v5, 0x2625a0

    div-int/2addr v4, v5

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/lit8 v5, v5, -0x12

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/lit8 v6, v6, -0x12

    mul-int/2addr v5, v6

    div-int/lit8 v5, v5, 0xf

    add-int/2addr v4, v5

    int-to-double v4, v4

    sub-double/2addr v2, v4

    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    add-double v0, v2, v4

    .line 476
    .local v0, "marketValue":D
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x18

    if-ge v2, v3, :cond_0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x8

    if-le v2, v3, :cond_0

    .line 477
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-double v2, v2

    add-double/2addr v0, v2

    .line 480
    :cond_0
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    const-wide v4, 0x4053c00000000000L    # 79.0

    cmpl-double v2, v2, v4

    if-lez v2, :cond_1

    .line 481
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0xa

    int-to-double v2, v2

    add-double/2addr v0, v2

    .line 484
    :cond_1
    const-wide/16 v2, 0x0

    cmpg-double v2, v0, v2

    if-gez v2, :cond_2

    .line 485
    div-double/2addr v0, v8

    .line 487
    .end local v0    # "marketValue":D
    :cond_2
    return-wide v0
.end method

.method public getMatchValue(Ljava/lang/Integer;)Ljava/lang/Double;
    .locals 6
    .param p1, "position"    # Ljava/lang/Integer;

    .prologue
    .line 470
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-double v2, v2

    const-wide v4, 0x3ffccccccccccccdL    # 1.8

    mul-double/2addr v2, v4

    add-double/2addr v0, v2

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    div-int/2addr v2, v3

    int-to-double v2, v2

    sub-double/2addr v0, v2

    invoke-virtual {p0, p1}, Lcom/blank/bm15/model/object/crud/Player;->getPenalty(Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-double v2, v2

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOfferList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Offer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 420
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempOfferList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 421
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempOfferList:Ljava/util/List;

    .line 423
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempOfferList:Ljava/util/List;

    return-object v0
.end method

.method public getPenalty(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 7
    .param p1, "position"    # Ljava/lang/Integer;

    .prologue
    const/16 v6, 0x50

    const/16 v5, 0x3c

    const/16 v4, 0x28

    const/16 v3, 0x14

    .line 492
    const/4 v0, 0x0

    .line 494
    .local v0, "playerModifier":I
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eq v1, v2, :cond_0

    .line 495
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 496
    const/4 v0, -0x2

    .line 502
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lt v1, v6, :cond_2

    .line 503
    add-int/lit8 v0, v0, 0x0

    .line 514
    :goto_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lt v1, v6, :cond_6

    .line 515
    add-int/lit8 v0, v0, 0x0

    .line 526
    :goto_2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1

    .line 498
    :cond_1
    const/4 v0, -0x7

    goto :goto_0

    .line 504
    :cond_2
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lt v1, v5, :cond_3

    .line 505
    add-int/lit8 v0, v0, -0x1

    .line 506
    goto :goto_1

    :cond_3
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lt v1, v4, :cond_4

    .line 507
    add-int/lit8 v0, v0, -0x2

    .line 508
    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lt v1, v3, :cond_5

    .line 509
    add-int/lit8 v0, v0, -0x4

    .line 510
    goto :goto_1

    .line 511
    :cond_5
    add-int/lit8 v0, v0, -0x8

    goto :goto_1

    .line 516
    :cond_6
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lt v1, v5, :cond_7

    .line 517
    add-int/lit8 v0, v0, -0x1

    .line 518
    goto :goto_2

    :cond_7
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lt v1, v4, :cond_8

    .line 519
    add-int/lit8 v0, v0, -0x2

    .line 520
    goto :goto_2

    :cond_8
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lt v1, v3, :cond_9

    .line 521
    add-int/lit8 v0, v0, -0x4

    .line 522
    goto :goto_2

    .line 523
    :cond_9
    add-int/lit8 v0, v0, -0x8

    goto :goto_2
.end method

.method public getPositionFirst()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->positionFirst:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPositionMatch()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 354
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempPositionMatch:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 355
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempPositionMatch:Ljava/lang/Integer;

    .line 357
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->tempPositionMatch:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPositionSecond()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->positionSecond:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 82
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->positionSecond:Ljava/lang/Integer;

    .line 84
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->positionSecond:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPotential()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->potential:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSalary()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->salary:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 115
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->salary:Ljava/lang/Integer;

    .line 117
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->salary:Ljava/lang/Integer;

    return-object v0
.end method

.method public getShortName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 462
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Util;->getPlayerShortName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSkillBlock()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillBlock:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillPass()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillPass:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillPhysique()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillPhysique:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillRebound()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillRebound:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillShotExterior()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 236
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillShotExterior:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillShotFree()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 250
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillShotFree:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillShotInterior()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillShotInterior:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillSteal()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillSteal:Ljava/lang/Integer;

    return-object v0
.end method

.method public getStateEnergy()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 264
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->stateEnergy:Ljava/lang/Integer;

    return-object v0
.end method

.method public getStateForm()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 278
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->stateForm:Ljava/lang/Integer;

    return-object v0
.end method

.method public getStateInjury()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 292
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->stateInjury:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 293
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->stateInjury:Ljava/lang/Integer;

    .line 295
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->stateInjury:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTeam()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 316
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->team:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_1

    .line 317
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->team:Lcom/blank/bm15/model/object/crud/Team;

    .line 318
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 322
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->team:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0

    .line 319
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->isNotLoaded()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 320
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto :goto_0
.end method

.method public getValue()Ljava/lang/Double;
    .locals 4

    .prologue
    .line 466
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    int-to-double v2, v2

    add-double/2addr v0, v2

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-double v2, v2

    sub-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getYearsContract()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->yearsContract:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 126
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->yearsContract:Ljava/lang/Integer;

    .line 128
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->yearsContract:Ljava/lang/Integer;

    return-object v0
.end method

.method public getYearsExperience()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->yearsExperience:Ljava/lang/Integer;

    return-object v0
.end method

.method public setAge(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "age"    # Ljava/lang/Integer;

    .prologue
    .line 110
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->age:Ljava/lang/Integer;

    .line 111
    return-void
.end method

.method public setBaseMatchAttackModifier(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "tempBaseMatchAttackModifier"    # Ljava/lang/Integer;

    .prologue
    .line 342
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->tempBaseMatchAttackModifier:Ljava/lang/Integer;

    .line 343
    return-void
.end method

.method public setBaseMatchDefenseModifier(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "tempBaseMatchDefenseModifier"    # Ljava/lang/Integer;

    .prologue
    .line 350
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->tempBaseMatchDefenseModifier:Ljava/lang/Integer;

    .line 351
    return-void
.end method

.method public setCurrentMatchResult(Lcom/blank/bm15/model/object/crud/MatchResult;)V
    .locals 0
    .param p1, "currentMatchResult"    # Lcom/blank/bm15/model/object/crud/MatchResult;

    .prologue
    .line 334
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->tempCurrentMatchResult:Lcom/blank/bm15/model/object/crud/MatchResult;

    .line 335
    return-void
.end method

.method public setGame(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 0
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 312
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 313
    return-void
.end method

.method public setIsReserve(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "tempIsReserve"    # Ljava/lang/Boolean;

    .prologue
    .line 416
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsReserve:Ljava/lang/Boolean;

    .line 417
    return-void
.end method

.method public setIsStarOne(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "tempIsStarOne"    # Ljava/lang/Boolean;

    .prologue
    .line 372
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsStarOne:Ljava/lang/Boolean;

    .line 373
    return-void
.end method

.method public setIsStarThree(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "tempIsStarThree"    # Ljava/lang/Boolean;

    .prologue
    .line 394
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsStarThree:Ljava/lang/Boolean;

    .line 395
    return-void
.end method

.method public setIsStarTwo(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "tempIsStarTwo"    # Ljava/lang/Boolean;

    .prologue
    .line 383
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsStarTwo:Ljava/lang/Boolean;

    .line 384
    return-void
.end method

.method public setIsTitular(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "tempIsTitular"    # Ljava/lang/Boolean;

    .prologue
    .line 405
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->tempIsTitular:Ljava/lang/Boolean;

    .line 406
    return-void
.end method

.method public setLoyalty(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "loyalty"    # Ljava/lang/Integer;

    .prologue
    .line 140
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->loyalty:Ljava/lang/Integer;

    .line 141
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->name:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public setOfferList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Offer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 427
    .local p1, "tempOfferList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->tempOfferList:Ljava/util/List;

    .line 428
    return-void
.end method

.method public setPositionFirst(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "positionFirst"    # Ljava/lang/Integer;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->positionFirst:Ljava/lang/Integer;

    .line 78
    return-void
.end method

.method public setPositionMatch(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "tempPositionMatch"    # Ljava/lang/Integer;

    .prologue
    .line 361
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->tempPositionMatch:Ljava/lang/Integer;

    .line 362
    return-void
.end method

.method public setPositionSecond(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "positionSecond"    # Ljava/lang/Integer;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->positionSecond:Ljava/lang/Integer;

    .line 89
    return-void
.end method

.method public setPotential(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "potential"    # Ljava/lang/Integer;

    .prologue
    const/16 v2, 0xa

    const/4 v1, 0x1

    .line 96
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, v1, :cond_0

    .line 97
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->potential:Ljava/lang/Integer;

    .line 103
    :goto_0
    return-void

    .line 98
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v2, :cond_1

    .line 99
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->potential:Ljava/lang/Integer;

    goto :goto_0

    .line 101
    :cond_1
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->potential:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public setSalary(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "salary"    # Ljava/lang/Integer;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->salary:Ljava/lang/Integer;

    .line 122
    return-void
.end method

.method public setSkillBlock(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "skillBlock"    # Ljava/lang/Integer;

    .prologue
    const/16 v2, 0x63

    const/16 v1, 0x28

    .line 156
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, v1, :cond_0

    .line 157
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillBlock:Ljava/lang/Integer;

    .line 163
    :goto_0
    return-void

    .line 158
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v2, :cond_1

    .line 159
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillBlock:Ljava/lang/Integer;

    goto :goto_0

    .line 161
    :cond_1
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->skillBlock:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public setSkillPass(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "skillPass"    # Ljava/lang/Integer;

    .prologue
    const/16 v2, 0x63

    const/16 v1, 0x28

    .line 170
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, v1, :cond_0

    .line 171
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillPass:Ljava/lang/Integer;

    .line 177
    :goto_0
    return-void

    .line 172
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v2, :cond_1

    .line 173
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillPass:Ljava/lang/Integer;

    goto :goto_0

    .line 175
    :cond_1
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->skillPass:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public setSkillPhysique(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "skillPhysique"    # Ljava/lang/Integer;

    .prologue
    const/16 v2, 0x63

    const/16 v1, 0x28

    .line 184
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, v1, :cond_0

    .line 185
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillPhysique:Ljava/lang/Integer;

    .line 191
    :goto_0
    return-void

    .line 186
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v2, :cond_1

    .line 187
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillPhysique:Ljava/lang/Integer;

    goto :goto_0

    .line 189
    :cond_1
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->skillPhysique:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public setSkillRebound(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "skillRebound"    # Ljava/lang/Integer;

    .prologue
    const/16 v2, 0x63

    const/16 v1, 0x28

    .line 198
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, v1, :cond_0

    .line 199
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillRebound:Ljava/lang/Integer;

    .line 205
    :goto_0
    return-void

    .line 200
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v2, :cond_1

    .line 201
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillRebound:Ljava/lang/Integer;

    goto :goto_0

    .line 203
    :cond_1
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->skillRebound:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public setSkillShotExterior(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "skillShotExterior"    # Ljava/lang/Integer;

    .prologue
    const/16 v2, 0x63

    const/16 v1, 0x28

    .line 240
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, v1, :cond_0

    .line 241
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillShotExterior:Ljava/lang/Integer;

    .line 247
    :goto_0
    return-void

    .line 242
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v2, :cond_1

    .line 243
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillShotExterior:Ljava/lang/Integer;

    goto :goto_0

    .line 245
    :cond_1
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->skillShotExterior:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public setSkillShotFree(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "skillShotFree"    # Ljava/lang/Integer;

    .prologue
    const/16 v2, 0x63

    const/16 v1, 0x28

    .line 254
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, v1, :cond_0

    .line 255
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillShotFree:Ljava/lang/Integer;

    .line 261
    :goto_0
    return-void

    .line 256
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v2, :cond_1

    .line 257
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillShotFree:Ljava/lang/Integer;

    goto :goto_0

    .line 259
    :cond_1
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->skillShotFree:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public setSkillShotInterior(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "skillShotInterior"    # Ljava/lang/Integer;

    .prologue
    const/16 v2, 0x63

    const/16 v1, 0x28

    .line 226
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, v1, :cond_0

    .line 227
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillShotInterior:Ljava/lang/Integer;

    .line 233
    :goto_0
    return-void

    .line 228
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v2, :cond_1

    .line 229
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillShotInterior:Ljava/lang/Integer;

    goto :goto_0

    .line 231
    :cond_1
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->skillShotInterior:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public setSkillSteal(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "skillSteal"    # Ljava/lang/Integer;

    .prologue
    const/16 v2, 0x63

    const/16 v1, 0x28

    .line 212
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, v1, :cond_0

    .line 213
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillSteal:Ljava/lang/Integer;

    .line 219
    :goto_0
    return-void

    .line 214
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v2, :cond_1

    .line 215
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->skillSteal:Ljava/lang/Integer;

    goto :goto_0

    .line 217
    :cond_1
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->skillSteal:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public setStateEnergy(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "stateEnergy"    # Ljava/lang/Integer;

    .prologue
    const/16 v2, 0x63

    const/16 v1, 0x14

    .line 268
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v2, :cond_0

    .line 269
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->stateEnergy:Ljava/lang/Integer;

    .line 275
    :goto_0
    return-void

    .line 270
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, v1, :cond_1

    .line 271
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->stateEnergy:Ljava/lang/Integer;

    goto :goto_0

    .line 273
    :cond_1
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->stateEnergy:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public setStateForm(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "stateForm"    # Ljava/lang/Integer;

    .prologue
    const/16 v2, 0x63

    const/16 v1, 0x14

    .line 282
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v2, :cond_0

    .line 283
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->stateForm:Ljava/lang/Integer;

    .line 289
    :goto_0
    return-void

    .line 284
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, v1, :cond_1

    .line 285
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Player;->stateForm:Ljava/lang/Integer;

    goto :goto_0

    .line 287
    :cond_1
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->stateForm:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public setStateInjury(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "stateInjury"    # Ljava/lang/Integer;

    .prologue
    .line 299
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->stateInjury:Ljava/lang/Integer;

    .line 300
    return-void
.end method

.method public setTeam(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 326
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->team:Lcom/blank/bm15/model/object/crud/Team;

    .line 327
    return-void
.end method

.method public setYearsContract(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "yearsContract"    # Ljava/lang/Integer;

    .prologue
    .line 132
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->yearsContract:Ljava/lang/Integer;

    .line 133
    return-void
.end method

.method public setYearsExperience(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "yearsExperience"    # Ljava/lang/Integer;

    .prologue
    .line 148
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Player;->yearsExperience:Ljava/lang/Integer;

    .line 149
    return-void
.end method
