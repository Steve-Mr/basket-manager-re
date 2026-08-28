.class public Lcom/blank/bm15/activity/fragment/TradeFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "TradeFragment.java"


# instance fields
.field FILTER_SHARED_PREFERENCE:Ljava/lang/String;

.field private numPlayersMinInTeam:Ljava/lang/Integer;

.field private teamButton:Landroid/widget/Button;

.field private teamList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Team;",
            ">;"
        }
    .end annotation
.end field

.field private tempTrade:Lcom/blank/bm15/model/object/crud/Trade;

.field private tempTradeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Trade;",
            ">;"
        }
    .end annotation
.end field

.field private trade:Lcom/blank/bm15/model/object/crud/Trade;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    .line 41
    const-string v0, "FILTER_TRADE"

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->FILTER_SHARED_PREFERENCE:Ljava/lang/String;

    .line 48
    const/16 v0, 0xd

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->numPlayersMinInTeam:Ljava/lang/Integer;

    .line 39
    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/blank/bm15/activity/fragment/TradeFragment;Lcom/blank/bm15/model/object/crud/Trade;)V
    .locals 0

    .prologue
    .line 43
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->trade:Lcom/blank/bm15/model/object/crud/Trade;

    return-void
.end method

.method static synthetic access$10(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Game;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$11(Lcom/blank/bm15/activity/fragment/TradeFragment;)Ljava/util/List;
    .locals 1

    .prologue
    .line 616
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTradeList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$12(Lcom/blank/bm15/activity/fragment/TradeFragment;)V
    .locals 0

    .prologue
    .line 519
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->openTradeDialog()V

    return-void
.end method

.method static synthetic access$13(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;
    .locals 1

    .prologue
    .line 603
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$14(Lcom/blank/bm15/activity/fragment/TradeFragment;Lcom/blank/bm15/model/object/crud/Trade;)V
    .locals 0

    .prologue
    .line 1008
    invoke-direct {p0, p1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->saveTrade(Lcom/blank/bm15/model/object/crud/Trade;)V

    return-void
.end method

.method static synthetic access$2(Lcom/blank/bm15/activity/fragment/TradeFragment;Lcom/blank/bm15/model/object/crud/Trade;)V
    .locals 0

    .prologue
    .line 44
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTrade:Lcom/blank/bm15/model/object/crud/Trade;

    return-void
.end method

.method static synthetic access$3(Lcom/blank/bm15/activity/fragment/TradeFragment;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 45
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTradeList:Ljava/util/List;

    return-void
.end method

.method static synthetic access$4(Lcom/blank/bm15/activity/fragment/TradeFragment;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 46
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->teamButton:Landroid/widget/Button;

    return-void
.end method

.method static synthetic access$5(Lcom/blank/bm15/activity/fragment/TradeFragment;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 47
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->teamList:Ljava/util/List;

    return-void
.end method

.method static synthetic access$6(Lcom/blank/bm15/activity/fragment/TradeFragment;)V
    .locals 0

    .prologue
    .line 73
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->createPage()V

    return-void
.end method

.method static synthetic access$7(Lcom/blank/bm15/activity/fragment/TradeFragment;)Ljava/util/List;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->teamList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;
    .locals 1

    .prologue
    .line 595
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$9(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    .locals 1

    .prologue
    .line 911
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    move-result-object v0

    return-object v0
.end method

.method private createPage()V
    .locals 13

    .prologue
    const v12, 0x7f060027

    const v11, 0x7f05017f

    const/4 v8, 0x0

    const/4 v7, 0x1

    const/4 v10, 0x0

    .line 75
    new-instance v5, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 76
    .local v5, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    iget-object v9, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->FILTER_SHARED_PREFERENCE:Ljava/lang/String;

    invoke-static {v6, v9, v8}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->getInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/blank/bm15/model/object/crud/Team;->setId(Ljava/lang/Integer;)V

    .line 77
    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 78
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->reloadPlayers()V

    .line 81
    new-instance v3, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-direct {v3, v6}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 82
    .local v3, "filter":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 83
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v6

    iput-object v6, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->teamList:Ljava/util/List;

    .line 84
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->teamList:Ljava/util/List;

    new-instance v9, Lcom/blank/bm15/model/comparator/TeamComparator;

    invoke-direct {v9, v7, v7}, Lcom/blank/bm15/model/comparator/TeamComparator;-><init>(II)V

    invoke-static {v6, v9}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 86
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->rootView:Landroid/view/View;

    const v9, 0x7f0b00b5

    invoke-virtual {v6, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    iput-object v6, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->teamButton:Landroid/widget/Button;

    .line 87
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->rootView:Landroid/view/View;

    const v9, 0x7f0b00b7

    invoke-virtual {v6, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 88
    .local v0, "elementButton1":Landroid/widget/Button;
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->rootView:Landroid/view/View;

    const v9, 0x7f0b00b9

    invoke-virtual {v6, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 89
    .local v1, "elementButton2":Landroid/widget/Button;
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->rootView:Landroid/view/View;

    const v9, 0x7f0b00bb

    invoke-virtual {v6, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 90
    .local v2, "elementButton3":Landroid/widget/Button;
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->rootView:Landroid/view/View;

    const v9, 0x7f0b00b3

    invoke-virtual {v6, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    .line 92
    .local v4, "findButton":Landroid/widget/Button;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {v6, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 93
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {v6, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 94
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {v6, v11}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 96
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    if-eqz v6, :cond_1

    move v6, v7

    :goto_0
    invoke-virtual {v0, v6}, Landroid/widget/Button;->setEnabled(Z)V

    .line 97
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    if-eqz v6, :cond_2

    move v6, v7

    :goto_1
    invoke-virtual {v1, v6}, Landroid/widget/Button;->setEnabled(Z)V

    .line 98
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    if-eqz v6, :cond_3

    :goto_2
    invoke-virtual {v2, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 99
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setEnabled(Z)V

    .line 100
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f060026

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 102
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    if-nez v6, :cond_4

    .line 104
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 105
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 106
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 108
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->teamButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    const v8, 0x7f05017e

    invoke-virtual {v7, v8}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 135
    :cond_0
    :goto_3
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->teamButton:Landroid/widget/Button;

    new-instance v7, Lcom/blank/bm15/activity/fragment/TradeFragment$1;

    invoke-direct {v7, p0}, Lcom/blank/bm15/activity/fragment/TradeFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/TradeFragment;)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    invoke-virtual {v0, v10}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 184
    new-instance v6, Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-direct {v6, p0, v0, v4}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;-><init>(Lcom/blank/bm15/activity/fragment/TradeFragment;Landroid/widget/Button;Landroid/widget/Button;)V

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 288
    invoke-virtual {v1, v10}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 289
    new-instance v6, Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-direct {v6, p0, v1, v4}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;-><init>(Lcom/blank/bm15/activity/fragment/TradeFragment;Landroid/widget/Button;Landroid/widget/Button;)V

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 393
    invoke-virtual {v2, v10}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 394
    new-instance v6, Lcom/blank/bm15/activity/fragment/TradeFragment$4;

    invoke-direct {v6, p0, v2, v4}, Lcom/blank/bm15/activity/fragment/TradeFragment$4;-><init>(Lcom/blank/bm15/activity/fragment/TradeFragment;Landroid/widget/Button;Landroid/widget/Button;)V

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 498
    invoke-virtual {v4, v10}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 499
    new-instance v6, Lcom/blank/bm15/activity/fragment/TradeFragment$5;

    invoke-direct {v6, p0}, Lcom/blank/bm15/activity/fragment/TradeFragment$5;-><init>(Lcom/blank/bm15/activity/fragment/TradeFragment;)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 517
    return-void

    :cond_1
    move v6, v8

    .line 96
    goto/16 :goto_0

    :cond_2
    move v6, v8

    .line 97
    goto/16 :goto_1

    :cond_3
    move v7, v8

    .line 98
    goto/16 :goto_2

    .line 110
    :cond_4
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->teamButton:Landroid/widget/Button;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 113
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f06002e

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 114
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f06002e

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 115
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f06002e

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 118
    iput-object v10, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->trade:Lcom/blank/bm15/model/object/crud/Trade;

    .line 119
    iput-object v10, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTradeList:Ljava/util/List;

    .line 122
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-eq v6, v7, :cond_5

    .line 123
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/blank/bm15/model/object/crud/Trade;->setTeamB(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 129
    :goto_4
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    iget-object v6, v6, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    if-eqz v6, :cond_0

    .line 130
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    iget-object v6, v6, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v6}, Landroid/app/AlertDialog;->cancel()V

    goto/16 :goto_3

    .line 125
    :cond_5
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6, v10}, Lcom/blank/bm15/model/object/crud/Trade;->setTeamB(Lcom/blank/bm15/model/object/crud/Team;)V

    goto :goto_4
.end method

.method private getAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    .locals 15

    .prologue
    .line 912
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v12

    iget-object v13, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->FILTER_SHARED_PREFERENCE:Ljava/lang/String;

    const/4 v14, 0x0

    invoke-static {v12, v13, v14}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->getInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v12}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v11

    .line 914
    .local v11, "teamId":I
    new-instance v8, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v12

    invoke-direct {v8, v12}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 915
    .local v8, "playerFilter":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v12

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/blank/bm15/model/object/crud/Team;->setId(Ljava/lang/Integer;)V

    .line 916
    invoke-static {v8}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v3

    .line 917
    .local v3, "auxPlayerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 918
    .local v9, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_0
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_3

    .line 933
    new-instance v12, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v13, 0x1

    const/4 v14, -0x1

    invoke-direct {v12, v13, v14}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v9, v12}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 935
    new-instance v5, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v12

    invoke-direct {v5, v12}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    .line 936
    .local v5, "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v12

    invoke-virtual {v5, v12}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 937
    const/4 v12, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v5, v12}, Lcom/blank/bm15/model/object/crud/DraftRound;->setRound(Ljava/lang/Integer;)V

    .line 938
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v12

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/blank/bm15/model/object/crud/Team;->setId(Ljava/lang/Integer;)V

    .line 939
    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v2

    .line 940
    .local v2, "auxDraftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 941
    .local v6, "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_1
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_b

    .line 957
    new-instance v10, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v12

    invoke-direct {v10, v12}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;-><init>(Landroid/content/Context;)V

    .line 959
    .local v10, "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    new-instance v1, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v12

    const v13, 0x7f03001f

    invoke-direct {v1, v12, v13, v9}, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 960
    .local v1, "adapterPlayer":Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f050182

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12, v1}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 962
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_2

    .line 963
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v12

    const v13, 0x7f030021

    invoke-direct {v0, v12, v13, v6}, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 964
    .local v0, "adapterDrawer":Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f050183

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 967
    .end local v0    # "adapterDrawer":Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;
    :cond_2
    return-object v10

    .line 918
    .end local v1    # "adapterPlayer":Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;
    .end local v2    # "auxDraftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    .end local v5    # "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    .end local v6    # "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    .end local v10    # "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    :cond_3
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/blank/bm15/model/object/crud/Player;

    .line 919
    .local v7, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    if-ne v11, v13, :cond_7

    .line 920
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_4

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    if-eq v13, v14, :cond_0

    .line 921
    :cond_4
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_5

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    if-eq v13, v14, :cond_0

    .line 922
    :cond_5
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_6

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    if-eq v13, v14, :cond_0

    .line 923
    :cond_6
    invoke-interface {v9, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 926
    :cond_7
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_8

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    if-eq v13, v14, :cond_0

    .line 927
    :cond_8
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_9

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    if-eq v13, v14, :cond_0

    .line 928
    :cond_9
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_a

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    if-eq v13, v14, :cond_0

    .line 929
    :cond_a
    invoke-interface {v9, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 941
    .end local v7    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .restart local v2    # "auxDraftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    .restart local v5    # "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    .restart local v6    # "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    :cond_b
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 942
    .local v4, "draftRound":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    if-ne v11, v13, :cond_f

    .line 943
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_c

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    if-eq v13, v14, :cond_1

    .line 944
    :cond_c
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_d

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    if-eq v13, v14, :cond_1

    .line 945
    :cond_d
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_e

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    if-eq v13, v14, :cond_1

    .line 946
    :cond_e
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 949
    :cond_f
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_10

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    if-eq v13, v14, :cond_1

    .line 950
    :cond_10
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_11

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    if-eq v13, v14, :cond_1

    .line 951
    :cond_11
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_12

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v14

    invoke-virtual {v14}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    if-eq v13, v14, :cond_1

    .line 952
    :cond_12
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1
.end method

.method private getAddElementToTrade(DDDDDD)Z
    .locals 19
    .param p1, "elementsValues"    # D
    .param p3, "tradeElementsValues"    # D
    .param p5, "numOfElements"    # D
    .param p7, "numOfTradeElements"    # D
    .param p9, "elementsSalary"    # D
    .param p11, "tradeElementsSalary"    # D

    .prologue
    .line 744
    invoke-direct/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamA()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v2

    .line 745
    .local v2, "numOfPlayersTeamA":I
    invoke-direct/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamB()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v3

    .line 747
    .local v3, "numOfPlayersTeamB":I
    invoke-direct/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamA()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v9

    const/4 v14, 0x0

    invoke-virtual {v9, v14}, Lcom/blank/bm15/model/object/crud/Team;->getTeamSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 748
    .local v6, "salaryTeamA":I
    invoke-direct/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamB()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v9

    const/4 v14, 0x0

    invoke-virtual {v9, v14}, Lcom/blank/bm15/model/object/crud/Team;->getTeamSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 749
    .local v7, "salaryTeamB":I
    invoke-direct/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamA()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 750
    .local v4, "salaryCapTeamA":I
    invoke-direct/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamB()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 752
    .local v5, "salaryCapTeamB":I
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->FILTER_SHARED_PREFERENCE:Ljava/lang/String;

    const/4 v15, 0x0

    invoke-static {v9, v14, v15}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->getInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v9}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 754
    .local v8, "teamId":I
    const-wide/high16 v14, 0x4008000000000000L    # 3.0

    mul-double v14, v14, p1

    const-wide/high16 v16, 0x4059000000000000L    # 100.0

    div-double v10, v14, v16

    .line 755
    .local v10, "value1":D
    const-wide/high16 v14, 0x4028000000000000L    # 12.0

    mul-double v14, v14, p1

    const-wide/high16 v16, 0x4059000000000000L    # 100.0

    div-double v12, v14, v16

    .line 756
    .local v12, "value2":D
    sub-double v14, v12, v10

    const-wide/high16 v16, 0x401c000000000000L    # 7.0

    cmpg-double v9, v14, v16

    if-gez v9, :cond_0

    .line 757
    const-wide/high16 v14, 0x401c000000000000L    # 7.0

    add-double v12, v10, v14

    .line 760
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-ne v9, v8, :cond_4

    .line 761
    add-double v14, p3, v10

    cmpl-double v9, p1, v14

    if-lez v9, :cond_4

    add-double v14, p3, v12

    cmpg-double v9, p1, v14

    if-gez v9, :cond_4

    .line 763
    int-to-double v14, v2

    sub-double v14, v14, p5

    add-double v14, v14, p7

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->numPlayersMinInTeam:Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    int-to-double v0, v9

    move-wide/from16 v16, v0

    cmpl-double v9, v14, v16

    if-ltz v9, :cond_8

    int-to-double v14, v2

    sub-double v14, v14, p5

    add-double v14, v14, p7

    const-wide/high16 v16, 0x4035000000000000L    # 21.0

    cmpg-double v9, v14, v16

    if-gez v9, :cond_8

    .line 764
    int-to-double v14, v3

    sub-double v14, v14, p7

    add-double v14, v14, p5

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->numPlayersMinInTeam:Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    int-to-double v0, v9

    move-wide/from16 v16, v0

    cmpl-double v9, v14, v16

    if-ltz v9, :cond_8

    int-to-double v14, v3

    sub-double v14, v14, p7

    add-double v14, v14, p5

    const-wide/high16 v16, 0x4035000000000000L    # 21.0

    cmpg-double v9, v14, v16

    if-gez v9, :cond_8

    .line 766
    cmpg-double v9, p11, p9

    if-ltz v9, :cond_1

    int-to-double v14, v6

    add-double v14, v14, p11

    sub-double v14, v14, p9

    int-to-double v0, v4

    move-wide/from16 v16, v0

    cmpg-double v9, v14, v16

    if-gez v9, :cond_3

    .line 767
    :cond_1
    cmpl-double v9, p11, p9

    if-gtz v9, :cond_2

    int-to-double v14, v7

    sub-double v14, v14, p11

    add-double v14, v14, p9

    int-to-double v0, v5

    move-wide/from16 v16, v0

    cmpg-double v9, v14, v16

    if-gez v9, :cond_3

    .line 768
    :cond_2
    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    .line 787
    :goto_0
    return v9

    .line 770
    :cond_3
    sget-object v9, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    goto :goto_0

    .line 773
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-eq v9, v8, :cond_8

    .line 774
    add-double v14, p1, v10

    cmpg-double v9, v14, p3

    if-gez v9, :cond_8

    add-double v14, p1, v12

    cmpl-double v9, v14, p3

    if-lez v9, :cond_8

    .line 776
    int-to-double v14, v2

    sub-double v14, v14, p7

    add-double v14, v14, p5

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->numPlayersMinInTeam:Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    int-to-double v0, v9

    move-wide/from16 v16, v0

    cmpl-double v9, v14, v16

    if-ltz v9, :cond_8

    int-to-double v14, v2

    sub-double v14, v14, p7

    add-double v14, v14, p5

    const-wide/high16 v16, 0x4035000000000000L    # 21.0

    cmpg-double v9, v14, v16

    if-gez v9, :cond_8

    .line 777
    int-to-double v14, v3

    sub-double v14, v14, p5

    add-double v14, v14, p7

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->numPlayersMinInTeam:Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    int-to-double v0, v9

    move-wide/from16 v16, v0

    cmpl-double v9, v14, v16

    if-ltz v9, :cond_8

    int-to-double v14, v3

    sub-double v14, v14, p5

    add-double v14, v14, p7

    const-wide/high16 v16, 0x4035000000000000L    # 21.0

    cmpg-double v9, v14, v16

    if-gez v9, :cond_8

    .line 779
    cmpl-double v9, p11, p9

    if-gtz v9, :cond_5

    int-to-double v14, v6

    sub-double v14, v14, p11

    add-double v14, v14, p9

    int-to-double v0, v4

    move-wide/from16 v16, v0

    cmpg-double v9, v14, v16

    if-gez v9, :cond_7

    .line 780
    :cond_5
    cmpg-double v9, p11, p9

    if-ltz v9, :cond_6

    int-to-double v14, v7

    add-double v14, v14, p11

    sub-double v14, v14, p9

    int-to-double v0, v5

    move-wide/from16 v16, v0

    cmpg-double v9, v14, v16

    if-gez v9, :cond_7

    .line 781
    :cond_6
    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    goto/16 :goto_0

    .line 783
    :cond_7
    sget-object v9, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    goto/16 :goto_0

    .line 787
    :cond_8
    sget-object v9, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    goto/16 :goto_0
.end method

.method private getElements(I)D
    .locals 11
    .param p1, "type"    # I

    .prologue
    const/4 v6, 0x0

    const-wide/16 v8, 0x0

    const/4 v5, 0x1

    .line 819
    const-wide/16 v2, 0x0

    .line 820
    .local v2, "result":D
    if-ne p1, v5, :cond_7

    move v4, v5

    .line 821
    .local v4, "value":Z
    :goto_0
    const/4 v7, 0x2

    if-ne p1, v7, :cond_8

    move v0, v5

    .line 823
    .local v0, "number":Z
    :goto_1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    iget-object v10, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->FILTER_SHARED_PREFERENCE:Ljava/lang/String;

    invoke-static {v7, v10, v6}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->getInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 824
    .local v1, "teamId":I
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v6, v1, :cond_11

    .line 826
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 827
    if-eqz v4, :cond_9

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getMarketValue()D

    move-result-wide v6

    :goto_2
    add-double/2addr v2, v6

    .line 829
    :cond_0
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 830
    if-eqz v4, :cond_b

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getMarketValue()D

    move-result-wide v6

    :goto_3
    add-double/2addr v2, v6

    .line 832
    :cond_1
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 833
    if-eqz v4, :cond_d

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getMarketValue()D

    move-result-wide v6

    :goto_4
    add-double/2addr v2, v6

    .line 835
    :cond_2
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 836
    if-eqz v4, :cond_f

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getMarketValue()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    :goto_5
    add-double/2addr v2, v6

    .line 838
    :cond_3
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 839
    if-eqz v4, :cond_10

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getMarketValue()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    :goto_6
    add-double/2addr v2, v6

    .line 841
    :cond_4
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_6

    .line 842
    if-eqz v4, :cond_5

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getMarketValue()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    :cond_5
    add-double/2addr v2, v8

    .line 866
    :cond_6
    :goto_7
    return-wide v2

    .end local v0    # "number":Z
    .end local v1    # "teamId":I
    .end local v4    # "value":Z
    :cond_7
    move v4, v6

    .line 820
    goto/16 :goto_0

    .restart local v4    # "value":Z
    :cond_8
    move v0, v6

    .line 821
    goto/16 :goto_1

    .line 827
    .restart local v0    # "number":Z
    .restart local v1    # "teamId":I
    :cond_9
    if-eqz v0, :cond_a

    move v6, v5

    :goto_8
    int-to-double v6, v6

    goto/16 :goto_2

    :cond_a
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_8

    .line 830
    :cond_b
    if-eqz v0, :cond_c

    move v6, v5

    :goto_9
    int-to-double v6, v6

    goto/16 :goto_3

    :cond_c
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_9

    .line 833
    :cond_d
    if-eqz v0, :cond_e

    :goto_a
    int-to-double v6, v5

    goto/16 :goto_4

    :cond_e
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_a

    :cond_f
    move-wide v6, v8

    .line 836
    goto/16 :goto_5

    :cond_10
    move-wide v6, v8

    .line 839
    goto :goto_6

    .line 846
    :cond_11
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v6

    if-eqz v6, :cond_12

    .line 847
    if-eqz v4, :cond_18

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getMarketValue()D

    move-result-wide v6

    :goto_b
    add-double/2addr v2, v6

    .line 849
    :cond_12
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v6

    if-eqz v6, :cond_13

    .line 850
    if-eqz v4, :cond_1a

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getMarketValue()D

    move-result-wide v6

    :goto_c
    add-double/2addr v2, v6

    .line 852
    :cond_13
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v6

    if-eqz v6, :cond_14

    .line 853
    if-eqz v4, :cond_1c

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getMarketValue()D

    move-result-wide v6

    :goto_d
    add-double/2addr v2, v6

    .line 855
    :cond_14
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_15

    .line 856
    if-eqz v4, :cond_1e

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getMarketValue()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    :goto_e
    add-double/2addr v2, v6

    .line 858
    :cond_15
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_16

    .line 859
    if-eqz v4, :cond_1f

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getMarketValue()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    :goto_f
    add-double/2addr v2, v6

    .line 861
    :cond_16
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_6

    .line 862
    if-eqz v4, :cond_17

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getMarketValue()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    :cond_17
    add-double/2addr v2, v8

    goto/16 :goto_7

    .line 847
    :cond_18
    if-eqz v0, :cond_19

    move v6, v5

    :goto_10
    int-to-double v6, v6

    goto/16 :goto_b

    :cond_19
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_10

    .line 850
    :cond_1a
    if-eqz v0, :cond_1b

    move v6, v5

    :goto_11
    int-to-double v6, v6

    goto/16 :goto_c

    :cond_1b
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_11

    .line 853
    :cond_1c
    if-eqz v0, :cond_1d

    :goto_12
    int-to-double v6, v5

    goto/16 :goto_d

    :cond_1d
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_12

    :cond_1e
    move-wide v6, v8

    .line 856
    goto/16 :goto_e

    :cond_1f
    move-wide v6, v8

    .line 859
    goto :goto_f
.end method

.method private getElementsNumOfPlayer()D
    .locals 2

    .prologue
    .line 811
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getElements(I)D

    move-result-wide v0

    return-wide v0
.end method

.method private getElementsSalary()D
    .locals 2

    .prologue
    .line 815
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getElements(I)D

    move-result-wide v0

    return-wide v0
.end method

.method private getElementsValue()D
    .locals 2

    .prologue
    .line 807
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getElements(I)D

    move-result-wide v0

    return-wide v0
.end method

.method private getPlayersAndDraftRounds(Lcom/blank/bm15/model/object/crud/Team;)Ljava/util/List;
    .locals 14
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Team;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v13, 0x2

    .line 871
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 872
    .local v3, "isUserTeam":Ljava/lang/Boolean;
    if-nez p1, :cond_0

    .line 873
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 874
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getRandomTeam()V

    .line 875
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamB()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object p1

    .line 878
    :cond_0
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 880
    .local v7, "playersAndDraftRounds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_1
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_2

    .line 899
    new-instance v1, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v10

    invoke-direct {v1, v10}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    .line 900
    .local v1, "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v10

    invoke-virtual {v1, v10}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 901
    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v1, v10}, Lcom/blank/bm15/model/object/crud/DraftRound;->setRound(Ljava/lang/Integer;)V

    .line 902
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v10

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/blank/bm15/model/object/crud/Team;->setId(Ljava/lang/Integer;)V

    .line 903
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v2

    .line 904
    .local v2, "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_5

    .line 908
    return-object v7

    .line 880
    .end local v1    # "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    .end local v2    # "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    :cond_2
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/blank/bm15/model/object/crud/Player;

    .line 881
    .local v6, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    if-eqz v11, :cond_3

    .line 882
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 884
    :cond_3
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    invoke-virtual {p1, v11}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v11

    add-int/lit8 v4, v11, -0x1

    .line 885
    .local v4, "numPlayersOfPositionFirst":I
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    invoke-virtual {p1, v11}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v5

    .line 886
    .local v5, "numPlayersOfPositionSecond":I
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    if-eqz v11, :cond_4

    .line 887
    add-int/lit8 v5, v5, -0x1

    .line 890
    :cond_4
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v11

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-virtual {v11, v12}, Lcom/blank/bm15/model/object/crud/Trade;->getNumPlayersOfPosition(I)I

    move-result v8

    .line 891
    .local v8, "tradeNumOfPlayersOfPositionFirst":I
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v11

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-virtual {v11, v12}, Lcom/blank/bm15/model/object/crud/Trade;->getNumPlayersOfPosition(I)I

    move-result v9

    .line 893
    .local v9, "tradeNumOfPlayersOfPositionSecond":I
    add-int v11, v4, v8

    if-le v11, v13, :cond_1

    add-int v11, v5, v9

    if-le v11, v13, :cond_1

    .line 894
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 904
    .end local v4    # "numPlayersOfPositionFirst":I
    .end local v5    # "numPlayersOfPositionSecond":I
    .end local v6    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .end local v8    # "tradeNumOfPlayersOfPositionFirst":I
    .end local v9    # "tradeNumOfPlayersOfPositionSecond":I
    .restart local v1    # "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    .restart local v2    # "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    :cond_5
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 905
    .local v0, "draftRound":Lcom/blank/bm15/model/object/crud/DraftRound;
    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private getRandomTeam()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 791
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->FILTER_SHARED_PREFERENCE:Ljava/lang/String;

    invoke-static {v3, v4, v6}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->getInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 793
    .local v2, "teamId":I
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v2, :cond_1

    .line 794
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 795
    .local v0, "ok":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_2

    .line 804
    .end local v0    # "ok":Z
    :cond_1
    return-void

    .line 796
    .restart local v0    # "ok":Z
    :cond_2
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->teamList:Ljava/util/List;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->teamList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Team;

    .line 798
    .local v1, "randomTeam":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eq v3, v2, :cond_0

    .line 799
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setTeamB(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 800
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_0
.end method

.method private getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;
    .locals 3

    .prologue
    .line 604
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTrade:Lcom/blank/bm15/model/object/crud/Trade;

    if-nez v1, :cond_0

    .line 605
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTradeList()Ljava/util/List;

    move-result-object v0

    .line 607
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Trade;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 608
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Trade;

    iput-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTrade:Lcom/blank/bm15/model/object/crud/Trade;

    .line 613
    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Trade;>;"
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTrade:Lcom/blank/bm15/model/object/crud/Trade;

    return-object v1

    .line 610
    .restart local v0    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Trade;>;"
    :cond_1
    new-instance v1, Lcom/blank/bm15/model/object/crud/Trade;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Trade;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTrade:Lcom/blank/bm15/model/object/crud/Trade;

    goto :goto_0
.end method

.method private getTempTradeList()Ljava/util/List;
    .locals 52
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Trade;",
            ">;"
        }
    .end annotation

    .prologue
    .line 617
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->FILTER_SHARED_PREFERENCE:Ljava/lang/String;

    const/4 v11, 0x0

    invoke-static {v3, v10, v11}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->getInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v51

    .line 619
    .local v51, "teamId":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTradeList:Ljava/util/List;

    if-nez v3, :cond_0

    .line 620
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTradeList:Ljava/util/List;

    .line 622
    const/16 v50, 0x0

    .line 624
    .local v50, "playersAndDraftRounds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/16 v45, 0x0

    .local v45, "jumps":I
    :goto_0
    const/16 v3, 0xa

    move/from16 v0, v45

    if-ge v0, v3, :cond_0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTradeList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 740
    .end local v45    # "jumps":I
    .end local v50    # "playersAndDraftRounds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTradeList:Ljava/util/List;

    return-object v3

    .line 625
    .restart local v45    # "jumps":I
    .restart local v50    # "playersAndDraftRounds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    move/from16 v0, v51

    if-ne v3, v0, :cond_2

    .line 626
    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getPlayersAndDraftRounds(Lcom/blank/bm15/model/object/crud/Team;)Ljava/util/List;

    move-result-object v50

    .line 630
    :goto_1
    new-instance v3, Lcom/blank/bm15/model/comparator/PlayerOrDraftRoundComparator;

    const/4 v10, 0x0

    const/4 v11, 0x1

    invoke-direct {v3, v10, v11}, Lcom/blank/bm15/model/comparator/PlayerOrDraftRoundComparator;-><init>(II)V

    move-object/from16 v0, v50

    invoke-static {v0, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 632
    invoke-direct/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getElementsValue()D

    move-result-wide v4

    .line 633
    .local v4, "elementsValues":D
    invoke-direct/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getElementsSalary()D

    move-result-wide v12

    .line 634
    .local v12, "elementsSalary":D
    invoke-direct/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getElementsNumOfPlayer()D

    move-result-wide v8

    .line 636
    .local v8, "numOfElements":D
    const-wide/16 v6, 0x0

    .line 637
    .local v6, "tradeElementsValues1":D
    const-wide/16 v20, 0x0

    .line 638
    .local v20, "tradeElementsValues2":D
    const-wide/16 v34, 0x0

    .line 640
    .local v34, "tradeElementsValues3":D
    const-wide/16 v14, 0x0

    .line 641
    .local v14, "tradeElementsSalary1":D
    const-wide/16 v28, 0x0

    .line 642
    .local v28, "tradeElementsSalary2":D
    const-wide/16 v42, 0x0

    .line 644
    .local v42, "tradeElementsSalary3":D
    const/16 v30, 0x0

    .local v30, "i":I
    :goto_2
    invoke-interface/range {v50 .. v50}, Ljava/util/List;->size()I

    move-result v3

    move/from16 v0, v30

    if-lt v0, v3, :cond_3

    .line 735
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    move/from16 v0, v51

    if-ne v3, v0, :cond_0

    .line 624
    add-int/lit8 v45, v45, 0x1

    goto :goto_0

    .line 628
    .end local v4    # "elementsValues":D
    .end local v6    # "tradeElementsValues1":D
    .end local v8    # "numOfElements":D
    .end local v12    # "elementsSalary":D
    .end local v14    # "tradeElementsSalary1":D
    .end local v20    # "tradeElementsValues2":D
    .end local v28    # "tradeElementsSalary2":D
    .end local v30    # "i":I
    .end local v34    # "tradeElementsValues3":D
    .end local v42    # "tradeElementsSalary3":D
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getPlayersAndDraftRounds(Lcom/blank/bm15/model/object/crud/Team;)Ljava/util/List;

    move-result-object v50

    goto :goto_1

    .line 645
    .restart local v4    # "elementsValues":D
    .restart local v6    # "tradeElementsValues1":D
    .restart local v8    # "numOfElements":D
    .restart local v12    # "elementsSalary":D
    .restart local v14    # "tradeElementsSalary1":D
    .restart local v20    # "tradeElementsValues2":D
    .restart local v28    # "tradeElementsSalary2":D
    .restart local v30    # "i":I
    .restart local v34    # "tradeElementsValues3":D
    .restart local v42    # "tradeElementsSalary3":D
    :cond_3
    const-wide/16 v6, 0x0

    .line 646
    const-wide/16 v14, 0x0

    .line 647
    new-instance v2, Lcom/blank/bm15/model/object/crud/Trade;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/blank/bm15/model/object/crud/Trade;-><init>(Landroid/content/Context;)V

    .line 648
    .local v2, "aux":Lcom/blank/bm15/model/object/crud/Trade;
    move-object/from16 v0, v50

    move/from16 v1, v30

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v47

    .line 651
    .local v47, "obj1":Ljava/lang/Object;
    move-object/from16 v0, v47

    instance-of v3, v0, Lcom/blank/bm15/model/object/crud/Player;

    if-eqz v3, :cond_5

    move-object/from16 v3, v47

    .line 652
    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getMarketValue()D

    move-result-wide v10

    add-double/2addr v6, v10

    move-object/from16 v3, v47

    .line 653
    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-double v10, v3

    add-double/2addr v14, v10

    .line 654
    check-cast v47, Lcom/blank/bm15/model/object/crud/Player;

    .end local v47    # "obj1":Ljava/lang/Object;
    move-object/from16 v0, v47

    invoke-virtual {v2, v0}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerA1(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 656
    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v15}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getAddElementToTrade(DDDDDD)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 657
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTradeList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 644
    :cond_4
    :goto_3
    add-int/lit8 v30, v30, 0x1

    goto :goto_2

    .restart local v47    # "obj1":Ljava/lang/Object;
    :cond_5
    move-object/from16 v3, v47

    .line 661
    check-cast v3, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/DraftRound;->getMarketValue()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    add-double/2addr v6, v10

    .line 662
    check-cast v47, Lcom/blank/bm15/model/object/crud/DraftRound;

    .end local v47    # "obj1":Ljava/lang/Object;
    move-object/from16 v0, v47

    invoke-virtual {v2, v0}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundA1(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 664
    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v15}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getAddElementToTrade(DDDDDD)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 665
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTradeList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 670
    :cond_6
    add-int/lit8 v44, v30, 0x1

    .local v44, "j":I
    :goto_4
    invoke-interface/range {v50 .. v50}, Ljava/util/List;->size()I

    move-result v3

    move/from16 v0, v44

    if-ge v0, v3, :cond_4

    .line 671
    move-wide/from16 v20, v6

    .line 672
    move-wide/from16 v28, v14

    .line 673
    move-object/from16 v0, v50

    move/from16 v1, v44

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v48

    .line 675
    .local v48, "obj2":Ljava/lang/Object;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerA2(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 676
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundA2(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 677
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerA3(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 678
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundA3(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 681
    move-object/from16 v0, v48

    instance-of v3, v0, Lcom/blank/bm15/model/object/crud/Player;

    if-eqz v3, :cond_8

    move-object/from16 v3, v48

    .line 682
    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getMarketValue()D

    move-result-wide v10

    add-double v20, v20, v10

    move-object/from16 v3, v48

    .line 683
    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-double v10, v3

    add-double v28, v28, v10

    .line 684
    check-cast v48, Lcom/blank/bm15/model/object/crud/Player;

    .end local v48    # "obj2":Ljava/lang/Object;
    move-object/from16 v0, v48

    invoke-virtual {v2, v0}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerA2(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 686
    const-wide/high16 v24, 0x4000000000000000L    # 2.0

    move-object/from16 v17, p0

    move-wide/from16 v18, v4

    move-wide/from16 v22, v8

    move-wide/from16 v26, v12

    invoke-direct/range {v17 .. v29}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getAddElementToTrade(DDDDDD)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 687
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTradeList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 688
    new-instance v16, Lcom/blank/bm15/model/object/crud/Trade;

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Lcom/blank/bm15/model/object/crud/Trade;-><init>(Lcom/blank/bm15/model/object/crud/Trade;)V

    .end local v2    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    .local v16, "aux":Lcom/blank/bm15/model/object/crud/Trade;
    move-object/from16 v2, v16

    .line 670
    .end local v16    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    .restart local v2    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    :cond_7
    :goto_5
    add-int/lit8 v44, v44, 0x1

    goto :goto_4

    .restart local v48    # "obj2":Ljava/lang/Object;
    :cond_8
    move-object/from16 v3, v48

    .line 692
    check-cast v3, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/DraftRound;->getMarketValue()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    add-double v20, v20, v10

    .line 693
    check-cast v48, Lcom/blank/bm15/model/object/crud/DraftRound;

    .end local v48    # "obj2":Ljava/lang/Object;
    move-object/from16 v0, v48

    invoke-virtual {v2, v0}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundA2(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 695
    const-wide/high16 v24, 0x4000000000000000L    # 2.0

    move-object/from16 v17, p0

    move-wide/from16 v18, v4

    move-wide/from16 v22, v8

    move-wide/from16 v26, v12

    invoke-direct/range {v17 .. v29}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getAddElementToTrade(DDDDDD)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 696
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTradeList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 697
    new-instance v16, Lcom/blank/bm15/model/object/crud/Trade;

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Lcom/blank/bm15/model/object/crud/Trade;-><init>(Lcom/blank/bm15/model/object/crud/Trade;)V

    .end local v2    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    .restart local v16    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    move-object/from16 v2, v16

    .line 698
    .end local v16    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    .restart local v2    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    goto :goto_5

    .line 702
    :cond_9
    add-int/lit8 v46, v44, 0x1

    .local v46, "k":I
    :goto_6
    invoke-interface/range {v50 .. v50}, Ljava/util/List;->size()I

    move-result v3

    move/from16 v0, v46

    if-ge v0, v3, :cond_7

    .line 703
    move-wide/from16 v34, v20

    .line 704
    move-wide/from16 v42, v28

    .line 705
    move-object/from16 v0, v50

    move/from16 v1, v46

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v49

    .line 707
    .local v49, "obj3":Ljava/lang/Object;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerA3(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 708
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundA3(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 711
    move-object/from16 v0, v49

    instance-of v3, v0, Lcom/blank/bm15/model/object/crud/Player;

    if-eqz v3, :cond_a

    move-object/from16 v3, v49

    .line 712
    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getMarketValue()D

    move-result-wide v10

    add-double v34, v34, v10

    move-object/from16 v3, v49

    .line 713
    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-double v10, v3

    add-double v42, v42, v10

    .line 714
    check-cast v49, Lcom/blank/bm15/model/object/crud/Player;

    .end local v49    # "obj3":Ljava/lang/Object;
    move-object/from16 v0, v49

    invoke-virtual {v2, v0}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerA3(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 716
    const-wide/high16 v38, 0x4008000000000000L    # 3.0

    move-object/from16 v31, p0

    move-wide/from16 v32, v4

    move-wide/from16 v36, v8

    move-wide/from16 v40, v12

    invoke-direct/range {v31 .. v43}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getAddElementToTrade(DDDDDD)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 717
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTradeList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 718
    new-instance v16, Lcom/blank/bm15/model/object/crud/Trade;

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Lcom/blank/bm15/model/object/crud/Trade;-><init>(Lcom/blank/bm15/model/object/crud/Trade;)V

    .end local v2    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    .restart local v16    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    move-object/from16 v2, v16

    .line 719
    .end local v16    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    .restart local v2    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    goto/16 :goto_5

    .restart local v49    # "obj3":Ljava/lang/Object;
    :cond_a
    move-object/from16 v3, v49

    .line 722
    check-cast v3, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/DraftRound;->getMarketValue()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    add-double v34, v34, v10

    .line 723
    check-cast v49, Lcom/blank/bm15/model/object/crud/DraftRound;

    .end local v49    # "obj3":Ljava/lang/Object;
    move-object/from16 v0, v49

    invoke-virtual {v2, v0}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundA3(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 725
    const-wide/high16 v38, 0x4008000000000000L    # 3.0

    move-object/from16 v31, p0

    move-wide/from16 v32, v4

    move-wide/from16 v36, v8

    move-wide/from16 v40, v12

    invoke-direct/range {v31 .. v43}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getAddElementToTrade(DDDDDD)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 726
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTradeList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 727
    new-instance v16, Lcom/blank/bm15/model/object/crud/Trade;

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Lcom/blank/bm15/model/object/crud/Trade;-><init>(Lcom/blank/bm15/model/object/crud/Trade;)V

    .end local v2    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    .restart local v16    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    move-object/from16 v2, v16

    .line 728
    .end local v16    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    .restart local v2    # "aux":Lcom/blank/bm15/model/object/crud/Trade;
    goto/16 :goto_5

    .line 702
    :cond_b
    add-int/lit8 v46, v46, 0x1

    goto/16 :goto_6
.end method

.method private getTrade()Lcom/blank/bm15/model/object/crud/Trade;
    .locals 2

    .prologue
    .line 596
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->trade:Lcom/blank/bm15/model/object/crud/Trade;

    if-nez v0, :cond_0

    .line 597
    new-instance v0, Lcom/blank/bm15/model/object/crud/Trade;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->trade:Lcom/blank/bm15/model/object/crud/Trade;

    .line 598
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->trade:Lcom/blank/bm15/model/object/crud/Trade;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setTeamA(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 600
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->trade:Lcom/blank/bm15/model/object/crud/Trade;

    return-object v0
.end method

.method private getTradeAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    .locals 7

    .prologue
    .line 972
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 973
    .local v3, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 974
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 976
    :cond_0
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 977
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 979
    :cond_1
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 980
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 982
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 983
    .local v2, "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 984
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 986
    :cond_3
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 987
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 989
    :cond_4
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_5

    .line 990
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 993
    :cond_5
    new-instance v4, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;-><init>(Landroid/content/Context;)V

    .line 995
    .local v4, "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_6

    .line 996
    new-instance v1, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    const v6, 0x7f03001f

    invoke-direct {v1, v5, v6, v3}, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 997
    .local v1, "adapterPlayer":Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f050182

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v1}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 1000
    .end local v1    # "adapterPlayer":Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;
    :cond_6
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_7

    .line 1001
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    const v6, 0x7f030021

    invoke-direct {v0, v5, v6, v2}, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 1002
    .local v0, "adapterDrawer":Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f050183

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 1005
    .end local v0    # "adapterDrawer":Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;
    :cond_7
    return-object v4
.end method

.method public static final newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/TradeFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I
    .param p1, "navigationMode"    # Ljava/lang/Integer;

    .prologue
    .line 51
    new-instance v1, Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;-><init>()V

    .line 53
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/TradeFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 54
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/TradeFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 55
    sget-object v2, Lcom/blank/bm15/activity/fragment/TradeFragment;->NAVIGATION_MODE:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 56
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->setArguments(Landroid/os/Bundle;)V

    .line 58
    return-object v1
.end method

.method private openTradeDialog()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    const v10, 0x7f050180

    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 520
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->FILTER_SHARED_PREFERENCE:Ljava/lang/String;

    invoke-static {v6, v7, v9}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->getInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 521
    .local v4, "teamId":I
    iput-object v11, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->tempTrade:Lcom/blank/bm15/model/object/crud/Trade;

    .line 522
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTempTrade()Lcom/blank/bm15/model/object/crud/Trade;

    .line 524
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-direct {v0, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 525
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/activity/HomeActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    .line 527
    .local v2, "inflater":Landroid/view/LayoutInflater;
    const v6, 0x7f030006

    invoke-virtual {v2, v6, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 528
    .local v1, "dialogView":Landroid/view/View;
    const v6, 0x7f0b002f

    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 529
    .local v5, "textView":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v6, v4, :cond_0

    .line 530
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {v6, v10}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-array v7, v8, [Ljava/lang/Object;

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamB()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 534
    :goto_0
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 536
    const v6, 0x7f0b0030

    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    .line 537
    .local v3, "listView":Landroid/widget/ListView;
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTradeAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 539
    const v6, 0x7f050047

    invoke-virtual {p0, v6}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/blank/bm15/activity/fragment/TradeFragment$6;

    invoke-direct {v7, p0, v4}, Lcom/blank/bm15/activity/fragment/TradeFragment$6;-><init>(Lcom/blank/bm15/activity/fragment/TradeFragment;I)V

    invoke-virtual {v0, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 565
    const v7, 0x7f050050

    invoke-virtual {p0, v7}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lcom/blank/bm15/activity/fragment/TradeFragment$7;

    invoke-direct {v8, p0, v4}, Lcom/blank/bm15/activity/fragment/TradeFragment$7;-><init>(Lcom/blank/bm15/activity/fragment/TradeFragment;I)V

    invoke-virtual {v6, v7, v8}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 585
    const v7, 0x7f050048

    invoke-virtual {p0, v7}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lcom/blank/bm15/activity/fragment/TradeFragment$8;

    invoke-direct {v8, p0}, Lcom/blank/bm15/activity/fragment/TradeFragment$8;-><init>(Lcom/blank/bm15/activity/fragment/TradeFragment;)V

    invoke-virtual {v6, v7, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 591
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    iput-object v7, v6, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 592
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    iget-object v6, v6, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v6}, Landroid/app/AlertDialog;->show()V

    .line 593
    return-void

    .line 532
    .end local v3    # "listView":Landroid/widget/ListView;
    :cond_0
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {v6, v10}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-array v7, v8, [Ljava/lang/Object;

    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getTrade()Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamA()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private saveTrade(Lcom/blank/bm15/model/object/crud/Trade;)V
    .locals 4
    .param p1, "trade"    # Lcom/blank/bm15/model/object/crud/Trade;

    .prologue
    .line 1009
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1010
    .local v1, "savePlayerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1012
    .local v0, "saveDraftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1013
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamB()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 1014
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1016
    :cond_0
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 1017
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamB()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 1018
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1020
    :cond_1
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 1021
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamB()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 1022
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1024
    :cond_2
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 1025
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamA()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 1026
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1028
    :cond_3
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 1029
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamA()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 1030
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1032
    :cond_4
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 1033
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamA()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 1034
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1036
    :cond_5
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 1038
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 1039
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamB()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamUser(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 1040
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1042
    :cond_6
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_7

    .line 1043
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamB()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamUser(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 1044
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1046
    :cond_7
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_8

    .line 1047
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamB()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamUser(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 1048
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1050
    :cond_8
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_9

    .line 1051
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamA()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamUser(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 1052
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1054
    :cond_9
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 1055
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamA()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamUser(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 1056
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1058
    :cond_a
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_b

    .line 1059
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getTeamA()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/DraftRound;->setTeamUser(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 1060
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1062
    :cond_b
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 1063
    return-void
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 63
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 66
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0xe7

    if-ne v0, v1, :cond_0

    .line 67
    const/4 v0, 0x7

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment;->numPlayersMinInTeam:Ljava/lang/Integer;

    .line 70
    :cond_0
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->createPage()V

    .line 71
    return-void
.end method
