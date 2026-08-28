.class public Lcom/blank/bm15/model/comparator/NavigationComparator;
.super Ljava/lang/Object;
.source "NavigationComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/blank/bm15/model/object/crud/Navigation;",
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
.method public compare(Lcom/blank/bm15/model/object/crud/Navigation;Lcom/blank/bm15/model/object/crud/Navigation;)I
    .locals 2
    .param p1, "n1"    # Lcom/blank/bm15/model/object/crud/Navigation;
    .param p2, "n2"    # Lcom/blank/bm15/model/object/crud/Navigation;

    .prologue
    .line 18
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Navigation;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Navigation;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v0

    mul-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 1
    check-cast p1, Lcom/blank/bm15/model/object/crud/Navigation;

    check-cast p2, Lcom/blank/bm15/model/object/crud/Navigation;

    invoke-virtual {p0, p1, p2}, Lcom/blank/bm15/model/comparator/NavigationComparator;->compare(Lcom/blank/bm15/model/object/crud/Navigation;Lcom/blank/bm15/model/object/crud/Navigation;)I

    move-result v0

    return v0
.end method
