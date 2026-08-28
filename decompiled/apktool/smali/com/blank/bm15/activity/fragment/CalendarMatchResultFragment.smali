.class public Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "CalendarMatchResultFragment.java"


# instance fields
.field private match:Lcom/blank/bm15/model/object/crud/Match;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method private getAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    .locals 10

    .prologue
    const v9, 0x7f03001c

    .line 53
    new-instance v2, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-direct {v2, v6}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 54
    .local v2, "filter":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getMatch()Lcom/blank/bm15/model/object/crud/Match;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->setMatch(Lcom/blank/bm15/model/object/crud/Match;)V

    .line 56
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v4

    .line 57
    .local v4, "matchResultList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/MatchResult;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .local v3, "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getMatch()Lcom/blank/bm15/model/object/crud/Match;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getMatch()Lcom/blank/bm15/model/object/crud/Match;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getMatch()Lcom/blank/bm15/model/object/crud/Match;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    new-instance v5, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;-><init>(Landroid/content/Context;)V

    .line 63
    .local v5, "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    new-instance v1, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    const v7, 0x7f03001a

    invoke-direct {v1, v6, v7, v3}, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 64
    .local v1, "adapterGame":Lcom/blank/bm15/activity/adapter/AdapterGameResultList;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    const v8, 0x7f05002f

    invoke-virtual {v7, v8}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getMatch()Lcom/blank/bm15/model/object/crud/Match;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v1}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 65
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getMatch()Lcom/blank/bm15/model/object/crud/Match;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-direct {p0, v4, v7}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getTeamMatchResults(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Team;)Ljava/util/List;

    move-result-object v7

    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v0, v6, v9, v7, v8}, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;-><init>(Landroid/content/Context;ILjava/util/List;Ljava/lang/Boolean;)V

    .line 66
    .local v0, "adapter":Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getMatch()Lcom/blank/bm15/model/object/crud/Match;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getFullName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    const v8, 0x7f050143

    invoke-virtual {v7, v8}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 67
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;

    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->match:Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-direct {p0, v4, v7}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getTeamMatchResults(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Team;)Ljava/util/List;

    move-result-object v7

    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v0, v6, v9, v7, v8}, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;-><init>(Landroid/content/Context;ILjava/util/List;Ljava/lang/Boolean;)V

    .line 68
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getMatch()Lcom/blank/bm15/model/object/crud/Match;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getFullName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    const v8, 0x7f050144

    invoke-virtual {v7, v8}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 70
    return-object v5
.end method

.method private getTeamMatchResults(Ljava/util/List;Lcom/blank/bm15/model/object/crud/Team;)Ljava/util/List;
    .locals 7
    .param p2, "team"    # Lcom/blank/bm15/model/object/crud/Team;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/MatchResult;",
            ">;",
            "Lcom/blank/bm15/model/object/crud/Team;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/MatchResult;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, "matchResultList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/MatchResult;>;"
    const/4 v6, 0x0

    .line 74
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .local v1, "teamMatchResultList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/MatchResult;>;"
    new-instance v2, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 77
    .local v2, "total":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 83
    new-instance v3, Lcom/blank/bm15/model/comparator/MatchResultComparator;

    const/4 v4, -0x1

    invoke-direct {v3, v6, v4}, Lcom/blank/bm15/model/comparator/MatchResultComparator;-><init>(II)V

    invoke-static {v1, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 85
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_1

    .line 86
    new-instance v3, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    invoke-interface {v1, v6, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 88
    :cond_1
    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/blank/bm15/model/object/crud/MatchResult;->setMatches(Ljava/lang/Integer;)V

    .line 89
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    return-object v1

    .line 77
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/MatchResult;

    .line 78
    .local v0, "matchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPlayer()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_0

    .line 79
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    invoke-virtual {v2, v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->addMatchResult(Lcom/blank/bm15/model/object/crud/MatchResult;)V

    goto :goto_0
.end method

.method public static final newInstance(I)Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I

    .prologue
    .line 27
    new-instance v1, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;-><init>()V

    .line 29
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 30
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 31
    sget-object v2, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->NAVIGATION_MODE_NULL:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 32
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->setArguments(Landroid/os/Bundle;)V

    .line 34
    return-object v1
.end method


# virtual methods
.method public getMatch()Lcom/blank/bm15/model/object/crud/Match;
    .locals 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->match:Lcom/blank/bm15/model/object/crud/Match;

    if-nez v0, :cond_0

    .line 96
    new-instance v0, Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->match:Lcom/blank/bm15/model/object/crud/Match;

    .line 98
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->match:Lcom/blank/bm15/model/object/crud/Match;

    return-object v0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 39
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 42
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->rootView:Landroid/view/View;

    const v2, 0x7f0b0034

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    .line 49
    .local v0, "listView":Landroid/widget/ListView;
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->getAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 50
    return-void
.end method

.method public setMatch(Lcom/blank/bm15/model/object/crud/Match;)V
    .locals 0
    .param p1, "match"    # Lcom/blank/bm15/model/object/crud/Match;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchResultFragment;->match:Lcom/blank/bm15/model/object/crud/Match;

    .line 103
    return-void
.end method
