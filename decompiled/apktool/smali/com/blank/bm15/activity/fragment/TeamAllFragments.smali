.class public Lcom/blank/bm15/activity/fragment/TeamAllFragments;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "TeamAllFragments.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method public static loadHeader(Lcom/blank/bm15/activity/HomeActivity;Landroid/view/View;Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 7
    .param p0, "activity"    # Lcom/blank/bm15/activity/HomeActivity;
    .param p1, "rootView"    # Landroid/view/View;
    .param p2, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 64
    const v5, 0x7f0b00d2

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 65
    .local v4, "textView":Landroid/widget/TextView;
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getFullName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    const v5, 0x7f0b00d3

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .end local v4    # "textView":Landroid/widget/TextView;
    check-cast v4, Landroid/widget/TextView;

    .line 67
    .restart local v4    # "textView":Landroid/widget/TextView;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getConference()Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/blank/bm15/model/util/Util;->getConference(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getDivision()Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/blank/bm15/model/util/Util;->getDivision(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, "confereceAndDivision":Ljava/lang/String;
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "("

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const v6, 0x7f050161

    invoke-virtual {p0, v6}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const v6, 0x7f050162

    invoke-virtual {p0, v6}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 72
    .local v3, "text":Ljava/lang/String;
    const v5, 0x7f0b00d4

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .end local v4    # "textView":Landroid/widget/TextView;
    check-cast v4, Landroid/widget/TextView;

    .line 73
    .restart local v4    # "textView":Landroid/widget/TextView;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const v6, 0x7f0500b8

    invoke-virtual {p0, v6}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    const v5, 0x7f0b00d5

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .end local v4    # "textView":Landroid/widget/TextView;
    check-cast v4, Landroid/widget/TextView;

    .line 75
    .restart local v4    # "textView":Landroid/widget/TextView;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageTitularsAttack()Ljava/lang/Double;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageTitularsDefense()Ljava/lang/Double;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    const v5, 0x7f0b00d7

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .end local v4    # "textView":Landroid/widget/TextView;
    check-cast v4, Landroid/widget/TextView;

    .line 80
    .restart local v4    # "textView":Landroid/widget/TextView;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageReservesAttack()Ljava/lang/Double;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageReservesDefense()Ljava/lang/Double;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    const v5, 0x7f0b00d9

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .end local v4    # "textView":Landroid/widget/TextView;
    check-cast v4, Landroid/widget/TextView;

    .line 85
    .restart local v4    # "textView":Landroid/widget/TextView;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageRemainsAttack()Ljava/lang/Double;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getPlayersAverageRemainsDefense()Ljava/lang/Double;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getTeamAveragePotential()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->intValue()I

    move-result v2

    .line 88
    .local v2, "potential":I
    const v5, 0x7f0b00d1

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 89
    .local v1, "image":Landroid/widget/ImageView;
    const/16 v5, 0x9

    if-lt v2, v5, :cond_0

    .line 90
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f02004a

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 100
    :goto_0
    return-void

    .line 91
    :cond_0
    const/4 v5, 0x7

    if-lt v2, v5, :cond_1

    .line 92
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020049

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 93
    :cond_1
    const/4 v5, 0x5

    if-lt v2, v5, :cond_2

    .line 94
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020048

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 95
    :cond_2
    const/4 v5, 0x3

    if-lt v2, v5, :cond_3

    .line 96
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020047

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 98
    :cond_3
    invoke-virtual {p0}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020046

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method public static final newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/TeamAllFragments;
    .locals 4
    .param p0, "fragmentLayout"    # I
    .param p1, "navigationMode"    # Ljava/lang/Integer;

    .prologue
    .line 23
    new-instance v1, Lcom/blank/bm15/activity/fragment/TeamAllFragments;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;-><init>()V

    .line 25
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/TeamAllFragments;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 26
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 27
    sget-object v2, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->NAVIGATION_MODE:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 28
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->setArguments(Landroid/os/Bundle;)V

    .line 30
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 35
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 37
    const v1, 0x7f03000d

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->newInstance(I)Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    move-result-object v1

    iput-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->fragmentTab1:Landroid/app/Fragment;

    .line 38
    const v1, 0x7f03000c

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->newInstance(I)Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

    move-result-object v1

    iput-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->fragmentTab2:Landroid/app/Fragment;

    .line 39
    const v1, 0x7f03000f

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->newInstance(I)Lcom/blank/bm15/activity/fragment/TeamTacticFragment;

    move-result-object v1

    iput-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->fragmentTab3:Landroid/app/Fragment;

    .line 40
    const v1, 0x7f03000e

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->newInstance(I)Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;

    move-result-object v1

    iput-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->fragmentTab4:Landroid/app/Fragment;

    .line 42
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v1

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    const v3, 0x7f0500b4

    invoke-virtual {v2, v3}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v1

    iput-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->tab1:Landroid/app/ActionBar$Tab;

    .line 43
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v1

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    const v3, 0x7f0500b5

    invoke-virtual {v2, v3}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v1

    iput-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->tab2:Landroid/app/ActionBar$Tab;

    .line 44
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v1

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    const v3, 0x7f0500b6

    invoke-virtual {v2, v3}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v1

    iput-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->tab3:Landroid/app/ActionBar$Tab;

    .line 45
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v1

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    const v3, 0x7f0500b7

    invoke-virtual {v2, v3}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v1

    iput-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->tab4:Landroid/app/ActionBar$Tab;

    .line 47
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->tab1:Landroid/app/ActionBar$Tab;

    new-instance v2, Lcom/blank/bm15/activity/base/BaseTabListener;

    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->fragmentTab1:Landroid/app/Fragment;

    invoke-direct {v2, v3}, Lcom/blank/bm15/activity/base/BaseTabListener;-><init>(Landroid/app/Fragment;)V

    invoke-virtual {v1, v2}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    .line 48
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->tab2:Landroid/app/ActionBar$Tab;

    new-instance v2, Lcom/blank/bm15/activity/base/BaseTabListener;

    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->fragmentTab2:Landroid/app/Fragment;

    invoke-direct {v2, v3}, Lcom/blank/bm15/activity/base/BaseTabListener;-><init>(Landroid/app/Fragment;)V

    invoke-virtual {v1, v2}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    .line 49
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->tab3:Landroid/app/ActionBar$Tab;

    new-instance v2, Lcom/blank/bm15/activity/base/BaseTabListener;

    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->fragmentTab3:Landroid/app/Fragment;

    invoke-direct {v2, v3}, Lcom/blank/bm15/activity/base/BaseTabListener;-><init>(Landroid/app/Fragment;)V

    invoke-virtual {v1, v2}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    .line 50
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->tab4:Landroid/app/ActionBar$Tab;

    new-instance v2, Lcom/blank/bm15/activity/base/BaseTabListener;

    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->fragmentTab4:Landroid/app/Fragment;

    invoke-direct {v2, v3}, Lcom/blank/bm15/activity/base/BaseTabListener;-><init>(Landroid/app/Fragment;)V

    invoke-virtual {v1, v2}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    .line 52
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/activity/base/BaseActivity;->getNavigation(Landroid/content/Context;)Lcom/blank/bm15/model/object/crud/Navigation;

    move-result-object v0

    .line 53
    .local v0, "navigation":Lcom/blank/bm15/model/object/crud/Navigation;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->tab1:Landroid/app/ActionBar$Tab;

    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 54
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 55
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Navigation;->getIdObject()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 56
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Navigation;->getIdObject()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 57
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->tab2:Landroid/app/ActionBar$Tab;

    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 58
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->tab3:Landroid/app/ActionBar$Tab;

    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 60
    :cond_0
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->tab4:Landroid/app/ActionBar$Tab;

    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 61
    return-void
.end method
