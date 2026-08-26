.class public Lcom/blank/bm15/activity/adapter/AdapterClassificationList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterClassificationList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/blank/bm15/model/object/other/Classification;",
        ">;"
    }
.end annotation


# instance fields
.field private classificationList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/Classification;",
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
            "Lcom/blank/bm15/model/object/other/Classification;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p3, "classificationList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;->classificationList:Ljava/util/List;

    .line 32
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;->context:Landroid/content/Context;

    .line 33
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;->layoutId:I

    .line 34
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;->classificationList:Ljava/util/List;

    .line 35
    return-void
.end method

.method private changeBackgroundColor(Landroid/view/View;ILcom/blank/bm15/model/object/other/Classification;Lcom/blank/bm15/activity/HomeActivity;)V
    .locals 2
    .param p1, "row"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "classification"    # Lcom/blank/bm15/model/object/other/Classification;
    .param p4, "activity"    # Lcom/blank/bm15/activity/HomeActivity;

    .prologue
    .line 91
    invoke-virtual {p4}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p4}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 92
    const v0, 0x7f06002c

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 98
    :goto_0
    return-void

    .line 93
    :cond_0
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_1

    .line 94
    const v0, 0x7f060017

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    .line 96
    :cond_1
    const v0, 0x7f060018

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/other/Classification;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 39
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;->classificationList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/other/Classification;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;->getItem(I)Lcom/blank/bm15/model/object/other/Classification;

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
    move-object v4, p2

    .line 45
    .local v4, "row":Landroid/view/View;
    const/4 v2, 0x0

    .line 46
    .local v2, "holder":Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;->context:Landroid/content/Context;

    check-cast v0, Lcom/blank/bm15/activity/HomeActivity;

    .line 48
    .local v0, "activity":Lcom/blank/bm15/activity/HomeActivity;
    if-nez v4, :cond_0

    .line 49
    invoke-virtual {v0}, Lcom/blank/bm15/activity/HomeActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    .line 50
    .local v3, "inflater":Landroid/view/LayoutInflater;
    iget v5, p0, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;->layoutId:I

    const/4 v6, 0x0

    invoke-virtual {v3, v5, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 52
    new-instance v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;

    .end local v2    # "holder":Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;
    invoke-direct {v2}, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;-><init>()V

    .line 53
    .restart local v2    # "holder":Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;
    const v5, 0x7f0b0134

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->imageViewAveragePotential:Landroid/widget/ImageView;

    .line 54
    const v5, 0x7f0b0136

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewClassification:Landroid/widget/TextView;

    .line 55
    const v5, 0x7f0b0138

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewName:Landroid/widget/TextView;

    .line 56
    const v5, 0x7f0b0139

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewSalaryCap:Landroid/widget/TextView;

    .line 57
    const v5, 0x7f0b013c

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewMatchesWonText:Landroid/widget/TextView;

    .line 58
    const v5, 0x7f0b013f

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewMatchesLostText:Landroid/widget/TextView;

    .line 59
    const v5, 0x7f0b0142

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewPointsScoredText:Landroid/widget/TextView;

    .line 60
    const v5, 0x7f0b0144

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewPointsAllowedText:Landroid/widget/TextView;

    .line 61
    const v5, 0x7f0b013d

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewMatchesWon:Landroid/widget/TextView;

    .line 62
    const v5, 0x7f0b0140

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewMatchesLost:Landroid/widget/TextView;

    .line 63
    const v5, 0x7f0b0143

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewPointsScored:Landroid/widget/TextView;

    .line 64
    const v5, 0x7f0b0145

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewPointsAllowed:Landroid/widget/TextView;

    .line 66
    invoke-virtual {v4, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 71
    .end local v3    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v5, p0, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;->classificationList:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/other/Classification;

    .line 72
    .local v1, "classification":Lcom/blank/bm15/model/object/other/Classification;
    iget-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getFullName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    iget-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewClassification:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getPositionInConference()Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    iget-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewMatchesWon:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getGamesWon()Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    iget-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewMatchesLost:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getGamesLost()Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    iget-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewPointsScored:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getPointsScored()Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    iget-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewPointsAllowed:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getPointsAllowed()Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/other/Classification;->getIsClassified()Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 80
    iget-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewClassification:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f060031

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 85
    :goto_1
    invoke-direct {p0, v4, p1, v1, v0}, Lcom/blank/bm15/activity/adapter/AdapterClassificationList;->changeBackgroundColor(Landroid/view/View;ILcom/blank/bm15/model/object/other/Classification;Lcom/blank/bm15/activity/HomeActivity;)V

    .line 87
    return-object v4

    .line 68
    .end local v1    # "classification":Lcom/blank/bm15/model/object/other/Classification;
    :cond_0
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "holder":Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;
    check-cast v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;

    .restart local v2    # "holder":Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;
    goto :goto_0

    .line 82
    .restart local v1    # "classification":Lcom/blank/bm15/model/object/other/Classification;
    :cond_1
    iget-object v5, v2, Lcom/blank/bm15/activity/adapter/AdapterClassificationList$TeamHolder;->textViewClassification:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f060026

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1
.end method
