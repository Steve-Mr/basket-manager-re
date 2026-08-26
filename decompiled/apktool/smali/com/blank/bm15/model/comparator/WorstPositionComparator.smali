.class public Lcom/blank/bm15/model/comparator/WorstPositionComparator;
.super Ljava/lang/Object;
.source "WorstPositionComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/blank/bm15/model/object/other/WorstPosition;",
        ">;"
    }
.end annotation


# static fields
.field public static final ORDER_BY_VALUE:I = 0x0

.field public static final ORDER_TYPE_ASC:I = 0x1


# instance fields
.field private orderBy:Ljava/lang/Integer;

.field private orderType:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .param p1, "orderBy"    # I
    .param p2, "orderType"    # I

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/comparator/WorstPositionComparator;->orderBy:Ljava/lang/Integer;

    .line 22
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/comparator/WorstPositionComparator;->orderType:Ljava/lang/Integer;

    .line 23
    return-void
.end method


# virtual methods
.method public compare(Lcom/blank/bm15/model/object/other/WorstPosition;Lcom/blank/bm15/model/object/other/WorstPosition;)I
    .locals 3
    .param p1, "p1"    # Lcom/blank/bm15/model/object/other/WorstPosition;
    .param p2, "p2"    # Lcom/blank/bm15/model/object/other/WorstPosition;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/WorstPositionComparator;->orderBy:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    .line 29
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/WorstPositionComparator;->orderType:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/other/WorstPosition;->getAverageValue()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/other/WorstPosition;->getAverageValue()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v1

    mul-int/2addr v0, v1

    .line 31
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 1
    check-cast p1, Lcom/blank/bm15/model/object/other/WorstPosition;

    check-cast p2, Lcom/blank/bm15/model/object/other/WorstPosition;

    invoke-virtual {p0, p1, p2}, Lcom/blank/bm15/model/comparator/WorstPositionComparator;->compare(Lcom/blank/bm15/model/object/other/WorstPosition;Lcom/blank/bm15/model/object/other/WorstPosition;)I

    move-result v0

    return v0
.end method
