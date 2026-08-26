.class public Lcom/blank/bm15/model/object/other/MatchdayCalendar;
.super Ljava/lang/Object;
.source "MatchdayCalendar.java"


# instance fields
.field private matchday:Ljava/lang/Integer;

.field private teamLocal:Ljava/lang/String;

.field private teamVisitor:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Playoffs;Lcom/blank/bm15/model/object/crud/Playoffs;Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "matchday"    # Ljava/lang/Integer;
    .param p2, "teamA"    # Lcom/blank/bm15/model/object/crud/Playoffs;
    .param p3, "teamB"    # Lcom/blank/bm15/model/object/crud/Playoffs;
    .param p4, "isLocal"    # Ljava/lang/Boolean;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->matchday:Ljava/lang/Integer;

    .line 20
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getGamesWon()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getGamesWon()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-le v0, v1, :cond_2

    .line 21
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamLocal:Ljava/lang/String;

    .line 22
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamVisitor:Ljava/lang/String;

    .line 43
    :goto_2
    return-void

    .line 21
    :cond_0
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 22
    :cond_1
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 23
    :cond_2
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getGamesWon()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getGamesWon()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ge v0, v1, :cond_5

    .line 24
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_3
    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamVisitor:Ljava/lang/String;

    .line 25
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_4
    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamLocal:Ljava/lang/String;

    goto :goto_2

    .line 24
    :cond_3
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 25
    :cond_4
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 27
    :cond_5
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPointsDiff()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPointsDiff()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-le v0, v1, :cond_8

    .line 28
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_5
    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamLocal:Ljava/lang/String;

    .line 29
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_6
    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamVisitor:Ljava/lang/String;

    goto/16 :goto_2

    .line 28
    :cond_6
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    .line 29
    :cond_7
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 30
    :cond_8
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPointsDiff()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPointsDiff()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ge v0, v1, :cond_b

    .line 31
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_7
    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamVisitor:Ljava/lang/String;

    .line 32
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_8
    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamLocal:Ljava/lang/String;

    goto/16 :goto_2

    .line 31
    :cond_9
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 32
    :cond_a
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_8

    .line 34
    :cond_b
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPointsScored()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getPointsScored()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lt v0, v1, :cond_e

    .line 35
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_9
    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamLocal:Ljava/lang/String;

    .line 36
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_a
    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamVisitor:Ljava/lang/String;

    goto/16 :goto_2

    .line 35
    :cond_c
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_9

    .line 36
    :cond_d
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 38
    :cond_e
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_b
    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamVisitor:Ljava/lang/String;

    .line 39
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_c
    iput-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamLocal:Ljava/lang/String;

    goto/16 :goto_2

    .line 38
    :cond_f
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_b

    .line 39
    :cond_10
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Playoffs;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_c
.end method

.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "matchday"    # Ljava/lang/Integer;
    .param p2, "teamLocal"    # Ljava/lang/String;
    .param p3, "teamVisitor"    # Ljava/lang/String;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->matchday:Ljava/lang/Integer;

    .line 13
    iput-object p2, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamLocal:Ljava/lang/String;

    .line 14
    iput-object p3, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamVisitor:Ljava/lang/String;

    .line 15
    return-void
.end method


# virtual methods
.method public getMatchday()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->matchday:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTeamLocal()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamLocal:Ljava/lang/String;

    return-object v0
.end method

.method public getTeamVisitor()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamVisitor:Ljava/lang/String;

    return-object v0
.end method

.method public setMatchday(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "matchday"    # Ljava/lang/Integer;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->matchday:Ljava/lang/Integer;

    .line 51
    return-void
.end method

.method public setTeamLocal(Ljava/lang/String;)V
    .locals 0
    .param p1, "teamLocal"    # Ljava/lang/String;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamLocal:Ljava/lang/String;

    .line 59
    return-void
.end method

.method public setTeamVisitor(Ljava/lang/String;)V
    .locals 0
    .param p1, "teamVisitor"    # Ljava/lang/String;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/MatchdayCalendar;->teamVisitor:Ljava/lang/String;

    .line 67
    return-void
.end method
