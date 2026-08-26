.class public Lcom/blank/bm15/activity/adapter/AdapterFinanceList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterFinanceList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/blank/bm15/model/object/other/Finance;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private financeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/Finance;",
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
            "Lcom/blank/bm15/model/object/other/Finance;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p3, "financeList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Finance;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->financeList:Ljava/util/List;

    .line 31
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->context:Landroid/content/Context;

    .line 32
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->layoutId:I

    .line 33
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->financeList:Ljava/util/List;

    .line 34
    return-void
.end method

.method private changeBackgroundColor(Landroid/view/View;I)V
    .locals 1
    .param p1, "row"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 95
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_0

    .line 96
    const v0, 0x7f060017

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 100
    :goto_0
    return-void

    .line 98
    :cond_0
    const v0, 0x7f060018

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/other/Finance;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 38
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->financeList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/other/Finance;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->getItem(I)Lcom/blank/bm15/model/object/other/Finance;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 43
    move-object v3, p2

    .line 44
    .local v3, "row":Landroid/view/View;
    const/4 v1, 0x0

    .line 46
    .local v1, "holder":Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;
    if-nez v3, :cond_0

    .line 47
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->context:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    .line 48
    .local v2, "inflater":Landroid/view/LayoutInflater;
    iget v4, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->layoutId:I

    const/4 v5, 0x0

    invoke-virtual {v2, v4, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 50
    new-instance v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;

    .end local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;
    invoke-direct {v1}, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;-><init>()V

    .line 51
    .restart local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;
    const v4, 0x7f0b00f2

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewPlayerName:Landroid/widget/TextView;

    .line 52
    const v4, 0x7f0b00f3

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear1:Landroid/widget/TextView;

    .line 53
    const v4, 0x7f0b00f4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear2:Landroid/widget/TextView;

    .line 54
    const v4, 0x7f0b00f5

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear3:Landroid/widget/TextView;

    .line 55
    const v4, 0x7f0b00f6

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear4:Landroid/widget/TextView;

    .line 56
    const v4, 0x7f0b00f7

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear5:Landroid/widget/TextView;

    .line 58
    invoke-virtual {v3, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 64
    .end local v2    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->financeList:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/other/Finance;

    .line 65
    .local v0, "finance":Lcom/blank/bm15/model/object/other/Finance;
    if-lez p1, :cond_2

    .line 66
    iget-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear1:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Finance;->getYear1()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/model/util/Util;->formatSalary(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    iget-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear2:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Finance;->getYear2()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/model/util/Util;->formatSalary(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    iget-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear3:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Finance;->getYear3()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/model/util/Util;->formatSalary(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    iget-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear4:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Finance;->getYear4()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/model/util/Util;->formatSalary(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    iget-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear5:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Finance;->getYear5()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/model/util/Util;->formatSalary(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    invoke-direct {p0, v3, p1}, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->changeBackgroundColor(Landroid/view/View;I)V

    .line 74
    iget-object v4, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->financeList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne p1, v4, :cond_1

    .line 75
    iget-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewPlayerName:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->context:Landroid/content/Context;

    const v6, 0x7f05017b

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    const v4, 0x7f06002e

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 91
    :goto_1
    return-object v3

    .line 60
    .end local v0    # "finance":Lcom/blank/bm15/model/object/other/Finance;
    :cond_0
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;
    check-cast v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;

    .restart local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;
    goto :goto_0

    .line 78
    .restart local v0    # "finance":Lcom/blank/bm15/model/object/other/Finance;
    :cond_1
    iget-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewPlayerName:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Finance;->getPlayer()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 81
    :cond_2
    iget-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewPlayerName:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->context:Landroid/content/Context;

    const v6, 0x7f050028

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    iget-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear1:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->context:Landroid/content/Context;

    const v6, 0x7f050176

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    iget-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear2:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->context:Landroid/content/Context;

    const v6, 0x7f050177

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    iget-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear3:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->context:Landroid/content/Context;

    const v6, 0x7f050178

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    iget-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear4:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->context:Landroid/content/Context;

    const v6, 0x7f050179

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    iget-object v4, v1, Lcom/blank/bm15/activity/adapter/AdapterFinanceList$FinanceHolder;->textViewYear5:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterFinanceList;->context:Landroid/content/Context;

    const v6, 0x7f05017a

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    const v4, 0x7f06002c

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_1
.end method
