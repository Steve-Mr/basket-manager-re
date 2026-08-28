.class public Lcom/blank/bm15/model/core/ManageRenewals;
.super Ljava/lang/Object;
.source "ManageRenewals.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static atemptToRenew(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 12
    .param p0, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    const/16 v11, 0xa

    const/4 v10, 0x4

    const/4 v9, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 119
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v4, v7}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    .line 120
    .local v0, "offerPosition":Ljava/lang/Integer;
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v4, v7}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getLoyalty()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    add-int/2addr v7, v8

    if-ge v4, v7, :cond_3

    move v4, v5

    :goto_0
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 122
    .local v1, "renew":Ljava/lang/Boolean;
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_1

    .line 123
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v4, v7}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    .line 124
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v4, v7}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getLoyalty()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    add-int/2addr v7, v8

    if-ge v4, v7, :cond_0

    move v6, v5

    :cond_0
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 127
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 129
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v6, 0x19

    if-gt v4, v6, :cond_4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    .line 133
    .local v3, "yearsContract":Ljava/lang/Integer;
    :goto_1
    invoke-virtual {p0, v3}, Lcom/blank/bm15/model/object/crud/Player;->setYearsContract(Ljava/lang/Integer;)V

    .line 136
    invoke-static {p0}, Lcom/blank/bm15/model/util/Util;->getSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v2

    .line 137
    .local v2, "salary":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, -0xf

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/16 v7, 0xf

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    mul-int/2addr v5, v6

    div-int/lit8 v5, v5, 0x64

    add-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 138
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    div-int/lit16 v4, v4, 0x3e8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 139
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/lit16 v4, v4, 0x3e8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 140
    invoke-virtual {p0, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    .line 143
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 145
    .end local v2    # "salary":Ljava/lang/Integer;
    .end local v3    # "yearsContract":Ljava/lang/Integer;
    :cond_2
    return-void

    .end local v1    # "renew":Ljava/lang/Boolean;
    :cond_3
    move v4, v6

    .line 120
    goto/16 :goto_0

    .line 130
    .restart local v1    # "renew":Ljava/lang/Boolean;
    :cond_4
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v6, 0x1e

    if-gt v4, v6, :cond_5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_1

    .line 131
    :cond_5
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v6, 0x22

    if-gt v4, v6, :cond_6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_1

    .line 132
    :cond_6
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    goto/16 :goto_1
.end method

.method private static calculateNewSalaryCap(Lcom/blank/bm15/model/object/crud/Game;Ljava/util/List;)V
    .locals 12
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/Classification;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    const/4 v11, 0x1

    .line 148
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .local v2, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 191
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 192
    return-void

    .line 150
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/other/Classification;

    .line 151
    .local v0, "classification":Lcom/blank/bm15/model/object/other/Classification;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Classification;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    .line 152
    .local v1, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Classification;->getIsClassified()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 155
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_PLUS:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/lit8 v4, v4, 0x2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Team;->addSalaryCap(Ljava/lang/Integer;)V

    .line 157
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Classification;->getPositionInDivision()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v11, :cond_2

    .line 158
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_PLUS:Ljava/lang/Integer;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Team;->addSalaryCap(Ljava/lang/Integer;)V

    .line 160
    :cond_2
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayoffs()Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesSemis()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 161
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_PLUS:Ljava/lang/Integer;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Team;->addSalaryCap(Ljava/lang/Integer;)V

    .line 163
    :cond_3
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayoffs()Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesConferenceFinal()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 164
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_PLUS:Ljava/lang/Integer;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Team;->addSalaryCap(Ljava/lang/Integer;)V

    .line 166
    :cond_4
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayoffs()Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsInSeriesWorldFinal()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 167
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_PLUS:Ljava/lang/Integer;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Team;->addSalaryCap(Ljava/lang/Integer;)V

    .line 169
    :cond_5
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getPlayoffs()Lcom/blank/bm15/model/object/crud/Playoffs;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Playoffs;->getIsChampion()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 170
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_PLUS:Ljava/lang/Integer;

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Team;->addSalaryCap(Ljava/lang/Integer;)V

    .line 182
    :cond_6
    :goto_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_0

    .line 184
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 185
    const v5, 0x7f02003a

    .line 186
    const v6, 0x7f050124

    .line 187
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v7

    const v8, 0x7f050125

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    new-array v8, v11, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v10}, Lcom/blank/bm15/model/util/Util;->formatSalary(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 183
    invoke-static {p0, v4, v5, v6, v7}, Lcom/blank/bm15/model/core/ManageRenewals;->createNews(Lcom/blank/bm15/model/object/crud/Game;IIILjava/lang/String;)V

    goto/16 :goto_0

    .line 173
    :cond_7
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_PLUS:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/lit8 v4, v4, -0x3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Team;->addSalaryCap(Ljava/lang/Integer;)V

    .line 175
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Classification;->getPositionInDivision()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x5

    if-ne v4, v5, :cond_8

    .line 176
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_PLUS:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/lit8 v4, v4, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Team;->addSalaryCap(Ljava/lang/Integer;)V

    .line 178
    :cond_8
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/other/Classification;->getPositionInConference()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0xf

    if-ne v4, v5, :cond_6

    .line 179
    sget-object v4, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_PLUS:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/lit8 v4, v4, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/blank/bm15/model/object/crud/Team;->addSalaryCap(Ljava/lang/Integer;)V

    goto/16 :goto_1
.end method

.method private static createNews(Lcom/blank/bm15/model/object/crud/Game;IIILjava/lang/String;)V
    .locals 2
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "matchday"    # I
    .param p2, "type"    # I
    .param p3, "title"    # I
    .param p4, "body"    # Ljava/lang/String;

    .prologue
    .line 195
    new-instance v0, Lcom/blank/bm15/model/object/crud/News;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    .line 196
    .local v0, "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/News;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 197
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setMatchday(Ljava/lang/Integer;)V

    .line 198
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setType(Ljava/lang/Integer;)V

    .line 199
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/News;->setTitle(Ljava/lang/String;)V

    .line 200
    invoke-virtual {v0, p4}, Lcom/blank/bm15/model/object/crud/News;->setBody(Ljava/lang/String;)V

    .line 202
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 203
    return-void
.end method

.method public static finishRenewals(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 10
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 79
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v0, v6}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 80
    .local v0, "filter":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 81
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/blank/bm15/model/object/crud/Player;->setYearsContract(Ljava/lang/Integer;)V

    .line 82
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v2

    .line 84
    .local v2, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_0

    .line 89
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 91
    new-instance v4, Lcom/blank/bm15/model/object/crud/Tactic;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v4, v6}, Lcom/blank/bm15/model/object/crud/Tactic;-><init>(Landroid/content/Context;)V

    .line 92
    .local v4, "tacticFilter":Lcom/blank/bm15/model/object/crud/Tactic;
    invoke-virtual {v4, p0}, Lcom/blank/bm15/model/object/crud/Tactic;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 93
    invoke-static {v4}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v5

    .line 94
    .local v5, "tacticList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Tactic;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_1

    .line 115
    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 116
    return-void

    .line 84
    .end local v4    # "tacticFilter":Lcom/blank/bm15/model/object/crud/Tactic;
    .end local v5    # "tacticList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Tactic;>;"
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Player;

    .line 85
    .local v1, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v1, v8}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 86
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    goto :goto_0

    .line 94
    .end local v1    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .restart local v4    # "tacticFilter":Lcom/blank/bm15/model/object/crud/Tactic;
    .restart local v5    # "tacticList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Tactic;>;"
    :cond_1
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/crud/Tactic;

    .line 95
    .local v3, "tactic":Lcom/blank/bm15/model/object/crud/Tactic;
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularPointGuard(Ljava/lang/Integer;)V

    .line 96
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularShootingGuard(Ljava/lang/Integer;)V

    .line 97
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularSmallForward(Ljava/lang/Integer;)V

    .line 98
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularPowerForward(Ljava/lang/Integer;)V

    .line 99
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupTitularCenter(Ljava/lang/Integer;)V

    .line 101
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReservePointGuard(Ljava/lang/Integer;)V

    .line 102
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveShootingGuard(Ljava/lang/Integer;)V

    .line 103
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveSmallForward(Ljava/lang/Integer;)V

    .line 104
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReservePowerForward(Ljava/lang/Integer;)V

    .line 105
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setLineupReserveCenter(Ljava/lang/Integer;)V

    .line 107
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticBenchImportance(Ljava/lang/Integer;)V

    .line 108
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticGameType(Ljava/lang/Integer;)V

    .line 109
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticShotIntPercent(Ljava/lang/Integer;)V

    .line 110
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticShotTriplePercent(Ljava/lang/Integer;)V

    .line 111
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarOne(Ljava/lang/Integer;)V

    .line 112
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarTwo(Ljava/lang/Integer;)V

    .line 113
    invoke-virtual {v3, v8}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarThree(Ljava/lang/Integer;)V

    goto :goto_1
