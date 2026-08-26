.class public Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "Top100StatisticsFragment.java"


# instance fields
.field private orderBy:Ljava/lang/Integer;

.field private textButton:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 29
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    .line 31
    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->textButton:Ljava/lang/String;

    .line 32
    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->orderBy:Ljava/lang/Integer;

    .line 29
    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;)Lcom/blank/bm15/activity/HomeActivity;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;Ljava/lang/Integer;)V
    .locals 0

    .prologue
    .line 32
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->orderBy:Ljava/lang/Integer;

    return-void
.end method

.method static synthetic access$2(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 31
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->textButton:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$3(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;)V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->create()V

    return-void
.end method

.method private create()V
    .locals 4

    .prologue
    .line 54
    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->rootView:Landroid/view/View;

    const v3, 0x7f0b00b1

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 55
    .local v0, "button":Landroid/widget/Button;
    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->textButton:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 56
    const v2, 0x7f050051

    invoke-virtual {p0, v2}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 60
    :goto_0
    new-instance v2, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;

    invoke-direct {v2, p0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->rootView:Landroid/view/View;

    const v3, 0x7f0b00b2

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    .line 111
    .local v1, "listView":Landroid/widget/ListView;
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->getAdapter()Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 112
    return-void

    .line 58
    .end local v1    # "listView":Landroid/widget/ListView;
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    const v3, 0x7f050052

    invoke-virtual {p0, v3}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->textButton:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private getAdapter()Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;
    .locals 5

    .prologue
    .line 115
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->orderBy:Ljava/lang/Integer;

    invoke-static {v1, v2}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->getStatisticList(Lcom/blank/bm15/model/object/crud/Game;Ljava/lang/Integer;)Ljava/util/List;

    move-result-object v0

    .line 116
    .local v0, "matchResultList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/MatchResult;>;"
    const/4 v1, 0x0

    new-instance v2, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 118
    new-instance v1, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    const v3, 0x7f03001c

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {v1, v2, v3, v0, v4}, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;-><init>(Landroid/content/Context;ILjava/util/List;Ljava/lang/Boolean;)V

    return-object v1
.end method

.method public static getPlayerOfYearNewsBody(Lcom/blank/bm15/model/object/crud/Game;)Ljava/lang/String;
    .locals 8
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 148
    const/4 v4, 0x0

    invoke-static {p0, v4}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->getStatisticList(Lcom/blank/bm15/model/object/crud/Game;Ljava/lang/Integer;)Ljava/util/List;

    move-result-object v3

    .line 149
    .local v3, "matchResultList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/MatchResult;>;"
    const-string v0, ""

    .line 151
    .local v0, "body":Ljava/lang/String;
    const/4 v1, 0x0

    .line 152
    .local v1, "i":I
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 161
    :goto_0
    return-object v0

    .line 152
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/MatchResult;

    .line 153
    .local v2, "matchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f050025

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPlayer()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 155
    add-int/lit8 v1, v1, 0x1

    .line 156
    const/4 v5, 0x3

    if-ne v1, v5, :cond_0

    goto :goto_0
.end method

.method public static getStatisticList(Lcom/blank/bm15/model/object/crud/Game;Ljava/lang/Integer;)Ljava/util/List;
    .locals 13
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "position"    # Ljava/lang/Integer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            "Ljava/lang/Integer;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/MatchResult;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v12, 0x1

    .line 122
    new-instance v1, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v1, v6}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 123
    .local v1, "filter":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-virtual {v1, p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 124
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPlayer()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v6, p1}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    .line 126
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDaoExtra;->getAllStatistics(Lcom/blank/bm15/model/object/crud/MatchResult;)Ljava/util/List;

    move-result-object v0

    .line 127
    .local v0, "auxMatchResultList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/MatchResult;>;"
    new-instance v6, Lcom/blank/bm15/model/comparator/MatchResultComparator;

    const/4 v7, -0x1

    invoke-direct {v6, v12, v7}, Lcom/blank/bm15/model/comparator/MatchResultComparator;-><init>(II)V

    invoke-static {v0, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 129
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 130
    .local v5, "matchResultList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/MatchResult;>;"
    const/4 v2, 0x1

    .line 131
    .local v2, "i":I
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_1

    .line 144
    :goto_1
    return-object v5

    .line 131
    :cond_1
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/model/object/crud/MatchResult;

    .line 132
    .local v4, "matchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMinutesPlayed()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    int-to-double v8, v7

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    int-to-double v10, v7

    div-double/2addr v8, v10

    invoke-static {v8, v9, v12}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v8

    const-wide/high16 v10, 0x4034000000000000L    # 20.0

    cmpl-double v7, v8, v10

    if-ltz v7, :cond_0

    .line 133
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    div-int/lit8 v8, v8, 0xa

    if-le v7, v8, :cond_0

    .line 135
    new-instance v7, Ljava/lang/StringBuilder;

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, ".  "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/MatchResult;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lcom/blank/bm15/model/object/crud/MatchResult;->setName(Ljava/lang/String;)V

    .line 136
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    const/16 v7, 0x64

    if-le v3, v7, :cond_2

    move v2, v3

    .line 139
    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    :cond_2
    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_0
.end method

.method public static final newInstance(I)Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I

    .prologue
    .line 35
    new-instance v1, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;-><init>()V

    .line 37
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 38
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 39
    sget-object v2, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->NAVIGATION_MODE_NULL:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 40
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 42
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 47
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 49
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->create()V

    .line 50
    return-void
.end method
