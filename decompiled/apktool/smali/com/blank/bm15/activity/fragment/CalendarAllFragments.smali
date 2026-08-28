.class public Lcom/blank/bm15/activity/fragment/CalendarAllFragments;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "CalendarAllFragments.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method public static final newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/CalendarAllFragments;
    .locals 4
    .param p0, "fragmentLayout"    # I
    .param p1, "navigationMode"    # Ljava/lang/Integer;

    .prologue
    .line 15
    new-instance v1, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;-><init>()V

    .line 17
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/CalendarAllFragments;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 18
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 19
    sget-object v2, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->NAVIGATION_MODE:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 20
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->setArguments(Landroid/os/Bundle;)V

    .line 22
    return-object v1
.end method


# virtual methods
.method public loadMatch(Lcom/blank/bm15/model/object/crud/Match;)V
    .locals 3
    .param p1, "match"    # Lcom/blank/bm15/model/object/crud/Match;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->tab2:Landroid/app/ActionBar$Tab;

    if-nez v0, :cond_0

    .line 44
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v0

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    const v2, 0x7f050142

    invoke-virtual {v1, v2}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->tab2:Landroid/app/ActionBar$Tab;

    .line 45
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->tab2:Landroid/app/ActionBar$Tab;

    new-instance v1, Lcom/blank/bm15/activity/base/BaseTabListener;

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->fragmentTab2:Landroid/app/Fragment;

    invoke-direct {v1, v2}, Lcom/blank/bm15/activity/base/BaseTabListener;-><init>(Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    .line 46
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->tab2:Landroid/app/ActionBar$Tab;

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->fragmentTab2:Landroid/app/Fragment;

    check-cast v0, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;

    invoke-virtual {v0, p1}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->setMatch(Lcom/blank/bm15/model/object/crud/Match;)V

    .line 49
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setSelectedNavigationItem(I)V

    .line 50
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 27
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 29
    const v0, 0x7f030007

    invoke-static {v0, p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->newInstance(ILcom/blank/bm15/activity/fragment/CalendarAllFragments;)Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->fragmentTab1:Landroid/app/Fragment;

    .line 30
    const v0, 0x7f030008

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->newInstance(I)Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->fragmentTab2:Landroid/app/Fragment;

    .line 32
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v0

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    const v2, 0x7f050141

    invoke-virtual {v1, v2}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->tab1:Landroid/app/ActionBar$Tab;

    .line 35
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->tab1:Landroid/app/ActionBar$Tab;

    new-instance v1, Lcom/blank/bm15/activity/base/BaseTabListener;

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->fragmentTab1:Landroid/app/Fragment;

    invoke-direct {v1, v2}, Lcom/blank/bm15/activity/base/BaseTabListener;-><init>(Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    .line 38
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/CalendarAllFragments;->tab1:Landroid/app/ActionBar$Tab;

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 40
    return-void
.end method
