.class public Lcom/blank/bm15/activity/HomeActivity;
.super Lcom/blank/bm15/activity/base/BaseActivity;
.source "HomeActivity.java"


# instance fields
.field private isDrawerLocked:Ljava/lang/Boolean;

.field private mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

.field private mDrawerList:Landroid/widget/ListView;

.field private mDrawerToggle:Landroid/support/v4/app/ActionBarDrawerToggle;

.field private mLastClickTime:J

.field private play:Lcom/blank/bm15/model/core/Play;

.field private playHome:Ljava/lang/Boolean;

.field private playOpponent:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseActivity;-><init>()V

    .line 66
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mLastClickTime:J

    .line 73
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->isDrawerLocked:Ljava/lang/Boolean;

    .line 64
    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/HomeActivity;)V
    .locals 0

    .prologue
    .line 396
    invoke-direct {p0}, Lcom/blank/bm15/activity/HomeActivity;->loadFragment()V

    return-void
.end method

.method static synthetic access$1(Lcom/blank/bm15/activity/HomeActivity;Lcom/blank/bm15/model/core/Play;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/blank/bm15/activity/HomeActivity;->play:Lcom/blank/bm15/model/core/Play;

    return-void
.end method

.method static synthetic access$10(Lcom/blank/bm15/activity/HomeActivity;I)Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 546
    invoke-direct {p0, p1}, Lcom/blank/bm15/activity/HomeActivity;->validateLineup(I)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2(Lcom/blank/bm15/activity/HomeActivity;)Lcom/blank/bm15/model/core/Play;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->play:Lcom/blank/bm15/model/core/Play;

    return-object v0
.end method

.method static synthetic access$3(Lcom/blank/bm15/activity/HomeActivity;)Landroid/widget/ListView;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerList:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$4(Lcom/blank/bm15/activity/HomeActivity;)Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->isDrawerLocked:Ljava/lang/Boolean;

    return-object v0
.end method

.method static synthetic access$5(Lcom/blank/bm15/activity/HomeActivity;)Landroid/support/v4/widget/DrawerLayout;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    return-object v0
.end method

.method static synthetic access$6(Lcom/blank/bm15/activity/HomeActivity;)Lcom/blank/bm15/model/object/crud/Team;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->playOpponent:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0
.end method

.method static synthetic access$7(Lcom/blank/bm15/activity/HomeActivity;)Z
    .locals 1

    .prologue
    .line 140
    invoke-direct {p0}, Lcom/blank/bm15/activity/HomeActivity;->validatePlay()Z

    move-result v0

    return v0
.end method

.method static synthetic access$8(Lcom/blank/bm15/activity/HomeActivity;)J
    .locals 2

    .prologue
    .line 66
    iget-wide v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mLastClickTime:J

    return-wide v0
.end method

.method static synthetic access$9(Lcom/blank/bm15/activity/HomeActivity;J)V
    .locals 1

    .prologue
    .line 66
    iput-wide p1, p0, Lcom/blank/bm15/activity/HomeActivity;->mLastClickTime:J

    return-void
.end method

.method private getDrawerAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    .locals 17

    .prologue
    .line 445
    new-instance v4, Lcom/blank/bm15/model/object/crud/News;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 446
    .local v4, "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v4, v11}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 447
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v4, v11}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 448
    invoke-static {v4}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    .line 451
    .local v5, "numOfNews":Ljava/lang/String;
    invoke-direct/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->loadOpponent()V

    .line 454
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 455
    .local v7, "playList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/DrawerItem;>;"
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/4 v12, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f020027

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f050099

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 456
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    add-int/lit8 v11, v11, 0x7

    const/16 v12, 0xe2

    if-ge v11, v12, :cond_0

    .line 457
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/4 v12, 0x2

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f020027

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f05009a

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 458
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    add-int/lit8 v11, v11, 0x1e

    const/16 v12, 0xe2

    if-ge v11, v12, :cond_0

    .line 459
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/4 v12, 0x3

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f020027

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f05009b

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 462
    :cond_0
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/HomeActivity;->playOpponent:Lcom/blank/bm15/model/object/crud/Team;

    if-eqz v11, :cond_1

    .line 463
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/HomeActivity;->playHome:Ljava/lang/Boolean;

    if-eqz v11, :cond_8

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/HomeActivity;->playHome:Ljava/lang/Boolean;

    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    if-eqz v11, :cond_8

    const-string v2, ""

    .line 464
    .local v2, "analize":Ljava/lang/String;
    :goto_0
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/4 v12, 0x4

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f02001c

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f05009c

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/HomeActivity;->playOpponent:Lcom/blank/bm15/model/object/crud/Team;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Team;->getShortFullName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 467
    .end local v2    # "analize":Ljava/lang/String;
    :cond_1
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 468
    .local v9, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/DrawerItem;>;"
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v12, 0xa

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f02002b

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f05009e

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 469
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    const/16 v12, 0xa8

    if-lt v11, v12, :cond_2

    .line 470
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v12, 0xc

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f020028

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f0500a2

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 472
    :cond_2
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v12, 0xd

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f02001f

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f05009f

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 473
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v12, 0xe

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f02001d

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f0500a0

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v15

    invoke-static {v15}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 474
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v12, 0xf

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f020026

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f0500a1

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v11, v12, v13, v14, v5}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 476
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 477
    .local v3, "marketList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/DrawerItem;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    const/16 v12, 0xe4

    if-eq v11, v12, :cond_3

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    const/16 v12, 0xe5

    if-eq v11, v12, :cond_3

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    const/16 v12, 0xe6

    if-ne v11, v12, :cond_4

    .line 478
    :cond_3
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v12, 0x14

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f020029

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f0500a4

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 480
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    const/16 v12, 0xe8

    if-eq v11, v12, :cond_5

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    const/16 v12, 0xe9

    if-ne v11, v12, :cond_6

    .line 481
    :cond_5
    new-instance v12, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v11, 0x15

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v11, 0x7f020020

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const v11, 0x7f0500a5

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    const/16 v16, 0xe8

    move/from16 v0, v16

    if-ne v11, v0, :cond_9

    const-string v11, "1"

    :goto_1
    invoke-direct {v12, v13, v14, v15, v11}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 483
    :cond_6
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v12, 0x16

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f02002c

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f0500a8

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 484
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v12, 0x17

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f020024

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f0500a7

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 485
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v12, 0x18

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f020023

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f0500a6

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 487
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 488
    .local v10, "topList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/DrawerItem;>;"
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v12, 0x1e

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f02001b

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f0500aa

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 489
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    const/16 v12, 0xe8

    if-eq v11, v12, :cond_7

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    const/16 v12, 0xe9

    if-eq v11, v12, :cond_7

    .line 490
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v12, 0x1f

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f02001b

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f0500ab

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 493
    :cond_7
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 494
    .local v6, "otherList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/DrawerItem;>;"
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v12, 0x28

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f020021

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f0500ad

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v6, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 495
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v12, 0x29

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f02001e

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f0500ae

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v6, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 496
    new-instance v11, Lcom/blank/bm15/model/object/other/DrawerItem;

    const/16 v12, 0x2a

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const v13, 0x7f020025

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v14, 0x7f0500af

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/blank/bm15/model/object/other/DrawerItem;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v6, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 498
    new-instance v8, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    sget-object v11, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, p0

    invoke-direct {v8, v0, v11}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;-><init>(Landroid/content/Context;Ljava/lang/Boolean;)V

    .line 500
    .local v8, "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    new-instance v1, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;

    const v11, 0x7f030017

    move-object/from16 v0, p0

    invoke-direct {v1, v0, v11, v7}, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 501
    .local v1, "adapter":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f050098

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11, v1}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 503
    new-instance v1, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;

    .end local v1    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;
    const v11, 0x7f030017

    move-object/from16 v0, p0

    invoke-direct {v1, v0, v11, v9}, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 504
    .restart local v1    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f05009d

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11, v1}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 506
    new-instance v1, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;

    .end local v1    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;
    const v11, 0x7f030017

    move-object/from16 v0, p0

    invoke-direct {v1, v0, v11, v3}, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 507
    .restart local v1    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0500a3

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11, v1}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 509
    new-instance v1, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;

    .end local v1    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;
    const v11, 0x7f030017

    move-object/from16 v0, p0

    invoke-direct {v1, v0, v11, v10}, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 510
    .restart local v1    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0500a9

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11, v1}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 512
    new-instance v1, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;

    .end local v1    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;
    const v11, 0x7f030017

    move-object/from16 v0, p0

    invoke-direct {v1, v0, v11, v6}, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 513
    .restart local v1    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0500ac

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11, v1}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 515
    return-object v8

    .line 463
    .end local v1    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;
    .end local v3    # "marketList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/DrawerItem;>;"
    .end local v6    # "otherList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/DrawerItem;>;"
    .end local v8    # "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    .end local v9    # "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/DrawerItem;>;"
    .end local v10    # "topList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/DrawerItem;>;"
    :cond_8
    const v11, 0x7f05002a

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 481
    .restart local v3    # "marketList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/DrawerItem;>;"
    .restart local v9    # "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/DrawerItem;>;"
    :cond_9
    const-string v11, "2"

    goto/16 :goto_1
