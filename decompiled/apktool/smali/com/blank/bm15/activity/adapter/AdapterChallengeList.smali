.class public Lcom/blank/bm15/activity/adapter/AdapterChallengeList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterChallengeList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/blank/bm15/model/object/crud/Challenge;",
        ">;"
    }
.end annotation


# instance fields
.field private challengeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Challenge;",
            ">;"
        }
    .end annotation
.end field

.field private context:Landroid/content/Context;

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
            "Lcom/blank/bm15/model/object/crud/Challenge;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p3, "challengeList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Challenge;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;->challengeList:Ljava/util/List;

    .line 31
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;->context:Landroid/content/Context;

    .line 32
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;->layoutId:I

    .line 33
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;->challengeList:Ljava/util/List;

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
.method public getItem(I)Lcom/blank/bm15/model/object/crud/Challenge;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 38
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;->challengeList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Challenge;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;->getItem(I)Lcom/blank/bm15/model/object/crud/Challenge;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const v7, 0x7f060028

    const v9, 0x7f060025

    const/4 v8, 0x0

    .line 43
    move-object v3, p2

    .line 44
    .local v3, "row":Landroid/view/View;
    const/4 v0, 0x0

    .line 46
    .local v0, "holder":Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;
    if-nez v3, :cond_0

    .line 47
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;->context:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 48
    .local v1, "inflater":Landroid/view/LayoutInflater;
    iget v4, p0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;->layoutId:I

    invoke-virtual {v1, v4, p3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 50
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;
    invoke-direct {v0}, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;-><init>()V

    .line 51
    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;
    const v4, 0x7f0b00ef

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;->imageViewIcon:Landroid/widget/ImageView;

    .line 52
    const v4, 0x7f0b00f0

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;->textViewTitle:Landroid/widget/TextView;

    .line 53
    const v4, 0x7f0b00f1

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;->textViewText:Landroid/widget/TextView;

    .line 55
    invoke-virtual {v3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 60
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;->challengeList:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Challenge;

    .line 62
    .local v2, "obj":Lcom/blank/bm15/model/object/crud/Challenge;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Challenge;->getAcquired()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 63
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;->imageViewIcon:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f02004b

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 64
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;->textViewText:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;->context:Landroid/content/Context;

    const v6, 0x7f050157

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Challenge;->getSeason()Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;->textViewTitle:Landroid/widget/TextView;

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 67
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;->textViewText:Landroid/widget/TextView;

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 75
    :goto_1
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;->textViewTitle:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Challenge;->getTeamName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    invoke-direct {p0, v3, p1}, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;->changeBackgroundColor(Landroid/view/View;I)V

    .line 79
    return-object v3

    .line 57
    .end local v2    # "obj":Lcom/blank/bm15/model/object/crud/Challenge;
    :cond_0
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;
    check-cast v0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;

    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;
    goto :goto_0

    .line 69
    .restart local v2    # "obj":Lcom/blank/bm15/model/object/crud/Challenge;
    :cond_1
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;->imageViewIcon:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020046

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 70
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;->textViewText:Landroid/widget/TextView;

    const-string v5, ""

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;->textViewTitle:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 73
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterChallengeList$ChallengeHolder;->textViewText:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1
.end method
