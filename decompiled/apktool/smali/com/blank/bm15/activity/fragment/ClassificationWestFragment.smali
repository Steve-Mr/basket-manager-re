.class public Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "ClassificationWestFragment.java"


# instance fields
.field private westConferenceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/Classification;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;)Lcom/blank/bm15/activity/HomeActivity;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    return-object v0
.end method

.method private getAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    .locals 8

    .prologue
    const/4 v7, 0x6

    const/4 v6, 0x5

    const/4 v5, 0x4

    const v4, 0x7f030022

    .line 57
    new-instance v1, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;-><init>(Landroid/content/Context;)V

    .line 59
    .local v1, "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    invoke-direct {p0, v5}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getClassification(I)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v2, v4, v3}, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 60
    .local v0, "adapter":Lcom/blank/bm15/activity/adapter/AdapterClassificationList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getDivision(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 61
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;

    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterClassificationList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    invoke-direct {p0, v6}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getClassification(I)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v2, v4, v3}, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 62
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterClassificationList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getDivision(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 63
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;

    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterClassificationList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    invoke-direct {p0, v7}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getClassification(I)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v2, v4, v3}, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 64
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterClassificationList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getDivision(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 66
    return-object v1
.end method

.method private getClassification(I)Ljava/util/List;
    .locals 5
    .param p1, "division"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/Classification;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v4, 0x8

    .line 70
    new-instance v0, Lcom/blank/bm15/model/object/other/Classification;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/blank/bm15/model/object/other/Classification;-><init>(Landroid/content/Context;)V

    .line 71
    .local v0, "classification":Lcom/blank/bm15/model/object/other/Classification;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/blank/bm15/model/object/other/Classification;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 72
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/blank/bm15/model/object/other/Classification;->setDivision(Ljava/lang/Integer;)V

    .line 73
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getClassification(Lcom/blank/bm15/model/object/other/Classification;)Ljava/util/List;

    move-result-object v2

    .line 75
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-le v1, v3, :cond_0

    .line 82
    return-object v2

    .line 76
    :cond_0
    add-int/lit8 v3, v1, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "classification":Lcom/blank/bm15/model/object/other/Classification;
    check-cast v0, Lcom/blank/bm15/model/object/other/Classification;

    .line 77
    .restart local v0    # "classification":Lcom/blank/bm15/model/object/other/Classification;
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/blank/bm15/model/object/other/Classification;->setPositionInDivision(Ljava/lang/Integer;)V

    .line 78
    invoke-direct {p0, v0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->setPositionInConference(Lcom/blank/bm15/model/object/other/Classification;)V

    .line 79
    if-eq v1, v4, :cond_1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Classification;->getPositionInConference()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-le v3, v4, :cond_1

    const/4 v3, 0x0

    :goto_1
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/blank/bm15/model/object/other/Classification;->setIsClassified(Ljava/lang/Boolean;)V

    .line 75
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 79
    :cond_1
    const/4 v3, 0x1

    goto :goto_1
.end method

.method private getWestConferenceList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/Classification;",
            ">;"
        }
    .end annotation

    .prologue
    .line 98
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->westConferenceList:Ljava/util/List;

    if-nez v1, :cond_0

    .line 99
    new-instance v0, Lcom/blank/bm15/model/object/other/Classification;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/other/Classification;-><init>(Landroid/content/Context;)V

    .line 100
    .local v0, "filter":Lcom/blank/bm15/model/object/other/Classification;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/other/Classification;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 101
    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/other/Classification;->setConference(Ljava/lang/Integer;)V

    .line 102
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getClassification(Lcom/blank/bm15/model/object/other/Classification;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->westConferenceList:Ljava/util/List;

    .line 104
    .end local v0    # "filter":Lcom/blank/bm15/model/object/other/Classification;
    :cond_0
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->westConferenceList:Ljava/util/List;

    return-object v1
.end method

.method public static final newInstance(I)Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I

    .prologue
    .line 29
    new-instance v1, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;-><init>()V

    .line 31
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 32
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 33
    sget-object v2, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->NAVIGATION_MODE_NULL:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 34
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->setArguments(Landroid/os/Bundle;)V

    .line 36
    return-object v1
.end method

.method private setPositionInConference(Lcom/blank/bm15/model/object/other/Classification;)V
    .locals 4
    .param p1, "classification"    # Lcom/blank/bm15/model/object/other/Classification;

    .prologue
    .line 87
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getWestConferenceList()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-le v1, v2, :cond_0

    .line 95
    :goto_1
    return-void

    .line 88
    :cond_0
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getWestConferenceList()Ljava/util/List;

    move-result-object v2

    add-int/lit8 v3, v1, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/other/Classification;

    .line 90
    .local v0, "aux":Lcom/blank/bm15/model/object/other/Classification;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v2, v3, :cond_1

    .line 91
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/blank/bm15/model/object/other/Classification;->setPositionInConference(Ljava/lang/Integer;)V

    goto :goto_1

    .line 87
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 41
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 44
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->rootView:Landroid/view/View;

    const v2, 0x7f0b0034

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    .line 45
    .local v0, "listView":Landroid/widget/ListView;
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->getAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 46
    new-instance v1, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment$1;

    invoke-direct {v1, p0, v0}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;Landroid/widget/ListView;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 54
    return-void
.end method
