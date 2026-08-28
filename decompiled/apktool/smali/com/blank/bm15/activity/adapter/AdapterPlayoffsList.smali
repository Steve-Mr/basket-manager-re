.class public Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterPlayoffsList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/blank/bm15/model/object/other/MatchPlayoffs;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private layoutId:I

.field private matchPlayoffsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/MatchPlayoffs;",
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
            "Lcom/blank/bm15/model/object/other/MatchPlayoffs;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p3, "playoffsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/MatchPlayoffs;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 25
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;->matchPlayoffsList:Ljava/util/List;

    .line 35
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;->context:Landroid/content/Context;

    .line 36
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;->layoutId:I

    .line 37
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;->matchPlayoffsList:Ljava/util/List;

    .line 38
    return-void
.end method

.method private changeBackgroundColor(Landroid/view/View;I)V
    .locals 1
    .param p1, "row"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 99
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_0

    .line 100
    const v0, 0x7f060017

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 104
    :goto_0
    return-void

    .line 102
    :cond_0
    const v0, 0x7f060018

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/other/MatchPlayoffs;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 42
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;->matchPlayoffsList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;->getItem(I)Lcom/blank/bm15/model/object/other/MatchPlayoffs;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 47
    move-object v4, p2

    .line 48
    .local v4, "row":Landroid/view/View;
    const/4 v1, 0x0

    .line 50
    .local v1, "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;
    if-nez v4, :cond_1

    .line 51
    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;->context:Landroid/content/Context;

    check-cast v5, Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    .line 52
    .local v2, "inflater":Landroid/view/LayoutInflater;
    iget v5, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;->layoutId:I

    const/4 v6, 0x0

    invoke-virtual {v2, v5, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 54
    new-instance v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;

    .end local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;
    invoke-direct {v1}, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;-><init>()V

    .line 55
    .restart local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;
    const v5, 0x7f0b012c

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewConference:Landroid/widget/TextView;

    .line 56
    const v5, 0x7f0b012d

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewTeam1Name:Landroid/widget/TextView;

    .line 57
    const v5, 0x7f0b0131

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewTeam2Name:Landroid/widget/TextView;

    .line 58
    const v5, 0x7f0b012e

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewTeam1Result:Landroid/widget/TextView;

    .line 59
    const v5, 0x7f0b0130

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewTeam2Result:Landroid/widget/TextView;

    .line 61
    invoke-virtual {v4, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 66
    .end local v2    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;->matchPlayoffsList:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/other/MatchPlayoffs;

    .line 67
    .local v3, "matchPlayoffs":Lcom/blank/bm15/model/object/other/MatchPlayoffs;
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getConference()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 68
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewConference:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;->context:Landroid/content/Context;

    check-cast v5, Landroid/app/Activity;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getConference()Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/blank/bm15/model/util/Util;->getConference(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    :goto_1
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getTeamLocalPositionConference()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 73
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewTeam1Name:Landroid/widget/TextView;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "("

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getTeamLocalPositionConference()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewTeam1Result:Landroid/widget/TextView;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getResultLocal()Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    :goto_2
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getTeamVisitorPositionConference()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 80
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewTeam2Name:Landroid/widget/TextView;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, " ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getTeamVisitorPositionConference()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewTeam2Result:Landroid/widget/TextView;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getResultVisitor()Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    :goto_3
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;->context:Landroid/content/Context;

    check-cast v0, Lcom/blank/bm15/activity/HomeActivity;

    .line 88
    .local v0, "activity":Lcom/blank/bm15/activity/HomeActivity;
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-eq v5, v6, :cond_0

    .line 89
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v5, v6, :cond_5

    .line 90
    :cond_0
    const v5, 0x7f06002c

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundResource(I)V

    .line 95
    :goto_4
    return-object v4

    .line 63
    .end local v0    # "activity":Lcom/blank/bm15/activity/HomeActivity;
    .end local v3    # "matchPlayoffs":Lcom/blank/bm15/model/object/other/MatchPlayoffs;
    :cond_1
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;
    check-cast v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;

    .restart local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;
    goto/16 :goto_0

    .line 70
    .restart local v3    # "matchPlayoffs":Lcom/blank/bm15/model/object/other/MatchPlayoffs;
    :cond_2
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewConference:Landroid/widget/TextView;

    const-string v6, ""

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 76
    :cond_3
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewTeam1Name:Landroid/widget/TextView;

    const-string v6, ""

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewTeam1Result:Landroid/widget/TextView;

    const-string v6, ""

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 83
    :cond_4
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewTeam2Name:Landroid/widget/TextView;

    const-string v6, ""

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList$PlayoffsHolder;->textViewTeam2Result:Landroid/widget/TextView;

    const-string v6, ""

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3

    .line 92
    .restart local v0    # "activity":Lcom/blank/bm15/activity/HomeActivity;
    :cond_5
    invoke-direct {p0, v4, p1}, Lcom/blank/bm15/activity/adapter/AdapterPlayoffsList;->changeBackgroundColor(Landroid/view/View;I)V

    goto :goto_4
.end method
