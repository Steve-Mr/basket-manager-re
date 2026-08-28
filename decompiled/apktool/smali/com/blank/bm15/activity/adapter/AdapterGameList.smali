.class public Lcom/blank/bm15/activity/adapter/AdapterGameList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterGameList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/blank/bm15/model/object/crud/Game;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private gameList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Game;",
            ">;"
        }
    .end annotation
.end field

.field private layoutId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/util/List;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "layoutId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Game;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p3, "gameList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Game;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterGameList;->gameList:Ljava/util/List;

    .line 31
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterGameList;->context:Landroid/content/Context;

    .line 32
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterGameList;->layoutId:I

    .line 33
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterGameList;->gameList:Ljava/util/List;

    .line 34
    return-void
.end method

.method private changeBackgroundColor(Landroid/view/View;I)V
    .locals 1
    .param p1, "row"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 83
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_0

    .line 84
    const v0, 0x7f060017

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 88
    :goto_0
    return-void

    .line 86
    :cond_0
    const v0, 0x7f060018

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/crud/Game;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 38
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterGameList;->gameList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Game;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterGameList;->getItem(I)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 43
    move-object v5, p2

    .line 44
    .local v5, "row":Landroid/view/View;
    const/4 v3, 0x0

    .line 46
    .local v3, "holder":Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;
    if-nez v5, :cond_0

    .line 47
    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterGameList;->context:Landroid/content/Context;

    check-cast v6, Landroid/app/Activity;

    invoke-virtual {v6}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    .line 48
    .local v4, "inflater":Landroid/view/LayoutInflater;
    iget v6, p0, Lcom/blank/bm15/activity/adapter/AdapterGameList;->layoutId:I

    const/4 v7, 0x0

    invoke-virtual {v4, v6, p3, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    .line 50
    new-instance v3, Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;

    .end local v3    # "holder":Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;
    invoke-direct {v3}, Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;-><init>()V

    .line 51
    .restart local v3    # "holder":Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;
    const v6, 0x7f0b00f8

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, v3, Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;->viewTeamColor:Landroid/view/View;

    .line 52
    const v6, 0x7f0b00f9

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v3, Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;->textViewName:Landroid/widget/TextView;

    .line 53
    const v6, 0x7f0b00fa

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v3, Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;->textViewTeam:Landroid/widget/TextView;

    .line 54
    const v6, 0x7f0b00fb

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v3, Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;->textViewCurrentSeason:Landroid/widget/TextView;

    .line 55
    const v6, 0x7f0b00fc

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v3, Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;->textViewCurrentMatchday:Landroid/widget/TextView;

    .line 57
    invoke-virtual {v5, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 62
    .end local v4    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterGameList;->gameList:Ljava/util/List;

    invoke-interface {v6, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Game;

    .line 64
    .local v2, "game":Lcom/blank/bm15/model/object/crud/Game;
    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterGameList;->context:Landroid/content/Context;

    check-cast v6, Landroid/app/Activity;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getConference()Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getConference(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "conference":Ljava/lang/String;
    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterGameList;->context:Landroid/content/Context;

    check-cast v6, Landroid/app/Activity;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getDivision()Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getDivision(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v1

    .line 68
    .local v1, "division":Ljava/lang/String;
    iget-object v6, v3, Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 70
    iget-object v6, v3, Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;->textViewTeam:Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Team;->getFullName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, " ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " / "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    :goto_1
    iget-object v6, v3, Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;->textViewCurrentSeason:Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/blank/bm15/activity/adapter/AdapterGameList;->context:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f05002e

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentSeason()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    iget-object v6, v3, Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;->textViewCurrentMatchday:Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/blank/bm15/activity/adapter/AdapterGameList;->context:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f05002f

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    invoke-direct {p0, v5, p1}, Lcom/blank/bm15/activity/adapter/AdapterGameList;->changeBackgroundColor(Landroid/view/View;I)V

    .line 79
    return-object v5

    .line 59
    .end local v0    # "conference":Ljava/lang/String;
    .end local v1    # "division":Ljava/lang/String;
    .end local v2    # "game":Lcom/blank/bm15/model/object/crud/Game;
    :cond_0
    invoke-virtual {v5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "holder":Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;
    check-cast v3, Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;

    .restart local v3    # "holder":Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;
    goto/16 :goto_0

    .line 72
    .restart local v0    # "conference":Ljava/lang/String;
    .restart local v1    # "division":Ljava/lang/String;
    .restart local v2    # "game":Lcom/blank/bm15/model/object/crud/Game;
    :cond_1
    iget-object v6, v3, Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;->textViewTeam:Landroid/widget/TextView;

    const-string v7, ""

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method
