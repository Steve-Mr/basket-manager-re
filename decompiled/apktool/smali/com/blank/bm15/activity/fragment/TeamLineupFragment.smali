.class public Lcom/blank/bm15/activity/fragment/TeamLineupFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "TeamLineupFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;)V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->createPage()V

    return-void
.end method

.method static synthetic access$1(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 153
    invoke-direct {p0, p1, p2, p3}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->onClickLineupPlayers(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V

    return-void
.end method

.method static synthetic access$2(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;)Lcom/blank/bm15/activity/HomeActivity;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    return-object v0
.end method

.method private createPage()V
    .locals 10

    .prologue
    const/4 v9, 0x5

    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 53
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/base/BaseActivity;->getNavigation(Landroid/content/Context;)Lcom/blank/bm15/model/object/crud/Navigation;

    move-result-object v1

    .line 54
    .local v1, "navigation":Lcom/blank/bm15/model/object/crud/Navigation;
    new-instance v2, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 55
    .local v2, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Navigation;->getIdObject()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/Team;->setId(Ljava/lang/Integer;)V

    .line 56
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 58
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->rootView:Landroid/view/View;

    invoke-static {v3, v4, v2}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->loadHeader(Lcom/blank/bm15/activity/HomeActivity;Landroid/view/View;Lcom/blank/bm15/model/object/crud/Team;)V

    .line 60
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b0082

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 61
    .local v0, "button":Landroid/widget/Button;
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 62
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {p0, v2, v0, v3}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V

    .line 64
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b0085

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "button":Landroid/widget/Button;
    check-cast v0, Landroid/widget/Button;

    .line 65
    .restart local v0    # "button":Landroid/widget/Button;
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 66
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {p0, v2, v0, v3}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V

    .line 68
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b0088

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "button":Landroid/widget/Button;
    check-cast v0, Landroid/widget/Button;

    .line 69
    .restart local v0    # "button":Landroid/widget/Button;
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 70
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {p0, v2, v0, v3}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V

    .line 72
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b008b

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "button":Landroid/widget/Button;
    check-cast v0, Landroid/widget/Button;

    .line 73
    .restart local v0    # "button":Landroid/widget/Button;
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 74
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {p0, v2, v0, v3}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V

    .line 76
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b008e

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "button":Landroid/widget/Button;
    check-cast v0, Landroid/widget/Button;

    .line 77
    .restart local v0    # "button":Landroid/widget/Button;
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 78
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {p0, v2, v0, v3}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V

    .line 80
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b0083

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "button":Landroid/widget/Button;
    check-cast v0, Landroid/widget/Button;

    .line 81
    .restart local v0    # "button":Landroid/widget/Button;
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 82
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p0, v2, v0, v3}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V

    .line 84
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b0086

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "button":Landroid/widget/Button;
    check-cast v0, Landroid/widget/Button;

    .line 85
    .restart local v0    # "button":Landroid/widget/Button;
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 86
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p0, v2, v0, v3}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V

    .line 88
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b0089

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "button":Landroid/widget/Button;
    check-cast v0, Landroid/widget/Button;

    .line 89
    .restart local v0    # "button":Landroid/widget/Button;
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 90
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p0, v2, v0, v3}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V

    .line 92
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b008c

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "button":Landroid/widget/Button;
    check-cast v0, Landroid/widget/Button;

    .line 93
    .restart local v0    # "button":Landroid/widget/Button;
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 94
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p0, v2, v0, v3}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V

    .line 96
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b008f

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "button":Landroid/widget/Button;
    check-cast v0, Landroid/widget/Button;

    .line 97
    .restart local v0    # "button":Landroid/widget/Button;
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 98
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p0, v2, v0, v3}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V

    .line 100
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b007f

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "button":Landroid/widget/Button;
    check-cast v0, Landroid/widget/Button;

    .line 101
    .restart local v0    # "button":Landroid/widget/Button;
    new-instance v3, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$1;

    invoke-direct {v3, p0, v2}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;Lcom/blank/bm15/model/object/crud/Team;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->rootView:Landroid/view/View;

    const v4, 0x7f0b0091

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "button":Landroid/widget/Button;
    check-cast v0, Landroid/widget/Button;

    .line 110
    .restart local v0    # "button":Landroid/widget/Button;
    new-instance v3, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$2;

    invoke-direct {v3, p0, v2}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$2;-><init>(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;Lcom/blank/bm15/model/object/crud/Team;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    return-void
.end method

.method private getAdapter(Lcom/blank/bm15/model/object/crud/Team;I)Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    .locals 11
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;
    .param p2, "matchPosition"    # I

    .prologue
    const v10, 0x7f03001f

    .line 206
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 207
    .local v2, "positionFirstList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 208
    .local v4, "positionSecondList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 209
    .local v3, "positionOtherList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v6

    new-instance v7, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v8, 0x1

    const/4 v9, -0x1

    invoke-direct {v7, v8, v9}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 211
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_3

    .line 221
    new-instance v5, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;-><init>(Landroid/content/Context;)V

    .line 224
    .local v5, "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 225
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-direct {v0, v6, v10, v2, v7}, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;-><init>(Landroid/content/Context;ILjava/util/List;Z)V

    .line 226
    .local v0, "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayerList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    const v7, 0x7f0500bc

    invoke-virtual {v6, v7}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 228
    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayerList;
    :cond_0
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 229
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-direct {v0, v6, v10, v4, v7}, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;-><init>(Landroid/content/Context;ILjava/util/List;Z)V

    .line 230
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayerList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    const v7, 0x7f0500bd

    invoke-virtual {v6, v7}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 232
    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayerList;
    :cond_1
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    .line 233
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-direct {v0, v6, v10, v3, v7}, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;-><init>(Landroid/content/Context;ILjava/util/List;Z)V

    .line 234
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayerList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    const v7, 0x7f0500be

    invoke-virtual {v6, v7}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 237
    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterPlayerList;
    :cond_2
    return-object v5

    .line 211
    .end local v5    # "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    :cond_3
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Player;

    .line 212
    .local v1, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-ne v7, p2, :cond_4

    .line 213
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 214
    :cond_4
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-ne v7, p2, :cond_5

    .line 215
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 217
    :cond_5
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0
.end method

.method public static final newInstance(I)Lcom/blank/bm15/activity/fragment/TeamLineupFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I

    .prologue
    .line 36
    new-instance v1, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;-><init>()V

    .line 38
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/TeamLineupFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 39
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 40
    sget-object v2, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->NAVIGATION_MODE_NULL:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 41
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->setArguments(Landroid/os/Bundle;)V

    .line 43
    return-object v1
.end method

.method private onClickLineupPlayers(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V
    .locals 9
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;
    .param p2, "button"    # Landroid/widget/Button;
    .param p3, "isTitular"    # Ljava/lang/Boolean;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    .line 154
    invoke-virtual {p2}, Landroid/widget/Button;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 155
    .local v5, "matchPosition":I
    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    invoke-direct {v6, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 156
    .local v6, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/activity/HomeActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v8

    .line 158
    .local v8, "inflater":Landroid/view/LayoutInflater;
    const v0, 0x7f030006

    const/4 v1, 0x0

    invoke-virtual {v8, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    .line 159
    .local v7, "dialogView":Landroid/view/View;
    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 160
    const v1, 0x7f050049

    invoke-virtual {p0, v1}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;

    invoke-direct {v3, p0, p3, p1, v5}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;-><init>(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;Ljava/lang/Boolean;Lcom/blank/bm15/model/object/crud/Team;I)V

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 171
    const v1, 0x7f050048

    invoke-virtual {p0, v1}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$6;

    invoke-direct {v3, p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$6;-><init>(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;)V

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 177
    const v0, 0x7f0b0030

    invoke-virtual {v7, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    .line 178
    .local v2, "listView":Landroid/widget/ListView;
    invoke-direct {p0, p1, v5}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getAdapter(Lcom/blank/bm15/model/object/crud/Team;I)Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 179
    new-instance v0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;-><init>(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;Landroid/widget/ListView;Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Boolean;I)V

    invoke-virtual {v2, v0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 201
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, v0, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 202
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    iget-object v0, v0, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 203
    return-void
.end method

.method private setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V
    .locals 4
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;
    .param p2, "button"    # Landroid/widget/Button;
    .param p3, "isTitular"    # Ljava/lang/Boolean;

    .prologue
    .line 120
    const/4 v0, 0x0

    .line 122
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p2}, Landroid/widget/Button;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 123
    .local v1, "position":I
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 124
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPlayer(I)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 126
    new-instance v2, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$3;

    invoke-direct {v2, p0, p1, p2}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$3;-><init>(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;)V

    invoke-virtual {p2, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 143
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 144
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 150
    :goto_1
    return-void

    .line 133
    :cond_0
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePlayer(I)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 135
    new-instance v2, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$4;

    invoke-direct {v2, p0, p1, p2}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$4;-><init>(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;)V

    invoke-virtual {p2, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 145
    :cond_1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 146
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0500b8

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 148
    :cond_2
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0500b9

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 48
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 49
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->createPage()V

    .line 50
    return-void
.end method
