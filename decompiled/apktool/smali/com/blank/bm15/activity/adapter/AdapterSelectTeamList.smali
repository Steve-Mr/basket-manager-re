.class public Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterSelectTeamList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/blank/bm15/model/object/crud/Team;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private layoutId:I

.field private teamList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Team;",
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
            "Lcom/blank/bm15/model/object/crud/Team;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p3, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 25
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->teamList:Ljava/util/List;

    .line 35
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    .line 36
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->layoutId:I

    .line 37
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->teamList:Ljava/util/List;

    .line 38
    return-void
.end method

.method private changeBackgroundColor(Landroid/view/View;I)V
    .locals 1
    .param p1, "row"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 121
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_0

    .line 122
    const v0, 0x7f060017

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 126
    :goto_0
    return-void

    .line 124
    :cond_0
    const v0, 0x7f060018

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/crud/Team;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 42
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->teamList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Team;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->getItem(I)Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 12
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const v11, 0x7f060024

    const/4 v10, 0x0

    .line 47
    move-object v4, p2

    .line 48
    .local v4, "row":Landroid/view/View;
    const/4 v1, 0x0

    .line 49
    .local v1, "holder":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    .line 51
    .local v0, "activity":Landroid/app/Activity;
    if-nez v4, :cond_1

    .line 52
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    .line 53
    .local v2, "inflater":Landroid/view/LayoutInflater;
    iget v6, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->layoutId:I

    invoke-virtual {v2, v6, p3, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 55
    new-instance v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;

    .end local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;
    invoke-direct {v1}, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;-><init>()V

    .line 56
    .restart local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;
    const v6, 0x7f0b0134

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    iput-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->imageViewAveragePotential:Landroid/widget/ImageView;

    .line 57
    const v6, 0x7f0b0136

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewClassification:Landroid/widget/TextView;

    .line 58
    const v6, 0x7f0b0138

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewName:Landroid/widget/TextView;

    .line 59
    const v6, 0x7f0b0139

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewSalaryCap:Landroid/widget/TextView;

    .line 60
    const v6, 0x7f0b013c

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewMatchesWonText:Landroid/widget/TextView;

    .line 61
    const v6, 0x7f0b013f

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewMatchesLostText:Landroid/widget/TextView;

    .line 62
    const v6, 0x7f0b0142

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewPointsScoredText:Landroid/widget/TextView;

    .line 63
    const v6, 0x7f0b0144

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewPointsAllowedText:Landroid/widget/TextView;

    .line 64
    const v6, 0x7f0b013d

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewMatchesWon:Landroid/widget/TextView;

    .line 65
    const v6, 0x7f0b0140

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewMatchesLost:Landroid/widget/TextView;

    .line 66
    const v6, 0x7f0b0143

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewPointsScored:Landroid/widget/TextView;

    .line 67
    const v6, 0x7f0b0145

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewPointsAllowed:Landroid/widget/TextView;

    .line 69
    invoke-virtual {v4, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 74
    .end local v2    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->teamList:Ljava/util/List;

    invoke-interface {v6, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/model/object/crud/Team;

    .line 75
    .local v5, "team":Lcom/blank/bm15/model/object/crud/Team;
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getFullName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewSalaryCap:Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    const v9, 0x7f050159

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v8}, Lcom/blank/bm15/model/util/Util;->formatSalary(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->imageViewAveragePotential:Landroid/widget/ImageView;

    invoke-virtual {v6, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 78
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewClassification:Landroid/widget/TextView;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 79
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewSalaryCap:Landroid/widget/TextView;

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 81
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTeamAveragePotential()Ljava/lang/Double;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 82
    .local v3, "potential":I
    const/16 v6, 0x9

    if-lt v3, v6, :cond_2

    .line 83
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->imageViewAveragePotential:Landroid/widget/ImageView;

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f02004b

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 96
    :goto_1
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewMatchesWonText:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    const v8, 0x7f050160

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewMatchesLostText:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    const v8, 0x7f050161

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewPointsScoredText:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    const v8, 0x7f050162

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewPointsAllowedText:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    const v8, 0x7f050163

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewMatchesWon:Landroid/widget/TextView;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTeamAverageAge()Ljava/lang/Double;

    move-result-object v7

    invoke-static {v7}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewMatchesLost:Landroid/widget/TextView;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTeamAverageSkillAttack()Ljava/lang/Double;

    move-result-object v7

    invoke-static {v7}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewPointsScored:Landroid/widget/TextView;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTeamAverageSkillDefense()Ljava/lang/Double;

    move-result-object v7

    invoke-static {v7}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewPointsAllowed:Landroid/widget/TextView;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTeamAverageSkillAll()Ljava/lang/Double;

    move-result-object v7

    invoke-static {v7}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewPointsAllowedText:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 107
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->textViewPointsAllowed:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 109
    invoke-direct {p0, v4, p1}, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->changeBackgroundColor(Landroid/view/View;I)V

    .line 111
    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    instance-of v6, v6, Lcom/blank/bm15/activity/HomeActivity;

    if-eqz v6, :cond_0

    .line 112
    iget-object v6, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    check-cast v6, Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v6}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-ne v6, v7, :cond_0

    .line 113
    const v6, 0x7f06002c

    invoke-virtual {v4, v6}, Landroid/view/View;->setBackgroundResource(I)V

    .line 117
    :cond_0
    return-object v4

    .line 71
    .end local v3    # "potential":I
    .end local v5    # "team":Lcom/blank/bm15/model/object/crud/Team;
    :cond_1
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;
    check-cast v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;

    .restart local v1    # "holder":Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;
    goto/16 :goto_0

    .line 84
    .restart local v3    # "potential":I
    .restart local v5    # "team":Lcom/blank/bm15/model/object/crud/Team;
    :cond_2
    const/4 v6, 0x7

    if-lt v3, v6, :cond_3

    .line 85
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->imageViewAveragePotential:Landroid/widget/ImageView;

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f02004a

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_1

    .line 86
    :cond_3
    const/4 v6, 0x5

    if-lt v3, v6, :cond_4

    .line 87
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->imageViewAveragePotential:Landroid/widget/ImageView;

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f020049

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_1

    .line 88
    :cond_4
    const/4 v6, 0x3

    if-lt v3, v6, :cond_5

    .line 89
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->imageViewAveragePotential:Landroid/widget/ImageView;

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f020048

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_1

    .line 90
    :cond_5
    const/4 v6, 0x1

    if-lt v3, v6, :cond_6

    .line 91
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->imageViewAveragePotential:Landroid/widget/ImageView;

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f020047

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_1

    .line 93
    :cond_6
    iget-object v6, v1, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList$TeamHolder;->imageViewAveragePotential:Landroid/widget/ImageView;

    iget-object v7, p0, Lcom/blank/bm15/activity/adapter/AdapterSelectTeamList;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f020046

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_1
.end method
