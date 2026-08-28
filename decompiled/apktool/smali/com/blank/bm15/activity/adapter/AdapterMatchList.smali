.class public Lcom/blank/bm15/activity/adapter/AdapterMatchList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterMatchList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/blank/bm15/model/object/crud/Match;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private layoutId:I

.field private matchList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Match;",
            ">;"
        }
    .end annotation
.end field


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
            "Lcom/blank/bm15/model/object/crud/Match;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p3, "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->matchList:Ljava/util/List;

    .line 32
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->context:Landroid/content/Context;

    .line 33
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->layoutId:I

    .line 34
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->matchList:Ljava/util/List;

    .line 35
    return-void
.end method

.method private changeBackgroundColor(Landroid/view/View;ILcom/blank/bm15/model/object/crud/Match;)V
    .locals 3
    .param p1, "row"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "match"    # Lcom/blank/bm15/model/object/crud/Match;

    .prologue
    const v2, 0x7f06002e

    .line 85
    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/activity/base/BaseActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/activity/base/BaseActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 86
    :cond_0
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/activity/base/BaseActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 87
    const v0, 0x7f060032

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 104
    :goto_0
    return-void

    .line 88
    :cond_1
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eqz v0, :cond_4

    .line 89
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-le v0, v1, :cond_2

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/activity/base/BaseActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 90
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    .line 91
    :cond_2
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ge v0, v1, :cond_3

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/activity/base/BaseActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 92
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 94
    :cond_3
    const v0, 0x7f060030

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 97
    :cond_4
    const v0, 0x7f06002c

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 99
    :cond_5
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_6

    .line 100
    const v0, 0x7f060017

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 102
    :cond_6
    const v0, 0x7f060018

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_0
.end method

.method private getActivity()Lcom/blank/bm15/activity/base/BaseActivity;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->context:Landroid/content/Context;

    check-cast v0, Lcom/blank/bm15/activity/base/BaseActivity;

    return-object v0
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/crud/Match;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 39
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->matchList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Match;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->getItem(I)Lcom/blank/bm15/model/object/crud/Match;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const v7, 0x7f060025

    .line 44
    move-object v3, p2

    .line 45
    .local v3, "row":Landroid/view/View;
    const/4 v0, 0x0

    .line 47
    .local v0, "holder":Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;
    if-nez v3, :cond_1

    .line 48
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->context:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 49
    .local v1, "inflater":Landroid/view/LayoutInflater;
    iget v4, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->layoutId:I

    const/4 v5, 0x0

    invoke-virtual {v1, v4, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 51
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;
    invoke-direct {v0}, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;-><init>()V

    .line 52
    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;
    const v4, 0x7f0b0108

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewTeamLocalName:Landroid/widget/TextView;

    .line 53
    const v4, 0x7f0b0104

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewTeamVisitorName:Landroid/widget/TextView;

    .line 54
    const v4, 0x7f0b0106

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewSeparator:Landroid/widget/TextView;

    .line 55
    const v4, 0x7f0b0107

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewTeamLocalResult:Landroid/widget/TextView;

    .line 56
    const v4, 0x7f0b0105

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewTeamVisitorResult:Landroid/widget/TextView;

    .line 58
    invoke-virtual {v3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 63
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->matchList:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Match;

    .line 64
    .local v2, "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getLocalExtension()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-gtz v4, :cond_0

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorExtension()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_2

    .line 65
    :cond_0
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewSeparator:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f060031

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 69
    :goto_1
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewTeamLocalName:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getFullName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewTeamVisitorName:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getFullName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewTeamLocalResult:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewTeamVisitorResult:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewTeamLocalName:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 75
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewTeamLocalResult:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewTeamVisitorName:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 77
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewTeamVisitorResult:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 79
    invoke-direct {p0, v3, p1, v2}, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->changeBackgroundColor(Landroid/view/View;ILcom/blank/bm15/model/object/crud/Match;)V

    .line 81
    return-object v3

    .line 60
    .end local v2    # "match":Lcom/blank/bm15/model/object/crud/Match;
    :cond_1
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;
    check-cast v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;

    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;
    goto/16 :goto_0

    .line 67
    .restart local v2    # "match":Lcom/blank/bm15/model/object/crud/Match;
    :cond_2
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;->textViewSeparator:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterMatchList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_1
.end method
