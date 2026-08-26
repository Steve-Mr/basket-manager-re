.class public Lcom/blank/bm15/model/core/ManageFreeAgency;
.super Ljava/lang/Object;
.source "ManageFreeAgency.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createSecondaryPlayer(Lcom/blank/bm15/model/object/crud/Team;I)Lcom/blank/bm15/model/object/crud/Player;
    .locals 8
    .param p0, "team"    # Lcom/blank/bm15/model/object/crud/Team;
    .param p1, "position"    # I

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x5

    const/4 v3, 0x0

    const/16 v5, 0xa

    const/16 v4, 0x1e

    .line 207
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 208
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 209
    invoke-virtual {v0, p0}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 210
    invoke-static {}, Lcom/blank/bm15/model/generator/Names;->getFullName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setName(Ljava/lang/String;)V

    .line 211
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setPotential(Ljava/lang/Integer;)V

    .line 212
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    .line 213
    const/16 v1, 0x13

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x17

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setAge(Ljava/lang/Integer;)V

    .line 214
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setStateInjury(Ljava/lang/Integer;)V

    .line 215
    const/16 v1, 0x63

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setStateEnergy(Ljava/lang/Integer;)V

    .line 216
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    .line 217
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setLoyalty(Ljava/lang/Integer;)V

    .line 218
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setYearsExperience(Ljava/lang/Integer;)V

    .line 219
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setYearsContract(Ljava/lang/Integer;)V

    .line 220
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x46

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setStateForm(Ljava/lang/Integer;)V

    .line 222
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1, v7}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setSkillPhysique(Ljava/lang/Integer;)V

    .line 223
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x2

    invoke-static {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setSkillBlock(Ljava/lang/Integer;)V

    .line 224
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x3

    invoke-static {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setSkillSteal(Ljava/lang/Integer;)V

    .line 225
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x4

    invoke-static {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setSkillRebound(Ljava/lang/Integer;)V

    .line 226
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1, v6}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setSkillPass(Ljava/lang/Integer;)V

    .line 227
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x6

    invoke-static {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotInterior(Ljava/lang/Integer;)V

    .line 228
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x7

    invoke-static {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotExterior(Ljava/lang/Integer;)V

    .line 229
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x8

    invoke-static {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->getBaseOfPosition(II)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotFree(Ljava/lang/Integer;)V

    .line 231
    return-object v0
.end method

.method private static getFewPlayersInPosition(Lcom/blank/bm15/model/object/crud/Team;)Z
    .locals 8
    .param p0, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x3

    .line 148
    invoke-virtual {p0, v5}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v2

    .line 149
    .local v2, "numPG":I
    const/4 v6, 0x2

    invoke-virtual {p0, v6}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v4

    .line 150
    .local v4, "numSG":I
    invoke-virtual {p0, v7}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v3

    .line 151
    .local v3, "numSF":I
    const/4 v6, 0x4

    invoke-virtual {p0, v6}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v1

    .line 152
    .local v1, "numPF":I
    const/4 v6, 0x5

    invoke-virtual {p0, v6}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v0

    .line 154
    .local v0, "numCE":I
    if-lt v2, v7, :cond_0

    if-lt v4, v7, :cond_0

    if-lt v3, v7, :cond_0

    if-lt v1, v7, :cond_0

    if-lt v0, v7, :cond_0

    const/4 v5, 0x0

    :cond_0
    return v5
.end method

.method private static getWeakerPositionOfTeam(Lcom/blank/bm15/model/object/crud/Team;)I
    .locals 12
    .param p0, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    const/4 v9, 0x5

    const/4 v8, 0x4

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v7, 0x3

    .line 158
    invoke-virtual {p0, v5}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v2

    .line 159
    .local v2, "numPG":I
    invoke-virtual {p0, v6}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v4

    .line 160
    .local v4, "numSG":I
    invoke-virtual {p0, v7}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v3

    .line 161
    .local v3, "numSF":I
    invoke-virtual {p0, v8}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v1

    .line 162
    .local v1, "numPF":I
    invoke-virtual {p0, v9}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v0

    .line 164
    .local v0, "numCE":I
    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-nez v10, :cond_5

    .line 165
    if-ge v2, v7, :cond_1

    .line 190
    :cond_0
    :goto_0
    return v5

    .line 167
    :cond_1
    if-ge v4, v7, :cond_2

    move v5, v6

    .line 168
    goto :goto_0

    .line 169
    :cond_2
    if-ge v3, v7, :cond_3

    move v5, v7

    .line 170
    goto :goto_0

    .line 171
    :cond_3
    if-ge v1, v7, :cond_4

    move v5, v8

    .line 172
    goto :goto_0

    .line 173
    :cond_4
    if-ge v0, v7, :cond_a

    move v5, v9

    .line 174
    goto :goto_0

    .line 177
    :cond_5
    if-ge v0, v7, :cond_6

    move v5, v9

    .line 178
    goto :goto_0

    .line 179
    :cond_6
    if-ge v2, v7, :cond_7

    move v5, v8

    .line 180
    goto :goto_0

    .line 181
    :cond_7
    if-ge v3, v7, :cond_8

    move v5, v7

    .line 182
    goto :goto_0

    .line 183
    :cond_8
    if-ge v4, v7, :cond_9

    move v5, v6

    .line 184
    goto :goto_0

    .line 185
    :cond_9
    if-lt v2, v7, :cond_0

    .line 190
    :cond_a
    invoke-static {p0}, Lcom/blank/bm15/model/core/ManageFreeAgency;->getWorstPositionOfTeam(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/other/WorstPosition;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/other/WorstPosition;->getPosition()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_0
.end method

.method private static getWorstPositionOfTeam(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/other/WorstPosition;
    .locals 9
    .param p0, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 194
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 195
    .local v0, "worstPositionList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/blank/bm15/model/object/other/WorstPosition;>;"
    new-instance v1, Lcom/blank/bm15/model/object/other/WorstPosition;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v4}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/blank/bm15/model/object/other/WorstPosition;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 196
    new-instance v1, Lcom/blank/bm15/model/object/other/WorstPosition;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v6}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/blank/bm15/model/object/other/WorstPosition;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 197
    new-instance v1, Lcom/blank/bm15/model/object/other/WorstPosition;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v7}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/blank/bm15/model/object/other/WorstPosition;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 198
    new-instance v1, Lcom/blank/bm15/model/object/other/WorstPosition;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v8}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/blank/bm15/model/object/other/WorstPosition;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 199
    new-instance v1, Lcom/blank/bm15/model/object/other/WorstPosition;

    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x5

    invoke-virtual {p0, v3}, Lcom/blank/bm15/model/object/crud/Team;->getNumPlayersOfPosition(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/blank/bm15/model/object/other/WorstPosition;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 201
    new-instance v1, Lcom/blank/bm15/model/comparator/WorstPositionComparator;

    invoke-direct {v1, v5, v4}, Lcom/blank/bm15/model/comparator/WorstPositionComparator;-><init>(II)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 203
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/other/WorstPosition;

    return-object v1
.end method

.method public static manage(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 6
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .param p1, "team"    # Lcom/blank/bm15/model/object/crud/Team;

    .prologue
    .line 24
    const/16 v4, 0xe

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v5, 0xf

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 25
    .local v3, "minPlayers":I
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    .line 26
    .local v0, "curPlayers":I
    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    rsub-int/lit8 v2, v4, 0x14

    .line 27
    .local v2, "maxPlayers":I
    invoke-static {p1}, Lcom/blank/bm15/model/core/ManageFreeAgency;->getFewPlayersInPosition(Lcom/blank/bm15/model/object/crud/Team;)Z

    move-result v1

    .line 29
    .local v1, "fewPlayers":Z
    if-lt v0, v3, :cond_0

    if-eqz v1, :cond_2

    .line 30
    :cond_0
    :goto_0
    if-lt v0, v3, :cond_1

    if-eqz v1, :cond_2

    :cond_1
    if-le v0, v2, :cond_3

    .line 36
    :cond_2
    return-void

    .line 31
    :cond_3
    invoke-static {p1}, Lcom/blank/bm15/model/core/ManageFreeAgency;->getWeakerPositionOfTeam(Lcom/blank/bm15/model/object/crud/Team;)I

    move-result v4

    invoke-static {p1, v4}, Lcom/blank/bm15/model/core/ManageFreeAgency;->singUpNewFreeAgencyPlayer(Lcom/blank/bm15/model/object/crud/Team;I)V

    .line 32
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    .line 33
    invoke-static {p1}, Lcom/blank/bm15/model/core/ManageFreeAgency;->getFewPlayersInPosition(Lcom/blank/bm15/model/object/crud/Team;)Z

    move-result v1

    goto :goto_0
.end method

.method public static manageLastMathcdayOffers(Lcom/blank/bm15/model/object/crud/Game;Ljava/util/List;)Z
    .locals 22
    .param p0, "game"    # Lcom/blank/bm15/model/object/crud/Game;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Game;",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 39
    .local p1, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v5, Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v15

    invoke-direct {v5, v15}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 40
    .local v5, "filter":Lcom/blank/bm15/model/object/crud/Team;
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/blank/bm15/model/object/crud/Team;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 41
    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v12

    .line 43
    .local v12, "teamList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Team;>;"
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_0
    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-nez v16, :cond_2

    .line 81
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 82
    .local v2, "acceptOfferOfPlayer":Ljava/lang/Boolean;
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :cond_1
    :goto_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-nez v15, :cond_a

    .line 96
    invoke-static/range {p1 .. p1}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Ljava/util/List;)V

    .line 98
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v15

    return v15

    .line 43
    .end local v2    # "acceptOfferOfPlayer":Ljava/lang/Boolean;
    :cond_2
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/blank/bm15/model/object/crud/Team;

    .line 44
    .local v11, "team":Lcom/blank/bm15/model/object/crud/Team;
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->size()I

    move-result v4

    .line 45
    .local v4, "curPlayers":I
    const/16 v16, 0x0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    const/16 v17, 0x2

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    rsub-int/lit8 v6, v16, 0x14

    .line 47
    .local v6, "maxPlayers":I
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    move/from16 v0, v16

    move/from16 v1, v17

    if-eq v0, v1, :cond_0

    if-gt v4, v6, :cond_0

    .line 48
    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    const/16 v17, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Lcom/blank/bm15/model/object/crud/Team;->getTeamSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    sub-int v10, v16, v17

    .line 49
    .local v10, "salaryAvailable":I
    invoke-static {v11}, Lcom/blank/bm15/model/core/ManageFreeAgency;->getWeakerPositionOfTeam(Lcom/blank/bm15/model/object/crud/Team;)I

    move-result v13

    .line 51
    .local v13, "worstPosition":I
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :cond_3
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_0

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/crud/Player;

    .line 52
    .local v8, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-static {v8}, Lcom/blank/bm15/model/util/Util;->getSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v9

    .line 54
    .local v9, "salary":Ljava/lang/Integer;
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v18

    const-wide/high16 v20, 0x4055000000000000L    # 84.0

    cmpl-double v17, v18, v20

    if-gtz v17, :cond_6

    const/16 v17, 0x0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    const/16 v18, 0x2

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    if-nez v17, :cond_6

    const/4 v3, 0x0

    .line 55
    .local v3, "choosePlayer":Z
    :goto_2
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    move/from16 v0, v17

    if-eq v0, v13, :cond_4

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    move/from16 v0, v17

    if-ne v0, v13, :cond_3

    .line 56
    :cond_4
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v17

    move/from16 v0, v17

    if-gt v10, v0, :cond_5

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v17

    const v18, 0xf4240

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_3

    .line 57
    :cond_5
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getValue()Ljava/lang/Double;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v18

    invoke-static {v11}, Lcom/blank/bm15/model/core/ManageFreeAgency;->getWorstPositionOfTeam(Lcom/blank/bm15/model/object/crud/Team;)Lcom/blank/bm15/model/object/other/WorstPosition;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/other/WorstPosition;->getAverageValue()Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    move/from16 v0, v17

    int-to-double v0, v0

    move-wide/from16 v20, v0

    cmpl-double v17, v18, v20

    if-lez v17, :cond_3

    .line 58
    if-eqz v3, :cond_3

    .line 60
    new-instance v7, Lcom/blank/bm15/model/object/crud/Offer;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getContext()Landroid/content/Context;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v7, v0}, Lcom/blank/bm15/model/object/crud/Offer;-><init>(Landroid/content/Context;)V

    .line 61
    .local v7, "offer":Lcom/blank/bm15/model/object/crud/Offer;
    invoke-virtual {v7, v11}, Lcom/blank/bm15/model/object/crud/Offer;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 63
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    const/16 v17, 0x19

    move/from16 v0, v16

    move/from16 v1, v17

    if-gt v0, v1, :cond_7

    const/16 v16, 0x2

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    const/16 v17, 0x4

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v14

    .line 67
    .local v14, "yearsContract":Ljava/lang/Integer;
    :goto_3
    invoke-virtual {v7, v14}, Lcom/blank/bm15/model/object/crud/Offer;->setYears(Ljava/lang/Integer;)V

    .line 69
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v16

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v17

    const/16 v18, -0x19

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    const/16 v19, 0x19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Integer;->intValue()I

    move-result v18

    mul-int v17, v17, v18

    div-int/lit8 v17, v17, 0x64

    add-int v16, v16, v17

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 70
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v16

    move/from16 v0, v16

    div-int/lit16 v0, v0, 0x3e8

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 71
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v16

    move/from16 v0, v16

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 72
    invoke-virtual {v7, v9}, Lcom/blank/bm15/model/object/crud/Offer;->setSalary(Ljava/lang/Integer;)V

    .line 74
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getOfferList()Ljava/util/List;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 54
    .end local v3    # "choosePlayer":Z
    .end local v7    # "offer":Lcom/blank/bm15/model/object/crud/Offer;
    .end local v14    # "yearsContract":Ljava/lang/Integer;
    :cond_6
    const/4 v3, 0x1

    goto/16 :goto_2

    .line 64
    .restart local v3    # "choosePlayer":Z
    .restart local v7    # "offer":Lcom/blank/bm15/model/object/crud/Offer;
    :cond_7
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    const/16 v17, 0x1e

    move/from16 v0, v16

    move/from16 v1, v17

    if-gt v0, v1, :cond_8

    const/16 v16, 0x1

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    const/16 v17, 0x4

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v14

    goto :goto_3

    .line 65
    :cond_8
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    const/16 v17, 0x22

    move/from16 v0, v16

    move/from16 v1, v17

    if-gt v0, v1, :cond_9

    const/16 v16, 0x1

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    const/16 v17, 0x3

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v14

    goto/16 :goto_3

    .line 66
    :cond_9
    const/16 v16, 0x1

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    const/16 v17, 0x2

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v14

    goto/16 :goto_3

    .line 82
    .end local v3    # "choosePlayer":Z
    .end local v4    # "curPlayers":I
    .end local v6    # "maxPlayers":I
    .end local v7    # "offer":Lcom/blank/bm15/model/object/crud/Offer;
    .end local v8    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .end local v9    # "salary":Ljava/lang/Integer;
    .end local v10    # "salaryAvailable":I
    .end local v11    # "team":Lcom/blank/bm15/model/object/crud/Team;
    .end local v13    # "worstPosition":I
    .restart local v2    # "acceptOfferOfPlayer":Ljava/lang/Boolean;
    :cond_a
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/blank/bm15/model/object/crud/Player;

    .line 83
    .restart local v8    # "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getOfferList()Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v15

    if-lez v15, :cond_1

    .line 84
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getOfferList()Ljava/util/List;

    move-result-object v15

    new-instance v17, Lcom/blank/bm15/model/comparator/OfferComparator;

    const/16 v18, 0x0

    const/16 v19, -0x1

    invoke-direct/range {v17 .. v19}, Lcom/blank/bm15/model/comparator/OfferComparator;-><init>(II)V

    move-object/from16 v0, v17

    invoke-static {v15, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 86
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getOfferList()Ljava/util/List;

    move-result-object v15

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-interface {v15, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/blank/bm15/model/object/crud/Offer;

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Offer;->getSalary()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v8, v15}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    .line 87
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getOfferList()Ljava/util/List;

    move-result-object v15

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-interface {v15, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/blank/bm15/model/object/crud/Offer;

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Offer;->getYears()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v8, v15}, Lcom/blank/bm15/model/object/crud/Player;->setYearsContract(Ljava/lang/Integer;)V

    .line 88
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getOfferList()Ljava/util/List;

    move-result-object v15

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-interface {v15, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/blank/bm15/model/object/crud/Offer;

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Offer;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v8, v15}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 90
    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Player;->getOfferList()Ljava/util/List;

    move-result-object v15

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-interface {v15, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/blank/bm15/model/object/crud/Offer;

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Offer;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    move/from16 v0, v17

    if-ne v15, v0, :cond_1

    .line 91
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto/16 :goto_1
.end method

.method private static singUpNewFreeAgencyPlayer(Lcom/blank/bm15/model/object/crud/Team;I)V
    .locals 12
    .param p0, "team"    # Lcom/blank/bm15/model/object/crud/Team;
    .param p1, "position"    # I

    .prologue
    .line 102
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v0, v8}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 103
    .local v0, "filter":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v8

    invoke-virtual {v0, v8}, Lcom/blank/bm15/model/object/crud/Player;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 104
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getFreeAgents(Lcom/blank/bm15/model/object/crud/Player;)Ljava/util/List;

    move-result-object v4

    .line 105
    .local v4, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v8, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v9, 0x0

    const/4 v10, -0x1

    invoke-direct {v8, v9, v10}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v4, v8}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 107
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 108
    .local v1, "found":Z
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    const/4 v9, 0x0

    invoke-virtual {p0, v9}, Lcom/blank/bm15/model/object/crud/Team;->getTeamSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 109
    .local v6, "salaryAvailable":Ljava/lang/Integer;
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_2

    .line 140
    :goto_0
    if-nez v1, :cond_1

    .line 141
    invoke-static {p0, p1}, Lcom/blank/bm15/model/core/ManageFreeAgency;->createSecondaryPlayer(Lcom/blank/bm15/model/object/crud/Team;I)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v3

    .line 142
    .local v3, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 144
    .end local v3    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v8

    invoke-virtual {v8}, Lcom/blank/bm15/model/object/crud/Tactic;->reloadPlayers()V

    .line 145
    return-void

    .line 109
    :cond_2
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    .line 111
    .restart local v3    # "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-ne v9, p1, :cond_5

    const/4 v2, 0x1

    .line 112
    .local v2, "isCorrectPosition":Z
    :goto_1
    if-nez v2, :cond_3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v9

    if-eqz v9, :cond_3

    .line 113
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-ne v9, p1, :cond_6

    const/4 v2, 0x1

    .line 117
    :cond_3
    :goto_2
    invoke-static {v3}, Lcom/blank/bm15/model/util/Util;->getSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v5

    .line 118
    .local v5, "salary":Ljava/lang/Integer;
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-gt v9, v10, :cond_4

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const v10, 0xf4240

    if-ge v9, v10, :cond_0

    :cond_4
    if-eqz v2, :cond_0

    .line 119
    invoke-virtual {v3, p0}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 121
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    const/16 v9, 0x19

    if-gt v8, v9, :cond_7

    const/4 v8, 0x2

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v7

    .line 125
    .local v7, "yearsContract":Ljava/lang/Integer;
    :goto_3
    invoke-virtual {v3, v7}, Lcom/blank/bm15/model/object/crud/Player;->setYearsContract(Ljava/lang/Integer;)V

    .line 128
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/16 v10, -0xf

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/16 v11, 0xf

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    mul-int/2addr v9, v10

    div-int/lit8 v9, v9, 0x64

    add-int/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 129
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v8

    div-int/lit16 v8, v8, 0x3e8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 130
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v8

    mul-int/lit16 v8, v8, 0x3e8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 131
    invoke-virtual {v3, v5}, Lcom/blank/bm15/model/object/crud/Player;->setSalary(Ljava/lang/Integer;)V

    .line 134
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 135
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 136
    goto/16 :goto_0

    .line 111
    .end local v2    # "isCorrectPosition":Z
    .end local v5    # "salary":Ljava/lang/Integer;
    .end local v7    # "yearsContract":Ljava/lang/Integer;
    :cond_5
    const/4 v2, 0x0

    goto/16 :goto_1

    .line 113
    .restart local v2    # "isCorrectPosition":Z
    :cond_6
    const/4 v2, 0x0

    goto/16 :goto_2

    .line 122
    .restart local v5    # "salary":Ljava/lang/Integer;
    :cond_7
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    const/16 v9, 0x1e

    if-gt v8, v9, :cond_8

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v7

    goto :goto_3

    .line 123
    :cond_8
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    const/16 v9, 0x22

    if-gt v8, v9, :cond_9

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x3

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v7

    goto/16 :goto_3

    .line 124
    :cond_9
    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v7

    goto/16 :goto_3
.end method
