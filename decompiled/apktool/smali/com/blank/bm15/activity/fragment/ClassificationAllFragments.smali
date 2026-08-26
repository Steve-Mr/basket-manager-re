.class public Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "ClassificationAllFragments.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method public static final newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;
    .locals 4
    .param p0, "fragmentLayout"    # I
    .param p1, "navigationMode"    # Ljava/lang/Integer;

    .prologue
    .line 15
    new-instance v1, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;-><init>()V

    .line 17
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 18
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 19
    sget-object v2, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->NAVIGATION_MODE:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 20
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->setArguments(Landroid/os/Bundle;)V

    .line 22
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x2

    const v1, 0x7f030008

    .line 27
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 29
    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;->newInstance(I)Lcom/blank/bm15/activity/fragment/ClassificationWestFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->fragmentTab1:Landroid/app/Fragment;

    .line 30
    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->newInstance(I)Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->fragmentTab2:Landroid/app/Fragment;

    .line 31
    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/ClassificationEastFragment;->newInstance(I)Lcom/blank/bm15/activity/fragment/ClassificationEastFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->fragmentTab3:Landroid/app/Fragment;

    .line 33
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v0

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    const v2, 0x7f050032

    invoke-virtual {v1, v2}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->tab1:Landroid/app/ActionBar$Tab;

    .line 34
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v0

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    const v2, 0x7f050033

    invoke-virtual {v1, v2}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->tab2:Landroid/app/ActionBar$Tab;

    .line 35
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v0

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    const v2, 0x7f050031

    invoke-virtual {v1, v2}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->tab3:Landroid/app/ActionBar$Tab;

    .line 37
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->tab1:Landroid/app/ActionBar$Tab;

    new-instance v1, Lcom/blank/bm15/activity/base/BaseTabListener;

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->fragmentTab1:Landroid/app/Fragment;

    invoke-direct {v1, v2}, Lcom/blank/bm15/activity/base/BaseTabListener;-><init>(Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    .line 38
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->tab2:Landroid/app/ActionBar$Tab;

    new-instance v1, Lcom/blank/bm15/activity/base/BaseTabListener;

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->fragmentTab2:Landroid/app/Fragment;

    invoke-direct {v1, v2}, Lcom/blank/bm15/activity/base/BaseTabListener;-><init>(Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    .line 39
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->tab3:Landroid/app/ActionBar$Tab;

    new-instance v1, Lcom/blank/bm15/activity/base/BaseTabListener;

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->fragmentTab3:Landroid/app/Fragment;

    invoke-direct {v1, v2}, Lcom/blank/bm15/activity/base/BaseTabListener;-><init>(Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    .line 41
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->tab1:Landroid/app/ActionBar$Tab;

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 42
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->tab2:Landroid/app/ActionBar$Tab;

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 43
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->tab3:Landroid/app/ActionBar$Tab;

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 45
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getConference()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v3, :cond_0

    .line 46
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setSelectedNavigationItem(I)V

    .line 50
    :goto_0
    return-void

    .line 48
    :cond_0
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ClassificationAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/app/ActionBar;->setSelectedNavigationItem(I)V

    goto :goto_0
.end method
