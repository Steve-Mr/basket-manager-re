.class public Lcom/blank/bm15/dao/utils/BlankObj;
.super Ljava/lang/Object;
.source "BlankObj.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isNullOrEmpty(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 164
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

.method public static toBoolean(Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 140
    if-nez p0, :cond_0

    .line 141
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 153
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 142
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_0
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    .line 143
    check-cast p0, Ljava/lang/Boolean;

    goto :goto_0

    .line 144
    :cond_1
    instance-of v0, p0, Ljava/lang/Integer;

    if-eqz v0, :cond_3

    .line 145
    check-cast p0, Ljava/lang/Integer;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_2

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_0

    :cond_2
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_0

    .line 146
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_3
    instance-of v0, p0, Ljava/lang/Long;

    if-eqz v0, :cond_5

    .line 147
    check-cast p0, Ljava/lang/Long;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Long;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_4

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_0

    :cond_4
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_0

    .line 148
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_5
    instance-of v0, p0, Ljava/lang/Float;

    if-eqz v0, :cond_7

    .line 149
    check-cast p0, Ljava/lang/Float;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Float;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_6

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_0

    :cond_6
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_0

    .line 150
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    instance-of v0, p0, Ljava/lang/Double;

    if-eqz v0, :cond_9

    .line 151
    check-cast p0, Ljava/lang/Double;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Double;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_8

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_0

    :cond_8
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_0

    .line 153
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static toDouble(Ljava/lang/Object;)Ljava/lang/Double;
    .locals 4
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 112
    if-nez p0, :cond_0

    move-object p0, v1

    .line 128
    .end local p0    # "obj":Ljava/lang/Object;
    .local v0, "e":Ljava/lang/NumberFormatException;
    :goto_0
    return-object p0

    .line 114
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_0
    instance-of v2, p0, Ljava/lang/Boolean;

    if-eqz v2, :cond_2

    .line 115
    check-cast p0, Ljava/lang/Boolean;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    int-to-double v2, v1

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 116
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_2
    instance-of v2, p0, Ljava/lang/Integer;

    if-eqz v2, :cond_3

    .line 117
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object p0

    goto :goto_0

    .line 118
    :cond_3
    instance-of v2, p0, Ljava/lang/Long;

    if-eqz v2, :cond_4

    .line 119
    check-cast p0, Ljava/lang/Long;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Long;->doubleValue()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    goto :goto_0

    .line 120
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_4
    instance-of v2, p0, Ljava/lang/Float;

    if-eqz v2, :cond_5

    .line 121
    check-cast p0, Ljava/lang/Float;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Float;->doubleValue()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    goto :goto_0

    .line 122
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_5
    instance-of v2, p0, Ljava/lang/Double;

    if-eqz v2, :cond_6

    .line 123
    check-cast p0, Ljava/lang/Double;

    goto :goto_0

    .line 126
    :cond_6
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    goto :goto_0

    .line 127
    :catch_0
    move-exception v0

    .restart local v0    # "e":Ljava/lang/NumberFormatException;
    move-object p0, v1

    .line 128
    goto :goto_0
.end method

.method public static toFloat(Ljava/lang/Object;)Ljava/lang/Float;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 84
    if-nez p0, :cond_0

    move-object p0, v1

    .line 100
    .end local p0    # "obj":Ljava/lang/Object;
    .local v0, "e":Ljava/lang/NumberFormatException;
    :goto_0
    return-object p0

    .line 86
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_0
    instance-of v2, p0, Ljava/lang/Boolean;

    if-eqz v2, :cond_2

    .line 87
    check-cast p0, Ljava/lang/Boolean;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    int-to-float v1, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 88
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_2
    instance-of v2, p0, Ljava/lang/Integer;

    if-eqz v2, :cond_3

    .line 89
    check-cast p0, Ljava/lang/Float;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    goto :goto_0

    .line 90
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_3
    instance-of v2, p0, Ljava/lang/Long;

    if-eqz v2, :cond_4

    .line 91
    check-cast p0, Ljava/lang/Long;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Long;->floatValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    goto :goto_0

    .line 92
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_4
    instance-of v2, p0, Ljava/lang/Float;

    if-eqz v2, :cond_5

    .line 93
    check-cast p0, Ljava/lang/Float;

    goto :goto_0

    .line 94
    :cond_5
    instance-of v2, p0, Ljava/lang/Double;

    if-eqz v2, :cond_6

    .line 95
    check-cast p0, Ljava/lang/Double;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Double;->floatValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    goto :goto_0

    .line 98
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_6
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    goto :goto_0

    .line 99
    :catch_0
    move-exception v0

    .restart local v0    # "e":Ljava/lang/NumberFormatException;
    move-object p0, v1

    .line 100
    goto :goto_0
.end method

.method public static toInteger(Ljava/lang/Object;)Ljava/lang/Integer;
    .locals 6
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 28
    if-nez p0, :cond_0

    move-object p0, v1

    .line 44
    .end local p0    # "obj":Ljava/lang/Object;
    .local v0, "e":Ljava/lang/NumberFormatException;
    :goto_0
    return-object p0

    .line 30
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_0
    instance-of v2, p0, Ljava/lang/Boolean;

    if-eqz v2, :cond_2

    .line 31
    check-cast p0, Ljava/lang/Boolean;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 32
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_2
    instance-of v2, p0, Ljava/lang/Integer;

    if-eqz v2, :cond_3

    .line 33
    check-cast p0, Ljava/lang/Integer;

    goto :goto_0

    .line 34
    :cond_3
    instance-of v2, p0, Ljava/lang/Long;

    if-eqz v2, :cond_4

    .line 35
    check-cast p0, Ljava/lang/Long;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Long;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_0

    .line 36
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_4
    instance-of v2, p0, Ljava/lang/Float;

    if-eqz v2, :cond_5

    .line 37
    check-cast p0, Ljava/lang/Float;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    const/high16 v2, 0x3f000000    # 0.5f

    add-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_0

    .line 38
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_5
    instance-of v2, p0, Ljava/lang/Double;

    if-eqz v2, :cond_6

    .line 39
    check-cast p0, Ljava/lang/Double;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    const-wide/high16 v4, 0x3fe0000000000000L    # 0.5

    add-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_0

    .line 42
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_6
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    goto :goto_0

    .line 43
    :catch_0
    move-exception v0

    .restart local v0    # "e":Ljava/lang/NumberFormatException;
    move-object p0, v1

    .line 44
    goto :goto_0
.end method

.method public static toLong(Ljava/lang/Object;)Ljava/lang/Long;
    .locals 6
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 56
    if-nez p0, :cond_0

    move-object p0, v1

    .line 72
    .end local p0    # "obj":Ljava/lang/Object;
    .local v0, "e":Ljava/lang/NumberFormatException;
    :goto_0
    return-object p0

    .line 58
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_0
    instance-of v2, p0, Ljava/lang/Boolean;

    if-eqz v2, :cond_2

    .line 59
    check-cast p0, Ljava/lang/Boolean;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    int-to-long v2, v1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 60
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_2
    instance-of v2, p0, Ljava/lang/Integer;

    if-eqz v2, :cond_3

    .line 61
    check-cast p0, Ljava/lang/Integer;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Integer;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    goto :goto_0

    .line 62
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_3
    instance-of v2, p0, Ljava/lang/Long;

    if-eqz v2, :cond_4

    .line 63
    check-cast p0, Ljava/lang/Long;

    goto :goto_0

    .line 64
    :cond_4
    instance-of v2, p0, Ljava/lang/Float;

    if-eqz v2, :cond_5

    .line 65
    check-cast p0, Ljava/lang/Float;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    const/high16 v2, 0x3f000000    # 0.5f

    add-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    goto :goto_0

    .line 66
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_5
    instance-of v2, p0, Ljava/lang/Double;

    if-eqz v2, :cond_6

    .line 67
    check-cast p0, Ljava/lang/Double;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    const-wide/high16 v4, 0x3fe0000000000000L    # 0.5

    add-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    goto :goto_0

    .line 70
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_6
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    goto :goto_0

    .line 71
    :catch_0
    move-exception v0

    .restart local v0    # "e":Ljava/lang/NumberFormatException;
    move-object p0, v1

    .line 72
    goto :goto_0
.end method

.method public static toString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 12
    if-nez p0, :cond_0

    .line 13
    const-string v0, ""

    .line 17
    :goto_0
    return-object v0

    .line 14
    :cond_0
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_2

    .line 15
    check-cast p0, Ljava/lang/Boolean;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "1"

    :goto_1
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, "0"

    goto :goto_1

    .line 17
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
