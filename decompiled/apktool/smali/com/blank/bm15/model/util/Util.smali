.class public Lcom/blank/bm15/model/util/Util;
.super Ljava/lang/Object;
.source "Util.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static formatSalary(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 2
    .param p0, "salary"    # Ljava/lang/Integer;

    .prologue
    .line 203
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v1}, Ljava/text/NumberFormat;->getNumberInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/text/NumberFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " $"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getConference(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "value"    # Ljava/lang/Integer;

    .prologue
    .line 170
    if-nez p1, :cond_0

    .line 171
    const-string v0, ""

    .line 177
    :goto_0
    return-object v0

    .line 172
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 173
    const v0, 0x7f050031

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 174
    :cond_1
    const/4 v0, 0x2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 175
    const v0, 0x7f050032

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 177
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getDivision(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "value"    # Ljava/lang/Integer;

    .prologue
    .line 213
    if-nez p1, :cond_0

    .line 214
    const-string v0, ""

    .line 228
    :goto_0
    return-object v0

    .line 215
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 216
    const v0, 0x7f050035

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 217
    :cond_1
    const/4 v0, 0x2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 218
    const v0, 0x7f050036

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 219
    :cond_2
    const/4 v0, 0x3

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 220
    const v0, 0x7f050037

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 221
    :cond_3
    const/4 v0, 0x4

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_4

    .line 222
    const v0, 0x7f050038

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 223
    :cond_4
    const/4 v0, 0x5

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_5

    .line 224
    const v0, 0x7f050039

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 225
    :cond_5
    const/4 v0, 0x6

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_6

    .line 226
    const v0, 0x7f05003a

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 228
    :cond_6
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getIntegerOfIntent(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/Integer;
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 58
    .local v2, "intent":Landroid/content/Intent;
    const/4 v1, 0x0

    .line 60
    .local v1, "integer":Ljava/lang/Integer;
    if-eqz v2, :cond_0

    .line 61
    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 62
    .local v0, "bundle":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 63
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 66
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_0
    return-object v1
.end method

.method public static getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "position"    # Ljava/lang/Integer;

    .prologue
    .line 259
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 260
    const v0, 0x7f050040

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 270
    :goto_0
    return-object v0

    .line 261
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 262
    const v0, 0x7f050041

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 263
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    .line 264
    const v0, 0x7f050042

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 265
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_3

    .line 266
    const v0, 0x7f050043

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 267
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_4

    .line 268
    const v0, 0x7f050044

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 270
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getPlayerShortName(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "fullName"    # Ljava/lang/String;

    .prologue
    .line 30
    if-nez p0, :cond_0

    .line 31
    const-string v1, "-"

    .line 47
    :goto_0
    return-object v1

    .line 33
    :cond_0
    const-string v1, ""

    .line 34
    .local v1, "shortName":Ljava/lang/String;
    new-instance v2, Ljava/util/StringTokenizer;

    const-string v4, " "

    invoke-direct {v2, p0, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .local v2, "st":Ljava/util/StringTokenizer;
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    .line 36
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 37
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    .line 38
    .local v3, "surname":Ljava/lang/String;
    const-string v4, "."

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 39
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ". "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 43
    goto :goto_0

    .line 44
    .end local v3    # "surname":Ljava/lang/String;
    :cond_2
    move-object v1, v0

    goto :goto_0
.end method

.method public static getRandomPotential(I)I
    .locals 4
    .param p0, "base"    # I

    .prologue
    .line 146
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 147
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 148
    .local v2, "minValue":Ljava/lang/Integer;
    const/16 v3, 0x8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 150
    .local v1, "maxValue":Ljava/lang/Integer;
    invoke-static {v2, v1}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    invoke-static {v2, v1}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    invoke-static {v2, v1}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    invoke-static {v2, v1}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    invoke-static {v2, v1}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    invoke-static {v2, v1}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 156
    invoke-static {v2, v1}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 160
    const/4 v3, 0x3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v3, p0

    return v3
.end method

.method public static getRandomSimulate(Ljava/lang/Double;)Ljava/lang/Double;
    .locals 10
    .param p0, "base"    # Ljava/lang/Double;

    .prologue
    .line 126
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 127
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/16 v3, 0xf

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 128
    .local v2, "minValue":Ljava/lang/Integer;
    const/16 v3, 0x19

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 130
    .local v1, "maxValue":Ljava/lang/Integer;
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmpl-double v3, v6, v8

    if-nez v3, :cond_0

    .line 131
    const/16 v3, 0xa

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 132
    const/16 v3, 0x14

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 135
    :cond_0
    invoke-static {v2, v1}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 136
    invoke-static {v2, v1}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    invoke-static {v2, v1}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 140
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-double v6, v3

    const-wide/high16 v8, 0x4024000000000000L    # 10.0

    div-double v4, v6, v8

    .line 142
    .local v4, "result":D
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    add-double/2addr v6, v4

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    return-object v3
.end method

.method public static getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 4
    .param p0, "minValue"    # Ljava/lang/Integer;
    .param p1, "maxValue"    # Ljava/lang/Integer;

    .prologue
    .line 116
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sub-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x1

    int-to-double v2, v2

    mul-double/2addr v0, v2

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-double v2, v2

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public static getSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;
    .locals 14
    .param p0, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    const-wide/high16 v12, 0x4059000000000000L    # 100.0

    const-wide/high16 v10, 0x4024000000000000L    # 10.0

    .line 181
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    const-wide/high16 v8, 0x4044000000000000L    # 40.0

    sub-double v2, v6, v8

    .line 182
    .local v2, "subAverage":D
    mul-double v6, v2, v2

    mul-double/2addr v6, v2

    mul-double/2addr v6, v2

    const-wide/high16 v8, 0x4079000000000000L    # 400.0

    div-double v4, v6, v8

    .line 183
    .local v4, "value":D
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    rsub-int/lit8 v1, v1, 0x28

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    mul-int/lit8 v6, v6, 0x2

    add-int/2addr v1, v6

    add-int/lit8 v1, v1, 0x4b

    int-to-double v6, v1

    mul-double/2addr v4, v6

    .line 184
    const-wide/high16 v6, 0x405e000000000000L    # 120.0

    mul-double/2addr v6, v4

    div-double v4, v6, v12

    .line 186
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eqz v1, :cond_0

    .line 187
    mul-double v6, v4, v10

    div-double/2addr v6, v12

    add-double/2addr v4, v6

    .line 190
    :cond_0
    mul-double v6, v4, v10

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 192
    .local v0, "roundedSalary":I
    const v1, 0x186a0

    if-ge v0, v1, :cond_1

    .line 193
    const v0, 0x186a0

    .line 199
    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1

    .line 195
    :cond_1
    div-int/lit16 v0, v0, 0x3e8

    .line 196
    mul-int/lit16 v0, v0, 0x3e8

    goto :goto_0
.end method

.method public static getShortPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "position"    # Ljava/lang/Integer;

    .prologue
    .line 238
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 239
    const v0, 0x7f05003b

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 249
    :goto_0
    return-object v0

    .line 240
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 241
    const v0, 0x7f05003c

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 242
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    .line 243
    const v0, 0x7f05003d

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 244
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_3

    .line 245
    const v0, 0x7f05003e

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 246
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_4

    .line 247
    const v0, 0x7f05003f

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 249
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getStringOfIntent(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 76
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 77
    .local v1, "intent":Landroid/content/Intent;
    const/4 v2, 0x0

    .line 79
    .local v2, "string":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 80
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 81
    .local v0, "bundle":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 82
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 85
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_0
    return-object v2
.end method

.method public static getTeamColor(Lcom/blank/bm15/model/object/crud/Team;)I
    .locals 2
    .param p0, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 274
    const-string v0, "BOS"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 275
    const v0, 0x7f060036

    .line 336
    :goto_0
    return v0

    .line 276
    :cond_0
    const-string v0, "BRO"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 277
    const v0, 0x7f060046

    goto :goto_0

    .line 278
    :cond_1
    const-string v0, "NYK"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 279
    const v0, 0x7f060048

    goto :goto_0

    .line 280
    :cond_2
    const-string v0, "PHI"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 281
    const v0, 0x7f06004b

    goto :goto_0

    .line 282
    :cond_3
    const-string v0, "TOR"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 283
    const v0, 0x7f060050

    goto :goto_0

    .line 284
    :cond_4
    const-string v0, "CHI"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 285
    const v0, 0x7f060038

    goto :goto_0

    .line 286
    :cond_5
    const-string v0, "CLE"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 287
    const v0, 0x7f060039

    goto :goto_0

    .line 288
    :cond_6
    const-string v0, "DET"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 289
    const v0, 0x7f06003c

    goto :goto_0

    .line 290
    :cond_7
    const-string v0, "IND"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 291
    const v0, 0x7f06003f

    goto :goto_0

    .line 292
    :cond_8
    const-string v0, "MIL"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 293
    const v0, 0x7f060044

    goto/16 :goto_0

    .line 294
    :cond_9
    const-string v0, "ATL"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 295
    const v0, 0x7f060035

    goto/16 :goto_0

    .line 296
    :cond_a
    const-string v0, "CHA"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 297
    const v0, 0x7f060037

    goto/16 :goto_0

    .line 298
    :cond_b
    const-string v0, "MIA"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 299
    const v0, 0x7f060043

    goto/16 :goto_0

    .line 300
    :cond_c
    const-string v0, "ORL"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 301
    const v0, 0x7f06004a

    goto/16 :goto_0

    .line 302
    :cond_d
    const-string v0, "WAS"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 303
    const v0, 0x7f060052

    goto/16 :goto_0

    .line 304
    :cond_e
    const-string v0, "DAL"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 305
    const v0, 0x7f06003a

    goto/16 :goto_0

    .line 306
    :cond_f
    const-string v0, "HOU"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 307
    const v0, 0x7f06003e

    goto/16 :goto_0

    .line 308
    :cond_10
    const-string v0, "MEM"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 309
    const v0, 0x7f060042

    goto/16 :goto_0

    .line 310
    :cond_11
    const-string v0, "NOR"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 311
    const v0, 0x7f060047

    goto/16 :goto_0

    .line 312
    :cond_12
    const-string v0, "SAN"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 313
    const v0, 0x7f06004f

    goto/16 :goto_0

    .line 314
    :cond_13
    const-string v0, "DEN"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 315
    const v0, 0x7f06003b

    goto/16 :goto_0

    .line 316
    :cond_14
    const-string v0, "MIN"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 317
    const v0, 0x7f060045

    goto/16 :goto_0

    .line 318
    :cond_15
    const-string v0, "POR"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 319
    const v0, 0x7f06004d

    goto/16 :goto_0

    .line 320
    :cond_16
    const-string v0, "OKC"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 321
    const v0, 0x7f060049

    goto/16 :goto_0

    .line 322
    :cond_17
    const-string v0, "UTA"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 323
    const v0, 0x7f060051

    goto/16 :goto_0

    .line 324
    :cond_18
    const-string v0, "GSW"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 325
    const v0, 0x7f06003d

    goto/16 :goto_0

    .line 326
    :cond_19
    const-string v0, "LAC"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 327
    const v0, 0x7f060040

    goto/16 :goto_0

    .line 328
    :cond_1a
    const-string v0, "LAL"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 329
    const v0, 0x7f060041

    goto/16 :goto_0

    .line 330
    :cond_1b
    const-string v0, "PHO"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 331
    const v0, 0x7f06004c

    goto/16 :goto_0

    .line 332
    :cond_1c
    const-string v0, "SAC"

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 333
    const v0, 0x7f06004e

    goto/16 :goto_0

    .line 336
    :cond_1d
    const v0, 0x7f06002d

    goto/16 :goto_0
.end method

.method public static isNullOrEmpty(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 26
    if-eqz p0, :cond_0

    const-string v0, ""

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public static round(D)D
    .locals 2
    .param p0, "number"    # D

    .prologue
    .line 95
    const/4 v0, 0x2

    invoke-static {p0, p1, v0}, Lcom/blank/bm15/model/util/Util;->round(DI)D

    move-result-wide v0

    return-wide v0
.end method

.method public static round(DI)D
    .locals 6
    .param p0, "number"    # D
    .param p2, "decimals"    # I

    .prologue
    .line 105
    const-wide/high16 v2, 0x4024000000000000L    # 10.0

    int-to-double v4, p2

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    double-to-int v0, v2

    .line 106
    .local v0, "aux":I
    int-to-double v2, v0

    mul-double/2addr v2, p0

    invoke-static {v2, v3}, Ljava/lang/Math;->rint(D)D

    move-result-wide v2

    int-to-double v4, v0

    div-double/2addr v2, v4

    return-wide v2
.end method
