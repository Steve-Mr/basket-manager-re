.class public Lcom/blank/bm15/model/comparator/OfferComparator;
.super Ljava/lang/Object;
.source "OfferComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/blank/bm15/model/object/crud/Offer;",
        ">;"
    }
.end annotation


# static fields
.field public static final ORDER_BY_SALARY:I = 0x0

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
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/comparator/OfferComparator;->orderBy:Ljava/lang/Integer;

    .line 23
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/comparator/OfferComparator;->orderType:Ljava/lang/Integer;

    .line 24
    return-void
.end method


# virtual methods
.method public compare(Lcom/blank/bm15/model/object/crud/Offer;Lcom/blank/bm15/model/object/crud/Offer;)I
    .locals 7
    .param p1, "p1"    # Lcom/blank/bm15/model/object/crud/Offer;
    .param p2, "p2"    # Lcom/blank/bm15/model/object/crud/Offer;

    .prologue
    .line 28
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Offer;->getSalary()Ljava/lang/Integer;

    move-result-object v2

    .line 29
    .local v2, "salary1":Ljava/lang/Integer;
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Offer;->getSalary()Ljava/lang/Integer;

    move-result-object v3

    .line 30
    .local v3, "salary2":Ljava/lang/Integer;
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Offer;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    sget-object v5, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_PLUS:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    div-int/2addr v4, v5

    sget-object v5, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_MED:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    sget-object v6, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_PLUS:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    div-int/2addr v5, v6

    sub-int v0, v4, v5

    .line 31
    .local v0, "percent1":I
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Offer;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    sget-object v5, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_PLUS:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    div-int/2addr v4, v5

    sget-object v5, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_MED:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    sget-object v6, Lcom/blank/bm15/model/util/Constant;->SALARY_CAP_PLUS:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    div-int/2addr v5, v6

    sub-int v1, v4, v5

    .line 33
    .local v1, "percent2":I
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    mul-int/2addr v5, v0

    div-int/lit8 v5, v5, 0x64

    add-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 34
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    mul-int/2addr v5, v1

    div-int/lit8 v5, v5, 0x64

    add-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 36
    iget-object v4, p0, Lcom/blank/bm15/model/comparator/OfferComparator;->orderBy:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-nez v4, :cond_0

    .line 37
    iget-object v4, p0, Lcom/blank/bm15/model/comparator/OfferComparator;->orderType:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v5

    mul-int/2addr v4, v5

    .line 39
    :goto_0
    return v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 1
    check-cast p1, Lcom/blank/bm15/model/object/crud/Offer;

    check-cast p2, Lcom/blank/bm15/model/object/crud/Offer;

    invoke-virtual {p0, p1, p2}, Lcom/blank/bm15/model/comparator/OfferComparator;->compare(Lcom/blank/bm15/model/object/crud/Offer;Lcom/blank/bm15/model/object/crud/Offer;)I

    move-result v0

    return v0
.end method
