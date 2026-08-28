.class public Lcom/blank/bm15/activity/fragment/RookiesAllFragments;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "RookiesAllFragments.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method public static final newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/RookiesAllFragments;
    .locals 4
    .param p0, "fragmentLayout"    # I
    .param p1, "navigationMode"    # Ljava/lang/Integer;

    .prologue
    .line 14
    new-instance v1, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;-><init>()V

    .line 16
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/RookiesAllFragments;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 17
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 18
    sget-object v2, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->NAVIGATION_MODE:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 19
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->setArguments(Landroid/os/Bundle;)V

    .line 21
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v1, 0x7f030010

    .line 26
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 28
    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/RookiesPlayersFragment;->newInstance(I)Lcom/blank/bm15/activity/fragment/RookiesPlayersFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->fragmentTab1:Landroid/app/Fragment;

    .line 29
    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment;->newInstance(I)Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->fragmentTab2:Landroid/app/Fragment;

    .line 31
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v0

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    const v2, 0x7f050188

    invoke-virtual {v1, v2}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->tab1:Landroid/app/ActionBar$Tab;

    .line 32
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v0

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    const v2, 0x7f050189

    invoke-virtual {v1, v2}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->tab2:Landroid/app/ActionBar$Tab;

    .line 34
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->tab1:Landroid/app/ActionBar$Tab;

    new-instance v1, Lcom/blank/bm15/activity/base/BaseTabListener;

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->fragmentTab1:Landroid/app/Fragment;

    invoke-direct {v1, v2}, Lcom/blank/bm15/activity/base/BaseTabListener;-><init>(Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    .line 35
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->tab2:Landroid/app/ActionBar$Tab;

    new-instance v1, Lcom/blank/bm15/activity/base/BaseTabListener;

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->fragmentTab2:Landroid/app/Fragment;

    invoke-direct {v1, v2}, Lcom/blank/bm15/activity/base/BaseTabListener;-><init>(Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    .line 37
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->tab1:Landroid/app/ActionBar$Tab;

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 38
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/RookiesAllFragments;->tab2:Landroid/app/ActionBar$Tab;

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 39
    return-void
.end method
