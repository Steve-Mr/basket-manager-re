.class public Lcom/blank/bm15/activity/fragment/ChallengesFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "ChallengesFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method public static addChallenge(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 6
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 53
    new-instance v2, Lcom/blank/bm15/model/object/crud/Challenge;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/blank/bm15/model/object/crud/Challenge;-><init>(Landroid/content/Context;)V

    .line 54
    .local v2, "filter":Lcom/blank/bm15/model/object/crud/Challenge;
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getAll(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v1

    .line 56
    .local v1, "challengeList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Challenge;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 68
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 69
    return-void

    .line 56
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Challenge;

    .line 57
    .local v0, "challenge":Lcom/blank/bm15/model/object/crud/Challenge;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Challenge;->getTeamName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 58
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Challenge;->getAcquired()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_2

    .line 59
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v4}, Lcom/blank/bm15/model/object/crud/Challenge;->setAcquired(Ljava/lang/Boolean;)V

    .line 60
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentSeason()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/blank/bm15/model/object/crud/Challenge;->setSeason(Ljava/lang/Integer;)V

    goto :goto_0

    .line 61
    :cond_2
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Challenge;->getSeason()Ljava/lang/Integer;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Challenge;->getSeason()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentSeason()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-le v4, v5, :cond_0

    .line 62
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v4}, Lcom/blank/bm15/model/object/crud/Challenge;->setAcquired(Ljava/lang/Boolean;)V

    .line 63
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentSeason()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/blank/bm15/model/object/crud/Challenge;->setSeason(Ljava/lang/Integer;)V

    goto :goto_0
.end method

.method public static final newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/ChallengesFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I
    .param p1, "navigationMode"    # Ljava/lang/Integer;

    .prologue
    .line 22
    new-instance v1, Lcom/blank/bm15/activity/fragment/ChallengesFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/ChallengesFragment;-><init>()V

    .line 24
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/ChallengesFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 25
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/ChallengesFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 26
    sget-object v2, Lcom/blank/bm15/activity/fragment/ChallengesFragment;->NAVIGATION_MODE:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 27
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/ChallengesFragment;->setArguments(Landroid/os/Bundle;)V

    .line 29
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 34
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 36
    new-instance v2, Lcom/blank/bm15/model/object/crud/Challenge;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ChallengesFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Challenge;-><init>(Landroid/content/Context;)V

    .line 37
    .local v2, "filter":Lcom/blank/bm15/model/object/crud/Challenge;
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getAll(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v1

    .line 38
    .local v1, "challengeList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Challenge;>;"
    new-instance v4, Lcom/blank/bm15/model/comparator/ChallengeComparator;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-direct {v4, v5, v6}, Lcom/blank/bm15/model/comparator/ChallengeComparator;-><init>(II)V

    invoke-static {v1, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 41
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/ChallengesFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b0034

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    .line 42
    .local v3, "listView":Landroid/widget/ListView;
    new-instance v4, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ChallengesFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    const v6, 0x7f030017

    invoke-direct {v4, v5, v6, v1}, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 44
    new-instance v2, Lcom/blank/bm15/model/object/crud/Challenge;

    .end local v2    # "filter":Lcom/blank/bm15/model/object/crud/Challenge;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ChallengesFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/blank/bm15/model/object/crud/Challenge;-><init>(Landroid/content/Context;)V

    .line 45
    .restart local v2    # "filter":Lcom/blank/bm15/model/object/crud/Challenge;
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v4}, Lcom/blank/bm15/model/object/crud/Challenge;->setAcquired(Ljava/lang/Boolean;)V

    .line 46
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v0

    .line 47
    .local v0, "challengeAcquiredList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Challenge;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 48
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/ChallengesFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    const v5, 0x7f050068

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Alert;->showInfoDialog(Landroid/app/Activity;Ljava/lang/Integer;)V

    .line 50
    :cond_0
    return-void
.end method
