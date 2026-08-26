.class public Lcom/blank/bm15/activity/adapter/AdapterCalendarList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterCalendarList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;
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
    .line 33
    .local p3, "matchList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->matchList:Ljava/util/List;

    .line 34
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->context:Landroid/content/Context;

    .line 35
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->layoutId:I

    .line 36
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->matchList:Ljava/util/List;

    .line 37
    return-void
.end method

.method private getActivity()Lcom/blank/bm15/activity/base/BaseActivity;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->context:Landroid/content/Context;

    check-cast v0, Lcom/blank/bm15/activity/base/BaseActivity;

    return-object v0
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/crud/Match;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 41
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->matchList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Match;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->getItem(I)Lcom/blank/bm15/model/object/crud/Match;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const v10, 0x7f06002e

    const v9, 0x7f060034

    const/4 v8, 0x4

    const/4 v7, 0x0

    .line 46
    move-object v3, p2

    .line 47
    .local v3, "row":Landroid/view/View;
    const/4 v0, 0x0

    .line 49
    .local v0, "holder":Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;
    if-nez v3, :cond_4

    .line 50
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->context:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 51
    .local v1, "inflater":Landroid/view/LayoutInflater;
    iget v4, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->layoutId:I

    invoke-virtual {v1, v4, p3, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 53
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;
    invoke-direct {v0}, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;-><init>()V

    .line 54
    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;
    const v4, 0x7f0b00dc

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->imageView:Landroid/widget/ImageView;

    .line 55
    const v4, 0x7f0b00dd

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    .line 56
    const v4, 0x7f0b00de

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewMatchday:Landroid/widget/TextView;

    .line 58
    invoke-virtual {v3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 63
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    rem-int/lit8 v4, p1, 0x2

    if-nez v4, :cond_5

    .line 64
    const v4, 0x7f060017

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 69
    :goto_1
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->matchList:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Match;

    .line 70
    .local v2, "match":Lcom/blank/bm15/model/object/crud/Match;
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v4, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 71
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 72
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewMatchday:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewMatchday:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 75
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0x58

    if-ne v4, v5, :cond_6

    .line 76
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 77
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->context:Landroid/content/Context;

    const v6, 0x7f05014b

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewMatchday:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 79
    invoke-virtual {v3, v9}, Landroid/view/View;->setBackgroundResource(I)V

    .line 107
    :cond_0
    :goto_2
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_1

    .line 108
    const v4, 0x7f060032

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 111
    :cond_1
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    if-eqz v4, :cond_3

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 112
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_b

    .line 113
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v4, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 114
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->imageView:Landroid/widget/ImageView;

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020002

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 115
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 116
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getShortFullName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    :cond_2
    :goto_3
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_e

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_e

    .line 124
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-le v4, v5, :cond_c

    .line 125
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_c

    .line 126
    invoke-virtual {v3, v10}, Landroid/view/View;->setBackgroundResource(I)V

    .line 138
    :cond_3
    :goto_4
    return-object v3

    .line 60
    .end local v2    # "match":Lcom/blank/bm15/model/object/crud/Match;
    :cond_4
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;
    check-cast v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;

    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;
    goto/16 :goto_0

    .line 66
    :cond_5
    const v4, 0x7f060018

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_1

    .line 80
    .restart local v2    # "match":Lcom/blank/bm15/model/object/crud/Match;
    :cond_6
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0xa7

    if-ne v4, v5, :cond_7

    .line 81
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 82
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->context:Landroid/content/Context;

    const v6, 0x7f050156

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewMatchday:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 84
    invoke-virtual {v3, v9}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_2

    .line 85
    :cond_7
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0xb6

    if-ne v4, v5, :cond_8

    .line 86
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 87
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->context:Landroid/content/Context;

    const v6, 0x7f050155

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewMatchday:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 89
    invoke-virtual {v3, v9}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_2

    .line 90
    :cond_8
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0xc5

    if-ne v4, v5, :cond_9

    .line 91
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 92
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->context:Landroid/content/Context;

    const v6, 0x7f050154

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewMatchday:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 94
    invoke-virtual {v3, v9}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_2

    .line 95
    :cond_9
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0xd4

    if-ne v4, v5, :cond_a

    .line 96
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 97
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->context:Landroid/content/Context;

    const v6, 0x7f050153

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewMatchday:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 99
    invoke-virtual {v3, v9}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_2

    .line 100
    :cond_a
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0xe2

    if-ne v4, v5, :cond_0

    .line 101
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 102
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->context:Landroid/content/Context;

    const v6, 0x7f05014c

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewMatchday:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 104
    invoke-virtual {v3, v9}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_2

    .line 117
    :cond_b
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_2

    .line 118
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v4, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 119
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->imageView:Landroid/widget/ImageView;

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020001

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 120
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 121
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterCalendarList$MatchHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getShortFullName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 127
    :cond_c
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ge v4, v5, :cond_d

    .line 128
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_d

    .line 129
    invoke-virtual {v3, v10}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_4

    .line 131
    :cond_d
    const v4, 0x7f060030

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_4

    .line 133
    :cond_e
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterCalendarList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eq v4, v5, :cond_3

    .line 134
    const v4, 0x7f06002c

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_4
.end method
