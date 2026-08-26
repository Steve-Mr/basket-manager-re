.class public Lcom/blank/bm15/activity/adapter/AdapterNewsList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterNewsList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/blank/bm15/model/object/crud/News;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private layoutId:I

.field private newsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/News;",
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
            "Lcom/blank/bm15/model/object/crud/News;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p3, "newsList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/News;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->newsList:Ljava/util/List;

    .line 32
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->context:Landroid/content/Context;

    .line 33
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->layoutId:I

    .line 34
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->newsList:Ljava/util/List;

    .line 35
    return-void
.end method

.method private changeBackgroundColor(Landroid/view/View;I)V
    .locals 1
    .param p1, "row"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 87
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_0

    .line 88
    const v0, 0x7f060017

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 92
    :goto_0
    return-void

    .line 90
    :cond_0
    const v0, 0x7f060018

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/crud/News;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 39
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->newsList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/News;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->getItem(I)Lcom/blank/bm15/model/object/crud/News;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const v10, 0x7f060026

    const v9, 0x7f060025

    .line 44
    move-object v4, p2

    .line 45
    .local v4, "row":Landroid/view/View;
    const/4 v1, 0x0

    .line 47
    .local v1, "holder":Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;
    if-nez v4, :cond_0

    .line 48
    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->context:Landroid/content/Context;

    check-cast v5, Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    .line 49
    .local v2, "inflater":Landroid/view/LayoutInflater;
    iget v5, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->layoutId:I

    const/4 v6, 0x0

    invoke-virtual {v2, v5, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 51
    new-instance v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;

    .end local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;
    invoke-direct {v1}, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;-><init>()V

    .line 52
    .restart local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;
    const v5, 0x7f0b0113

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->textViewTitle:Landroid/widget/TextView;

    .line 53
    const v5, 0x7f0b0114

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->textViewBody:Landroid/widget/TextView;

    .line 54
    const v5, 0x7f0b0115

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->textViewMatchDay:Landroid/widget/TextView;

    .line 55
    const v5, 0x7f0b0112

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->image:Landroid/widget/ImageView;

    .line 57
    invoke-virtual {v4, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 62
    .end local v2    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->newsList:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/crud/News;

    .line 63
    .local v3, "news":Lcom/blank/bm15/model/object/crud/News;
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->textViewTitle:Landroid/widget/TextView;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/News;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->textViewBody:Landroid/widget/TextView;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/News;->getBody()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->textViewMatchDay:Landroid/widget/TextView;

    new-instance v6, Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->context:Landroid/content/Context;

    const v8, 0x7f05002f

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/News;->getMatchday()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->image:Landroid/widget/ImageView;

    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/News;->getType()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->context:Landroid/content/Context;

    check-cast v0, Lcom/blank/bm15/activity/HomeActivity;

    .line 69
    .local v0, "activity":Lcom/blank/bm15/activity/HomeActivity;
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/News;->getMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ne v5, v6, :cond_1

    .line 70
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->textViewTitle:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 71
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->textViewBody:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 72
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->textViewMatchDay:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 73
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->image:Landroid/widget/ImageView;

    const/16 v6, 0xff

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageAlpha(I)V

    .line 81
    :goto_1
    invoke-direct {p0, v4, p1}, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->changeBackgroundColor(Landroid/view/View;I)V

    .line 83
    return-object v4

    .line 59
    .end local v0    # "activity":Lcom/blank/bm15/activity/HomeActivity;
    .end local v3    # "news":Lcom/blank/bm15/model/object/crud/News;
    :cond_0
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;
    check-cast v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;

    .restart local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;
    goto/16 :goto_0

    .line 75
    .restart local v0    # "activity":Lcom/blank/bm15/activity/HomeActivity;
    .restart local v3    # "news":Lcom/blank/bm15/model/object/crud/News;
    :cond_1
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->textViewTitle:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->textViewBody:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 77
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->textViewMatchDay:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterNewsList;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 78
    iget-object v5, v1, Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;->image:Landroid/widget/ImageView;

    const/16 v6, 0xa0

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageAlpha(I)V

    goto :goto_1
.end method
