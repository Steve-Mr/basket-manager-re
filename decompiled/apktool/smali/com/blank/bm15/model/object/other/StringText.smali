.class public Lcom/blank/bm15/model/object/other/StringText;
.super Ljava/lang/Object;
.source "StringText.java"


# instance fields
.field private color:Ljava/lang/Integer;

.field private id:Ljava/lang/Integer;

.field private text:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/String;Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/Integer;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/StringText;->id:Ljava/lang/Integer;

    .line 20
    iput-object p2, p0, Lcom/blank/bm15/model/object/other/StringText;->text:Ljava/lang/String;

    .line 22
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v0, v1, :cond_0

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, -0x5

    if-ne v0, v1, :cond_1

    .line 23
    :cond_0
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Player;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06002d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/StringText;->color:Ljava/lang/Integer;

    .line 30
    :goto_0
    return-void

    .line 24
    :cond_1
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eqz v0, :cond_3

    .line 25
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v0, v1, :cond_2

    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, -0x5

    if-ne v0, v1, :cond_3

    .line 26
    :cond_2
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Player;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06002f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/StringText;->color:Ljava/lang/Integer;

    goto :goto_0

    .line 28
    :cond_3
    invoke-virtual {p3}, Lcom/blank/bm15/model/object/crud/Player;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060025

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/StringText;->color:Ljava/lang/Integer;

    goto :goto_0
.end method


# virtual methods
.method public getColor()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/StringText;->color:Ljava/lang/Integer;

    return-object v0
.end method

.method public getId()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/StringText;->id:Ljava/lang/Integer;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/StringText;->text:Ljava/lang/String;

    return-object v0
.end method

.method public setColor(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "color"    # Ljava/lang/Integer;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/StringText;->color:Ljava/lang/Integer;

    .line 46
    return-void
.end method

.method public setId(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/Integer;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/StringText;->id:Ljava/lang/Integer;

    .line 38
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/StringText;->text:Ljava/lang/String;

    .line 54
    return-void
.end method
