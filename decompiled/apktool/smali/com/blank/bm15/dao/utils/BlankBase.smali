.class public Lcom/blank/bm15/dao/utils/BlankBase;
.super Ljava/lang/Object;
.source "BlankBase.java"


# instance fields
.field private context:Landroid/content/Context;

.field private id:Ljava/lang/Integer;

.field private tempLoaded:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/blank/bm15/dao/utils/BlankBase;->context:Landroid/content/Context;

    .line 15
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/blank/bm15/dao/utils/BlankBase;->tempLoaded:Ljava/lang/Boolean;

    .line 16
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 40
    instance-of v1, p1, Lcom/blank/bm15/dao/utils/BlankBase;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 41
    check-cast v0, Lcom/blank/bm15/dao/utils/BlankBase;

    .line 42
    .local v0, "object":Lcom/blank/bm15/dao/utils/BlankBase;
    invoke-virtual {p0}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 43
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 46
    .end local v0    # "object":Lcom/blank/bm15/dao/utils/BlankBase;
    :goto_0
    return v1

    :cond_0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/blank/bm15/dao/utils/BlankBase;->context:Landroid/content/Context;

    return-object v0
.end method

.method public getId()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/blank/bm15/dao/utils/BlankBase;->id:Ljava/lang/Integer;

    return-object v0
.end method

.method public isNotLoaded()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/blank/bm15/dao/utils/BlankBase;->tempLoaded:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public load()V
    .locals 1

    .prologue
    .line 35
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/blank/bm15/dao/utils/BlankBase;->tempLoaded:Ljava/lang/Boolean;

    .line 36
    return-void
.end method

.method public setId(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/Integer;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/blank/bm15/dao/utils/BlankBase;->id:Ljava/lang/Integer;

    .line 28
    return-void
.end method