.end method

.method private loadDrawer()V
    .locals 8

    .prologue
    .line 306
    const v0, 0x7f0b0012

    invoke-virtual {p0, v0}, Lcom/blank/bm15/activity/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    iput-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    .line 307
    const v0, 0x7f0b0014

    invoke-virtual {p0, v0}, Lcom/blank/bm15/activity/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerList:Landroid/widget/ListView;

    .line 310
    const v0, 0x7f0b0013

    invoke-virtual {p0, v0}, Lcom/blank/bm15/activity/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/FrameLayout;

    .line 311
    .local v7, "frameLayout":Landroid/widget/FrameLayout;
    invoke-virtual {v7}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090005

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    if-ne v0, v1, :cond_0

    .line 312
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerList:Landroid/widget/ListView;

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/widget/DrawerLayout;->setDrawerLockMode(ILandroid/view/View;)V

    .line 313
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->setScrimColor(I)V

    .line 314
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->isDrawerLocked:Ljava/lang/Boolean;

    .line 318
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerList:Landroid/widget/ListView;

    new-instance v1, Lcom/blank/bm15/activity/HomeActivity$13;

    invoke-direct {v1, p0}, Lcom/blank/bm15/activity/HomeActivity$13;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 375
    new-instance v0, Lcom/blank/bm15/activity/HomeActivity$14;

    iget-object v3, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    const v4, 0x7f02002d

    const v5, 0x7f050096

    const v6, 0x7f050097

    move-object v1, p0

    move-object v2, p0

    invoke-direct/range {v0 .. v6}, Lcom/blank/bm15/activity/HomeActivity$14;-><init>(Lcom/blank/bm15/activity/HomeActivity;Landroid/app/Activity;Landroid/support/v4/widget/DrawerLayout;III)V

    iput-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerToggle:Landroid/support/v4/app/ActionBarDrawerToggle;

    .line 387
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->isDrawerLocked:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    .line 389
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerList:Landroid/widget/ListView;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->closeDrawer(Landroid/view/View;)V

    .line 392
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerToggle:Landroid/support/v4/app/ActionBarDrawerToggle;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->setDrawerListener(Landroid/support/v4/widget/DrawerLayout$DrawerListener;)V

    .line 394
    :cond_1
    return-void
