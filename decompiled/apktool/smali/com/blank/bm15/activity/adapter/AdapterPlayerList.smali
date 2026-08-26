.class public Lcom/blank/bm15/activity/adapter/AdapterPlayerList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterPlayerList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/blank/bm15/model/object/crud/Player;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private layoutId:I

.field private playerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ">;"
        }
    .end annotation
.end field

.field private showTeamName:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/util/List;Z)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "layoutId"    # I
    .param p4, "showTeamName"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p3, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->playerList:Ljava/util/List;

    .line 36
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    .line 37
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->layoutId:I

    .line 38
    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->showTeamName:Ljava/lang/Boolean;

    .line 39
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->playerList:Ljava/util/List;

    .line 40
    return-void
.end method

.method private changeBackgroundColor(Landroid/view/View;I)V
    .locals 1
    .param p1, "row"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 186
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_0

    .line 187
    const v0, 0x7f060017

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 191
    :goto_0
    return-void

    .line 189
    :cond_0
    const v0, 0x7f060018

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method


# virtual methods
.method public getItem(I)Lcom/blank/bm15/model/object/crud/Player;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 44
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->playerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->getItem(I)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 16
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 49
    move-object/from16 v9, p2

    .line 50
    .local v9, "row":Landroid/view/View;
    const/4 v2, 0x0

    .line 52
    .local v2, "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;
    if-nez v9, :cond_2

    .line 53
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    check-cast v10, Landroid/app/Activity;

    invoke-virtual {v10}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    .line 54
    .local v3, "inflater":Landroid/view/LayoutInflater;
    move-object/from16 v0, p0

    iget v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->layoutId:I

    const/4 v11, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v3, v10, v0, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v9

    .line 56
    new-instance v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;

    .end local v2    # "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;
    invoke-direct {v2}, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;-><init>()V

    .line 57
    .restart local v2    # "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;
    const v10, 0x7f0b0118

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/ImageView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    .line 58
    const v10, 0x7f0b011a

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewName:Landroid/widget/TextView;

    .line 59
    const v10, 0x7f0b011b

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    .line 60
    const v10, 0x7f0b011c

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewSeparatorPositionSecond:Landroid/widget/TextView;

    .line 61
    const v10, 0x7f0b011d

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    .line 62
    const v10, 0x7f0b011e

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewSeparatorPositionMatch:Landroid/widget/TextView;

    .line 63
    const v10, 0x7f0b011f

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    .line 64
    const v10, 0x7f0b0120

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/RelativeLayout;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->relativeLayoutAge:Landroid/widget/RelativeLayout;

    .line 65
    const v10, 0x7f0b0122

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAgeText:Landroid/widget/TextView;

    .line 66
    const v10, 0x7f0b0123

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAgeValue:Landroid/widget/TextView;

    .line 67
    const v10, 0x7f0b0125

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewFormText:Landroid/widget/TextView;

    .line 68
    const v10, 0x7f0b0126

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewFormValue:Landroid/widget/TextView;

    .line 69
    const v10, 0x7f0b0128

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewEnergyText:Landroid/widget/TextView;

    .line 70
    const v10, 0x7f0b0129

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewEnergyValue:Landroid/widget/TextView;

    .line 71
    const v10, 0x7f0b012a

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAverageText:Landroid/widget/TextView;

    .line 72
    const v10, 0x7f0b012b

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    .line 74
    invoke-virtual {v9, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 79
    .end local v3    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->playerList:Ljava/util/List;

    move/from16 v0, p1

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/model/object/crud/Player;

    .line 80
    .local v5, "player":Lcom/blank/bm15/model/object/crud/Player;
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f060026

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 81
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f060026

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 82
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAverageText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f060026

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 83
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f060026

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 84
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewSeparatorPositionMatch:Landroid/widget/TextView;

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 85
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 87
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-lez v10, :cond_4

    .line 88
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f02003b

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 89
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewSeparatorPositionMatch:Landroid/widget/TextView;

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 90
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 91
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 92
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewSeparatorPositionSecond:Landroid/widget/TextView;

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 93
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 95
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/4 v11, 0x1

    if-le v10, v11, :cond_3

    .line 96
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    new-instance v11, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f05002b

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f05002d

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    :cond_0
    :goto_1
    const-string v4, ""

    .line 156
    .local v4, "name":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->showTeamName:Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 157
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v10

    if-eqz v10, :cond_1

    .line 158
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, "("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ") "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 161
    :cond_1
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewName:Landroid/widget/TextView;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->showTeamName:Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    if-eqz v10, :cond_10

    .line 164
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->relativeLayoutAge:Landroid/widget/RelativeLayout;

    invoke-virtual {v10}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    const/16 v11, 0x8c

    iput v11, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 165
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAgeText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    const v12, 0x7f05016a

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAgeValue:Landroid/widget/TextView;

    new-instance v11, Ljava/lang/StringBuilder;

    new-instance v12, Ljava/lang/Double;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    int-to-double v14, v13

    invoke-direct {v12, v14, v15}, Ljava/lang/Double;-><init>(D)V

    invoke-virtual {v12}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v12

    const-wide v14, 0x412e848000000000L    # 1000000.0

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "M"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 167
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewFormText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    const v12, 0x7f050169

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 168
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewFormValue:Landroid/widget/TextView;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getYearsContract()Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 169
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewEnergyText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    const v12, 0x7f050165

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 170
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewEnergyValue:Landroid/widget/TextView;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    :goto_2
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 180
    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v9, v1}, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->changeBackgroundColor(Landroid/view/View;I)V

    .line 182
    return-object v9

    .line 76
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_2
    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;
    check-cast v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;

    .restart local v2    # "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;
    goto/16 :goto_0

    .line 98
    .restart local v5    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_3
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    new-instance v11, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f05002b

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f05002c

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 101
    :cond_4
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 102
    .local v8, "potential":I
    const/16 v10, 0x9

    if-lt v8, v10, :cond_5

    .line 103
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f02004b

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 116
    :goto_3
    iget-object v11, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    check-cast v10, Landroid/app/Activity;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v10, v12}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v11, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-eqz v10, :cond_a

    .line 118
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewSeparatorPositionSecond:Landroid/widget/TextView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 119
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 120
    iget-object v11, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    check-cast v10, Landroid/app/Activity;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v10, v12}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v11, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    :goto_4
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v10

    invoke-virtual {v10, v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 127
    .local v7, "posTitular":I
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v10

    invoke-virtual {v10, v5}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 128
    .local v6, "posReserve":I
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->showTeamName:Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    if-nez v10, :cond_d

    if-eqz v7, :cond_d

    .line 129
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-ne v7, v10, :cond_b

    .line 130
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f06002d

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 138
    :goto_5
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAverageText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f06002d

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 139
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f06002d

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_1

    .line 104
    .end local v6    # "posReserve":I
    .end local v7    # "posTitular":I
    :cond_5
    const/4 v10, 0x7

    if-lt v8, v10, :cond_6

    .line 105
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f02004a

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 106
    :cond_6
    const/4 v10, 0x5

    if-lt v8, v10, :cond_7

    .line 107
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f020049

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 108
    :cond_7
    const/4 v10, 0x3

    if-lt v8, v10, :cond_8

    .line 109
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f020048

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 110
    :cond_8
    const/4 v10, 0x1

    if-lt v8, v10, :cond_9

    .line 111
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f020047

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 113
    :cond_9
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f020046

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 122
    :cond_a
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewSeparatorPositionSecond:Landroid/widget/TextView;

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 123
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_4

    .line 131
    .restart local v6    # "posReserve":I
    .restart local v7    # "posTitular":I
    :cond_b
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-ne v7, v10, :cond_c

    .line 132
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f06002d

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_5

    .line 134
    :cond_c
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewSeparatorPositionMatch:Landroid/widget/TextView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 135
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 136
    iget-object v11, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    check-cast v10, Landroid/app/Activity;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v10, v12}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v11, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_5

    .line 140
    :cond_d
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->showTeamName:Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    if-nez v10, :cond_0

    if-eqz v6, :cond_0

    .line 141
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-ne v6, v10, :cond_e

    .line 142
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f06002f

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 150
    :goto_6
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAverageText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f06002f

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 151
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f06002f

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_1

    .line 143
    :cond_e
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-ne v6, v10, :cond_f

    .line 144
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f06002f

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_6

    .line 146
    :cond_f
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewSeparatorPositionMatch:Landroid/widget/TextView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 147
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 148
    iget-object v11, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    check-cast v10, Landroid/app/Activity;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v10, v12}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v11, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_6

    .line 172
    .end local v6    # "posReserve":I
    .end local v7    # "posTitular":I
    .end local v8    # "potential":I
    .restart local v4    # "name":Ljava/lang/String;
    :cond_10
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAgeText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    const v12, 0x7f050165

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewAgeValue:Landroid/widget/TextView;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewFormText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    const v12, 0x7f050166

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewFormValue:Landroid/widget/TextView;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewEnergyText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;->context:Landroid/content/Context;

    const v12, 0x7f050167

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerList$PlayerHolder;->textViewEnergyValue:Landroid/widget/TextView;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v11}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2
.end method
