.class public Lcom/blank/bm15/activity/fragment/FinancesFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "FinancesFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method private loadHeader(Lcom/blank/bm15/activity/HomeActivity;Landroid/view/View;Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 8
    .param p1, "activity"    # Lcom/blank/bm15/activity/HomeActivity;
    .param p2, "rootView"    # Landroid/view/View;
    .param p3, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    const/4 v7, 0x0

    .line 72
    const v5, 0x7f0b00d2

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 73
    .local v4, "textView":Landroid/widget/TextView;
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Team;->getFullName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    const v5, 0x7f0b00d3

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .end local v4    # "textView":Landroid/widget/TextView;
    check-cast v4, Landroid/widget/TextView;

    .line 75
    .restart local v4    # "textView":Landroid/widget/TextView;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Team;->getConference()Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p1, v6}, Lcom/blank/bm15/model/util/Util;->getConference(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Team;->getDivision()Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p1, v6}, Lcom/blank/bm15/model/util/Util;->getDivision(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "confereceAndDivision":Ljava/lang/String;
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p3, v7}, Lcom/blank/bm15/model/object/crud/Team;->getTeamSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 79
    .local v3, "salaryAvailable":Ljava/lang/Integer;
    const v5, 0x7f0b00d4

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .end local v4    # "textView":Landroid/widget/TextView;
    check-cast v4, Landroid/widget/TextView;

    .line 80
    .restart local v4    # "textView":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FinancesFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    const v6, 0x7f050158

    invoke-virtual {v5, v6}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    const v5, 0x7f0b00d5

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .end local v4    # "textView":Landroid/widget/TextView;
    check-cast v4, Landroid/widget/TextView;

    .line 82
    .restart local v4    # "textView":Landroid/widget/TextView;
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/model/util/Util;->formatSalary(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    const v5, 0x7f0b00d6

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .end local v4    # "textView":Landroid/widget/TextView;
    check-cast v4, Landroid/widget/TextView;

    .line 84
    .restart local v4    # "textView":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FinancesFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    const v6, 0x7f05015a

    invoke-virtual {v5, v6}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    const v5, 0x7f0b00d7

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .end local v4    # "textView":Landroid/widget/TextView;
    check-cast v4, Landroid/widget/TextView;

    .line 86
    .restart local v4    # "textView":Landroid/widget/TextView;
    invoke-virtual {p3, v7}, Lcom/blank/bm15/model/object/crud/Team;->getTeamSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/model/util/Util;->formatSalary(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    const v5, 0x7f0b00d8

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .end local v4    # "textView":Landroid/widget/TextView;
    check-cast v4, Landroid/widget/TextView;

    .line 88
    .restart local v4    # "textView":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FinancesFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    const v6, 0x7f05015b

    invoke-virtual {v5, v6}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    const v5, 0x7f0b00d9

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .end local v4    # "textView":Landroid/widget/TextView;
    check-cast v4, Landroid/widget/TextView;

    .line 90
    .restart local v4    # "textView":Landroid/widget/TextView;
    invoke-static {v3}, Lcom/blank/bm15/model/util/Util;->formatSalary(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Team;->getTeamAveragePotential()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->intValue()I

    move-result v2

    .line 93
    .local v2, "potential":I
    const v5, 0x7f0b00d1

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 94
    .local v1, "image":Landroid/widget/ImageView;
    const/16 v5, 0x9

    if-lt v2, v5, :cond_0

    .line 95
    invoke-virtual {p1}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f02004a

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 105
    :goto_0
    return-void

    .line 96
    :cond_0
    const/4 v5, 0x7

    if-lt v2, v5, :cond_1

    .line 97
    invoke-virtual {p1}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020049

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 98
    :cond_1
    const/4 v5, 0x5

    if-lt v2, v5, :cond_2

    .line 99
    invoke-virtual {p1}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020048

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 100
    :cond_2
    const/4 v5, 0x3

    if-lt v2, v5, :cond_3

    .line 101
    invoke-virtual {p1}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020047

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 103
    :cond_3
    invoke-virtual {p1}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020046

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method public static final newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/FinancesFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I
    .param p1, "navigationMode"    # Ljava/lang/Integer;

    .prologue
    .line 27
    new-instance v1, Lcom/blank/bm15/activity/fragment/FinancesFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/FinancesFragment;-><init>()V

    .line 29
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/FinancesFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 30
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/FinancesFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 31
    sget-object v2, Lcom/blank/bm15/activity/fragment/FinancesFragment;->NAVIGATION_MODE:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 32
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/FinancesFragment;->setArguments(Landroid/os/Bundle;)V

    .line 34
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 39
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 41
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FinancesFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Tactic;->reloadPlayers()V

    .line 42
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FinancesFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/FinancesFragment;->rootView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FinancesFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-direct {p0, v4, v5, v6}, Lcom/blank/bm15/activity/fragment/FinancesFragment;->loadHeader(Lcom/blank/bm15/activity/HomeActivity;Landroid/view/View;Lcom/blank/bm15/model/object/crud/Team;)V

    .line 44
    const/4 v3, 0x0

    .line 45
    .local v3, "total":Lcom/blank/bm15/model/object/other/Finance;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .local v0, "financeList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Finance;>;"
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FinancesFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 58
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/FinancesFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b0096

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    .line 62
    .local v1, "listView":Landroid/widget/ListView;
    new-instance v4, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/FinancesFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    const v6, 0x7f030018

    invoke-direct {v4, v5, v6, v0}, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    invoke-virtual {v1, v4}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 63
    new-instance v4, Lcom/blank/bm15/activity/fragment/FinancesFragment$1;

    invoke-direct {v4, p0}, Lcom/blank/bm15/activity/fragment/FinancesFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/FinancesFragment;)V

    invoke-virtual {v1, v4}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 69
    return-void

    .line 46
    .end local v1    # "listView":Landroid/widget/ListView;
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Player;

    .line 47
    .local v2, "player":Lcom/blank/bm15/model/object/crud/Player;
    if-nez v3, :cond_1

    .line 49
    new-instance v5, Lcom/blank/bm15/model/object/other/Finance;

    invoke-direct {v5, v2}, Lcom/blank/bm15/model/object/other/Finance;-><init>(Lcom/blank/bm15/model/object/crud/Player;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    new-instance v3, Lcom/blank/bm15/model/object/other/Finance;

    .end local v3    # "total":Lcom/blank/bm15/model/object/other/Finance;
    invoke-direct {v3, v2}, Lcom/blank/bm15/model/object/other/Finance;-><init>(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 55
    .restart local v3    # "total":Lcom/blank/bm15/model/object/other/Finance;
    :goto_1
    new-instance v5, Lcom/blank/bm15/model/object/other/Finance;

    invoke-direct {v5, v2}, Lcom/blank/bm15/model/object/other/Finance;-><init>(Lcom/blank/bm15/model/object/crud/Player;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {v3, v2}, Lcom/blank/bm15/model/object/other/Finance;->addPlayer(Lcom/blank/bm15/model/object/crud/Player;)V

    goto :goto_1
.end method
