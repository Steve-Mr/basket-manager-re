.class public Lcom/blank/bm15/activity/fragment/DraftFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "DraftFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/DraftFragment;)Lcom/blank/bm15/model/object/crud/Game;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/blank/bm15/activity/fragment/DraftFragment;)Lcom/blank/bm15/activity/HomeActivity;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2(Lcom/blank/bm15/activity/fragment/DraftFragment;Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;I)V
    .locals 0

    .prologue
    .line 76
    invoke-direct {p0, p1, p2, p3}, Lcom/blank/bm15/activity/fragment/DraftFragment;->createNoMorePicksAlert(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;I)V

    return-void
.end method

.method static synthetic access$3(Lcom/blank/bm15/activity/fragment/DraftFragment;Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;ILcom/blank/bm15/model/object/crud/DraftRound;)V
    .locals 0

    .prologue
    .line 91
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/blank/bm15/activity/fragment/DraftFragment;->createSelectPlayerAlert(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;ILcom/blank/bm15/model/object/crud/DraftRound;)V

    return-void
.end method

.method static synthetic access$4(Lcom/blank/bm15/activity/fragment/DraftFragment;Landroid/view/View;)V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/blank/bm15/activity/fragment/DraftFragment;->loadList(Landroid/view/View;)V

    return-void
.end method

.method private createNoMorePicksAlert(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;I)V
    .locals 6
    .param p1, "rootView"    # Landroid/view/View;
    .param p2, "player"    # Lcom/blank/bm15/model/object/crud/Player;
    .param p3, "round"    # I

    .prologue
    const/4 v5, 0x0

    .line 77
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/model/util/Alert;->getBuilder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 78
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f05006a

    invoke-virtual {p0, v1}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 79
    const v2, 0x7f05006d

    invoke-virtual {p0, v2}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 80
    invoke-virtual {v1, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 81
    const v2, 0x7f020036

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 82
    const v2, 0x7f050048

    invoke-virtual {p0, v2}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/blank/bm15/activity/fragment/DraftFragment$2;

    invoke-direct {v3, p0}, Lcom/blank/bm15/activity/fragment/DraftFragment$2;-><init>(Lcom/blank/bm15/activity/fragment/DraftFragment;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 87
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, v1, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 88
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    iget-object v1, v1, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 89
    return-void
.end method

.method private createSelectPlayerAlert(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;ILcom/blank/bm15/model/object/crud/DraftRound;)V
    .locals 9
    .param p1, "rootView"    # Landroid/view/View;
    .param p2, "player"    # Lcom/blank/bm15/model/object/crud/Player;
    .param p3, "round"    # I
    .param p4, "draftRound"    # Lcom/blank/bm15/model/object/crud/DraftRound;

    .prologue
    const/4 v4, 0x0

    .line 92
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/util/Alert;->getBuilder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 93
    .local v6, "builder":Landroid/app/AlertDialog$Builder;
    const v0, 0x7f05006a

    invoke-virtual {p0, v0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 94
    const v1, 0x7f05006e

    invoke-virtual {p0, v1}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 95
    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 96
    const v1, 0x7f020036

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 97
    const v0, 0x7f050047

    invoke-virtual {p0, v0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;

    move-object v1, p0

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/activity/fragment/DraftFragment$3;-><init>(Lcom/blank/bm15/activity/fragment/DraftFragment;Lcom/blank/bm15/model/object/crud/Player;ILcom/blank/bm15/model/object/crud/DraftRound;Landroid/view/View;)V

    invoke-virtual {v7, v8, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 108
    const v1, 0x7f050048

    invoke-virtual {p0, v1}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/blank/bm15/activity/fragment/DraftFragment$4;

    invoke-direct {v2, p0}, Lcom/blank/bm15/activity/fragment/DraftFragment$4;-><init>(Lcom/blank/bm15/activity/fragment/DraftFragment;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 113
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, v0, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 114
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    iget-object v0, v0, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 115
    return-void
.end method

.method private loadList(Landroid/view/View;)V
    .locals 6
    .param p1, "rootView"    # Landroid/view/View;

    .prologue
    .line 48
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 49
    .local v0, "filter":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 50
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getDraftPlayers(Lcom/blank/bm15/model/object/crud/Player;)Ljava/util/List;

    move-result-object v2

    .line 51
    .local v2, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v3, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v4, 0x0

    const/4 v5, -0x1

    invoke-direct {v3, v4, v5}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 54
    const v3, 0x7f0b0034

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    .line 55
    .local v1, "listView":Landroid/widget/ListView;
    new-instance v3, Lcom/blank/bm15/activity/adapter/AdapterDraftList;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    const v5, 0x7f030016

    invoke-direct {v3, v4, v5, v2}, Lcom/blank/bm15/activity/adapter/AdapterDraftList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 56
    new-instance v3, Lcom/blank/bm15/activity/fragment/DraftFragment$1;

    invoke-direct {v3, p0, v1, p1}, Lcom/blank/bm15/activity/fragment/DraftFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/DraftFragment;Landroid/widget/ListView;Landroid/view/View;)V

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 74
    return-void
.end method

.method public static final newInstance(ILjava/lang/Integer;)Lcom/blank/bm15/activity/fragment/DraftFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I
    .param p1, "navigationMode"    # Ljava/lang/Integer;

    .prologue
    .line 30
    new-instance v1, Lcom/blank/bm15/activity/fragment/DraftFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/DraftFragment;-><init>()V

    .line 32
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/DraftFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 33
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/DraftFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 34
    sget-object v2, Lcom/blank/bm15/activity/fragment/DraftFragment;->NAVIGATION_MODE:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 35
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->setArguments(Landroid/os/Bundle;)V

    .line 37
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 42
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 44
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/DraftFragment;->rootView:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->loadList(Landroid/view/View;)V

    .line 45
    return-void
.end method
