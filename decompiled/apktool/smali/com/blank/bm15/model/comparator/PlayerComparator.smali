.class public Lcom/blank/bm15/model/comparator/PlayerComparator;
.super Ljava/lang/Object;
.source "PlayerComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/blank/bm15/model/object/crud/Player;",
        ">;"
    }
.end annotation


# static fields
.field public static final ORDER_BY_AGE:I = 0x5

.field public static final ORDER_BY_AVERAGE_ALL:I = 0x1

.field public static final ORDER_BY_AVERAGE_ATTACK:I = 0x2

.field public static final ORDER_BY_AVERAGE_DEFENSE:I = 0x3

.field public static final ORDER_BY_POSITION:I = 0x6

.field public static final ORDER_BY_POTENTIAL:I = 0x4

.field public static final ORDER_BY_VALUE:I = 0x0

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
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderBy:Ljava/lang/Integer;

    .line 29
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderType:Ljava/lang/Integer;

    .line 30
    return-void
.end method


# virtual methods
.method public compare(Lcom/blank/bm15/model/object/crud/Player;Lcom/blank/bm15/model/object/crud/Player;)I
    .locals 3
    .param p1, "p1"    # Lcom/blank/bm15/model/object/crud/Player;
    .param p2, "p2"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderBy:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    .line 36
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderType:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getValue()Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getValue()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Double;->compareTo(Ljava/lang/Double;)I

    move-result v1

    mul-int/2addr v0, v1

    .line 50
    :goto_0
    return v0

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderBy:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 38
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderType:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Double;->compareTo(Ljava/lang/Double;)I

    move-result v1

    mul-int/2addr v0, v1

    goto :goto_0

    .line 39
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderBy:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 40
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderType:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAttack()Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAttack()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Double;->compareTo(Ljava/lang/Double;)I

    move-result v1

    mul-int/2addr v0, v1

    goto :goto_0

    .line 41
    :cond_2
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderBy:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    .line 42
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderType:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillDefense()Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillDefense()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Double;->compareTo(Ljava/lang/Double;)I

    move-result v1

    mul-int/2addr v0, v1

    goto :goto_0

    .line 43
    :cond_3
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderBy:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_4

    .line 44
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderType:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v1

    mul-int/2addr v0, v1

    goto :goto_0

    .line 45
    :cond_4
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderBy:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_5

    .line 46
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderType:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v1

    mul-int/2addr v0, v1

    goto/16 :goto_0

    .line 47
    :cond_5
    iget-object v0, p0, Lcom/blank/bm15/model/comparator/PlayerComparator;->orderBy:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_6

    .line 48
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v0

    goto/16 :goto_0

    .line 50
    :cond_6
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 1
    check-cast p1, Lcom/blank/bm15/model/object/crud/Player;

    check-cast p2, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0, p1, p2}, Lcom/blank/bm15/model/comparator/PlayerComparator;->compare(Lcom/blank/bm15/model/object/crud/Player;Lcom/blank/bm15/model/object/crud/Player;)I

    move-result v0

    return v0
.end method
