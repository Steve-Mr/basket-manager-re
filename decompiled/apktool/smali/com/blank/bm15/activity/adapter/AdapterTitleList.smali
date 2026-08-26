.class public Lcom/blank/bm15/activity/adapter/AdapterTitleList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterTitleList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterTitleList$TitleHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private isDark:Z

.field private layoutId:I

.field private titleList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "isDark"    # Ljava/lang/Boolean;

    .prologue
    const v1, 0x7f030014

    .line 30
    invoke-direct {p0, p1, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->titleList:Ljava/util/List;

    .line 31
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->context:Landroid/content/Context;

    .line 32
    iput v1, p0, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->layoutId:I

    .line 33
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->isDark:Z

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->titleList:Ljava/util/List;

    .line 35
    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->add(Ljava/lang/String;)V

    return-void
.end method

.method public add(Ljava/lang/String;)V
    .locals 1
    .param p1, "object"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-super {p0, p1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 45
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->titleList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->getItem(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItem(I)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 39
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->titleList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const v6, 0x7f06002c

    .line 50
    move-object v2, p2

    .line 51
    .local v2, "row":Landroid/view/View;
    const/4 v0, 0x0

    .line 53
    .local v0, "holder":Lcom/blank/bm15/activity/adapter/AdapterTitleList$TitleHolder;
    if-nez v2, :cond_1

    .line 54
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->context:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 55
    .local v1, "inflater":Landroid/view/LayoutInflater;
    iget v4, p0, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->layoutId:I

    const/4 v5, 0x0

    invoke-virtual {v1, v4, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 57
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterTitleList$TitleHolder;

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterTitleList$TitleHolder;
    invoke-direct {v0}, Lcom/blank/bm15/activity/adapter/AdapterTitleList$TitleHolder;-><init>()V

    .line 58
    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterTitleList$TitleHolder;
    const v4, 0x7f0b00da

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterTitleList$TitleHolder;->textViewTitle:Landroid/widget/TextView;

    .line 59
    const v4, 0x7f0b00db

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterTitleList$TitleHolder;->viewLine:Landroid/view/View;

    .line 61
    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 66
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->titleList:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 67
    .local v3, "title":Ljava/lang/String;
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterTitleList$TitleHolder;->textViewTitle:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    iget-boolean v4, p0, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->isDark:Z

    if-eqz v4, :cond_0

    .line 70
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterTitleList$TitleHolder;->textViewTitle:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 71
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterTitleList$TitleHolder;->viewLine:Landroid/view/View;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterTitleList;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 74
    :cond_0
    return-object v2

    .line 63
    .end local v3    # "title":Ljava/lang/String;
    :cond_1
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterTitleList$TitleHolder;
    check-cast v0, Lcom/blank/bm15/activity/adapter/AdapterTitleList$TitleHolder;

    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterTitleList$TitleHolder;
    goto :goto_0
.end method
