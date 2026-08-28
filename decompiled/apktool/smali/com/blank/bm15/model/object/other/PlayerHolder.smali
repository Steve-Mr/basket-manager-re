.class public Lcom/blank/bm15/model/object/other/PlayerHolder;
.super Ljava/lang/Object;
.source "PlayerHolder.java"


# instance fields
.field public imageViewPotential:Landroid/widget/ImageView;

.field private showTeamName:Z

.field public textViewAge:Landroid/widget/TextView;

.field public textViewAverageText:Landroid/widget/TextView;

.field public textViewAverageValue:Landroid/widget/TextView;

.field public textViewEnergy:Landroid/widget/TextView;

.field public textViewForm:Landroid/widget/TextView;

.field public textViewName:Landroid/widget/TextView;

.field public textViewPositionFirst:Landroid/widget/TextView;

.field public textViewPositionMatch:Landroid/widget/TextView;

.field public textViewPositionSecond:Landroid/widget/TextView;

.field public textViewSeparatorPositionMatch:Landroid/widget/TextView;

.field public textViewSeparatorPositionSecond:Landroid/widget/TextView;

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;Z)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "showTeamName"    # Z

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    .line 34
    iput-boolean p2, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->showTeamName:Z

    .line 35
    const v0, 0x7f0b0118

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    .line 36
    const v0, 0x7f0b011a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewName:Landroid/widget/TextView;

    .line 37
    const v0, 0x7f0b0123

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewAge:Landroid/widget/TextView;

    .line 38
    const v0, 0x7f0b011b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    .line 39
    const v0, 0x7f0b011c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewSeparatorPositionSecond:Landroid/widget/TextView;

    .line 40
    const v0, 0x7f0b011d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    .line 41
    const v0, 0x7f0b011e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewSeparatorPositionMatch:Landroid/widget/TextView;

    .line 42
    const v0, 0x7f0b011f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    .line 43
    const v0, 0x7f0b0126

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewForm:Landroid/widget/TextView;

    .line 44
    const v0, 0x7f0b0129

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewEnergy:Landroid/widget/TextView;

    .line 45
    const v0, 0x7f0b012a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewAverageText:Landroid/widget/TextView;

    .line 46
    const v0, 0x7f0b012b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    .line 47
    return-void
.end method


# virtual methods
.method public load(Landroid/app/Activity;Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 11
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    const v10, 0x7f06002f

    const v9, 0x7f06002d

    const v6, 0x7f060026

    const/4 v8, 0x0

    const/16 v7, 0x8

    .line 50
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 51
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 52
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewAverageText:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 53
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 54
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewSeparatorPositionMatch:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 55
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 57
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_3

    .line 58
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f02003b

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 59
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewSeparatorPositionMatch:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 60
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 61
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 62
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewSeparatorPositionSecond:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 63
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 65
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_2

    .line 66
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f05002b

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f05002d

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    :cond_0
    :goto_0
    const-string v0, ""

    .line 126
    .local v0, "name":Ljava/lang/String;
    iget-boolean v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->showTeamName:Z

    if-eqz v4, :cond_1

    .line 127
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    if-nez v4, :cond_f

    .line 128
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f050029

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 133
    :cond_1
    :goto_1
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewName:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewAge:Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewForm:Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 136
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewEnergy:Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 137
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    return-void

    .line 68
    .end local v0    # "name":Ljava/lang/String;
    :cond_2
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f05002b

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f05002c

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 71
    :cond_3
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 72
    .local v3, "potential":I
    const/16 v4, 0x9

    if-lt v3, v4, :cond_4

    .line 73
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f02004b

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 86
    :goto_2
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {p1, v5}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_9

    .line 88
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewSeparatorPositionSecond:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 89
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 90
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {p1, v5}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    :goto_3
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    invoke-virtual {v4, p2}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 97
    .local v2, "posTitular":I
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    invoke-virtual {v4, p2}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 98
    .local v1, "posReserve":I
    iget-boolean v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->showTeamName:Z

    if-nez v4, :cond_c

    if-eqz v2, :cond_c

    .line 99
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v2, v4, :cond_a

    .line 100
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 108
    :goto_4
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewAverageText:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 109
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_0

    .line 74
    .end local v1    # "posReserve":I
    .end local v2    # "posTitular":I
    :cond_4
    const/4 v4, 0x7

    if-lt v3, v4, :cond_5

    .line 75
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f02004a

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 76
    :cond_5
    const/4 v4, 0x5

    if-lt v3, v4, :cond_6

    .line 77
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020049

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 78
    :cond_6
    const/4 v4, 0x3

    if-lt v3, v4, :cond_7

    .line 79
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020048

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 80
    :cond_7
    const/4 v4, 0x1

    if-lt v3, v4, :cond_8

    .line 81
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020047

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 83
    :cond_8
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020046

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 92
    :cond_9
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewSeparatorPositionSecond:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 93
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_3

    .line 101
    .restart local v1    # "posReserve":I
    .restart local v2    # "posTitular":I
    :cond_a
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v2, v4, :cond_b

    .line 102
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_4

    .line 104
    :cond_b
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewSeparatorPositionMatch:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 105
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 106
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {p1, v5}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 110
    :cond_c
    iget-boolean v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->showTeamName:Z

    if-nez v4, :cond_0

    if-eqz v1, :cond_0

    .line 111
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v1, v4, :cond_d

    .line 112
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 120
    :goto_5
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewAverageText:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 121
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_0

    .line 113
    :cond_d
    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v1, v4, :cond_e

    .line 114
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_5

    .line 116
    :cond_e
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewSeparatorPositionMatch:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 117
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 118
    iget-object v4, p0, Lcom/blank/bm15/model/object/other/PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {p1, v5}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 130
    .end local v1    # "posReserve":I
    .end local v2    # "posTitular":I
    .end local v3    # "potential":I
    .restart local v0    # "name":Ljava/lang/String;
    :cond_f
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1
.end method
