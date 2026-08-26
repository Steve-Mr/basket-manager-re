.class public Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterMatchResultList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/blank/bm15/model/object/crud/MatchResult;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private layoutId:I

.field private matchResultList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/MatchResult;",
            ">;"
        }
    .end annotation
.end field

.field private showMatches:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/util/List;Ljava/lang/Boolean;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "layoutId"    # I
    .param p4, "showMatches"    # Ljava/lang/Boolean;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/MatchResult;",
            ">;",
            "Ljava/lang/Boolean;",
            ")V"
        }
    .end annotation

    .prologue
    .line 32
    .local p3, "matchResultList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/MatchResult;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->matchResultList:Ljava/util/List;

    .line 33
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->context:Landroid/content/Context;

    .line 34
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->layoutId:I

    .line 35
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->matchResultList:Ljava/util/List;

    .line 36
    iput-object p4, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->showMatches:Ljava/lang/Boolean;

    .line 37
    return-void
.end method

.method private changeBackgroundColor(Landroid/view/View;I)V
    .locals 1
    .param p1, "row"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 132
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_0

    .line 133
    const v0, 0x7f060017

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 137
    :goto_0
    return-void

    .line 135
    :cond_0
    const v0, 0x7f060018

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/crud/MatchResult;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 41
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->matchResultList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/MatchResult;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->getItem(I)Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v10, 0x1

    .line 46
    move-object v3, p2

    .line 47
    .local v3, "row":Landroid/view/View;
    const/4 v0, 0x0

    .line 49
    .local v0, "holder":Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;
    if-nez v3, :cond_1

    .line 50
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->context:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 51
    .local v1, "inflater":Landroid/view/LayoutInflater;
    iget v4, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->layoutId:I

    const/4 v5, 0x0

    invoke-virtual {v1, v4, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 53
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;
    invoke-direct {v0}, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;-><init>()V

    .line 54
    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;
    const v4, 0x7f0b0109

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPlayerName:Landroid/widget/TextView;

    .line 55
    const v4, 0x7f0b010a

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewMatches:Landroid/widget/TextView;

    .line 56
    const v4, 0x7f0b010b

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewMinutes:Landroid/widget/TextView;

    .line 57
    const v4, 0x7f0b010c

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPoints:Landroid/widget/TextView;

    .line 58
    const v4, 0x7f0b010d

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewRebounds:Landroid/widget/TextView;

    .line 59
    const v4, 0x7f0b010e

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPassOK:Landroid/widget/TextView;

    .line 60
    const v4, 0x7f0b010f

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewBlocks:Landroid/widget/TextView;

    .line 61
    const v4, 0x7f0b0110

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewSteals:Landroid/widget/TextView;

    .line 62
    const v4, 0x7f0b0111

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPer:Landroid/widget/TextView;

    .line 64
    invoke-virtual {v3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 70
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->matchResultList:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/MatchResult;

    .line 71
    .local v2, "matchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->showMatches:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_0

    .line 72
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewMatches:Landroid/widget/TextView;

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 74
    :cond_0
    if-lez p1, :cond_6

    .line 75
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getName()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2

    .line 76
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPlayerName:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f050175

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    const v4, 0x7f06002e

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 83
    :goto_1
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_5

    .line 84
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getName()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_3

    .line 85
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewMinutes:Landroid/widget/TextView;

    const-string v5, "-"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    :goto_2
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewMatches:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v10, :cond_4

    .line 91
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPoints:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewRebounds:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getReboundsInt()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPassOK:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOkInt()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewBlocks:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocksInt()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewSteals:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getStealsInt()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    :goto_3
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPer:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPer()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    const/4 v5, 0x2

    invoke-static {v6, v7, v5}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 128
    :goto_4
    return-object v3

    .line 66
    .end local v2    # "matchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    :cond_1
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;
    check-cast v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;

    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;
    goto/16 :goto_0

    .line 79
    .restart local v2    # "matchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    :cond_2
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPlayerName:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    invoke-direct {p0, v3, p1}, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->changeBackgroundColor(Landroid/view/View;I)V

    goto/16 :goto_1

    .line 87
    :cond_3
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewMinutes:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMinutesPlayed()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v6, v5

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v8, v5

    div-double/2addr v6, v8

    invoke-static {v6, v7, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 97
    :cond_4
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPoints:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v6, v5

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v8, v5

    div-double/2addr v6, v8

    invoke-static {v6, v7, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewRebounds:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getReboundsInt()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v6, v5

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v8, v5

    div-double/2addr v6, v8

    invoke-static {v6, v7, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPassOK:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOkInt()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v6, v5

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v8, v5

    div-double/2addr v6, v8

    invoke-static {v6, v7, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewBlocks:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocksInt()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v6, v5

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v8, v5

    div-double/2addr v6, v8

    invoke-static {v6, v7, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewSteals:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getStealsInt()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v6, v5

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v8, v5

    div-double/2addr v6, v8

    invoke-static {v6, v7, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 105
    :cond_5
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewMatches:Landroid/widget/TextView;

    const-string v5, "-"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewMinutes:Landroid/widget/TextView;

    const-string v5, "-"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPoints:Landroid/widget/TextView;

    const-string v5, "-"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewRebounds:Landroid/widget/TextView;

    const-string v5, "-"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPassOK:Landroid/widget/TextView;

    const-string v5, "-"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewBlocks:Landroid/widget/TextView;

    const-string v5, "-"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewSteals:Landroid/widget/TextView;

    const-string v5, "-"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPer:Landroid/widget/TextView;

    const-string v5, "-"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 115
    :cond_6
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPlayerName:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->context:Landroid/content/Context;

    const v6, 0x7f050028

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewMatches:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->context:Landroid/content/Context;

    const v6, 0x7f05016b

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewMinutes:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->context:Landroid/content/Context;

    const v6, 0x7f05016c

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPoints:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->context:Landroid/content/Context;

    const v6, 0x7f05016d

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewRebounds:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->context:Landroid/content/Context;

    const v6, 0x7f050171

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPassOK:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->context:Landroid/content/Context;

    const v6, 0x7f050172

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewBlocks:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->context:Landroid/content/Context;

    const v6, 0x7f05016f

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewSteals:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->context:Landroid/content/Context;

    const v6, 0x7f050170

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList$MatchResultHolder;->textViewPer:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterMatchResultList;->context:Landroid/content/Context;

    const v6, 0x7f050174

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    const v4, 0x7f06002c

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_4
.end method
