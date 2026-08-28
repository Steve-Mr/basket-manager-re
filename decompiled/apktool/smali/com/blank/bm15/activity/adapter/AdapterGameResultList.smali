.class public Lcom/blank/bm15/activity/adapter/AdapterGameResultList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterGameResultList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;
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

.field private gameResultList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Match;",
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
            "Lcom/blank/bm15/model/object/crud/Match;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p3, "gameResultList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->gameResultList:Ljava/util/List;

    .line 31
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->context:Landroid/content/Context;

    .line 32
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->layoutId:I

    .line 33
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->gameResultList:Ljava/util/List;

    .line 34
    return-void
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/crud/Match;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 38
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->gameResultList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Match;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->getItem(I)Lcom/blank/bm15/model/object/crud/Match;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v5, 0x0

    .line 43
    move-object v3, p2

    .line 44
    .local v3, "row":Landroid/view/View;
    const/4 v0, 0x0

    .line 46
    .local v0, "holder":Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;
    if-nez v3, :cond_1

    .line 47
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->context:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 48
    .local v1, "inflater":Landroid/view/LayoutInflater;
    iget v4, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->layoutId:I

    invoke-virtual {v1, v4, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 50
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;
    invoke-direct {v0}, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;-><init>()V

    .line 51
    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;
    const v4, 0x7f0b00fd

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewTeamName:Landroid/widget/TextView;

    .line 52
    const v4, 0x7f0b00fe

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterOne:Landroid/widget/TextView;

    .line 53
    const v4, 0x7f0b00ff

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterTwo:Landroid/widget/TextView;

    .line 54
    const v4, 0x7f0b0100

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterThree:Landroid/widget/TextView;

    .line 55
    const v4, 0x7f0b0101

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterFour:Landroid/widget/TextView;

    .line 56
    const v4, 0x7f0b0102

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterExtension:Landroid/widget/TextView;

    .line 57
    const v4, 0x7f0b0103

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterTotal:Landroid/widget/TextView;

    .line 59
    invoke-virtual {v3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 64
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->gameResultList:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Match;

    .line 65
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

    .line 66
    :cond_0
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterExtension:Landroid/widget/TextView;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 71
    :goto_1
    if-nez p1, :cond_3

    .line 72
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewTeamName:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->context:Landroid/content/Context;

    const v6, 0x7f050028

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterOne:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->context:Landroid/content/Context;

    const v6, 0x7f050145

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterTwo:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->context:Landroid/content/Context;

    const v6, 0x7f050146

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterThree:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->context:Landroid/content/Context;

    const v6, 0x7f050147

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterFour:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->context:Landroid/content/Context;

    const v6, 0x7f050148

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterExtension:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->context:Landroid/content/Context;

    const v6, 0x7f050149

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterTotal:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList;->context:Landroid/content/Context;

    const v6, 0x7f05014a

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    const v4, 0x7f06002c

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 103
    :goto_2
    return-object v3

    .line 61
    .end local v2    # "match":Lcom/blank/bm15/model/object/crud/Match;
    :cond_1
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;
    check-cast v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;

    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;
    goto/16 :goto_0

    .line 68
    .restart local v2    # "match":Lcom/blank/bm15/model/object/crud/Match;
    :cond_2
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterExtension:Landroid/widget/TextView;

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 81
    :cond_3
    rem-int/lit8 v4, p1, 0x2

    if-eqz v4, :cond_4

    .line 82
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewTeamName:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterOne:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getLocalQuarterFirst()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterTwo:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getLocalQuarterSecond()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterThree:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getLocalQuarterThird()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterFour:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getLocalQuarterFourth()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterExtension:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getLocalExtension()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterTotal:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultLocal()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    const v4, 0x7f060017

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_2

    .line 92
    :cond_4
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewTeamName:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterOne:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorQuarterFirst()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterTwo:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorQuarterSecond()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterThree:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorQuarterThird()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterFour:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorQuarterFourth()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterExtension:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getVisitorExtension()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterGameResultList$MatchHolder;->textViewQuarterTotal:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Match;->getFinalResultVisitor()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    const v4, 0x7f060018

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_2
.end method
