.class public Lcom/blank/bm15/model/object/other/Roster;
.super Lcom/blank/bm15/dao/utils/BlankBase;
.source "Roster.java"


# instance fields
.field private age:Ljava/lang/Integer;

.field private name:Ljava/lang/String;

.field private positionFirst:Ljava/lang/Integer;

.field private positionSecond:Ljava/lang/Integer;

.field private potential:Ljava/lang/Integer;

.field private salary:Ljava/lang/Integer;

.field private skillBlock:Ljava/lang/Integer;

.field private skillPass:Ljava/lang/Integer;

.field private skillPhysique:Ljava/lang/Integer;

.field private skillRebound:Ljava/lang/Integer;

.field private skillShotExterior:Ljava/lang/Integer;

.field private skillShotFree:Ljava/lang/Integer;

.field private skillShotInterior:Ljava/lang/Integer;

.field private skillSteal:Ljava/lang/Integer;

.field private team:Ljava/lang/String;

.field private yearsContract:Ljava/lang/Integer;

.field private yearsExperience:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/utils/BlankBase;-><init>(Landroid/content/Context;)V

    .line 37
    return-void
.end method


# virtual methods
.method public getAge()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->age:Ljava/lang/Integer;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPositionFirst()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->positionFirst:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPositionSecond()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->positionSecond:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 91
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->positionSecond:Ljava/lang/Integer;

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->positionSecond:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPotential()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->potential:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSalary()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->salary:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillBlock()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillBlock:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillPass()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillPass:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillPhysique()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillPhysique:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillRebound()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillRebound:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillShotExterior()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillShotExterior:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillShotFree()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillShotFree:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillShotInterior()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillShotInterior:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSkillSteal()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillSteal:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTeam()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->team:Ljava/lang/String;

    return-object v0
.end method

.method public getYearsContract()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->yearsContract:Ljava/lang/Integer;

    return-object v0
.end method

.method public getYearsExperience()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->yearsExperience:Ljava/lang/Integer;

    return-object v0
.end method

.method public loadPlayer(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 1
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 40
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 41
    const-string v0, "0"

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->team:Ljava/lang/String;

    .line 46
    :goto_0
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->name:Ljava/lang/String;

    .line 47
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->positionFirst:Ljava/lang/Integer;

    .line 48
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->positionSecond:Ljava/lang/Integer;

    .line 49
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->potential:Ljava/lang/Integer;

    .line 50
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->age:Ljava/lang/Integer;

    .line 51
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->salary:Ljava/lang/Integer;

    .line 52
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getYearsContract()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->yearsContract:Ljava/lang/Integer;

    .line 53
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getYearsExperience()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->yearsExperience:Ljava/lang/Integer;

    .line 55
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillBlock()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillBlock:Ljava/lang/Integer;

    .line 56
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPass()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillPass:Ljava/lang/Integer;

    .line 57
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPhysique()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillPhysique:Ljava/lang/Integer;

    .line 58
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillRebound()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillRebound:Ljava/lang/Integer;

    .line 59
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillSteal()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillSteal:Ljava/lang/Integer;

    .line 60
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotInterior()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillShotInterior:Ljava/lang/Integer;

    .line 61
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotExterior()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillShotExterior:Ljava/lang/Integer;

    .line 62
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotFree()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->skillShotFree:Ljava/lang/Integer;

    .line 63
    return-void

    .line 43
    :cond_0
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Roster;->team:Ljava/lang/String;

    goto :goto_0
.end method

.method public setAge(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "age"    # Ljava/lang/Integer;

    .prologue
    .line 113
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->age:Ljava/lang/Integer;

    .line 114
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->name:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public setPositionFirst(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "positionFirst"    # Ljava/lang/Integer;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->positionFirst:Ljava/lang/Integer;

    .line 87
    return-void
.end method

.method public setPositionSecond(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "positionSecond"    # Ljava/lang/Integer;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->positionSecond:Ljava/lang/Integer;

    .line 98
    return-void
.end method

.method public setPotential(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "potential"    # Ljava/lang/Integer;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->potential:Ljava/lang/Integer;

    .line 106
    return-void
.end method

.method public setSalary(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "salary"    # Ljava/lang/Integer;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->salary:Ljava/lang/Integer;

    .line 122
    return-void
.end method

.method public setSkillBlock(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "skillBlock"    # Ljava/lang/Integer;

    .prologue
    .line 145
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->skillBlock:Ljava/lang/Integer;

    .line 146
    return-void
.end method

.method public setSkillPass(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "skillPass"    # Ljava/lang/Integer;

    .prologue
    .line 153
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->skillPass:Ljava/lang/Integer;

    .line 154
    return-void
.end method

.method public setSkillPhysique(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "skillPhysique"    # Ljava/lang/Integer;

    .prologue
    .line 161
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->skillPhysique:Ljava/lang/Integer;

    .line 162
    return-void
.end method

.method public setSkillRebound(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "skillRebound"    # Ljava/lang/Integer;

    .prologue
    .line 169
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->skillRebound:Ljava/lang/Integer;

    .line 170
    return-void
.end method

.method public setSkillShotExterior(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "skillShotExterior"    # Ljava/lang/Integer;

    .prologue
    .line 193
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->skillShotExterior:Ljava/lang/Integer;

    .line 194
    return-void
.end method

.method public setSkillShotFree(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "skillShotFree"    # Ljava/lang/Integer;

    .prologue
    .line 201
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->skillShotFree:Ljava/lang/Integer;

    .line 202
    return-void
.end method

.method public setSkillShotInterior(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "skillShotInterior"    # Ljava/lang/Integer;

    .prologue
    .line 185
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->skillShotInterior:Ljava/lang/Integer;

    .line 186
    return-void
.end method

.method public setSkillSteal(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "skillSteal"    # Ljava/lang/Integer;

    .prologue
    .line 177
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->skillSteal:Ljava/lang/Integer;

    .line 178
    return-void
.end method

.method public setTeam(Ljava/lang/String;)V
    .locals 0
    .param p1, "team"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->team:Ljava/lang/String;

    .line 79
    return-void
.end method

.method public setYearsContract(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "yearsContract"    # Ljava/lang/Integer;

    .prologue
    .line 129
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->yearsContract:Ljava/lang/Integer;

    .line 130
    return-void
.end method

.method public setYearsExperience(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "yearsExperience"    # Ljava/lang/Integer;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Roster;->yearsExperience:Ljava/lang/Integer;

    .line 138
    return-void
.end method
