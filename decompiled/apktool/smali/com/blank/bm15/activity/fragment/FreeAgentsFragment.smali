.class public Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "FreeAgentsFragment.java"


# static fields
.field public static final FILTER_SHARED_PREFERENCE:Ljava/lang/String; = "FILTER_FREE_AGENTS"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->create()V

    return-void
.end method

.method static synthetic access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    return-object v0
.end method

.method private create()V
    .locals 9

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    const-string v6, "FILTER_FREE_AGENTS"

    const/4 v7, 0x0

    invoke-static {v5, v6, v7}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->getInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v3

    .line 62
    .local v3, "orderBy":I
    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->rootView:Landroid/view/View;

    const v6, 0x7f0b00b1

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 63
    .local v0, "button":Landroid/widget/Button;
    if-nez v3, :cond_0

    .line 64
    const v5, 0x7f050051

    invoke-virtual {p0, v5}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 65
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f06002c

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 70
    :goto_0
    new-instance v5, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1;

    invoke-direct {v5, p0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)V

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-direct {v1, v5}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 118
    .local v1, "filter":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 119
    if-nez v3, :cond_1

    const/4 v5, 0x0

    :goto_1
    invoke-virtual {v1, v5}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    .line 120
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDaoExtra;->getFreeAgents(Lcom/blank/bm15/model/object/crud/Player;)Ljava/util/List;

    move-result-object v4

    .line 121
    .local v4, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v5, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v6, 0x1

    const/4 v7, -0x1

    invoke-direct {v5, v6, v7}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v4, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 123
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->reloadPlayers()V

    .line 126
    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->rootView:Landroid/view/View;

    const v6, 0x7f0b00b2

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    .line 127
    .local v2, "listView":Landroid/widget/ListView;
    new-instance v5, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    const v7, 0x7f03001f

    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    invoke-direct {v5, v6, v7, v4, v8}, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;-><init>(Landroid/content/Context;ILjava/util/List;Z)V

    invoke-virtual {v2, v5}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 128
    new-instance v5, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;

    invoke-direct {v5, p0, v2, v4}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;-><init>(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;Landroid/widget/ListView;Ljava/util/List;)V

    invoke-virtual {v2, v5}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 209
    return-void

    .line 67
    .end local v1    # "filter":Lcom/blank/bm15/model/object/crud/Player;
    .end local v2    # "listView":Landroid/widget/ListView;
    .end local v4    # "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    const v6, 0x7f050052

    invoke-virtual {p0, v6}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 68
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f060031

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setBackgroundColor(I)V

    goto/16 :goto_0

    .line 119
    .restart local v1    # "filter":Lcom/blank/bm15/model/object/crud/Player;
    :cond_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    goto/16 :goto_1
.end method

.method public static getOffer(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;I)Lcom/blank/bm15/model/object/crud/Offer;
    .locals 8
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;
    .param p2, "percent"    # I

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 212
    invoke-static {p1}, Lcom/blank/bm15/model/util/Util;->getSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v1

    .line 213
    .local v1, "salary":Ljava/lang/Integer;
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0x19

    if-gt v3, v4, :cond_1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    .line 218
    .local v2, "yearsContract":Ljava/lang/Integer;
    :goto_0
    new-instance v0, Lcom/blank/bm15/model/object/crud/Offer;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/blank/bm15/model/object/crud/Offer;-><init>(Landroid/content/Context;)V

    .line 219
    .local v0, "offer":Lcom/blank/bm15/model/object/crud/Offer;
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/Offer;->setPlayer(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 220
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/blank/bm15/model/object/crud/Offer;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 221
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/Offer;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 222
    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/Offer;->setYears(Ljava/lang/Integer;)V

    .line 224
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/2addr v4, p2

    div-int/lit8 v4, v4, 0x64

    add-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 225
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0xea

    if-eq v3, v4, :cond_0

    .line 226
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/lit8 v3, v3, 0x50

    div-int/lit8 v3, v3, 0x64

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 228
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    div-int/lit16 v3, v3, 0x3e8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 229
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/lit16 v3, v3, 0x3e8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 230
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/blank/bm15/model/object/crud/Offer;->setSalary(Ljava/lang/Integer;)V

    .line 232
    return-object v0

    .line 214
    .end local v0    # "offer":Lcom/blank/bm15/model/object/crud/Offer;
    .end local v2    # "yearsContract":Ljava/lang/Integer;
    :cond_1
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0x1e

    if-gt v3, v4, :cond_2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_0

    .line 215
    :cond_2
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0x22

    if-gt v3, v4, :cond_3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    goto/16 :goto_0

    .line 216
    :cond_3
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    goto/16 :goto_0
.end method

.method public static final newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I
    .param p1, "navigationMode"    # Ljava/lang/Integer;

    .prologue
    .line 41
    new-instance v1, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;-><init>()V

    .line 43
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 44
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 45
    sget-object v2, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->NAVIGATION_MODE:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 46
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 48
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 53
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 55
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->create()V

    .line 56
    return-void
.end method
