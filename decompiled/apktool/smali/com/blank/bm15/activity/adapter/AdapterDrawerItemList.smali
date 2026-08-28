.class public Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterDrawerItemList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/blank/bm15/model/object/other/DrawerItem;",
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
            "Lcom/blank/bm15/model/object/other/DrawerItem;",
            ">;"
        }
    .end annotation
.end field

.field navigation:Lcom/blank/bm15/model/object/crud/Navigation;


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
            "Lcom/blank/bm15/model/object/other/DrawerItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p3, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/DrawerItem;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 27
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->list:Ljava/util/List;

    .line 37
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->context:Landroid/content/Context;

    .line 38
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->layoutId:I

    .line 39
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->list:Ljava/util/List;

    .line 40
    invoke-static {p1}, Lcom/blank/bm15/activity/base/BaseActivity;->getNavigation(Landroid/content/Context;)Lcom/blank/bm15/model/object/crud/Navigation;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->navigation:Lcom/blank/bm15/model/object/crud/Navigation;

    .line 41
    return-void
.end method

.method private changeBackgroundColor(Landroid/view/View;ILcom/blank/bm15/model/object/other/DrawerItem;)V
    .locals 3
    .param p1, "row"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "obj"    # Lcom/blank/bm15/model/object/other/DrawerItem;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->context:Landroid/content/Context;

    check-cast v0, Lcom/blank/bm15/activity/HomeActivity;

    .line 93
    .local v0, "activity":Lcom/blank/bm15/activity/HomeActivity;
    const/16 v1, 0xb

    iget-object v2, p0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->navigation:Lcom/blank/bm15/model/object/crud/Navigation;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Navigation;->getIdFragment()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 94
    const/16 v1, 0xa

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/other/DrawerItem;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 95
    invoke-virtual {v0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/model/util/Util;->getTeamColor(Lcom/blank/bm15/model/object/crud/Team;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 99
    :cond_0
    :goto_0
    return-void

    .line 96
    :cond_1
    iget-object v1, p0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->navigation:Lcom/blank/bm15/model/object/crud/Navigation;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Navigation;->getIdFragment()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/other/DrawerItem;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 97
    invoke-virtual {v0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/model/util/Util;->getTeamColor(Lcom/blank/bm15/model/object/crud/Team;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/other/DrawerItem;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 45
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/other/DrawerItem;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->getItem(I)Lcom/blank/bm15/model/object/other/DrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v7, 0x0

    .line 50
    move-object v3, p2

    .line 51
    .local v3, "row":Landroid/view/View;
    const/4 v0, 0x0

    .line 53
    .local v0, "holder":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;
    if-nez v3, :cond_0

    .line 54
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->context:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 55
    .local v1, "inflater":Landroid/view/LayoutInflater;
    iget v4, p0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->layoutId:I

    invoke-virtual {v1, v4, p3, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 57
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;
    const/4 v4, 0x0

    invoke-direct {v0, v4}, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;-><init>(Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;)V

    .line 58
    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;
    const v4, 0x7f0b00ef

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;->imageViewIcon:Landroid/widget/ImageView;

    .line 59
    const v4, 0x7f0b00ee

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;->textViewId:Landroid/widget/TextView;

    .line 60
    const v4, 0x7f0b00f0

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;->textViewTitle:Landroid/widget/TextView;

    .line 61
    const v4, 0x7f0b00f1

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;->textViewText:Landroid/widget/TextView;

    .line 63
    invoke-virtual {v3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 68
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->list:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/other/DrawerItem;

    .line 69
    .local v2, "obj":Lcom/blank/bm15/model/object/other/DrawerItem;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/other/DrawerItem;->getIcon()Ljava/lang/Integer;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 70
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;->imageViewIcon:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/other/DrawerItem;->getIcon()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 71
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;->imageViewIcon:Landroid/widget/ImageView;

    invoke-virtual {v4, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 76
    :goto_1
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;->textViewId:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/other/DrawerItem;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;->textViewTitle:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/other/DrawerItem;->getTitle()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/other/DrawerItem;->getText()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 80
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;->textViewText:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/other/DrawerItem;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    :goto_2
    invoke-direct {p0, v3, p1, v2}, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList;->changeBackgroundColor(Landroid/view/View;ILcom/blank/bm15/model/object/other/DrawerItem;)V

    .line 87
    return-object v3

    .line 65
    .end local v2    # "obj":Lcom/blank/bm15/model/object/other/DrawerItem;
    :cond_0
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;
    check-cast v0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;

    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;
    goto :goto_0

    .line 73
    .restart local v2    # "obj":Lcom/blank/bm15/model/object/other/DrawerItem;
    :cond_1
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;->imageViewIcon:Landroid/widget/ImageView;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1

    .line 82
    :cond_2
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDrawerItemList$ItemHolder;->textViewText:Landroid/widget/TextView;

    const-string v5, ""

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2
.end method
