.class public Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "PlayerStatisticsFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method private createPage()V
    .locals 13

    .prologue
    const v12, 0x7f0500e3

    const v11, 0x7f0500e2

    const/4 v10, 0x1

    .line 41
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/activity/base/BaseActivity;->getNavigation(Landroid/content/Context;)Lcom/blank/bm15/model/object/crud/Navigation;

    move-result-object v0

    .line 42
    .local v0, "navigation":Lcom/blank/bm15/model/object/crud/Navigation;
    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 43
    .local v1, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Navigation;->getIdObject()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Player;->setId(Ljava/lang/Integer;)V

    .line 44
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 46
    invoke-direct {p0, v1}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->loadHeader(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 48
    invoke-direct {p0, v1}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getPlayerMatchResult(Lcom/blank/bm15/model/object/crud/Player;)Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v2

    .line 50
    .local v2, "statisticPlayerMatchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b0055

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 51
    .local v3, "textView":Landroid/widget/TextView;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    const v6, 0x7f0500e1

    invoke-virtual {v5, v6}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b0056

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 54
    .restart local v3    # "textView":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_0

    .line 55
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "PER: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPer()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    const/4 v5, 0x2

    invoke-static {v6, v7, v5}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    :goto_0
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b0057

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 61
    .restart local v3    # "textView":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_1

    .line 62
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMinutesPlayed()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v6, v5

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v8, v5

    div-double/2addr v6, v8

    invoke-static {v6, v7, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-virtual {v5, v12}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    :goto_1
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b0062

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 68
    .restart local v3    # "textView":Landroid/widget/TextView;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b005e

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 70
    .restart local v3    # "textView":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_2

    .line 71
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPoints()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-double v4, v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-double v6, v6

    div-double/2addr v4, v6

    invoke-static {v4, v5, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    :goto_2
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b006e

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 77
    .restart local v3    # "textView":Landroid/widget/TextView;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocks()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b006a

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 79
    .restart local v3    # "textView":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_3

    .line 80
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getBlocks()Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-double v6, v6

    div-double/2addr v4, v6

    invoke-static {v4, v5, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    :goto_3
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b006f

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 86
    .restart local v3    # "textView":Landroid/widget/TextView;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getSteals()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b006b

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 88
    .restart local v3    # "textView":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_4

    .line 89
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getSteals()Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-double v6, v6

    div-double/2addr v4, v6

    invoke-static {v4, v5, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    :goto_4
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b0063

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 95
    .restart local v3    # "textView":Landroid/widget/TextView;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getRebounds()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b005f

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 97
    .restart local v3    # "textView":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_5

    .line 98
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getRebounds()Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-double v6, v6

    div-double/2addr v4, v6

    invoke-static {v4, v5, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    :goto_5
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b0070

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 104
    .restart local v3    # "textView":Landroid/widget/TextView;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesKo()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b006c

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 106
    .restart local v3    # "textView":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_6

    .line 107
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesKo()Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-double v6, v6

    div-double/2addr v4, v6

    invoke-static {v4, v5, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    :goto_6
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b0064

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 113
    .restart local v3    # "textView":Landroid/widget/TextView;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOk()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b0060

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 115
    .restart local v3    # "textView":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_7

    .line 116
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPassesOk()Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-double v6, v6

    div-double/2addr v4, v6

    invoke-static {v4, v5, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    :goto_7
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b007a

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 122
    .restart local v3    # "textView":Landroid/widget/TextView;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotOnePointOK()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotOnePointTotals()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b0076

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 124
    .restart local v3    # "textView":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotOnePointTotals()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_8

    .line 125
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotOnePointOK()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/lit8 v4, v4, 0x64

    int-to-double v4, v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotOnePointTotals()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-double v6, v6

    div-double/2addr v4, v6

    invoke-static {v4, v5, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    :goto_8
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b007b

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 131
    .restart local v3    # "textView":Landroid/widget/TextView;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotTwoPointsOK()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotTwoPointsTotals()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b0077

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 133
    .restart local v3    # "textView":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotTwoPointsTotals()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_9

    .line 134
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotTwoPointsOK()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/lit8 v4, v4, 0x64

    int-to-double v4, v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotTwoPointsTotals()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-double v6, v6

    div-double/2addr v4, v6

    invoke-static {v4, v5, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 139
    :goto_9
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b007c

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 140
    .restart local v3    # "textView":Landroid/widget/TextView;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotThreePointsOK()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotThreePointsTotals()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    const v5, 0x7f0b0078

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "textView":Landroid/widget/TextView;
    check-cast v3, Landroid/widget/TextView;

    .line 142
    .restart local v3    # "textView":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotThreePointsTotals()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_a

    .line 143
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotThreePointsOK()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/lit8 v4, v4, 0x64

    int-to-double v4, v4

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getShotThreePointsTotals()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-double v6, v6

    div-double/2addr v4, v6

    invoke-static {v4, v5, v10}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 147
    :goto_a
    return-void

    .line 57
    :cond_0
    const-string v4, "PER: 0.00"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 64
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "0.0 "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 73
    :cond_2
    const-string v4, "0.0"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 82
    :cond_3
    const-string v4, "0.0"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 91
    :cond_4
    const-string v4, "0.0"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 100
    :cond_5
    const-string v4, "0.0"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_5

    .line 109
    :cond_6
    const-string v4, "0.0"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_6

    .line 118
    :cond_7
    const-string v4, "0.0"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_7

    .line 127
    :cond_8
    const-string v4, "0.0"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_8

    .line 136
    :cond_9
    const-string v4, "0.0"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_9

    .line 145
    :cond_a
    const-string v4, "0.0"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_a
.end method

.method private getPlayerMatchResult(Lcom/blank/bm15/model/object/crud/Player;)Lcom/blank/bm15/model/object/crud/MatchResult;
    .locals 6
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 150
    new-instance v0, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 151
    .local v0, "filter":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-virtual {v0, p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->setPlayer(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 153
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v2

    .line 154
    .local v2, "matchResultList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/MatchResult;>;"
    new-instance v3, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 155
    .local v3, "playerMatchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/blank/bm15/model/object/crud/MatchResult;->setMatches(Ljava/lang/Integer;)V

    .line 156
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 160
    return-object v3

    .line 156
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/MatchResult;

    .line 157
    .local v1, "matchResult":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-virtual {v3, v1}, Lcom/blank/bm15/model/object/crud/MatchResult;->addMatchResult(Lcom/blank/bm15/model/object/crud/MatchResult;)V

    goto :goto_0
.end method

.method private loadHeader(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 22
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 164
    sget-object v19, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    .line 165
    .local v7, "showTeamName":Z
    if-eqz p1, :cond_0

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v19

    if-eqz v19, :cond_0

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v19

    if-eqz v19, :cond_0

    .line 166
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_3

    const/4 v7, 0x1

    .line 169
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00bc

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 170
    .local v2, "imageViewPotential":Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00be

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    .line 171
    .local v13, "textViewName":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00c7

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 172
    .local v8, "textViewAge":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00bf

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/TextView;

    .line 173
    .local v14, "textViewPositionFirst":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00c0

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/widget/TextView;

    .line 174
    .local v18, "textViewSeparatorPositionSecond":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00c1

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/TextView;

    .line 175
    .local v16, "textViewPositionSecond":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00c2

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/TextView;

    .line 176
    .local v17, "textViewSeparatorPositionMatch":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00c3

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/TextView;

    .line 177
    .local v15, "textViewPositionMatch":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00ca

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    .line 178
    .local v12, "textViewForm":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00cd

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 179
    .local v11, "textViewEnergy":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00ce

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 180
    .local v9, "textViewAverageText":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00cf

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 189
    .local v10, "textViewAverageValue":Landroid/widget/TextView;
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    if-lez v19, :cond_5

    .line 190
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f02003b

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 191
    const/16 v19, 0x8

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 192
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 193
    const/16 v19, 0x8

    move/from16 v0, v19

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 194
    const/16 v19, 0x8

    invoke-virtual/range {v18 .. v19}, Landroid/widget/TextView;->setVisibility(I)V

    .line 195
    const/16 v19, 0x8

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 197
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_4

    .line 198
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v20

    const v21, 0x7f05002b

    invoke-virtual/range {v20 .. v21}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v20

    const v21, 0x7f05002d

    invoke-virtual/range {v20 .. v21}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 257
    :cond_1
    :goto_1
    const-string v3, ""

    .line 258
    .local v3, "name":Ljava/lang/String;
    if-eqz v7, :cond_2

    .line 259
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v19

    if-nez v19, :cond_11

    .line 260
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, "("

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getContext()Landroid/content/Context;

    move-result-object v20

    const v21, 0x7f050029

    invoke-virtual/range {v20 .. v21}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ") "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 265
    :cond_2
    :goto_2
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 266
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 267
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 269
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 270
    return-void

    .line 166
    .end local v2    # "imageViewPotential":Landroid/widget/ImageView;
    .end local v3    # "name":Ljava/lang/String;
    .end local v8    # "textViewAge":Landroid/widget/TextView;
    .end local v9    # "textViewAverageText":Landroid/widget/TextView;
    .end local v10    # "textViewAverageValue":Landroid/widget/TextView;
    .end local v11    # "textViewEnergy":Landroid/widget/TextView;
    .end local v12    # "textViewForm":Landroid/widget/TextView;
    .end local v13    # "textViewName":Landroid/widget/TextView;
    .end local v14    # "textViewPositionFirst":Landroid/widget/TextView;
    .end local v15    # "textViewPositionMatch":Landroid/widget/TextView;
    .end local v16    # "textViewPositionSecond":Landroid/widget/TextView;
    .end local v17    # "textViewSeparatorPositionMatch":Landroid/widget/TextView;
    .end local v18    # "textViewSeparatorPositionSecond":Landroid/widget/TextView;
    :cond_3
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 200
    .restart local v2    # "imageViewPotential":Landroid/widget/ImageView;
    .restart local v8    # "textViewAge":Landroid/widget/TextView;
    .restart local v9    # "textViewAverageText":Landroid/widget/TextView;
    .restart local v10    # "textViewAverageValue":Landroid/widget/TextView;
    .restart local v11    # "textViewEnergy":Landroid/widget/TextView;
    .restart local v12    # "textViewForm":Landroid/widget/TextView;
    .restart local v13    # "textViewName":Landroid/widget/TextView;
    .restart local v14    # "textViewPositionFirst":Landroid/widget/TextView;
    .restart local v15    # "textViewPositionMatch":Landroid/widget/TextView;
    .restart local v16    # "textViewPositionSecond":Landroid/widget/TextView;
    .restart local v17    # "textViewSeparatorPositionMatch":Landroid/widget/TextView;
    .restart local v18    # "textViewSeparatorPositionSecond":Landroid/widget/TextView;
    :cond_4
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v20

    const v21, 0x7f05002b

    invoke-virtual/range {v20 .. v21}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v20

    const v21, 0x7f05002c

    invoke-virtual/range {v20 .. v21}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 203
    :cond_5
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 204
    .local v6, "potential":I
    const/16 v19, 0x9

    move/from16 v0, v19

    if-lt v6, v0, :cond_6

    .line 205
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f02004b

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 218
    :goto_3
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 219
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    if-eqz v19, :cond_b

    .line 220
    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Landroid/widget/TextView;->setVisibility(I)V

    .line 221
    const/16 v19, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 222
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 228
    :goto_4
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 229
    .local v5, "posTitular":I
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 230
    .local v4, "posReserve":I
    if-nez v7, :cond_e

    if-eqz v5, :cond_e

    .line 231
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move/from16 v0, v19

    if-ne v5, v0, :cond_c

    .line 232
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002d

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 240
    :goto_5
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002d

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 241
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002d

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_1

    .line 206
    .end local v4    # "posReserve":I
    .end local v5    # "posTitular":I
    :cond_6
    const/16 v19, 0x7

    move/from16 v0, v19

    if-lt v6, v0, :cond_7

    .line 207
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f02004a

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 208
    :cond_7
    const/16 v19, 0x5

    move/from16 v0, v19

    if-lt v6, v0, :cond_8

    .line 209
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f020049

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 210
    :cond_8
    const/16 v19, 0x3

    move/from16 v0, v19

    if-lt v6, v0, :cond_9

    .line 211
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f020048

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 212
    :cond_9
    const/16 v19, 0x1

    move/from16 v0, v19

    if-lt v6, v0, :cond_a

    .line 213
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f020047

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 215
    :cond_a
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f020046

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 224
    :cond_b
    const/16 v19, 0x8

    invoke-virtual/range {v18 .. v19}, Landroid/widget/TextView;->setVisibility(I)V

    .line 225
    const/16 v19, 0x8

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_4

    .line 233
    .restart local v4    # "posReserve":I
    .restart local v5    # "posTitular":I
    :cond_c
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move/from16 v0, v19

    if-ne v5, v0, :cond_d

    .line 234
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002d

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_5

    .line 236
    :cond_d
    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 237
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 238
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_5

    .line 242
    :cond_e
    if-nez v7, :cond_1

    if-eqz v4, :cond_1

    .line 243
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move/from16 v0, v19

    if-ne v4, v0, :cond_f

    .line 244
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002f

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 252
    :goto_6
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002f

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 253
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002f

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_1

    .line 245
    :cond_f
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move/from16 v0, v19

    if-ne v4, v0, :cond_10

    .line 246
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002f

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_6

    .line 248
    :cond_10
    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 249
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 250
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_6

    .line 262
    .end local v4    # "posReserve":I
    .end local v5    # "posTitular":I
    .end local v6    # "potential":I
    .restart local v3    # "name":Ljava/lang/String;
    :cond_11
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, "("

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ") "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_2
.end method

.method public static final newInstance(I)Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I

    .prologue
    .line 24
    new-instance v1, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;-><init>()V

    .line 26
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 27
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 28
    sget-object v2, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->NAVIGATION_MODE_NULL:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 29
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 31
    return-object v1
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 36
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 37
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/PlayerStatisticsFragment;->createPage()V

    .line 38
    return-void
.end method
