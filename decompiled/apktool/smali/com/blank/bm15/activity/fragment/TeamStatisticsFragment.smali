.class public Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "TeamStatisticsFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method private getAdapter(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;
    .locals 9
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    const/4 v7, 0x0

    .line 55
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .local v1, "matchResultList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/MatchResult;>;"
    new-instance v4, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 59
    .local v4, "teamMatchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_0

    .line 65
    new-instance v5, Lcom/blank/bm15/model/comparator/MatchResultComparator;

    const/4 v6, -0x1

    invoke-direct {v5, v7, v6}, Lcom/blank/bm15/model/comparator/MatchResultComparator;-><init>(II)V

    invoke-static {v1, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 67
    new-instance v0, Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 68
    .local v0, "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/Match;->setTeamLocal(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 69
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/blank/bm15/model/object/crud/Match;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 70
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getPlayedMatchesTeam(Lcom/blank/bm15/model/object/crud/Match;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/blank/bm15/model/object/crud/MatchResult;->setMatches(Ljava/lang/Integer;)V

    .line 71
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    new-instance v5, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    invoke-interface {v1, v7, v5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 74
    new-instance v5, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    const v7, 0x7f03001c

    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {v5, v6, v7, v1, v8}, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;-><init>(Landroid/content/Context;ILjava/util/List;Ljava/lang/Boolean;)V

    return-object v5

    .line 59
    .end local v0    # "match":Lcom/blank/bm15/model/object/crud/Match;
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Player;

    .line 60
    .local v2, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-direct {p0, v2}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->getPlayerMatchResult(Lcom/blank/bm15/model/object/crud/Player;)Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v3

    .line 61
    .local v3, "playerMatchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->setName(Ljava/lang/String;)V

    .line 62
    invoke-virtual {v4, v3}, Lcom/blank/bm15/model/object/crud/MatchResult;->addMatchResult(Lcom/blank/bm15/model/object/crud/MatchResult;)V

    .line 63
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private getPlayerMatchResult(Lcom/blank/bm15/model/object/crud/Player;)Lcom/blank/bm15/model/object/crud/MatchResult;
    .locals 6
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 78
    new-instance v0, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 79
    .local v0, "filter":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->setPlayer(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 81
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v2

    .line 82
    .local v2, "matchResultList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/MatchResult;>;"
    new-instance v3, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 83
    .local v3, "playerMatchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/blank/bm15/model/object/crud/MatchResult;->setMatches(Ljava/lang/Integer;)V

    .line 84
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 88
    return-object v3

    .line 84
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/MatchResult;

    .line 85
    .local v1, "matchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-virtual {v3, v1}, Lcom/blank/bm15/model/object/crud/MatchResult;->addMatchResult(Lcom/blank/bm15/model/object/crud/MatchResult;)V

    goto :goto_0
.end method

.method public static final newInstance(I)Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I

    .prologue
    .line 27
    new-instance v1, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;-><init>()V

    .line 29
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 30
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 31
    sget-object v2, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->NAVIGATION_MODE_NULL:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 32
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 34
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 39
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 41
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/activity/base/BaseActivity;->getNavigation(Landroid/content/Context;)Lcom/blank/bm15/model/object/crud/Navigation;

    move-result-object v2

    .line 42
    .local v2, "navigation":Lcom/blank/bm15/model/object/crud/Navigation;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Navigation;->getIdObject()Ljava/lang/Integer;

    move-result-object v0

    .line 43
    .local v0, "idTeam":Ljava/lang/Integer;
    new-instance v3, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 44
    .local v3, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v3, v0}, Lcom/blank/bm15/model/object/crud/Team;->setId(Ljava/lang/Integer;)V

    .line 45
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 47
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->rootView:Landroid/view/View;

    invoke-static {v4, v5, v3}, Lcom/blank/bm15/activity/fragment/TeamAllFragments;->loadHeader(Lcom/blank/bm15/activity/HomeActivity;Landroid/view/View;Lcom/blank/bm15/model/object/crud/Team;)V

    .line 50
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b0096

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    .line 51
    .local v1, "listView":Landroid/widget/ListView;
    invoke-direct {p0, v3}, Lcom/blank/bm15/activity/fragment/TeamStatisticsFragment;->getAdapter(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 52
    return-void
.end method
