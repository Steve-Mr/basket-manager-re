.class public Lcom/blank/bm15/activity/fragment/TeamSquadFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "TeamSquadFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/activity/HomeActivity;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->createPage()V

    return-void
.end method

.method static synthetic access$2(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;Lcom/blank/bm15/model/object/crud/Player;)Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    .locals 1

    .prologue
    .line 259
    invoke-direct {p0, p1}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getMatchPositions(Lcom/blank/bm15/model/object/crud/Player;)Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/model/object/crud/Game;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    return-object v0
.end method

.method private createPage()V
    .locals 8

    .prologue
    const v7, 0x7f060025

    .line 63
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getNavigation(Landroid/content/Context;)Lcom/blank/bm15/model/object/crud/Navigation;

    move-result-object v3

    .line 64
    .local v3, "navigation":Lcom/blank/bm15/model/object/crud/Navigation;
    new-instance v4, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 65
    .local v4, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Navigation;->getIdObject()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/blank/bm15/model/object/crud/Team;->setId(Ljava/lang/Integer;)V

    .line 66
    invoke-static {v4}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 68
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->rootView:Landroid/view/View;

    invoke-static {v5, v6, v4}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->loadHeader(Lcom/blank/bm15/activity/HomeActivity;Landroid/view/View;Lcom/blank/bm15/model/object/crud/Team;)V

    .line 70
    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->rootView:Landroid/view/View;

    const v6, 0x7f0b0092

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    .line 71
    .local v2, "listView":Landroid/widget/ListView;
    invoke-direct {p0, v4}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getAdapter(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 72
    new-instance v5, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$1;

    invoke-direct {v5, p0, v2}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;Landroid/widget/ListView;)V

    invoke-virtual {v2, v5}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 81
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_0

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_0

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v5, v6, :cond_0

    .line 82
    new-instance v5, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;

    invoke-direct {v5, p0, v2, v4}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;-><init>(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;Landroid/widget/ListView;Lcom/blank/bm15/model/object/crud/Team;)V

    invoke-virtual {v2, v5}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 176
    :cond_0
    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->rootView:Landroid/view/View;

    const v6, 0x7f0b0094

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 177
    .local v0, "buttonAutoLineup":Landroid/widget/Button;
    new-instance v5, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$3;

    invoke-direct {v5, p0, v4}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$3;-><init>(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;Lcom/blank/bm15/model/object/crud/Team;)V

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 185
    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->rootView:Landroid/view/View;

    const v6, 0x7f0b0095

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 186
    .local v1, "buttonDraftRounds":Landroid/widget/Button;
    new-instance v5, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;

    invoke-direct {v5, p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;-><init>(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)V

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 219
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v5, v6, :cond_1

    .line 220
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 221
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 223
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f060031

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 224
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f060033

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 232
    :goto_0
    return-void

    .line 226
    :cond_1
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 227
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 229
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 230
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setBackgroundColor(I)V

    goto :goto_0
.end method

.method private getAdapter(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    .locals 9
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    const v8, 0x7f03001f

    .line 235
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersTitulars()Ljava/util/List;

    move-result-object v4

    .line 236
    .local v4, "titulars":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersReserves()Ljava/util/List;

    move-result-object v2

    .line 237
    .local v2, "reserves":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersRemains()Ljava/util/List;

    move-result-object v1

    .line 238
    .local v1, "remains":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v5, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v6, 0x1

    const/4 v7, -0x1

    invoke-direct {v5, v6, v7}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v1, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 240
    new-instance v3, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-direct {v3, v5}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;-><init>(Landroid/content/Context;)V

    .line 243
    .local v3, "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 244
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-direct {v0, v5, v8, v4, v6}, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;-><init>(Landroid/content/Context;ILjava/util/List;Z)V

    .line 245
    .local v0, "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayerList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    const v6, 0x7f0500b8

    invoke-virtual {v5, v6}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 247
    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayerList;
    :cond_0
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 248
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-direct {v0, v5, v8, v2, v6}, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;-><init>(Landroid/content/Context;ILjava/util/List;Z)V

    .line 249
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayerList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    const v6, 0x7f0500b9

    invoke-virtual {v5, v6}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 251
    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayerList;
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    .line 252
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-direct {v0, v5, v8, v1, v6}, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;-><init>(Landroid/content/Context;ILjava/util/List;Z)V

    .line 253
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayerList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    const v6, 0x7f0500ba

    invoke-virtual {v5, v6}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 256
    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayerList;
    :cond_2
    return-object v3
.end method

.method private getMatchPositions(Lcom/blank/bm15/model/object/crud/Player;)Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    .locals 13
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    const/4 v12, 0x5

    const/4 v11, 0x4

    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    .line 260
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 261
    .local v2, "matchPositionTitularsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/StringText;>;"
    new-instance v4, Lcom/blank/bm15/model/object/other/StringText;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, p1}, Lcom/blank/bm15/model/object/other/StringText;-><init>(Ljava/lang/Integer;Ljava/lang/String;Lcom/blank/bm15/model/object/crud/Player;)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    new-instance v4, Lcom/blank/bm15/model/object/other/StringText;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, p1}, Lcom/blank/bm15/model/object/other/StringText;-><init>(Ljava/lang/Integer;Ljava/lang/String;Lcom/blank/bm15/model/object/crud/Player;)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 263
    new-instance v4, Lcom/blank/bm15/model/object/other/StringText;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, p1}, Lcom/blank/bm15/model/object/other/StringText;-><init>(Ljava/lang/Integer;Ljava/lang/String;Lcom/blank/bm15/model/object/crud/Player;)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 264
    new-instance v4, Lcom/blank/bm15/model/object/other/StringText;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, p1}, Lcom/blank/bm15/model/object/other/StringText;-><init>(Ljava/lang/Integer;Ljava/lang/String;Lcom/blank/bm15/model/object/crud/Player;)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 265
    new-instance v4, Lcom/blank/bm15/model/object/other/StringText;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, p1}, Lcom/blank/bm15/model/object/other/StringText;-><init>(Ljava/lang/Integer;Ljava/lang/String;Lcom/blank/bm15/model/object/crud/Player;)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 267
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 268
    .local v1, "matchPositionReservesList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/StringText;>;"
    new-instance v4, Lcom/blank/bm15/model/object/other/StringText;

    const/4 v5, 0x6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, p1}, Lcom/blank/bm15/model/object/other/StringText;-><init>(Ljava/lang/Integer;Ljava/lang/String;Lcom/blank/bm15/model/object/crud/Player;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 269
    new-instance v4, Lcom/blank/bm15/model/object/other/StringText;

    const/4 v5, 0x7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, p1}, Lcom/blank/bm15/model/object/other/StringText;-><init>(Ljava/lang/Integer;Ljava/lang/String;Lcom/blank/bm15/model/object/crud/Player;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 270
    new-instance v4, Lcom/blank/bm15/model/object/other/StringText;

    const/16 v5, 0x8

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, p1}, Lcom/blank/bm15/model/object/other/StringText;-><init>(Ljava/lang/Integer;Ljava/lang/String;Lcom/blank/bm15/model/object/crud/Player;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 271
    new-instance v4, Lcom/blank/bm15/model/object/other/StringText;

    const/16 v5, 0x9

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, p1}, Lcom/blank/bm15/model/object/other/StringText;-><init>(Ljava/lang/Integer;Ljava/lang/String;Lcom/blank/bm15/model/object/crud/Player;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 272
    new-instance v4, Lcom/blank/bm15/model/object/other/StringText;

    const/16 v5, 0xa

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, p1}, Lcom/blank/bm15/model/object/other/StringText;-><init>(Ljava/lang/Integer;Ljava/lang/String;Lcom/blank/bm15/model/object/crud/Player;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 274
    new-instance v3, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;-><init>(Landroid/content/Context;)V

    .line 276
    .local v3, "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterStringTextList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    const v5, 0x7f030021

    invoke-direct {v0, v4, v5, v2}, Lcom/blank/bm15/activity/adapter/AdapterStringTextList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 277
    .local v0, "adapter":Lcom/blank/bm15/activity/adapter/AdapterStringTextList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    const v5, 0x7f0500b8

    invoke-virtual {v4, v5}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 279
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterStringTextList;

    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterStringTextList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    const v5, 0x7f030021

    invoke-direct {v0, v4, v5, v1}, Lcom/blank/bm15/activity/adapter/AdapterStringTextList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 280
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterStringTextList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    const v5, 0x7f0500b9

    invoke-virtual {v4, v5}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 282
    return-object v3
.end method

.method public static final newInstance(I)Lcom/blank/bm15/activity/fragment/TeamSquadFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I

    .prologue
    .line 46
    new-instance v1, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;-><init>()V

    .line 48
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/TeamSquadFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 49
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 50
    sget-object v2, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->NAVIGATION_MODE_NULL:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 51
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->setArguments(Landroid/os/Bundle;)V

    .line 53
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 58
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 59
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->createPage()V

    .line 60
    return-void
.end method
