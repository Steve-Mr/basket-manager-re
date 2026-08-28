.class public Lcom/blank/bm15/model/object/other/Finance;
.super Ljava/lang/Object;
.source "Finance.java"


# instance fields
.field private player:Lcom/blank/bm15/model/object/crud/Player;

.field private year1:Ljava/lang/Integer;

.field private year2:Ljava/lang/Integer;

.field private year3:Ljava/lang/Integer;

.field private year4:Ljava/lang/Integer;

.field private year5:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 3
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    const/4 v2, 0x0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Finance;->player:Lcom/blank/bm15/model/object/crud/Player;

    .line 18
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getYearsContract()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_0

    .line 19
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year1:Ljava/lang/Integer;

    .line 24
    :goto_0
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getYearsContract()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    .line 25
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year2:Ljava/lang/Integer;

    .line 30
    :goto_1
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getYearsContract()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_2

    .line 31
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year3:Ljava/lang/Integer;

    .line 36
    :goto_2
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getYearsContract()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x3

    if-le v0, v1, :cond_3

    .line 37
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year4:Ljava/lang/Integer;

    .line 42
    :goto_3
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getYearsContract()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x4

    if-le v0, v1, :cond_4

    .line 43
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year5:Ljava/lang/Integer;

    .line 47
    :goto_4
    return-void

    .line 21
    :cond_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year1:Ljava/lang/Integer;

    goto :goto_0

    .line 27
    :cond_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year2:Ljava/lang/Integer;

    goto :goto_1

    .line 33
    :cond_2
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year3:Ljava/lang/Integer;

    goto :goto_2

    .line 39
    :cond_3
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year4:Ljava/lang/Integer;

    goto :goto_3

    .line 45
    :cond_4
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year5:Ljava/lang/Integer;

    goto :goto_4
.end method


# virtual methods
.method public addPlayer(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 2
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 106
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->player:Lcom/blank/bm15/model/object/crud/Player;

    .line 107
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year1:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year1:Ljava/lang/Integer;

    .line 108
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getYearsContract()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 109
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year2:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year2:Ljava/lang/Integer;

    .line 111
    :cond_0
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getYearsContract()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_1

    .line 112
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year3:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year3:Ljava/lang/Integer;

    .line 114
    :cond_1
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getYearsContract()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x3

    if-le v0, v1, :cond_2

    .line 115
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year4:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year4:Ljava/lang/Integer;

    .line 117
    :cond_2
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getYearsContract()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x4

    if-le v0, v1, :cond_3

    .line 118
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year5:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year5:Ljava/lang/Integer;

    .line 120
    :cond_3
    return-void
.end method

.method public getPlayer()Lcom/blank/bm15/model/object/crud/Player;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->player:Lcom/blank/bm15/model/object/crud/Player;

    return-object v0
.end method

.method public getYear1()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year1:Ljava/lang/Integer;

    return-object v0
.end method

.method public getYear2()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year2:Ljava/lang/Integer;

    return-object v0
.end method

.method public getYear3()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year3:Ljava/lang/Integer;

    return-object v0
.end method

.method public getYear4()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year4:Ljava/lang/Integer;

    return-object v0
.end method

.method public getYear5()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/Finance;->year5:Ljava/lang/Integer;

    return-object v0
.end method

.method public setPlayer(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Finance;->player:Lcom/blank/bm15/model/object/crud/Player;

    .line 99
    return-void
.end method

.method public setYear1(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "year1"    # Ljava/lang/Integer;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Finance;->year1:Ljava/lang/Integer;

    .line 59
    return-void
.end method

.method public setYear2(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "year2"    # Ljava/lang/Integer;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Finance;->year2:Ljava/lang/Integer;

    .line 67
    return-void
.end method

.method public setYear3(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "year3"    # Ljava/lang/Integer;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Finance;->year3:Ljava/lang/Integer;

    .line 75
    return-void
.end method

.method public setYear4(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "year4"    # Ljava/lang/Integer;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Finance;->year4:Ljava/lang/Integer;

    .line 83
    return-void
.end method

.method public setYear5(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "year5"    # Ljava/lang/Integer;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/Finance;->year5:Ljava/lang/Integer;

    .line 91
    return-void
.end method
