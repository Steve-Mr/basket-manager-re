.class public Lcom/blank/bm15/activity/base/BaseFragment;
.super Landroid/app/Fragment;
.source "BaseFragment.java"


# static fields
.field protected static FRAGMENT_LAYOUT:Ljava/lang/String;

.field protected static NAVIGATION_MODE:Ljava/lang/String;

.field protected static NAVIGATION_MODE_NULL:Ljava/lang/String;


# instance fields
.field protected fragmentLayout:Ljava/lang/Integer;

.field protected fragmentTab1:Landroid/app/Fragment;

.field protected fragmentTab2:Landroid/app/Fragment;

.field protected fragmentTab3:Landroid/app/Fragment;

.field protected fragmentTab4:Landroid/app/Fragment;

.field protected navigationMode:Ljava/lang/Integer;

.field protected rootView:Landroid/view/View;

.field protected tab1:Landroid/app/ActionBar$Tab;

.field protected tab2:Landroid/app/ActionBar$Tab;

.field protected tab3:Landroid/app/ActionBar$Tab;

.field protected tab4:Landroid/app/ActionBar$Tab;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-string v0, "FRAGMENT_LAYOUT"

    sput-object v0, Lcom/blank/bm15/activity/base/BaseFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    .line 17
    const-string v0, "NAVIGATION_MODE"

    sput-object v0, Lcom/blank/bm15/activity/base/BaseFragment;->NAVIGATION_MODE:Ljava/lang/String;

    .line 18
    const-string v0, "NAVIGATION_MODE_NULL"

    sput-object v0, Lcom/blank/bm15/activity/base/BaseFragment;->NAVIGATION_MODE_NULL:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 29
    return-void
.end method


# virtual methods
.method protected getActionBar()Landroid/app/ActionBar;
    .locals 1

    .prologue
    .line 65
    invoke-virtual {p0}, Lcom/blank/bm15/activity/base/BaseFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/activity/HomeActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    return-object v0
.end method

.method protected getGame()Lcom/blank/bm15/model/object/crud/Game;
    .locals 1

    .prologue
    .line 69
    invoke-virtual {p0}, Lcom/blank/bm15/activity/base/BaseFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    return-object v0
.end method

.method protected getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;
    .locals 1

    .prologue
    .line 60
    invoke-virtual {p0}, Lcom/blank/bm15/activity/base/BaseFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/activity/HomeActivity;

    .line 61
    .local v0, "activity":Lcom/blank/bm15/activity/HomeActivity;
    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 33
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 35
    invoke-virtual {p0}, Lcom/blank/bm15/activity/base/BaseFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    sget-object v1, Lcom/blank/bm15/activity/base/BaseFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/base/BaseFragment;->fragmentLayout:Ljava/lang/Integer;

    .line 36
    invoke-virtual {p0}, Lcom/blank/bm15/activity/base/BaseFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    sget-object v1, Lcom/blank/bm15/activity/base/BaseFragment;->NAVIGATION_MODE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/base/BaseFragment;->navigationMode:Ljava/lang/Integer;

    .line 38
    invoke-virtual {p0}, Lcom/blank/bm15/activity/base/BaseFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    sget-object v1, Lcom/blank/bm15/activity/base/BaseFragment;->NAVIGATION_MODE_NULL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/base/BaseFragment;->navigationMode:Ljava/lang/Integer;

    .line 41
    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/blank/bm15/activity/base/BaseFragment;->fragmentLayout:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/base/BaseFragment;->rootView:Landroid/view/View;

    .line 46
    iget-object v0, p0, Lcom/blank/bm15/activity/base/BaseFragment;->rootView:Landroid/view/View;

    return-object v0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 51
    invoke-super {p0, p1, p2}, Landroid/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 53
    iget-object v0, p0, Lcom/blank/bm15/activity/base/BaseFragment;->navigationMode:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 54
    invoke-virtual {p0}, Lcom/blank/bm15/activity/base/BaseFragment;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ActionBar;->removeAllTabs()V

    .line 55
    invoke-virtual {p0}, Lcom/blank/bm15/activity/base/BaseFragment;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/base/BaseFragment;->navigationMode:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setNavigationMode(I)V

    .line 57
    :cond_0
    return-void
.end method
