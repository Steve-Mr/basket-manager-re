.class public Lcom/blank/bm15/model/object/other/MatchPlayoffs;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "MatchPlayoffs.java"


# instance fields
.field private conference:Ljava/lang/Integer;

.field private resultLocal:Ljava/lang/Integer;

.field private resultVisitor:Ljava/lang/Integer;

.field private teamLocal:Lcom/blank/bm15/model/object/crud/Team;

.field private teamLocalPositionConference:Ljava/lang/Integer;

.field private teamVisitor:Lcom/blank/bm15/model/object/crud/Team;

.field private teamVisitorPositionConference:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 20
    return-void
.end method


# virtual methods
.method public getConference()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->conference:Ljava/lang/Integer;

    return-object v0
.end method

.method public getResultLocal()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->resultLocal:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 54
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->resultLocal:Ljava/lang/Integer;

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->resultLocal:Ljava/lang/Integer;

    return-object v0
.end method

.method public getResultVisitor()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->resultVisitor:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 65
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->resultVisitor:Ljava/lang/Integer;

    .line 67
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->resultVisitor:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 31
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->teamLocal:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_0

    .line 32
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->teamLocal:Lcom/blank/bm15/model/object/crud/Team;

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->teamLocal:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0
.end method

.method public getTeamLocalPositionConference()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->teamLocalPositionConference:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;
    .locals 2

    .prologue
    .line 42
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->teamVisitor:Lcom/blank/bm15/model/object/crud/Team;

    if-nez v0, :cond_0

    .line 43
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->teamVisitor:Lcom/blank/bm15/model/object/crud/Team;

    .line 45
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->teamVisitor:Lcom/blank/bm15/model/object/crud/Team;

    return-object v0
.end method

.method public getTeamVisitorPositionConference()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->teamVisitorPositionConference:Ljava/lang/Integer;

    return-object v0
.end method

.method public setConference(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "conference"    # Ljava/lang/Integer;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->conference:Ljava/lang/Integer;

    .line 28
    return-void
.end method

.method public setResultLocal(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "resultLocal"    # Ljava/lang/Integer;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->resultLocal:Ljava/lang/Integer;

    .line 61
    return-void
.end method

.method public setResultVisitor(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "resultVisitor"    # Ljava/lang/Integer;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->resultVisitor:Ljava/lang/Integer;

    .line 72
    return-void
.end method

.method public setTeamLocal(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "teamLocal"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->teamLocal:Lcom/blank/bm15/model/object/crud/Team;

    .line 39
    return-void
.end method

.method public setTeamLocalPositionConference(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "teamLocalPositionConference"    # Ljava/lang/Integer;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->teamLocalPositionConference:Ljava/lang/Integer;

    .line 80
    return-void
.end method

.method public setTeamVisitor(Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0
    .param p1, "teamVisitor"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->teamVisitor:Lcom/blank/bm15/model/object/crud/Team;

    .line 50
    return-void
.end method

.method public setTeamVisitorPositionConference(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "teamVisitorPositionConference"    # Ljava/lang/Integer;

    .prologue
    .line 87
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/MatchPlayoffs;->teamVisitorPositionConference:Ljava/lang/Integer;

    .line 88
    return-void
.end method
