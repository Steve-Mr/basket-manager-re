.class public Lcom/blank/bm15/activity/adapter/AdapterOfferList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterOfferList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/blank/bm15/model/object/crud/Offer;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private layoutId:I

.field private offerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Offer;",
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
            "Lcom/blank/bm15/model/object/crud/Offer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p3, "offerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->offerList:Ljava/util/List;

    .line 34
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->context:Landroid/content/Context;

    .line 35
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->layoutId:I

    .line 36
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->offerList:Ljava/util/List;

    .line 37
    return-void
.end method

.method private changeBackgroundColor(Landroid/view/View;I)V
    .locals 1
    .param p1, "row"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 86
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_0

    .line 87
    const v0, 0x7f060017

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 91
    :goto_0
    return-void

    .line 89
    :cond_0
    const v0, 0x7f060018

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method

.method private getActivity()Lcom/blank/bm15/activity/base/BaseActivity;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->context:Landroid/content/Context;

    check-cast v0, Lcom/blank/bm15/activity/base/BaseActivity;

    return-object v0
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/crud/Offer;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 41
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->offerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Offer;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->getItem(I)Lcom/blank/bm15/model/object/crud/Offer;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const v10, 0x7f060031

    const v9, 0x7f060025

    .line 46
    move-object v3, p2

    .line 47
    .local v3, "row":Landroid/view/View;
    const/4 v0, 0x0

    .line 49
    .local v0, "holder":Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;
    if-nez v3, :cond_0

    .line 50
    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->context:Landroid/content/Context;

    check-cast v5, Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 51
    .local v1, "inflater":Landroid/view/LayoutInflater;
    iget v5, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->layoutId:I

    const/4 v6, 0x0

    invoke-virtual {v1, v5, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 53
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;
    invoke-direct {v0}, Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;-><init>()V

    .line 54
    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;
    const v5, 0x7f0b0116

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v0, Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;->textViewSalary:Landroid/widget/TextView;

    .line 55
    const v5, 0x7f0b0117

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v0, Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;->textViewYearsContract:Landroid/widget/TextView;

    .line 57
    invoke-virtual {v3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 62
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->offerList:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Offer;

    .line 64
    .local v2, "offer":Lcom/blank/bm15/model/object/crud/Offer;
    iget-object v5, v0, Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;->textViewSalary:Landroid/widget/TextView;

    new-instance v6, Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->context:Landroid/content/Context;

    const v8, 0x7f05014f

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Offer;->getSalary()Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v7}, Lcom/blank/bm15/model/util/Util;->formatSalary(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    iget-object v5, v0, Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;->textViewYearsContract:Landroid/widget/TextView;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Offer;->getYears()Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v7}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->context:Landroid/content/Context;

    const v8, 0x7f050150

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/base/BaseActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Offer;->getPlayer()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/blank/bm15/model/object/crud/Team;->getTeamSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 68
    .local v4, "teamSalary":I
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Offer;->getSalary()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v5, v4

    invoke-direct {p0}, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->getActivity()Lcom/blank/bm15/activity/base/BaseActivity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/activity/base/BaseActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-le v5, v6, :cond_1

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Offer;->getSalary()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const v6, 0xf4240

    if-le v5, v6, :cond_1

    .line 69
    iget-object v5, v0, Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;->textViewSalary:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 70
    iget-object v5, v0, Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;->textViewYearsContract:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    :goto_1
    invoke-direct {p0, v3, p1}, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->changeBackgroundColor(Landroid/view/View;I)V

    .line 78
    return-object v3

    .line 59
    .end local v2    # "offer":Lcom/blank/bm15/model/object/crud/Offer;
    .end local v4    # "teamSalary":I
    :cond_0
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;
    check-cast v0, Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;

    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;
    goto/16 :goto_0

    .line 72
    .restart local v2    # "offer":Lcom/blank/bm15/model/object/crud/Offer;
    .restart local v4    # "teamSalary":I
    :cond_1
    iget-object v5, v0, Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;->textViewSalary:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 73
    iget-object v5, v0, Lcom/blank/bm15/activity/adapter/AdapterOfferList$OfferHolder;->textViewYearsContract:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterOfferList;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1
.end method
