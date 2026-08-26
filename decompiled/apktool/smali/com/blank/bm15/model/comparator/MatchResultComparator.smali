.class public Lcom/blank/bm15/model/comparator/MatchResultComparator;
.super Ljava/lang/Object;
.source "MatchResultComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/blank/bm15/model/object/crud/MatchResult;",
        ">;"
    }
.end annotation


# static fields
.field public static final ORDER_BY_PER:I = 0x0

.field public static final ORDER_BY_STATISTICS:I = 0x1

.field public static final ORDER_TYPE_ASC:I = 0x1

.field public static final ORDER_TYPE_DESC:I = -0x1


# instance fields
.field private orderBy:Ljava/lang/Integer;

.field private orderType:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .param p1, "orderBy"    # I
    .param p2, "orderType"    # I

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/comparator/MatchResultComparator;->orderBy:Ljava/lang/Integer;

    .line 24
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/comparator/MatchResultComparator;->orderType:Ljava/lang/Integer;

    .line 25
    return-void
.end method


# virtual methods
.method public compare(Lcom/blank/bm15/model/object/crud/MatchResult;Lcom/blank/bm15/model/object/crud/MatchResult;)I
    .locals 6
    .param p1, "p1"    # Lcom/blank/bm15/model/object/crud/MatchResult;
    .param p2, "p2"    # Lcom/blank/bm15/model/object/crud/MatchResult;

    .prologue
    const/4 v3, 0x1

    .line 30
    iget-object v2, p0, Lcom/blank/bm15/model/comparator/MatchResultComparator;->orderBy:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_0

    .line 31
    iget-object v2, p0, Lcom/blank/bm15/model/comparator/MatchResultComparator;->orderType:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPer()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPer()Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Double;->compareTo(Ljava/lang/Double;)I

    move-result v3

    mul-int/2addr v2, v3

    .line 38
    :goto_0
    return v2

    .line 32
    :cond_0
    iget-object v2, p0, Lcom/blank/bm15/model/comparator/MatchResultComparator;->orderBy:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v3, :cond_3

    .line 33
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPer()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->intValue()I

    move-result v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    div-int/lit8 v4, v4, 0xa

    add-int/2addr v4, v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMinutesPlayed()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    div-int/2addr v2, v5

    if-nez v2, :cond_1

    move v2, v3

    :goto_1
    add-int/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 34
    .local v0, "intP1":Ljava/lang/Integer;
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPer()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->intValue()I

    move-result v2

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    div-int/lit8 v4, v4, 0xa

    add-int/2addr v2, v4

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMinutesPlayed()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    div-int/2addr v4, v5

    if-nez v4, :cond_2

    :goto_2
    add-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 36
    .local v1, "intP2":Ljava/lang/Integer;
    iget-object v2, p0, Lcom/blank/bm15/model/comparator/MatchResultComparator;->orderType:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v1}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v3

    mul-int/2addr v2, v3

    goto :goto_0

    .line 33
    .end local v0    # "intP1":Ljava/lang/Integer;
    .end local v1    # "intP2":Ljava/lang/Integer;
    :cond_1
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    div-int/lit8 v2, v2, 0xa

    goto :goto_1

    .line 34
    .restart local v0    # "intP1":Ljava/lang/Integer;
    :cond_2
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatches()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    div-int/lit8 v3, v3, 0xa

    goto :goto_2

    .line 38
    .end local v0    # "intP1":Ljava/lang/Integer;
    :cond_3
    const/4 v2, 0x0

    goto/16 :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 1
    check-cast p1, Lcom/blank/bm15/model/object/crud/MatchResult;

    check-cast p2, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0, p1, p2}, Lcom/blank/bm15/model/comparator/MatchResultComparator;->compare(Lcom/blank/bm15/model/object/crud/MatchResult;Lcom/blank/bm15/model/object/crud/MatchResult;)I

    move-result v0

    return v0
.end method
