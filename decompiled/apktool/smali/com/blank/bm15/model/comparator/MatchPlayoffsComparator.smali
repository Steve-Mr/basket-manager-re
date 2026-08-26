.class public Lcom/blank/bm15/model/comparator/MatchPlayoffsComparator;
.super Ljava/lang/Object;
.source "MatchPlayoffsComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/blank/bm15/model/object/other/MatchPlayoffs;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method


# virtual methods
.method public compare(Lcom/blank/bm15/model/object/other/MatchPlayoffs;Lcom/blank/bm15/model/object/other/MatchPlayoffs;)I
    .locals 3
    .param p1, "object1"    # Lcom/blank/bm15/model/object/other/MatchPlayoffs;
    .param p2, "object2"    # Lcom/blank/bm15/model/object/other/MatchPlayoffs;

    .prologue
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getConference()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getConference()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 20
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getConference()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getConference()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 21
    const/4 v0, -0x1

    .line 28
    :cond_0
    :goto_0
    return v0

    .line 22
    :cond_1
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getConference()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getConference()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-le v1, v2, :cond_0

    .line 23
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 1
    check-cast p1, Lcom/blank/bm15/model/object/other/MatchPlayoffs;

    check-cast p2, Lcom/blank/bm15/model/object/other/MatchPlayoffs;

    invoke-virtual {p0, p1, p2}, Lcom/blank/bm15/model/comparator/MatchPlayoffsComparator;->compare(Lcom/blank/bm15/model/object/other/MatchPlayoffs;Lcom/blank/bm15/model/object/other/MatchPlayoffs;)I

    move-result v0

    return v0
.end method