.end method

.method private loadFragment()V
    .locals 10

    .prologue
    const v9, 0x7f030008

    const v8, 0x7f03000b

    const/4 v7, 0x2

    const/4 v6, 0x0

    const v5, 0x7f0b0013

    .line 397
    iget-object v3, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerList:Landroid/widget/ListView;

    invoke-direct {p0}, Lcom/blank/bm15/activity/HomeActivity;->getDrawerAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 400
    invoke-static {p0}, Lcom/blank/bm15/activity/base/BaseActivity;->getNavigation(Landroid/content/Context;)Lcom/blank/bm15/model/object/crud/Navigation;

    move-result-object v1

    .line 401
    .local v1, "navigation":Lcom/blank/bm15/model/object/crud/Navigation;
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Navigation;->getIdFragment()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 404
    .local v2, "selectedFragmentId":I
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    .line 406
    .local v0, "ft":Landroid/app/FragmentTransaction;
    const/4 v3, 0x4

    if-ne v3, v2, :cond_1

    .line 407
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v8, v3}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/TeamAllFragments;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 439
    :cond_0
    :goto_0
    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    .line 440
    return-void

    .line 408
    :cond_1
    const/16 v3, 0xa

    if-ne v3, v2, :cond_2

    .line 409
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v8, v3}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/TeamAllFragments;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    goto :goto_0

    .line 410
    :cond_2
    const/16 v3, 0xb

    if-ne v3, v2, :cond_3

    .line 411
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v8, v3}, Lcom/blank/bm15/activity/fragment/PlayerAllFragments;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/PlayerAllFragments;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    goto :goto_0

    .line 412
    :cond_3
    const/16 v3, 0xd

    if-ne v3, v2, :cond_4

    .line 413
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v8, v3}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    goto :goto_0

    .line 414
    :cond_4
    const/16 v3, 0xe

    if-ne v3, v2, :cond_5

    .line 415
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v8, v3}, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/CalendarAllFragments;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    goto :goto_0

    .line 416
    :cond_5
    const/16 v3, 0xf

    if-ne v3, v2, :cond_6

    .line 417
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v9, v3}, Lcom/blank/bm15/activity/fragment/NewsFragment;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/NewsFragment;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    goto :goto_0

    .line 418
    :cond_6
    const/16 v3, 0xc

    if-ne v3, v2, :cond_7

    .line 419
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v9, v3}, Lcom/blank/bm15/activity/fragment/PlayoffsFragment;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/PlayoffsFragment;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    goto :goto_0

    .line 420
    :cond_7
    const/16 v3, 0x14

    if-ne v3, v2, :cond_8

    .line 421
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v9, v3}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    goto :goto_0

    .line 422
    :cond_8
    const/16 v3, 0x15

    if-ne v3, v2, :cond_9

    .line 423
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v9, v3}, Lcom/blank/bm15/activity/fragment/DraftFragment;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/DraftFragment;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    goto/16 :goto_0

    .line 424
    :cond_9
    const/16 v3, 0x16

    if-ne v3, v2, :cond_a

    .line 425
    const v3, 0x7f030011

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/blank/bm15/activity/fragment/TradeFragment;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    goto/16 :goto_0

    .line 426
    :cond_a
    const/16 v3, 0x17

    if-ne v3, v2, :cond_b

    .line 427
    const v3, 0x7f030010

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    goto/16 :goto_0

    .line 428
    :cond_b
    const/16 v3, 0x18

    if-ne v3, v2, :cond_c

    .line 429
    const v3, 0x7f03000e

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/blank/bm15/activity/fragment/FinancesFragment;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/FinancesFragment;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    goto/16 :goto_0

    .line 430
    :cond_c
    const/16 v3, 0x1e

    if-ne v3, v2, :cond_d

    .line 431
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v8, v3}, Lcom/blank/bm15/activity/fragment/Top100AllFragments;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/Top100AllFragments;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    goto/16 :goto_0

    .line 432
    :cond_d
    const/16 v3, 0x1f

    if-ne v3, v2, :cond_e

    .line 433
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v8, v3}, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/RookiesAllFragments;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    goto/16 :goto_0

    .line 434
    :cond_e
    const/16 v3, 0x29

    if-ne v3, v2, :cond_0

    .line 435
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v9, v3}, Lcom/blank/bm15/activity/fragment/ChallengesFragment;->newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/ChallengesFragment;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    goto/16 :goto_0
.end method

