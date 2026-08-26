.class public Lcom/blank/bm15/activity/adapter/AdapterDraftList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterDraftList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/blank/bm15/model/object/crud/Player;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private draftPlayerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Player;",
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
            "Lcom/blank/bm15/model/object/crud/Player;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p3, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftList;->draftPlayerList:Ljava/util/List;

    .line 32
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftList;->context:Landroid/content/Context;

    .line 33
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftList;->layoutId:I

    .line 34
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftList;->draftPlayerList:Ljava/util/List;

    .line 35
    return-void
.end method

.method private changeBackgroundColor(Landroid/view/View;I)V
    .locals 1
    .param p1, "row"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 79
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_0

    .line 80
    const v0, 0x7f060017

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 84
    :goto_0
    return-void

    .line 82
    :cond_0
    const v0, 0x7f060018

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method

.method private roundAverage(D)Ljava/lang/String;
    .locals 3
    .param p1, "average"    # D

    .prologue
    .line 97
    const-wide v0, 0x4055e00000000000L    # 87.5

    cmpl-double v0, p1, v0

    if-lez v0, :cond_0

    .line 98
    const-string v0, "90"

    .line 118
    :goto_0
    return-object v0

    .line 99
    :cond_0
    const-wide v0, 0x4054a00000000000L    # 82.5

    cmpl-double v0, p1, v0

    if-lez v0, :cond_1

    .line 100
    const-string v0, "85"

    goto :goto_0

    .line 101
    :cond_1
    const-wide v0, 0x4053600000000000L    # 77.5

    cmpl-double v0, p1, v0

    if-lez v0, :cond_2

    .line 102
    const-string v0, "80"

    goto :goto_0

    .line 103
    :cond_2
    const-wide v0, 0x4052200000000000L    # 72.5

    cmpl-double v0, p1, v0

    if-lez v0, :cond_3

    .line 104
    const-string v0, "75"

    goto :goto_0

    .line 105
    :cond_3
    const-wide v0, 0x4050e00000000000L    # 67.5

    cmpl-double v0, p1, v0

    if-lez v0, :cond_4

    .line 106
    const-string v0, "70"

    goto :goto_0

    .line 107
    :cond_4
    const-wide v0, 0x404f400000000000L    # 62.5

    cmpl-double v0, p1, v0

    if-lez v0, :cond_5

    .line 108
    const-string v0, "65"

    goto :goto_0

    .line 109
    :cond_5
    const-wide v0, 0x404cc00000000000L    # 57.5

    cmpl-double v0, p1, v0

    if-lez v0, :cond_6

    .line 110
    const-string v0, "60"

    goto :goto_0

    .line 111
    :cond_6
    const-wide v0, 0x404a400000000000L    # 52.5

    cmpl-double v0, p1, v0

    if-lez v0, :cond_7

    .line 112
    const-string v0, "55"

    goto :goto_0

    .line 113
    :cond_7
    const-wide v0, 0x4047c00000000000L    # 47.5

    cmpl-double v0, p1, v0

    if-lez v0, :cond_8

    .line 114
    const-string v0, "50"

    goto :goto_0

    .line 115
    :cond_8
    const-wide v0, 0x4045400000000000L    # 42.5

    cmpl-double v0, p1, v0

    if-lez v0, :cond_9

    .line 116
    const-string v0, "45"

    goto :goto_0

    .line 118
    :cond_9
    const-string v0, "40"

    goto :goto_0
.end method

.method private roundPotential(I)Ljava/lang/String;
    .locals 1
    .param p1, "potential"    # I

    .prologue
    .line 87
    const/4 v0, 0x7

    if-le p1, v0, :cond_0

    .line 88
    const-string v0, "A"

    .line 92
    :goto_0
    return-object v0

    .line 89
    :cond_0
    const/4 v0, 0x4

    if-le p1, v0, :cond_1

    .line 90
    const-string v0, "B"

    goto :goto_0

    .line 92
    :cond_1
    const-string v0, "C"

    goto :goto_0
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/crud/Player;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 39
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftList;->draftPlayerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterDraftList;->getItem(I)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 44
    move-object v3, p2

    .line 45
    .local v3, "row":Landroid/view/View;
    const/4 v0, 0x0

    .line 47
    .local v0, "holder":Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;
    if-nez v3, :cond_0

    .line 48
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftList;->context:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 49
    .local v1, "inflater":Landroid/view/LayoutInflater;
    iget v4, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftList;->layoutId:I

    const/4 v5, 0x0

    invoke-virtual {v1, v4, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 51
    new-instance v0, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;
    invoke-direct {v0}, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;-><init>()V

    .line 52
    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;
    const v4, 0x7f0b00e0

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;->textViewName:Landroid/widget/TextView;

    .line 53
    const v4, 0x7f0b00e1

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;->textViewPosition:Landroid/widget/TextView;

    .line 54
    const v4, 0x7f0b00e5

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;->textViewPotential:Landroid/widget/TextView;

    .line 55
    const v4, 0x7f0b00e8

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;->textViewAge:Landroid/widget/TextView;

    .line 56
    const v4, 0x7f0b00eb

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;->textViewAverageAttack:Landroid/widget/TextView;

    .line 57
    const v4, 0x7f0b00ed

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;->textViewAverageDefense:Landroid/widget/TextView;

    .line 59
    invoke-virtual {v3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 64
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftList;->draftPlayerList:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Player;

    .line 66
    .local v2, "player":Lcom/blank/bm15/model/object/crud/Player;
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    iget-object v5, v0, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;->textViewPosition:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterDraftList;->context:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;->textViewPotential:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-direct {p0, v5}, Lcom/blank/bm15/activity/adapter/AdapterDraftList;->roundPotential(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;->textViewAge:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;->textViewAverageAttack:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAttack()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/blank/bm15/activity/adapter/AdapterDraftList;->roundAverage(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    iget-object v4, v0, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;->textViewAverageDefense:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillDefense()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/blank/bm15/activity/adapter/AdapterDraftList;->roundAverage(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    invoke-direct {p0, v3, p1}, Lcom/blank/bm15/activity/adapter/AdapterDraftList;->changeBackgroundColor(Landroid/view/View;I)V

    .line 75
    return-object v3

    .line 61
    .end local v2    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_0
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;
    check-cast v0, Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;

    .restart local v0    # "holder":Lcom/blank/bm15/activity/adapter/AdapterDraftList$PlayerHolder;
    goto :goto_0
.end method
