.class public Lcom/blank/bm15/activity/fragment/NewsFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "NewsFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method public static final newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/NewsFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I
    .param p1, "navigationMode"    # Ljava/lang/Integer;

    .prologue
    .line 24
    new-instance v1, Lcom/blank/bm15/activity/fragment/NewsFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/NewsFragment;-><init>()V

    .line 26
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/NewsFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 27
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/NewsFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 28
    sget-object v2, Lcom/blank/bm15/activity/fragment/NewsFragment;->NAVIGATION_MODE:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 29
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/NewsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 31
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 36
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 38
    new-instance v1, Lcom/blank/bm15/model/object/crud/News;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/NewsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 39
    .local v1, "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/NewsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 40
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/NewsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 42
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDaoExtra;->getNews(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v2

    .line 43
    .local v2, "newsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/News;>;"
    new-instance v3, Lcom/blank/bm15/model/comparator/NewsComparator;

    const/4 v4, 0x0

    const/4 v5, -0x1

    invoke-direct {v3, v4, v5}, Lcom/blank/bm15/model/comparator/NewsComparator;-><init>(II)V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 46
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/NewsFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b0034

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    .line 47
    .local v0, "listView":Landroid/widget/ListView;
    new-instance v3, Lcom/blank/bm15/activity/adapter/AdapterNewsList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/NewsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    const v5, 0x7f03001d

    invoke-direct {v3, v4, v5, v2}, Lcom/blank/bm15/activity/adapter/AdapterNewsList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 48
    new-instance v3, Lcom/blank/bm15/activity/fragment/NewsFragment$1;

    invoke-direct {v3, p0, v0}, Lcom/blank/bm15/activity/fragment/NewsFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/NewsFragment;Landroid/widget/ListView;)V

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 58
    return-void
.end method
