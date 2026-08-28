.class public Lcom/blank/bm15/model/object/other/Rulete;
.super Ljava/lang/Object;
.source "Rulete.java"


# instance fields
.field private localReserves:[I

.field private localTitulars:[I

.field private match:Lcom/blank/bm15/model/object/crud/Match;

.field private visitorReserves:[I

.field private visitorTitulars:[I


# direct methods
.method public constructor <init>(Lcom/blank/bm15/model/object/crud/Match;)V
    .locals 8
    .param p1, "match"    # Lcom/blank/bm15/model/object/crud/Match;

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/16 v1, 0xa

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Rulete;->match:Lcom/blank/bm15/model/object/crud/Match;

    .line 23
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->localTitulars:[I

    .line 24
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->localReserves:[I

    .line 25
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorTitulars:[I

    .line 26
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorReserves:[I

    .line 28
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->localTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->localReserves:[I

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-direct {p0, v0, v1, v4, v2}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 29
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->localTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->localReserves:[I

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-direct {p0, v0, v1, v5, v2}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 30
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->localTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->localReserves:[I

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-direct {p0, v0, v1, v6, v2}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 31
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->localTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->localReserves:[I

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-direct {p0, v0, v1, v7, v2}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 32
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->localTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->localReserves:[I

    const/4 v2, 0x4

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 33
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->localTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->localReserves:[I

    const/4 v2, 0x5

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 34
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->localTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->localReserves:[I

    const/4 v2, 0x6

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 35
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->localTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->localReserves:[I

    const/4 v2, 0x7

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 36
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->localTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->localReserves:[I

    const/16 v2, 0x8

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 38
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorReserves:[I

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-direct {p0, v0, v1, v4, v2}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 39
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorReserves:[I

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-direct {p0, v0, v1, v5, v2}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 40
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorReserves:[I

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-direct {p0, v0, v1, v6, v2}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 41
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorReserves:[I

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-direct {p0, v0, v1, v7, v2}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 42
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorReserves:[I

    const/4 v2, 0x4

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 43
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorReserves:[I

    const/4 v2, 0x5

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 44
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorReserves:[I

    const/4 v2, 0x6

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 45
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorReserves:[I

    const/4 v2, 0x7

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 46
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorTitulars:[I

    iget-object v1, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorReserves:[I

    const/16 v2, 0x8

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Match;->getTeamVisitor()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/blank/bm15/model/object/other/Rulete;->loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V

    .line 47
    return-void
.end method

.method private getTotalRulete(Lcom/blank/bm15/model/object/crud/Player;I)I
    .locals 13
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;
    .param p2, "ruleteSkill"    # I

    .prologue
    const/4 v12, 0x5

    const/4 v11, 0x4

    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    .line 82
    const/4 v2, 0x0

    .line 84
    .local v2, "total":I
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-gtz v3, :cond_3

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 85
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/MatchResult;->getFoulsMade()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    const-wide/high16 v6, 0x4018000000000000L    # 6.0

    cmpg-double v3, v4, v6

    if-gez v3, :cond_3

    .line 86
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getCurrentMatchResult()Lcom/blank/bm15/model/object/crud/MatchResult;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMinutesPlayed()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 87
    .local v0, "minutesPlayed":I
    move v1, v0

    .line 89
    .local v1, "minutesPlayedForPoints":I
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getIsStarOne()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 90
    add-int/lit8 v1, v1, 0x9

    .line 92
    :cond_0
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getIsStarTwo()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 93
    add-int/lit8 v1, v1, 0x6

    .line 95
    :cond_1
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getIsStarThree()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 96
    add-int/lit8 v1, v1, 0x3

    .line 99
    :cond_2
    if-nez p2, :cond_4

    .line 100
    move v2, v0

    .line 120
    .end local v0    # "minutesPlayed":I
    .end local v1    # "minutesPlayedForPoints":I
    :cond_3
    :goto_0
    return v2

    .line 101
    .restart local v0    # "minutesPlayed":I
    .restart local v1    # "minutesPlayedForPoints":I
    :cond_4
    if-ne p2, v8, :cond_5

    .line 102
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPhysique()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchDefenseModifier()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionMatch()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4, v8}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/2addr v3, v4

    mul-int v2, v3, v0

    .line 103
    goto :goto_0

    :cond_5
    if-ne p2, v9, :cond_6

    .line 104
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillBlock()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchDefenseModifier()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionMatch()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4, v9}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/2addr v3, v4

    mul-int v2, v3, v0

    .line 105
    goto :goto_0

    :cond_6
    if-ne p2, v10, :cond_7

    .line 106
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillSteal()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchDefenseModifier()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionMatch()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4, v10}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/2addr v3, v4

    mul-int v2, v3, v0

    .line 107
    goto :goto_0

    :cond_7
    if-ne p2, v11, :cond_8

    .line 108
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillRebound()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchDefenseModifier()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionMatch()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4, v11}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/2addr v3, v4

    mul-int v2, v3, v0

    .line 109
    goto/16 :goto_0

    :cond_8
    if-ne p2, v12, :cond_9

    .line 110
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPass()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchAttackModifier()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionMatch()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4, v12}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/2addr v3, v4

    mul-int v2, v3, v0

    .line 111
    goto/16 :goto_0

    :cond_9
    const/4 v3, 0x6

    if-ne p2, v3, :cond_a

    .line 112
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotInterior()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchAttackModifier()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionMatch()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x6

    invoke-static {v4, v5}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/2addr v3, v4

    mul-int v2, v3, v1

    .line 113
    goto/16 :goto_0

    :cond_a
    const/4 v3, 0x7

    if-ne p2, v3, :cond_b

    .line 114
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotExterior()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchAttackModifier()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionMatch()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x7

    invoke-static {v4, v5}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/2addr v3, v4

    mul-int v2, v3, v1

    .line 115
    goto/16 :goto_0

    :cond_b
    const/16 v3, 0x8

    if-ne p2, v3, :cond_3

    .line 116
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotFree()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getBaseMatchAttackModifier()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionMatch()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0x8

    invoke-static {v4, v5}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/2addr v3, v4

    mul-int v2, v3, v1

    goto/16 :goto_0
.end method

.method private loadValues([I[IILcom/blank/bm15/model/object/crud/Team;)V
    .locals 5
    .param p1, "titulars"    # [I
    .param p2, "reserves"    # [I
    .param p3, "position"    # I
    .param p4, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 124
    const/4 v2, 0x0

    .line 125
    .local v2, "totalTitulars":I
    invoke-virtual {p4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersTitulars()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_0

    .line 128
    aput v2, p1, p3

    .line 130
    const/4 v1, 0x0

    .line 131
    .local v1, "totalReserves":I
    invoke-virtual {p4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersReserves()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 134
    aput v1, p2, p3

    .line 135
    return-void

    .line 125
    .end local v1    # "totalReserves":I
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 126
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-direct {p0, v0, p3}, Lcom/blank/bm15/model/object/other/Rulete;->getTotalRulete(Lcom/blank/bm15/model/object/crud/Player;I)I

    move-result v4

    add-int/2addr v2, v4

    goto :goto_0

    .line 131
    .end local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .restart local v1    # "totalReserves":I
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 132
    .restart local v0    # "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-direct {p0, v0, p3}, Lcom/blank/bm15/model/object/other/Rulete;->getTotalRulete(Lcom/blank/bm15/model/object/crud/Player;I)I

    move-result v4

    add-int/2addr v1, v4

    goto :goto_1
.end method


# virtual methods
.method public getRulete(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/crud/Player;
    .locals 8
    .param p1, "ruleteSkill"    # Ljava/lang/Integer;
    .param p2, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 52
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticBenchImportance()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    rsub-int/lit8 v1, v6, 0x6

    .line 53
    .local v1, "benchImportance":I
    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ge v6, v1, :cond_2

    .line 54
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersTitulars()Ljava/util/List;

    move-result-object v2

    .line 55
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    iget-object v7, p0, Lcom/blank/bm15/model/object/other/Rulete;->match:Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 56
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->localTitulars:[I

    .line 69
    .local v0, "array":[I
    :goto_0
    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v7

    aget v7, v0, v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 70
    .local v4, "random":I
    const/4 v5, 0x0

    .line 71
    .local v5, "total":I
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_4

    .line 78
    const/4 v3, 0x0

    :goto_1
    return-object v3

    .line 58
    .end local v0    # "array":[I
    .end local v4    # "random":I
    .end local v5    # "total":I
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorTitulars:[I

    .line 60
    .restart local v0    # "array":[I
    goto :goto_0

    .line 61
    .end local v0    # "array":[I
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    :cond_2
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayersReserves()Ljava/util/List;

    move-result-object v2

    .line 62
    .restart local v2    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v6

    iget-object v7, p0, Lcom/blank/bm15/model/object/other/Rulete;->match:Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 63
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->localReserves:[I

    .line 64
    .restart local v0    # "array":[I
    goto :goto_0

    .line 65
    .end local v0    # "array":[I
    :cond_3
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Rulete;->visitorReserves:[I

    .restart local v0    # "array":[I
    goto :goto_0

    .line 71
    .restart local v4    # "random":I
    .restart local v5    # "total":I
    :cond_4
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    .line 72
    .local v3, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-direct {p0, v3, v7}, Lcom/blank/bm15/model/object/other/Rulete;->getTotalRulete(Lcom/blank/bm15/model/object/crud/Player;I)I

    move-result v7

    add-int/2addr v5, v7

    .line 74
    if-lt v5, v4, :cond_0

    goto :goto_1
.end method