.end method

.method public static manage(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 14
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    const/4 v13, 0x2

    const/4 v12, 0x0

    const/4 v11, 0x1

    .line 22
    invoke-static {p0, v11}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getClassification(Lcom/blank/bm15/model/object/crud/Game;I)Ljava/util/List;

    move-result-object v0

    .line 23
    .local v0, "eastList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    invoke-static {p0, v0}, Lcom/blank/bm15/model/core/ManageRenewals;->calculateNewSalaryCap(Lcom/blank/bm15/model/object/crud/Game;Ljava/util/List;)V

    .line 26
    invoke-static {p0, v13}, Lcom/blank/bm15/activity/fragment/ClassificationTotalFragment;->getClassification(Lcom/blank/bm15/model/object/crud/Game;I)Ljava/util/List;

    move-result-object v5

    .line 27
    .local v5, "westList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    invoke-static {p0, v5}, Lcom/blank/bm15/model/core/ManageRenewals;->calculateNewSalaryCap(Lcom/blank/bm15/model/object/crud/Game;Ljava/util/List;)V

    .line 29
    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v1, v6}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 30
    .local v1, "filter":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v1, p0}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 31
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/blank/bm15/model/object/crud/Player;->setYearsContract(Ljava/lang/Integer;)V

    .line 32
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v4

    .line 34
    .local v4, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    const-string v2, ""

    .line 35
    .local v2, "news":Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_1

    .line 75
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const v7, 0x7f02003a

    const v8, 0x7f050129

    invoke-static {p0, v6, v7, v8, v2}, Lcom/blank/bm15/model/core/ManageRenewals;->createNews(Lcom/blank/bm15/model/object/crud/Game;IIILjava/lang/String;)V

    .line 76
    return-void

    .line 35
    :cond_1
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    .line 36
    .local v3, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v7

    if-eqz v7, :cond_8

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-eq v7, v8, :cond_8

    .line 37
    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3, v7}, Lcom/blank/bm15/model/object/crud/Player;->getIsBestInPosition(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-nez v7, :cond_2

    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v3, v7}, Lcom/blank/bm15/model/object/crud/Player;->getIsBestInPosition(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 39
    :cond_2
    invoke-static {v3}, Lcom/blank/bm15/model/core/ManageRenewals;->atemptToRenew(Lcom/blank/bm15/model/object/crud/Player;)V

    goto :goto_0

    .line 41
    :cond_3
    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3, v7}, Lcom/blank/bm15/model/object/crud/Player;->getIsUniqueInPosition(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-nez v7, :cond_4

    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v3, v7}, Lcom/blank/bm15/model/object/crud/Player;->getIsUniqueInPosition(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 43
    :cond_4
    invoke-static {v3}, Lcom/blank/bm15/model/core/ManageRenewals;->atemptToRenew(Lcom/blank/bm15/model/object/crud/Player;)V

    goto :goto_0

    .line 45
    :cond_5
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/16 v8, 0x18

    if-ge v7, v8, :cond_6

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/4 v8, 0x7

    if-le v7, v8, :cond_6

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    const/16 v8, 0xe

    if-ge v7, v8, :cond_6

    .line 47
    invoke-static {v3}, Lcom/blank/bm15/model/core/ManageRenewals;->atemptToRenew(Lcom/blank/bm15/model/object/crud/Player;)V

    goto/16 :goto_0

    .line 49
    :cond_6
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/16 v8, 0x21

    if-le v7, v8, :cond_7

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Double;->intValue()I

    move-result v7

    const/16 v8, 0x50

    if-le v7, v8, :cond_7

    .line 51
    invoke-static {v3}, Lcom/blank/bm15/model/core/ManageRenewals;->atemptToRenew(Lcom/blank/bm15/model/object/crud/Player;)V

    goto/16 :goto_0

    .line 54
    :cond_7
    const/4 v7, 0x0

    invoke-virtual {v3, v7}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    goto/16 :goto_0

    .line 56
    :cond_8
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v7

    if-eqz v7, :cond_0

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-ne v7, v8, :cond_0

    .line 57
    const-string v7, ""

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_9

    .line 58
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 61
    :cond_9
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getLoyalty()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-ne v7, v11, :cond_a

    .line 62
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f05012c

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-array v9, v11, [Ljava/lang/Object;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v12

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 63
    goto/16 :goto_0

    :cond_a
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getLoyalty()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-ne v7, v13, :cond_b

    .line 64
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f05012d

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-array v9, v11, [Ljava/lang/Object;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v12

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 65
    goto/16 :goto_0

    :cond_b
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getLoyalty()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/4 v8, 0x3

    if-ne v7, v8, :cond_c

    .line 66
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f05012e

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-array v9, v11, [Ljava/lang/Object;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v12

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 67
    goto/16 :goto_0

    :cond_c
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getLoyalty()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/4 v8, 0x4

    if-ne v7, v8, :cond_d

    .line 68
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f05012f

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-array v9, v11, [Ljava/lang/Object;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v12

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 69
    goto/16 :goto_0

    :cond_d
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getLoyalty()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/4 v8, 0x5

    if-ne v7, v8, :cond_0

    .line 70
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f050130

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-array v9, v11, [Ljava/lang/Object;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v12

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0
.end method
