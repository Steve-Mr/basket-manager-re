.class public Lcom/blank/bm15/activity/fragment/TeamTacticFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "TeamTacticFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->onClickTacticStarPlayers(Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$1(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->createPage()V

    return-void
.end method

.method static synthetic access$2(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;)Lcom/blank/bm15/activity/HomeActivity;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    return-object v0
.end method

.method private createPage()V
    .locals 11

    .prologue
    const/16 v10, 0xa

    const/4 v9, 0x4

    .line 50
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    invoke-static {v7}, Lcom/blank/bm15/activity/base/BaseActivity;->getNavigation(Landroid/content/Context;)Lcom/blank/bm15/model/object/crud/Navigation;

    move-result-object v1

    .line 51
    .local v1, "navigation":Lcom/blank/bm15/model/object/crud/Navigation;
    new-instance v6, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 52
    .local v6, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Navigation;->getIdObject()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/blank/bm15/model/object/crud/Team;->setId(Ljava/lang/Integer;)V

    .line 53
    invoke-static {v6}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 55
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    iget-object v8, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->rootView:Landroid/view/View;

    invoke-static {v7, v8, v6}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->loadHeader(Lcom/blank/bm15/activity/HomeActivity;Landroid/view/View;Lcom/blank/bm15/model/object/crud/Team;)V

    .line 57
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->rootView:Landroid/view/View;

    const v8, 0x7f0b009b

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/SeekBar;

    .line 58
    .local v3, "seekBarGameType":Landroid/widget/SeekBar;
    invoke-virtual {v3, v9}, Landroid/widget/SeekBar;->setMax(I)V

    .line 59
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticGameType()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/lit8 v7, v7, 0x2

    invoke-virtual {v3, v7}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 60
    new-instance v7, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$1;

    invoke-direct {v7, p0, v6}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;Lcom/blank/bm15/model/object/crud/Team;)V

    invoke-virtual {v3, v7}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 73
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->rootView:Landroid/view/View;

    const v8, 0x7f0b00a0

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/SeekBar;

    .line 74
    .local v2, "seekBarBenchImportance":Landroid/widget/SeekBar;
    invoke-virtual {v2, v9}, Landroid/widget/SeekBar;->setMax(I)V

    .line 75
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticBenchImportance()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v2, v7}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 76
    new-instance v7, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$2;

    invoke-direct {v7, p0, v6}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$2;-><init>(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;Lcom/blank/bm15/model/object/crud/Team;)V

    invoke-virtual {v2, v7}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 89
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->rootView:Landroid/view/View;

    const v8, 0x7f0b00a5

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/SeekBar;

    .line 90
    .local v4, "seekBarShotIntPercent":Landroid/widget/SeekBar;
    invoke-virtual {v4, v10}, Landroid/widget/SeekBar;->setMax(I)V

    .line 91
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticShotIntPercent()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/lit8 v7, v7, -0x23

    invoke-virtual {v4, v7}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 92
    new-instance v7, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$3;

    invoke-direct {v7, p0, v6}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$3;-><init>(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;Lcom/blank/bm15/model/object/crud/Team;)V

    invoke-virtual {v4, v7}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 105
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->rootView:Landroid/view/View;

    const v8, 0x7f0b00aa

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/SeekBar;

    .line 106
    .local v5, "seekBarShotTriplePercent":Landroid/widget/SeekBar;
    invoke-virtual {v5, v10}, Landroid/widget/SeekBar;->setMax(I)V

    .line 107
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticShotTriplePercent()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/lit8 v7, v7, -0x23

    invoke-virtual {v5, v7}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 108
    new-instance v7, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$4;

    invoke-direct {v7, p0, v6}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$4;-><init>(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;Lcom/blank/bm15/model/object/crud/Team;)V

    invoke-virtual {v5, v7}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 121
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->rootView:Landroid/view/View;

    const v8, 0x7f0b00ad

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 122
    .local v0, "button":Landroid/widget/Button;
    const/4 v7, 0x3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v7}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 123
    invoke-direct {p0, v6, v0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;)V

    .line 125
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->rootView:Landroid/view/View;

    const v8, 0x7f0b00ae

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "button":Landroid/widget/Button;
    check-cast v0, Landroid/widget/Button;

    .line 126
    .restart local v0    # "button":Landroid/widget/Button;
    const/4 v7, 0x2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v7}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 127
    invoke-direct {p0, v6, v0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;)V

    .line 129
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->rootView:Landroid/view/View;

    const v8, 0x7f0b00af

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "button":Landroid/widget/Button;
    check-cast v0, Landroid/widget/Button;

    .line 130
    .restart local v0    # "button":Landroid/widget/Button;
    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v7}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 131
    invoke-direct {p0, v6, v0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;)V

    .line 132
    return-void
