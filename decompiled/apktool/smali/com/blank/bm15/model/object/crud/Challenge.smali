.class public Lcom/blank/bm15/model/object/crud/Challenge;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "Challenge.java"


# instance fields
.field private acquired:Ljava/lang/Boolean;

.field private season:Ljava/lang/Integer;

.field private teamName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 17
    return-void
.end method


# virtual methods
.method public getAcquired()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Challenge;->acquired:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 41
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/blank/bm15/model/object/crud/Challenge;->acquired:Ljava/lang/Boolean;

    .line 43
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Challenge;->acquired:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getSeason()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Challenge;->season:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTeamName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/blank/bm15/model/object/crud/Challenge;->teamName:Ljava/lang/String;

    return-object v0
.end method

.method public setAcquired(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "acquired"    # Ljava/lang/Boolean;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Challenge;->acquired:Ljava/lang/Boolean;

    .line 48
    return-void
.end method

.method public setSeason(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "season"    # Ljava/lang/Integer;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Challenge;->season:Ljava/lang/Integer;

    .line 37
    return-void
.end method

.method public setTeamName(Ljava/lang/String;)V
    .locals 0
    .param p1, "teamName"    # Ljava/lang/String;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/blank/bm15/model/object/crud/Challenge;->teamName:Ljava/lang/String;

    .line 29
    return-void
.end method
