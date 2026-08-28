.class public Lcom/blank/bm15/activity/SelectTeamActivity;
.super Lcom/blank/bm15/activity/base/BaseActivity;
.source "SelectTeamActivity.java"


# instance fields
.field private dialog:Landroid/app/AlertDialog;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseActivity;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/SelectTeamActivity;->dialog:Landroid/app/AlertDialog;

    .line 30
    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/SelectTeamActivity;Landroid/app/AlertDialog;)V
    .locals 0

    .prologue
    .line 32
    iput-object p1, p0, Lcom/blank/bm15/activity/SelectTeamActivity;->dialog:Landroid/app/AlertDialog;

    return-void
.end method

.method static synthetic access$1(Lcom/blank/bm15/activity/SelectTeamActivity;)Landroid/app/AlertDialog;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/blank/bm15/activity/SelectTeamActivity;->dialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method private createPage()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    .line 44
    invoke-virtual {p0}, Lcom/blank/bm15/activity/SelectTeamActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 45
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/blank/bm15/activity/MainActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/blank/bm15/activity/SelectTeamActivity;->startActivity(Landroid/content/Intent;)V

    .line 48
    :cond_0
    const v1, 0x7f0b0020

    invoke-virtual {p0, v1}, Lcom/blank/bm15/activity/SelectTeamActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    .line 49
    .local v0, "listView":Landroid/widget/ListView;
    invoke-direct {p0}, Lcom/blank/bm15/activity/SelectTeamActivity;->getAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 50
    new-instance v1, Lcom/blank/bm15/activity/SelectTeamActivity$1;

    invoke-direct {v1, p0, v0}, Lcom/blank/bm15/activity/SelectTeamActivity$1;-><init>(Lcom/blank/bm15/activity/SelectTeamActivity;Landroid/widget/ListView;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 86
    return-void
.end method

.method private getAdapter()Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    .locals 12

    .prologue
    const/4 v11, 0x4

    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    const v7, 0x7f030022

    .line 89
    new-instance v3, Lcom/blank/bm15/model/object/crud/Team;

    invoke-direct {v3, p0}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 90
    .local v3, "filter":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/SelectTeamActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 92
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/blank/bm15/model/util/Util;->getConference(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v1

    .line 93
    .local v1, "conferenceEast":Ljava/lang/String;
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/blank/bm15/model/util/Util;->getConference(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v2

    .line 94
    .local v2, "conferenceWest":Ljava/lang/String;
    new-instance v4, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    invoke-direct {v4, p0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;-><init>(Landroid/content/Context;)V

    .line 96
    .local v4, "separatedAdapter":Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 97
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;

    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v0, p0, v7, v5}, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 98
    .local v0, "adapter":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/blank/bm15/model/util/Util;->getDivision(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 100
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 101
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;

    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v0, p0, v7, v5}, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 102
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/blank/bm15/model/util/Util;->getDivision(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 104
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 105
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;

    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v0, p0, v7, v5}, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 106
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/blank/bm15/model/util/Util;->getDivision(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 108
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 109
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;

    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v0, p0, v7, v5}, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 110
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/blank/bm15/model/util/Util;->getDivision(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 112
    const/4 v5, 0x5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 113
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;

    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v0, p0, v7, v5}, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 114
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x5

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/blank/bm15/model/util/Util;->getDivision(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 116
    const/4 v5, 0x6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/blank/bm15/model/object/crud/Team;->setDivision(Ljava/lang/Integer;)V

    .line 117
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;

    .end local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v0, p0, v7, v5}, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 118
    .restart local v0    # "adapter":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/blank/bm15/model/util/Util;->getDivision(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;->addSection(Ljava/lang/String;Landroid/widget/Adapter;)V

    .line 120
    return-object v4
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/blank/bm15/activity/base/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 37
    const v0, 0x7f030002

    invoke-virtual {p0, v0}, Lcom/blank/bm15/activity/SelectTeamActivity;->setContentView(I)V

    .line 39
    invoke-direct {p0}, Lcom/blank/bm15/activity/SelectTeamActivity;->createPage()V

    .line 40
    return-void
.end method
