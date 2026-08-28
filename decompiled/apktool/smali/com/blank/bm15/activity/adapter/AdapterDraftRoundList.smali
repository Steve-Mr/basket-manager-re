.class public Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterDraftRoundList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList$ItemHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/blank/bm15/model/object/crud/DraftRound;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private layoutId:I

.field private list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/DraftRound;",
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
            "Lcom/blank/bm15/model/object/crud/DraftRound;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p3, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;->list:Ljava/util/List;

    .line 30
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;->context:Landroid/content/Context;

    .line 31
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;->layoutId:I

    .line 32
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;->list:Ljava/util/List;

    .line 33
    return-void
.end method

.method private changeBackgroundColor(Landroid/view/View;I)V
    .locals 1
    .param p1, "row"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 66
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_0

    .line 67
    const v0, 0x7f060017

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 71
    :goto_0
    return-void

    .line 69
    :cond_0
    const v0, 0x7f060018

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/crud/DraftRound;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 37
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;->getItem(I)Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v8, 0x0

    .line 42
    move-object v3, p2

    .line 43
    .local v3, "row":Landroid/view/View;
    const/4 v0, 0x0

    .line 45
    .local v0, "holder":Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList$ItemHolder;
    if-nez v3, :cond_0

    .line 46
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;->context:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 47
    .local v1, "inflater":Landroid/view/LayoutInflater;
    iget v4, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;->layoutId:I

    invoke-virtual {v1, v4, p3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 49
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList$ItemHolder;

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList$ItemHolder;
    const/4 v4, 0x0

    invoke-direct {v0, v4}, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList$ItemHolder;-><init>(Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList$ItemHolder;)V

    .line 50
    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList$ItemHolder;
    const v4, 0x7f0b0133

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList$ItemHolder;->textViewValue:Landroid/widget/TextView;

    .line 52
    invoke-virtual {v3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 57
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;->list:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 58
    .local v2, "obj":Lcom/blank/bm15/model/object/crud/DraftRound;
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList$ItemHolder;->textViewValue:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;->context:Landroid/content/Context;

    const v6, 0x7f050184

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamOwner()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    invoke-direct {p0, v3, p1}, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList;->changeBackgroundColor(Landroid/view/View;I)V

    .line 62
    return-object v3

    .line 54
    .end local v2    # "obj":Lcom/blank/bm15/model/object/crud/DraftRound;
    :cond_0
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList$ItemHolder;
    check-cast v0, Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList$ItemHolder;

    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterDraftRoundList$ItemHolder;
    goto :goto_0
.end method
