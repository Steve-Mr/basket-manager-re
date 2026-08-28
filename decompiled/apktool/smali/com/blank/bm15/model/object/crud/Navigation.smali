.class public Lcom/blank/bm15/model/object/crud/Navigation;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "Navigation.java"


# instance fields
.field private idFragment:Ljava/lang/Integer;

.field private idObject:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 14
    return-void
.end method


# virtual methods
.method public getIdFragment()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Navigation;->idFragment:Ljava/lang/Integer;

    return-object v0
.end method

.method public getIdObject()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Navigation;->idObject:Ljava/lang/Integer;

    return-object v0
.end method

.method public setIdFragment(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "idFragment"    # Ljava/lang/Integer;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Navigation;->idFragment:Ljava/lang/Integer;

    .line 26
    return-void
.end method

.method public setIdObject(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "idObject"    # Ljava/lang/Integer;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Navigation;->idObject:Ljava/lang/Integer;

    .line 34
    return-void
.end method
