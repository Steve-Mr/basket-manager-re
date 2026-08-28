.class public Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "ClassificationTotalFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;)Lcom/blank/bm15/activity/HomeActivity;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    return-object v0
.end method

.method private getAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    .locals 7

    .prologue
    const v6, 0x7f030022

    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 56
    new-instance v1, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;-><init>(Landroid/content/Context;)V

    .line 58
    .local v1, "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-static {v3, v4}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getClassification(Lcom/blank/bm15/model/object/crud/Game;I)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v2, v6, v3}, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 59
    .local v0, "adapter":Lcom/blank/bm15/activity/adapter/AdapterClassificationList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getConference(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 60
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;

    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterClassificationList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-static {v3, v5}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getClassification(Lcom/blank/bm15/model/object/crud/Game;I)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v2, v6, v3}, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 61
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterClassificationList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getConference(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 63
    return-object v1
.end method

.method public static getClassification(Lcom/blank/bm15/model/object/crud/Game;I)Ljava/util/List;
    .locals 6
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "conference"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            "I)",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/Classification;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 67
    new-instance v0, Lcom/blank/bm15/model/object/other/Classification;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/blank/bm15/model/object/other/Classification;-><init>(Landroid/content/Context;)V

    .line 68
    .local v0, "classification":Lcom/blank/bm15/model/object/other/Classification;
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/other/Classification;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 69
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/blank/bm15/model/object/other/Classification;->setConference(Ljava/lang/Integer;)V

    .line 70
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getClassification(Lcom/blank/bm15/model/object/other/Classification;)Ljava/util/List;

    move-result-object v3

    .line 72
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    const/4 v1, 0x0

    .line 73
    .local v1, "classifieds":I
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-le v2, v4, :cond_0

    .line 82
    const/4 v2, 0x1

    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-le v2, v4, :cond_3

    .line 90
    return-object v3

    .line 74
    :cond_0
    add-int/lit8 v4, v2, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "classification":Lcom/blank/bm15/model/object/other/Classification;
    check-cast v0, Lcom/blank/bm15/model/object/other/Classification;

    .line 75
    .restart local v0    # "classification":Lcom/blank/bm15/model/object/other/Classification;
    invoke-static {p0, v0}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->setPositionInDivision(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/other/Classification;)V

    .line 76
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Classification;->getPositionInDivision()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v5, :cond_2

    move v4, v5

    :goto_2
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/blank/bm15/model/object/other/Classification;->setIsClassified(Ljava/lang/Boolean;)V

    .line 77
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Classification;->getIsClassified()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 78
    add-int/lit8 v1, v1, 0x1

    .line 73
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 76
    :cond_2
    const/4 v4, 0x0

    goto :goto_2

    .line 83
    :cond_3
    add-int/lit8 v4, v2, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "classification":Lcom/blank/bm15/model/object/other/Classification;
    check-cast v0, Lcom/blank/bm15/model/object/other/Classification;

    .line 84
    .restart local v0    # "classification":Lcom/blank/bm15/model/object/other/Classification;
    const/16 v4, 0x8

    if-ge v1, v4, :cond_4

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Classification;->getIsClassified()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_4

    .line 85
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v4}, Lcom/blank/bm15/model/object/other/Classification;->setIsClassified(Ljava/lang/Boolean;)V

    .line 86
    add-int/lit8 v1, v1, 0x1

    .line 82
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public static final newInstance(I)Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I

    .prologue
    .line 28
    new-instance v1, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;-><init>()V

    .line 30
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 31
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 32
    sget-object v2, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->NAVIGATION_MODE_NULL:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 33
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->setArguments(Landroid/os/Bundle;)V

    .line 35
    return-object v1
.end method

.method private static setPositionInDivision(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/other/Classification;)V
    .locals 6
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "classification"    # Lcom/blank/bm15/model/object/other/Classification;

    .prologue
    .line 94
    new-instance v1, Lcom/blank/bm15/model/object/other/Classification;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/blank/bm15/model/object/other/Classification;-><init>(Landroid/content/Context;)V

    .line 95
    .local v1, "filter":Lcom/blank/bm15/model/object/other/Classification;
    invoke-virtual {v1, p0}, Lcom/blank/bm15/model/object/other/Classification;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 96
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/other/Classification;->getDivision()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/other/Classification;->setDivision(Ljava/lang/Integer;)V

    .line 97
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDaoExtra;->getClassification(Lcom/blank/bm15/model/object/other/Classification;)Ljava/util/List;

    move-result-object v3

    .line 100
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-le v2, v4, :cond_0

    .line 108
    :goto_1
    return-void

    .line 101
    :cond_0
    add-int/lit8 v4, v2, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/other/Classification;

    .line 103
    .local v0, "aux":Lcom/blank/bm15/model/object/other/Classification;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_1

    .line 104
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/blank/bm15/model/object/other/Classification;->setPositionInDivision(Ljava/lang/Integer;)V

    goto :goto_1

    .line 100
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 40
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 43
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->rootView:Landroid/view/View;

    const v2, 0x7f0b0034

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    .line 44
    .local v0, "listView":Landroid/widget/ListView;
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 45
    new-instance v1, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment$1;

    invoke-direct {v1, p0, v0}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;Landroid/widget/ListView;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 53
    return-void
.end method
