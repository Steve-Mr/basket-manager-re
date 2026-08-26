.class public Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "CalendarMatchFragment.java"


# instance fields
.field public calendarAllFragments:Lcom/blank/bm15/activity/fragment/CalendarAllFragments;

.field private matchday:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;)Lcom/blank/bm15/activity/HomeActivity;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;)Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->matchday:Ljava/lang/Integer;

    return-object v0
.end method

.method static synthetic access$2(Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;Ljava/lang/Integer;)V
    .locals 0

    .prologue
    .line 27
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->matchday:Ljava/lang/Integer;

    return-void
.end method

.method static synthetic access$3(Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;)V
    .locals 0

    .prologue
    .line 94
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->updateMatchList()V

    return-void
.end method

.method static synthetic access$4(Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;)Lcom/blank/bm15/model/object/crud/Game;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    return-object v0
.end method

.method private createPage()V
    .locals 9

    .prologue
    .line 49
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v6

    iput-object v6, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->matchday:Ljava/lang/Integer;

    .line 51
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->rootView:Landroid/view/View;

    const v7, 0x7f0b0033

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 52
    .local v1, "button":Landroid/widget/Button;
    new-instance v6, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$1;

    invoke-direct {v6, p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;)V

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    new-instance v4, Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-direct {v4, v6}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 60
    .local v4, "filter":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/blank/bm15/model/object/crud/Match;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 61
    invoke-static {v4}, Lcom/blank/bm15/dao/BlankDaoExtra;->getUserMatchCalendar(Lcom/blank/bm15/model/object/crud/Match;)Ljava/util/List;

    move-result-object v0

    .line 62
    .local v0, "auxList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .local v2, "calendarList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_0
    const/16 v6, 0xea

    if-le v5, v6, :cond_0

    .line 68
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->rootView:Landroid/view/View;

    const v7, 0x7f0b0031

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    .line 69
    .local v3, "calendarListView":Landroid/widget/ListView;
    new-instance v6, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    const v8, 0x7f030015

    invoke-direct {v6, v7, v8, v2}, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    invoke-virtual {v3, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 70
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/lit8 v6, v6, -0x4

    invoke-virtual {v3, v6}, Landroid/widget/ListView;->setSelection(I)V

    .line 71
    new-instance v6, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$2;

    invoke-direct {v6, p0, v3}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$2;-><init>(Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;Landroid/widget/ListView;)V

    invoke-virtual {v3, v6}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 79
    new-instance v6, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$3;

    invoke-direct {v6, p0, v3}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$3;-><init>(Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;Landroid/widget/ListView;)V

    invoke-virtual {v3, v6}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 91
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->updateMatchList()V

    .line 92
    return-void

    .line 65
    .end local v3    # "calendarListView":Landroid/widget/ListView;
    :cond_0
    invoke-direct {p0, v0, v5}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getMatch(Ljava/util/List;I)Lcom/blank/bm15/model/object/crud/Match;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    add-int/lit8 v5, v5, 0x1

    goto :goto_0
.end method

.method private getMatch(Ljava/util/List;I)Lcom/blank/bm15/model/object/crud/Match;
    .locals 4
    .param p2, "matchday"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Match;",
            ">;I)",
            "Lcom/blank/bm15/model/object/crud/Match;"
        }
    .end annotation

    .prologue
    .line 123
    .local p1, "calendarList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 131
    :goto_0
    new-instance v0, Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 132
    .local v0, "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/Match;->setMatchday(Ljava/lang/Integer;)V

    move-object v1, v0

    .line 134
    .end local v0    # "match":Lcom/blank/bm15/model/object/crud/Match;
    .local v1, "match":Ljava/lang/Object;
    :goto_1
    return-object v1

    .line 123
    .end local v1    # "match":Ljava/lang/Object;
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Match;

    .line 124
    .restart local v0    # "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, p2, :cond_2

    move-object v1, v0

    .line 125
    .restart local v1    # "match":Ljava/lang/Object;
    goto :goto_1

    .line 126
    .end local v1    # "match":Ljava/lang/Object;
    :cond_2
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-le v3, p2, :cond_0

    goto :goto_0
.end method

.method public static final newInstance(ILcom/blank/bm15/activity/fragment/CalendarAllFragments;)Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I
    .param p1, "calendarAllFragments"    # Lcom/blank/bm15/activity/fragment/CalendarAllFragments;

    .prologue
    .line 31
    new-instance v1, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;-><init>()V

    .line 33
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 34
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 35
    sget-object v2, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->NAVIGATION_MODE_NULL:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 36
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->setArguments(Landroid/os/Bundle;)V

    .line 37
    iput-object p1, v1, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->calendarAllFragments:Lcom/blank/bm15/activity/fragment/CalendarAllFragments;

    .line 39
    return-object v1
.end method

.method private updateMatchList()V
    .locals 9

    .prologue
    .line 95
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->rootView:Landroid/view/View;

    const v7, 0x7f0b0033

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 96
    .local v1, "button":Landroid/widget/Button;
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->matchday:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/16 v7, 0xe2

    if-gt v6, v7, :cond_0

    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->matchday:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-le v6, v7, :cond_0

    .line 97
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 102
    :goto_0
    new-instance v2, Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-direct {v2, v6}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 103
    .local v2, "filter":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/blank/bm15/model/object/crud/Match;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 104
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->matchday:Ljava/lang/Integer;

    invoke-virtual {v2, v6}, Lcom/blank/bm15/model/object/crud/Match;->setMatchday(Ljava/lang/Integer;)V

    .line 105
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v3

    .line 107
    .local v3, "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    new-instance v5, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;-><init>(Landroid/content/Context;)V

    .line 108
    .local v5, "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    const v7, 0x7f03001b

    invoke-direct {v0, v6, v7, v3}, Lcom/blank/bm15/activity/adapter/AdapterMatchList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 109
    .local v0, "adapter":Lcom/blank/bm15/activity/adapter/AdapterMatchList;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

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

    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->matchday:Ljava/lang/Integer;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 111
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->rootView:Landroid/view/View;

    const v7, 0x7f0b0032

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ListView;

    .line 112
    .local v4, "matchListView":Landroid/widget/ListView;
    invoke-virtual {v4, v5}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 113
    new-instance v6, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$4;

    invoke-direct {v6, p0, v4}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$4;-><init>(Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;Landroid/widget/ListView;)V

    invoke-virtual {v4, v6}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 120
    return-void

    .line 99
    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterMatchList;
    .end local v2    # "filter":Lcom/blank/bm15/model/object/crud/Match;
    .end local v3    # "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    .end local v4    # "matchListView":Landroid/widget/ListView;
    .end local v5    # "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    :cond_0
    const/16 v6, 0x8

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 44
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 45
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->createPage()V

    .line 46
    return-void
.end method