.end method

.method public static final newInstance(I)Lcom/blank/bm15/activity/fragment/TeamTacticFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I

    .prologue
    .line 33
    new-instance v1, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;-><init>()V

    .line 35
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/TeamTacticFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 36
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 37
    sget-object v2, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->NAVIGATION_MODE_NULL:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 38
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->setArguments(Landroid/os/Bundle;)V

    .line 40
    return-object v1
.end method

.method private onClickTacticStarPlayers(Landroid/widget/Button;)V
    .locals 12
    .param p1, "button"    # Landroid/widget/Button;

    .prologue
    .line 165
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    invoke-static {v7}, Lcom/blank/bm15/activity/base/BaseActivity;->getNavigation(Landroid/content/Context;)Lcom/blank/bm15/model/object/crud/Navigation;

    move-result-object v5

    .line 166
    .local v5, "navigation":Lcom/blank/bm15/model/object/crud/Navigation;
    new-instance v6, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 167
    .local v6, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Navigation;->getIdObject()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/blank/bm15/model/object/crud/Team;->setId(Ljava/lang/Integer;)V

    .line 168
    invoke-static {v6}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 170
    invoke-virtual {p1}, Landroid/widget/Button;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-static {v7}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 172
    .local v2, "importance":I
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    invoke-direct {v0, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 173
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/activity/HomeActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    .line 175
    .local v3, "inflater":Landroid/view/LayoutInflater;
    const v7, 0x7f030006

    const/4 v8, 0x0

    invoke-virtual {v3, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 176
    .local v1, "dialogView":Landroid/view/View;
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 177
    const v8, 0x7f050049

    invoke-virtual {p0, v8}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$6;

    invoke-direct {v9, p0, v2, v6}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$6;-><init>(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;ILcom/blank/bm15/model/object/crud/Team;)V

    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 190
    const v8, 0x7f050048

    invoke-virtual {p0, v8}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$7;

    invoke-direct {v9, p0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$7;-><init>(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;)V

    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 196
    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v7

    new-instance v8, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v9, 0x1

    const/4 v10, -0x1

    invoke-direct {v8, v9, v10}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v7, v8}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 198
    const v7, 0x7f0b0030

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ListView;

    .line 199
    .local v4, "listView":Landroid/widget/ListView;
    new-instance v7, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v8

    const v9, 0x7f03001f

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v10

    sget-object v11, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    invoke-direct {v7, v8, v9, v10, v11}, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;-><init>(Landroid/content/Context;ILjava/util/List;Z)V

    invoke-virtual {v4, v7}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 200
    new-instance v7, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;

    invoke-direct {v7, p0, v4, v2, v6}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;-><init>(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;Landroid/widget/ListView;ILcom/blank/bm15/model/object/crud/Team;)V

    invoke-virtual {v4, v7}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 232
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v8

    iput-object v8, v7, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 233
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    iget-object v7, v7, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v7}, Landroid/app/AlertDialog;->show()V

    .line 234
    return-void
.end method

.method private setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;)V
    .locals 6
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;
    .param p2, "button"    # Landroid/widget/Button;

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 135
    invoke-virtual {p2}, Landroid/widget/Button;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 137
    .local v0, "importance":I
    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 138
    .local v1, "player":Lcom/blank/bm15/model/object/crud/Player;
    if-ne v0, v5, :cond_2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarOne()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 139
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarOne()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setId(Ljava/lang/Integer;)V

    .line 145
    :cond_0
    :goto_0
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 146
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 147
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " (+"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 156
    :cond_1
    :goto_1
    new-instance v2, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$5;

    invoke-direct {v2, p0, p2}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$5;-><init>(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;Landroid/widget/Button;)V

    invoke-virtual {p2, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    return-void

    .line 140
    :cond_2
    if-ne v0, v4, :cond_3

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarTwo()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 141
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarTwo()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setId(Ljava/lang/Integer;)V

    goto :goto_0

    .line 142
    :cond_3
    if-ne v0, v3, :cond_0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarThree()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 143
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarThree()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setId(Ljava/lang/Integer;)V

    goto :goto_0

    .line 148
    :cond_4
    if-ne v0, v5, :cond_5

    .line 149
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0500cf

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 150
    :cond_5
    if-ne v0, v4, :cond_6

    .line 151
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0500d0

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 152
    :cond_6
    if-ne v0, v3, :cond_1

    .line 153
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0500d1

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
    .line 45
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 46
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->createPage()V

    .line 47
    return-void
.end method