.method private loadOpponent()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 573
    new-instance v0, Lcom/blank/bm15/model/object/crud/Match;

    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 574
    .local v0, "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/Match;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 575
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/Match;->setMatchday(Ljava/lang/Integer;)V

    .line 577
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getUserMatchCalendar(Lcom/blank/bm15/model/object/crud/Match;)Ljava/util/List;

    move-result-object v1

    .line 578
    .local v1, "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 579
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "match":Lcom/blank/bm15/model/object/crud/Match;
    check-cast v0, Lcom/blank/bm15/model/object/crud/Match;

    .line 580
    .restart local v0    # "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 581
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    iput-object v2, p0, Lcom/blank/bm15/activity/HomeActivity;->playOpponent:Lcom/blank/bm15/model/object/crud/Team;

    .line 582
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v2, p0, Lcom/blank/bm15/activity/HomeActivity;->playHome:Ljava/lang/Boolean;

    .line 591
    :goto_0
    return-void

    .line 584
    :cond_0
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    iput-object v2, p0, Lcom/blank/bm15/activity/HomeActivity;->playOpponent:Lcom/blank/bm15/model/object/crud/Team;

    .line 585
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v2, p0, Lcom/blank/bm15/activity/HomeActivity;->playHome:Ljava/lang/Boolean;

    goto :goto_0

    .line 588
    :cond_1
    iput-object v4, p0, Lcom/blank/bm15/activity/HomeActivity;->playOpponent:Lcom/blank/bm15/model/object/crud/Team;

    .line 589
    iput-object v4, p0, Lcom/blank/bm15/activity/HomeActivity;->playHome:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method private validateLineup(I)Ljava/lang/Boolean;
    .locals 5
    .param p1, "matchday"    # I

    .prologue
    .line 547
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-static {v2}, Lcom/blank/bm15/model/core/Lineup;->validateTeam(Lcom/blank/bm15/model/object/crud/Team;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 548
    invoke-static {p0}, Lcom/blank/bm15/model/util/Alert;->getBuilder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 549
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    const v2, 0x7f050077

    invoke-virtual {p0, v2}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 550
    const v3, 0x7f05007a

    invoke-virtual {p0, v3}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 551
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 552
    const v3, 0x7f02002e

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 553
    const v3, 0x7f05004d

    invoke-virtual {p0, v3}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/blank/bm15/activity/HomeActivity$18;

    invoke-direct {v4, p0}, Lcom/blank/bm15/activity/HomeActivity$18;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 558
    const v3, 0x7f050048

    invoke-virtual {p0, v3}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/blank/bm15/activity/HomeActivity$19;

    invoke-direct {v4, p0}, Lcom/blank/bm15/activity/HomeActivity$19;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 563
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 564
    .local v0, "alert":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 566
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 568
    .end local v0    # "alert":Landroid/app/AlertDialog;
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    :goto_0
    return-object v2

    :cond_0
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method private validatePlay()Z
    .locals 15

    .prologue
    .line 141
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/16 v11, 0xe2

    if-ge v10, v11, :cond_4

    .line 142
    new-instance v4, Lcom/blank/bm15/model/object/crud/Match;

    invoke-direct {v4, p0}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 143
    .local v4, "filter":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/blank/bm15/model/object/crud/Match;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 144
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/blank/bm15/model/object/crud/Match;->setMatchday(Ljava/lang/Integer;)V

    .line 146
    invoke-static {v4}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v6

    .line 147
    .local v6, "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_2

    .line 302
    .end local v4    # "filter":Lcom/blank/bm15/model/object/crud/Match;
    .end local v6    # "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    :cond_1
    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    :goto_0
    return v10

    .line 147
    .restart local v4    # "filter":Lcom/blank/bm15/model/object/crud/Match;
    .restart local v6    # "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    :cond_2
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/model/object/crud/Match;

    .line 148
    .local v5, "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v11

    if-eqz v11, :cond_0

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v11

    if-eqz v11, :cond_0

    .line 149
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v12

    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    if-eq v11, v12, :cond_3

    .line 150
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v12

    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    if-ne v11, v12, :cond_0

    .line 151
    :cond_3
    new-instance v8, Lcom/blank/bm15/model/object/crud/Team;

    invoke-direct {v8, p0}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 152
    .local v8, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v8, v11}, Lcom/blank/bm15/model/object/crud/Team;->setId(Ljava/lang/Integer;)V

    .line 153
    invoke-static {v8}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 155
    invoke-static {v8}, Lcom/blank/bm15/model/core/Lineup;->validateTeam(Lcom/blank/bm15/model/object/crud/Team;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 156
    invoke-static {p0}, Lcom/blank/bm15/model/util/Alert;->getBuilder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 157
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    const v10, 0x7f050077

    invoke-virtual {p0, v10}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 158
    const v11, 0x7f05007a

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 159
    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 160
    const v11, 0x7f02002e

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 161
    const v11, 0x7f05004d

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Lcom/blank/bm15/activity/HomeActivity$3;

    invoke-direct {v12, p0}, Lcom/blank/bm15/activity/HomeActivity$3;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 166
    const v11, 0x7f0500c0

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Lcom/blank/bm15/activity/HomeActivity$4;

    invoke-direct {v12, p0}, Lcom/blank/bm15/activity/HomeActivity$4;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 172
    const v11, 0x7f050048

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Lcom/blank/bm15/activity/HomeActivity$5;

    invoke-direct {v12, p0}, Lcom/blank/bm15/activity/HomeActivity$5;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 177
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 178
    .local v0, "alert":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 180
    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    goto/16 :goto_0

    .line 185
    .end local v0    # "alert":Landroid/app/AlertDialog;
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v4    # "filter":Lcom/blank/bm15/model/object/crud/Match;
    .end local v5    # "match":Lcom/blank/bm15/model/object/crud/Match;
    .end local v6    # "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    .end local v8    # "team":Lcom/blank/bm15/model/object/crud/Team;
    :cond_4
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/16 v11, 0xe8

    if-ne v10, v11, :cond_5

    .line 186
    new-instance v2, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-direct {v2, p0}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    .line 187
    .local v2, "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v2, v10}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 188
    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v2, v10}, Lcom/blank/bm15/model/object/crud/DraftRound;->setRound(Ljava/lang/Integer;)V

    .line 189
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v3

    .line 190
    .local v3, "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    new-instance v10, Lcom/blank/bm15/model/comparator/DraftRoundComparator;

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-direct {v10, v11, v12}, Lcom/blank/bm15/model/comparator/DraftRoundComparator;-><init>(II)V

    invoke-static {v3, v10}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 191
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_1

    const/4 v10, 0x0

    invoke-interface {v3, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    if-ne v10, v11, :cond_1

    .line 192
    invoke-static {p0}, Lcom/blank/bm15/model/util/Alert;->getBuilder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 193
    .restart local v1    # "builder":Landroid/app/AlertDialog$Builder;
    const v10, 0x7f050077

    invoke-virtual {p0, v10}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 194
    const v11, 0x7f05007b

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 195
    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 196
    const v11, 0x7f02002e

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 197
    const v11, 0x7f05004f

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const v14, 0x7f0500a5

    invoke-virtual {p0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Lcom/blank/bm15/activity/HomeActivity$6;

    invoke-direct {v12, p0}, Lcom/blank/bm15/activity/HomeActivity$6;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 203
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 204
    .restart local v0    # "alert":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 206
    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    goto/16 :goto_0

    .line 208
    .end local v0    # "alert":Landroid/app/AlertDialog;
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v2    # "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    .end local v3    # "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    :cond_5
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/16 v11, 0xe9

    if-ne v10, v11, :cond_6

    .line 209
    new-instance v2, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-direct {v2, p0}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    .line 210
    .restart local v2    # "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v2, v10}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 211
    const/4 v10, 0x2

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v2, v10}, Lcom/blank/bm15/model/object/crud/DraftRound;->setRound(Ljava/lang/Integer;)V

    .line 212
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v3

    .line 213
    .restart local v3    # "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    new-instance v10, Lcom/blank/bm15/model/comparator/DraftRoundComparator;

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-direct {v10, v11, v12}, Lcom/blank/bm15/model/comparator/DraftRoundComparator;-><init>(II)V

    invoke-static {v3, v10}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 214
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_1

    const/4 v10, 0x0

    invoke-interface {v3, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    if-ne v10, v11, :cond_1

    .line 215
    invoke-static {p0}, Lcom/blank/bm15/model/util/Alert;->getBuilder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 216
    .restart local v1    # "builder":Landroid/app/AlertDialog$Builder;
    const v10, 0x7f05006a

    invoke-virtual {p0, v10}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 217
    const v11, 0x7f050074

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 218
    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 219
    const v11, 0x7f02002e

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 220
    const v11, 0x7f05004f

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const v14, 0x7f0500a5

    invoke-virtual {p0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Lcom/blank/bm15/activity/HomeActivity$7;

    invoke-direct {v12, p0}, Lcom/blank/bm15/activity/HomeActivity$7;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 225
    const v11, 0x7f05004e

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Lcom/blank/bm15/activity/HomeActivity$8;

    invoke-direct {v12, p0}, Lcom/blank/bm15/activity/HomeActivity$8;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 232
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 233
    .restart local v0    # "alert":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 235
    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    goto/16 :goto_0

    .line 237
    .end local v0    # "alert":Landroid/app/AlertDialog;
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v2    # "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    .end local v3    # "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    :cond_6
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/16 v11, 0xe4

    if-eq v10, v11, :cond_7

    .line 238
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/16 v11, 0xe5

    if-ne v10, v11, :cond_9

    .line 239
    :cond_7
    new-instance v4, Lcom/blank/bm15/model/object/crud/Player;

    invoke-direct {v4, p0}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 240
    .local v4, "filter":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 241
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 242
    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/blank/bm15/model/object/crud/Player;->setYearsContract(Ljava/lang/Integer;)V

    .line 243
    invoke-static {v4}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v7

    .line 245
    .local v7, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/16 v11, 0xe4

    if-ne v10, v11, :cond_8

    const v9, 0x7f050072

    .line 246
    .local v9, "text":I
    :goto_1
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_1

    .line 247
    invoke-static {p0}, Lcom/blank/bm15/model/util/Alert;->getBuilder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 248
    .restart local v1    # "builder":Landroid/app/AlertDialog$Builder;
    const v10, 0x7f05006a

    invoke-virtual {p0, v10}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 249
    invoke-virtual {p0, v9}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 250
    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 251
    const v11, 0x7f020036

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 252
    const v11, 0x7f05004f

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const v14, 0x7f0500a4

    invoke-virtual {p0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Lcom/blank/bm15/activity/HomeActivity$9;

    invoke-direct {v12, p0}, Lcom/blank/bm15/activity/HomeActivity$9;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 257
    const v11, 0x7f05004e

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Lcom/blank/bm15/activity/HomeActivity$10;

    invoke-direct {v12, p0}, Lcom/blank/bm15/activity/HomeActivity$10;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 264
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 265
    .restart local v0    # "alert":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 267
    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    goto/16 :goto_0

    .line 245
    .end local v0    # "alert":Landroid/app/AlertDialog;
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v9    # "text":I
    :cond_8
    const v9, 0x7f050073

    goto :goto_1

    .line 269
    .end local v4    # "filter":Lcom/blank/bm15/model/object/crud/Player;
    .end local v7    # "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    :cond_9
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/16 v11, 0xea

    if-ne v10, v11, :cond_1

    .line 270
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Tactic;->reloadPlayers()V

    .line 272
    invoke-static {p0}, Lcom/blank/bm15/model/util/Alert;->getBuilder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 273
    .restart local v1    # "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    const/16 v11, 0xd

    if-ge v10, v11, :cond_a

    .line 274
    const v10, 0x7f050077

    invoke-virtual {p0, v10}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 275
    const v11, 0x7f05007e

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 276
    const v11, 0x7f02002e

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 289
    :goto_2
    const/4 v10, 0x0

    invoke-virtual {v1, v10}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 290
    const v11, 0x7f05004f

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const v14, 0x7f0500a7

    invoke-virtual {p0, v14}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Lcom/blank/bm15/activity/HomeActivity$12;

    invoke-direct {v12, p0}, Lcom/blank/bm15/activity/HomeActivity$12;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 296
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 297
    .restart local v0    # "alert":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 299
    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    goto/16 :goto_0

    .line 278
    .end local v0    # "alert":Landroid/app/AlertDialog;
    :cond_a
    const v10, 0x7f05006a

    invoke-virtual {p0, v10}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 279
    const v11, 0x7f050076

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 280
    const v11, 0x7f020036

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 281
    const v11, 0x7f05004e

    invoke-virtual {p0, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Lcom/blank/bm15/activity/HomeActivity$11;

    invoke-direct {v12, p0}, Lcom/blank/bm15/activity/HomeActivity$11;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_2
.end method


# virtual methods
.method public onBackPressed()V
    .locals 6

    .prologue
    .line 111
    iget-object v3, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerList:Landroid/widget/ListView;

    if-eqz v3, :cond_0

    .line 112
    iget-object v3, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerList:Landroid/widget/ListView;

    invoke-virtual {v3, v4}, Landroid/support/v4/widget/DrawerLayout;->closeDrawer(Landroid/view/View;)V

    .line 115
    :cond_0
    invoke-static {p0}, Lcom/blank/bm15/activity/base/BaseActivity;->deleteLastNavigation(Landroid/content/Context;)Lcom/blank/bm15/model/object/crud/Navigation;

    move-result-object v2

    .line 117
    .local v2, "navigation":Lcom/blank/bm15/model/object/crud/Navigation;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Navigation;->getId()Ljava/lang/Integer;

    move-result-object v3

    if-nez v3, :cond_1

    .line 118
    invoke-static {p0}, Lcom/blank/bm15/model/util/Alert;->getBuilder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 119
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    const v3, 0x7f050055

    invoke-virtual {p0, v3}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 120
    const v4, 0x7f050056

    invoke-virtual {p0, v4}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 121
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 122
    const v4, 0x7f02002f

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 123
    const v4, 0x7f050047

    invoke-virtual {p0, v4}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/blank/bm15/activity/HomeActivity$1;

    invoke-direct {v5, p0}, Lcom/blank/bm15/activity/HomeActivity$1;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 128
    const v4, 0x7f050048

    invoke-virtual {p0, v4}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/blank/bm15/activity/HomeActivity$2;

    invoke-direct {v5, p0}, Lcom/blank/bm15/activity/HomeActivity$2;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 133
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 134
    .local v0, "alert":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 138
    .end local v0    # "alert":Landroid/app/AlertDialog;
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    :goto_0
    return-void

    .line 136
    :cond_1
    invoke-direct {p0}, Lcom/blank/bm15/activity/HomeActivity;->loadFragment()V

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 105
    invoke-super {p0, p1}, Lcom/blank/bm15/activity/base/BaseActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 106
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerToggle:Landroid/support/v4/app/ActionBarDrawerToggle;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/ActionBarDrawerToggle;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 107
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 77
    invoke-super {p0, p1}, Lcom/blank/bm15/activity/base/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 78
    const/high16 v0, 0x7f030000

    invoke-virtual {p0, v0}, Lcom/blank/bm15/activity/HomeActivity;->setContentView(I)V

    .line 80
    invoke-direct {p0}, Lcom/blank/bm15/activity/HomeActivity;->loadDrawer()V

    .line 81
    invoke-direct {p0}, Lcom/blank/bm15/activity/HomeActivity;->loadFragment()V

    .line 83
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->isDrawerLocked:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 84
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 85
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 87
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerToggle:Landroid/support/v4/app/ActionBarDrawerToggle;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/ActionBarDrawerToggle;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    const/4 v0, 0x1

    .line 94
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lcom/blank/bm15/activity/base/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onPostCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 99
    invoke-super {p0, p1}, Lcom/blank/bm15/activity/base/BaseActivity;->onPostCreate(Landroid/os/Bundle;)V

    .line 100
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity;->mDrawerToggle:Landroid/support/v4/app/ActionBarDrawerToggle;

    invoke-virtual {v0}, Landroid/support/v4/app/ActionBarDrawerToggle;->syncState()V

    .line 101
    return-void
.end method

.method public play(I)V
    .locals 6
    .param p1, "matchday"    # I

    .prologue
    const/4 v5, 0x0

    .line 519
    invoke-static {p0}, Lcom/blank/bm15/model/util/Alert;->getBuilder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 520
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f05006a

    invoke-virtual {p0, v1}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 521
    const v2, 0x7f05006b

    invoke-virtual {p0, v2}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 522
    invoke-virtual {v1, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 523
    const v2, 0x7f020036

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 524
    const v2, 0x7f050053

    invoke-virtual {p0, v2}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/blank/bm15/activity/HomeActivity$15;

    invoke-direct {v3, p0, p1}, Lcom/blank/bm15/activity/HomeActivity$15;-><init>(Lcom/blank/bm15/activity/HomeActivity;I)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 530
    const v2, 0x7f050054

    invoke-virtual {p0, v2}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/blank/bm15/activity/HomeActivity$16;

    invoke-direct {v3, p0, p1}, Lcom/blank/bm15/activity/HomeActivity$16;-><init>(Lcom/blank/bm15/activity/HomeActivity;I)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 537
    const v2, 0x7f050048

    invoke-virtual {p0, v2}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/blank/bm15/activity/HomeActivity$17;

    invoke-direct {v3, p0}, Lcom/blank/bm15/activity/HomeActivity$17;-><init>(Lcom/blank/bm15/activity/HomeActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 542
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 543
    iget-object v1, p0, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 544
    return-void
.end method
