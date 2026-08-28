.class public Lcom/blank/bm15/model/comparator/PlayerOrDraftRoundComparator;
.super Ljava/lang/Object;
.source "PlayerOrDraftRoundComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field public static final ORDER_BY_MARKET_VALUE:I = 0x0

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

    iput-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerOrDraftRoundComparator;->orderBy:Ljava/lang/Integer;

    .line 24
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerOrDraftRoundComparator;->orderType:Ljava/lang/Integer;

    .line 25
    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 4
    .param p1, "p1"    # Ljava/lang/Object;
    .param p2, "p2"    # Ljava/lang/Object;

    .prologue
    const-wide/16 v2, 0x0

    .line 29
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 30
    .local v0, "value1":Ljava/lang/Double;
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 32
    .local v1, "value2":Ljava/lang/Double;
    instance-of v2, p1, Lcom/blank/bm15/model/object/crud/Player;

    if-eqz v2, :cond_0

    .line 33
    check-cast p1, Lcom/blank/bm15/model/object/crud/Player;

    .end local p1    # "p1":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getMarketValue()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 38
    :goto_0
    instance-of v2, p2, Lcom/blank/bm15/model/object/crud/Player;

    if-eqz v2, :cond_1

    .line 39
    check-cast p2, Lcom/blank/bm15/model/object/crud/Player;

    .end local p2    # "p2":Ljava/lang/Object;
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getMarketValue()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 44
    :goto_1
    iget-object v2, p0, Lcom/blank/bm15/model/comparator/PlayerOrDraftRoundComparator;->orderBy:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_2

    .line 45
    iget-object v2, p0, Lcom/blank/bm15/model/comparator/PlayerOrDraftRoundComparator;->orderType:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v1}, Ljava/lang/Double;->compareTo(Ljava/lang/Double;)I

    move-result v3

    mul-int/2addr v2, v3

    .line 47
    :goto_2
    return v2

    .line 35
    .restart local p1    # "p1":Ljava/lang/Object;
    .restart local p2    # "p2":Ljava/lang/Object;
    :cond_0
    check-cast p1, Lcom/blank/bm15/model/object/crud/DraftRound;

    .end local p1    # "p1":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/DraftRound;->getMarketValue()Ljava/lang/Double;

    move-result-object v0

    goto :goto_0

    .line 41
    :cond_1
    check-cast p2, Lcom/blank/bm15/model/object/crud/DraftRound;

    .end local p2    # "p2":Ljava/lang/Object;
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/DraftRound;->getMarketValue()Ljava/lang/Double;

    move-result-object v1

    goto :goto_1

    .line 47
    :cond_2
    const/4 v2, 0x0

    goto :goto_2
.end method
