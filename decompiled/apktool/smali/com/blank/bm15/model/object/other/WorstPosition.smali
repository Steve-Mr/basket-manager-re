.class public Lcom/blank/bm15/model/object/other/WorstPosition;
.super Ljava/lang/Object;
.source "WorstPosition.java"


# instance fields
.field private averageValue:Ljava/lang/Integer;

.field private position:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0
    .param p1, "position"    # Ljava/lang/Integer;
    .param p2, "averageValue"    # Ljava/lang/Integer;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/WorstPosition;->position:Ljava/lang/Integer;

    .line 11
    iput-object p2, p0, Lcom/blank/bm15/model/object/other/WorstPosition;->averageValue:Ljava/lang/Integer;

    .line 12
    return-void
.end method


# virtual methods
.method public getAverageValue()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/WorstPosition;->averageValue:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPosition()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 15
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/WorstPosition;->position:Ljava/lang/Integer;

    return-object v0
.end method

.method public setAverageValue(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "averageValue"    # Ljava/lang/Integer;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/WorstPosition;->averageValue:Ljava/lang/Integer;

    .line 28
    return-void
.end method

.method public setPosition(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "position"    # Ljava/lang/Integer;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/WorstPosition;->position:Ljava/lang/Integer;

    .line 20
    return-void
.end method
