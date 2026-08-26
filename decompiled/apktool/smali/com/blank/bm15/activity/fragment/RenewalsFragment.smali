.class public Lcom/blank/bm15/activity/fragment/RenewalsFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "RenewalsFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/activity/HomeActivity;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/model/object/crud/Game;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    return-object v0
.end method

.method private loadList(Landroid/view/View;)V
    .locals 7
    .param p1, "rootView"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x0

    .line 48
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 49
    .local v0, "filter":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 50
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 51
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/blank/bm15/model/object/crud/Player;->setYearsContract(Ljava/lang/Integer;)V

    .line 52
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v2

    .line 53
    .local v2, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v3, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v4, -0x1

    invoke-direct {v3, v5, v4}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 56
    const v3, 0x7f0b0034

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    .line 57
    .local v1, "listView":Landroid/widget/ListView;
    new-instance v3, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    const v5, 0x7f03001f

    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-direct {v3, v4, v5, v2, v6}, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;-><init>(Landroid/content/Context;ILjava/util/List;Z)V

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 58
    new-instance v3, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;

    invoke-direct {v3, p0, v1}, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/RenewalsFragment;Landroid/widget/ListView;)V

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 118
    return-void
.end method

.method public static final newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/RenewalsFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I
    .param p1, "navigationMode"    # Ljava/lang/Integer;

    .prologue
    .line 31
    new-instance v1, Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;-><init>()V

    .line 33
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/RenewalsFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 34
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 35
    sget-object v2, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->NAVIGATION_MODE:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 36
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 38
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 43
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 44
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->rootView:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->loadList(Landroid/view/View;)V

    .line 45
    return-void
.end method
