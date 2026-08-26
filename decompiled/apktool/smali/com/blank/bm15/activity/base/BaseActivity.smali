.class public Lcom/blank/bm15/activity/base/BaseActivity;
.super Landroid/app/Activity;
.source "BaseActivity.java"


# instance fields
.field public alertDialog:Landroid/app/AlertDialog;

.field private game:Lcom/blank/bm15/model/object/crud/Game;

.field public interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/base/BaseActivity;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 22
    return-void
.end method

.method public static addNavigation(Landroid/content/Context;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "idFragment"    # Ljava/lang/Integer;
    .param p2, "idObject"    # Ljava/lang/Integer;

    .prologue
    .line 69
    new-instance v0, Lcom/blank/bm15/model/object/crud/Navigation;

    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/Navigation;-><init>(Landroid/content/Context;)V

    .line 70
    .local v0, "navigation":Lcom/blank/bm15/model/object/crud/Navigation;
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/Navigation;->setIdFragment(Ljava/lang/Integer;)V

    .line 71
    invoke-virtual {v0, p2}, Lcom/blank/bm15/model/object/crud/Navigation;->setIdObject(Ljava/lang/Integer;)V

    .line 72
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 73
    return-void
.end method

.method public static deleteLastNavigation(Landroid/content/Context;)Lcom/blank/bm15/model/object/crud/Navigation;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 76
    new-instance v1, Lcom/blank/bm15/model/object/crud/Navigation;

    invoke-direct {v1, p0}, Lcom/blank/bm15/model/object/crud/Navigation;-><init>(Landroid/content/Context;)V

    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->getAll(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v0

    .line 78
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Navigation;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 79
    new-instance v1, Lcom/blank/bm15/model/comparator/NavigationComparator;

    invoke-direct {v1}, Lcom/blank/bm15/model/comparator/NavigationComparator;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 80
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Navigation;

    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->delete(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 83
    :cond_0
    invoke-static {p0}, Lcom/blank/bm15/activity/base/BaseActivity;->getNavigation(Landroid/content/Context;)Lcom/blank/bm15/model/object/crud/Navigation;

    move-result-object v1

    return-object v1
.end method

.method public static getNavigation(Landroid/content/Context;)Lcom/blank/bm15/model/object/crud/Navigation;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 87
    new-instance v2, Lcom/blank/bm15/model/object/crud/Navigation;

    invoke-direct {v2, p0}, Lcom/blank/bm15/model/object/crud/Navigation;-><init>(Landroid/content/Context;)V

    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getAll(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v0

    .line 90
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Navigation;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 91
    new-instance v2, Lcom/blank/bm15/model/comparator/NavigationComparator;

    invoke-direct {v2}, Lcom/blank/bm15/model/comparator/NavigationComparator;-><init>()V

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 92
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Navigation;

    .line 98
    .local v1, "navigation":Lcom/blank/bm15/model/object/crud/Navigation;
    :goto_0
    return-object v1

    .line 94
    .end local v1    # "navigation":Lcom/blank/bm15/model/object/crud/Navigation;
    :cond_0
    new-instance v1, Lcom/blank/bm15/model/object/crud/Navigation;

    invoke-direct {v1, p0}, Lcom/blank/bm15/model/object/crud/Navigation;-><init>(Landroid/content/Context;)V

    .line 95
    .restart local v1    # "navigation":Lcom/blank/bm15/model/object/crud/Navigation;
    const/16 v2, 0xf

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Navigation;->setIdFragment(Ljava/lang/Integer;)V

    goto :goto_0
.end method

.method public static resetNavigation(Landroid/content/Context;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "idFragment"    # Ljava/lang/Integer;
    .param p2, "idObject"    # Ljava/lang/Integer;

    .prologue
    .line 64
    new-instance v0, Lcom/blank/bm15/model/object/crud/Navigation;

    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/Navigation;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getAll(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->deleteAll(Ljava/util/List;)V

    .line 65
    invoke-static {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseActivity;->addNavigation(Landroid/content/Context;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 66
    return-void
.end method


# virtual methods
.method public getGame()Lcom/blank/bm15/model/object/crud/Game;
    .locals 3

    .prologue
    .line 39
    const-string v1, "GAME_ID"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->getInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    .line 40
    .local v0, "id":I
    iget-object v1, p0, Lcom/blank/bm15/activity/base/BaseActivity;->game:Lcom/blank/bm15/model/object/crud/Game;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/blank/bm15/activity/base/BaseActivity;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/blank/bm15/activity/base/BaseActivity;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v1, v0, :cond_1

    .line 41
    :cond_0
    new-instance v1, Lcom/blank/bm15/model/object/crud/Game;

    invoke-direct {v1, p0}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/blank/bm15/activity/base/BaseActivity;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 42
    iget-object v1, p0, Lcom/blank/bm15/activity/base/BaseActivity;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Game;->setId(Ljava/lang/Integer;)V

    .line 43
    iget-object v1, p0, Lcom/blank/bm15/activity/base/BaseActivity;->game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 45
    :cond_1
    iget-object v1, p0, Lcom/blank/bm15/activity/base/BaseActivity;->game:Lcom/blank/bm15/model/object/crud/Game;

    return-object v1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 31
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 34
    invoke-virtual {p0}, Lcom/blank/bm15/activity/base/BaseActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 35
    .local v0, "actionBar":Landroid/app/ActionBar;
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 36
    return-void
.end method

.method public setGame(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 0
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/blank/bm15/activity/base/BaseActivity;->game:Lcom/blank/bm15/model/object/crud/Game;

    .line 50
    return-void
.end method

.method public showShortToast(Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 58
    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 59
    .local v0, "toast":Landroid/widget/Toast;
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/Toast;->setGravity(III)V

    .line 60
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 61
    return-void
.end method
