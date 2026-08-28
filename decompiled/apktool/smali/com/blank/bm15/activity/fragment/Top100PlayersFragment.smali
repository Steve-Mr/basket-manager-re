.class public Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "Top100PlayersFragment.java"


# static fields
.field private static final FILTER_SHARED_PREFERENCE:Ljava/lang/String; = "FILTER_PLAYERS"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)Lcom/blank/bm15/activity/HomeActivity;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->create()V

    return-void
.end method

.method private create()V
    .locals 8

    .prologue
    .line 56
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    const-string v4, "FILTER_PLAYERS"

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->getInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v2

    .line 59
    .local v2, "orderBy":I
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b00b1

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 60
    .local v0, "button":Landroid/widget/Button;
    if-nez v2, :cond_0

    .line 61
    const v3, 0x7f050051

    invoke-virtual {p0, v3}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 62
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f06002c

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 67
    :goto_0
    new-instance v3, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;

    invoke-direct {v3, p0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b00b2

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    .line 116
    .local v1, "listView":Landroid/widget/ListView;
    new-instance v3, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    const v5, 0x7f03001f

    invoke-direct {p0, v2}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getPlayers(I)Ljava/util/List;

    move-result-object v6

    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;-><init>(Landroid/content/Context;ILjava/util/List;Z)V

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 117
    new-instance v3, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$2;

    invoke-direct {v3, p0, v1}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$2;-><init>(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;Landroid/widget/ListView;)V

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 127
    return-void

    .line 64
    .end local v1    # "listView":Landroid/widget/ListView;
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    const v4, 0x7f050052

    invoke-virtual {p0, v4}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 65
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f060031

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setBackgroundColor(I)V

    goto :goto_0
.end method

.method private getPlayers(I)Ljava/util/List;
    .locals 9
    .param p1, "orderBy"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, -0x1

    .line 131
    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v1, v5}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 132
    .local v1, "filter":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 133
    if-nez p1, :cond_1

    const/4 v5, 0x0

    :goto_0
    invoke-virtual {v1, v5}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    .line 134
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v0

    .line 135
    .local v0, "auxPlayerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v5, Lcom/blank/bm15/model/comparator/PlayerComparator;

    invoke-direct {v5, v8, v7}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v0, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 137
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .local v4, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    const/4 v2, 0x1

    .line 139
    .local v2, "i":I
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_2

    .line 146
    :goto_1
    new-instance v5, Lcom/blank/bm15/model/comparator/PlayerComparator;

    invoke-direct {v5, v8, v7}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v4, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 148
    return-object v4

    .line 133
    .end local v0    # "auxPlayerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    .end local v2    # "i":I
    .end local v4    # "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    :cond_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    goto :goto_0

    .line 139
    .restart local v0    # "auxPlayerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    .restart local v2    # "i":I
    .restart local v4    # "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    .line 140
    .local v3, "player":Lcom/blank/bm15/model/object/crud/Player;
    add-int/lit8 v2, v2, 0x1

    .line 141
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    const/16 v6, 0x64

    if-le v2, v6, :cond_0

    goto :goto_1
.end method

.method public static final newInstance(I)Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I

    .prologue
    .line 38
    new-instance v1, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;-><init>()V

    .line 40
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 41
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 42
    sget-object v2, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->NAVIGATION_MODE_NULL:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 43
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->setArguments(Landroid/os/Bundle;)V

    .line 45
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 50
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 52
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->create()V

    .line 53
    return-void
.end method
