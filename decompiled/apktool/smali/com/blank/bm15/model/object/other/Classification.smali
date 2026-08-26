.class public Lcom/blank/bm15/model/object/other/Classification;
.super Lcom/blank/bm15/model/object/crud/League;
.source "Classification.java"


# instance fields
.field private conference:Ljava/lang/Integer;

.field private division:Ljava/lang/Integer;

.field private isClassified:Ljava/lang/Boolean;

.field private name:Ljava/lang/String;

.field private positionInConference:Ljava/lang/Integer;

.field private positionInDivision:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/blank/bm15/model/object/crud/League;-><init>(Landroid/content/Context;)V

    .line 19
    return-void
.end method


# virtual methods
.method public getConference()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Classification;->conference:Ljava/lang/Integer;

    return-object v0
.end method

.method public getDivision()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Classification;->division:Ljava/lang/Integer;

    return-object v0
.end method

.method public getIsClassified()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Classification;->isClassified:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Classification;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPositionInConference()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Classification;->positionInConference:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPositionInDivision()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Classification;->positionInDivision:Ljava/lang/Integer;

    return-object v0
.end method

.method public setConference(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "conference"    # Ljava/lang/Integer;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Classification;->conference:Ljava/lang/Integer;

    .line 35
    return-void
.end method

.method public setDivision(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "division"    # Ljava/lang/Integer;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Classification;->division:Ljava/lang/Integer;

    .line 43
    return-void
.end method

.method public setIsClassified(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "isClassified"    # Ljava/lang/Boolean;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Classification;->isClassified:Ljava/lang/Boolean;

    .line 67
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Classification;->name:Ljava/lang/String;

    .line 27
    return-void
.end method

.method public setPositionInConference(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "positionInConference"    # Ljava/lang/Integer;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Classification;->positionInConference:Ljava/lang/Integer;

    .line 51
    return-void
.end method

.method public setPositionInDivision(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "positionInDivision"    # Ljava/lang/Integer;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Classification;->positionInDivision:Ljava/lang/Integer;

    .line 59
    return-void
.end method
