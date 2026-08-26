.class public Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;
.super Landroid/widget/ArrayAdapter;
.source "AdapterPlayerTradeList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;
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


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/util/List;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "layoutId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p3, "playerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 25
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->playerList:Ljava/util/List;

    .line 35
    iput-object p1, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    .line 36
    iput p2, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->layoutId:I

    .line 37
    iput-object p3, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->playerList:Ljava/util/List;

    .line 38
    return-void
.end method

.method private changeBackgroundColor(Landroid/view/View;I)V
    .locals 1
    .param p1, "row"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 150
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_0

    .line 151
    const v0, 0x7f060017

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 155
    :goto_0
    return-void

    .line 153
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
    .line 42
    iget-object v0, p0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->playerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->getItem(I)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 16
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 47
    move-object/from16 v8, p2

    .line 48
    .local v8, "row":Landroid/view/View;
    const/4 v2, 0x0

    .line 50
    .local v2, "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;
    if-nez v8, :cond_1

    .line 51
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    check-cast v9, Landroid/app/Activity;

    invoke-virtual {v9}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    .line 52
    .local v3, "inflater":Landroid/view/LayoutInflater;
    move-object/from16 v0, p0

    iget v9, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->layoutId:I

    const/4 v10, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v3, v9, v0, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    .line 54
    new-instance v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;

    .end local v2    # "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;
    invoke-direct {v2}, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;-><init>()V

    .line 55
    .restart local v2    # "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;
    const v9, 0x7f0b0118

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/ImageView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    .line 56
    const v9, 0x7f0b011a

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewName:Landroid/widget/TextView;

    .line 57
    const v9, 0x7f0b0120

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/RelativeLayout;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->relativeLayoutAge:Landroid/widget/RelativeLayout;

    .line 58
    const v9, 0x7f0b0122

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewAgeText:Landroid/widget/TextView;

    .line 59
    const v9, 0x7f0b0123

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewAgeValue:Landroid/widget/TextView;

    .line 60
    const v9, 0x7f0b011b

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    .line 61
    const v9, 0x7f0b011c

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewSeparatorPositionSecond:Landroid/widget/TextView;

    .line 62
    const v9, 0x7f0b011d

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    .line 63
    const v9, 0x7f0b011e

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewSeparatorPositionMatch:Landroid/widget/TextView;

    .line 64
    const v9, 0x7f0b011f

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    .line 65
    const v9, 0x7f0b0125

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewFormText:Landroid/widget/TextView;

    .line 66
    const v9, 0x7f0b0126

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewFormValue:Landroid/widget/TextView;

    .line 67
    const v9, 0x7f0b0128

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewEnergyText:Landroid/widget/TextView;

    .line 68
    const v9, 0x7f0b0129

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewEnergyValue:Landroid/widget/TextView;

    .line 69
    const v9, 0x7f0b012a

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewAverageText:Landroid/widget/TextView;

    .line 70
    const v9, 0x7f0b012b

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    .line 72
    invoke-virtual {v8, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 77
    .end local v3    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->playerList:Ljava/util/List;

    move/from16 v0, p1

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/model/object/crud/Player;

    .line 78
    .local v4, "player":Lcom/blank/bm15/model/object/crud/Player;
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f060026

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 79
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f060026

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 80
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewAverageText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f060026

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 81
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f060026

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 82
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewSeparatorPositionMatch:Landroid/widget/TextView;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 83
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 85
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-lez v9, :cond_3

    .line 86
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f02003b

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 87
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewSeparatorPositionMatch:Landroid/widget/TextView;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 88
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 89
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 90
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewSeparatorPositionSecond:Landroid/widget/TextView;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 91
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 93
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_2

    .line 94
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    new-instance v10, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f05002b

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f05002d

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    :cond_0
    :goto_1
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewName:Landroid/widget/TextView;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 136
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->relativeLayoutAge:Landroid/widget/RelativeLayout;

    invoke-virtual {v9}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    const/16 v10, 0x8c

    iput v10, v9, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 137
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewAgeText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    const v11, 0x7f05016a

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewAgeValue:Landroid/widget/TextView;

    new-instance v10, Ljava/lang/StringBuilder;

    new-instance v11, Ljava/lang/Double;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    int-to-double v12, v12

    invoke-direct {v11, v12, v13}, Ljava/lang/Double;-><init>(D)V

    invoke-virtual {v11}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v12

    const-wide v14, 0x412e848000000000L    # 1000000.0

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Lcom/blank/bm15/model/util/Util;->round(D)D

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, "M"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 139
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewFormText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    const v11, 0x7f050169

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewFormValue:Landroid/widget/TextView;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getYearsContract()Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v10}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewEnergyText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    const v11, 0x7f050165

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewEnergyValue:Landroid/widget/TextView;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v10}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v10

    invoke-static {v10}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v8, v1}, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->changeBackgroundColor(Landroid/view/View;I)V

    .line 146
    return-object v8

    .line 74
    .end local v4    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_1
    invoke-virtual {v8}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;
    check-cast v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;

    .restart local v2    # "holder":Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;
    goto/16 :goto_0

    .line 96
    .restart local v4    # "player":Lcom/blank/bm15/model/object/crud/Player;
    :cond_2
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionMatch:Landroid/widget/TextView;

    new-instance v10, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f05002b

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f05002c

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 99
    :cond_3
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 100
    .local v7, "potential":I
    const/16 v9, 0x9

    if-lt v7, v9, :cond_4

    .line 101
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f02004b

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 114
    :goto_2
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionFirst:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    check-cast v9, Landroid/app/Activity;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v9, v11}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-eqz v9, :cond_9

    .line 116
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewSeparatorPositionSecond:Landroid/widget/TextView;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 117
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 118
    iget-object v10, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    check-cast v9, Landroid/app/Activity;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v9, v11}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    :goto_3
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v9

    invoke-virtual {v9, v4}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 125
    .local v6, "posTitular":I
    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v9

    invoke-virtual {v9, v4}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 126
    .local v5, "posReserve":I
    if-eqz v6, :cond_a

    .line 127
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewAverageText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f06002d

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 128
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f06002d

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_1

    .line 102
    .end local v5    # "posReserve":I
    .end local v6    # "posTitular":I
    :cond_4
    const/4 v9, 0x7

    if-lt v7, v9, :cond_5

    .line 103
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f02004a

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 104
    :cond_5
    const/4 v9, 0x5

    if-lt v7, v9, :cond_6

    .line 105
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f020049

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 106
    :cond_6
    const/4 v9, 0x3

    if-lt v7, v9, :cond_7

    .line 107
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f020048

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 108
    :cond_7
    const/4 v9, 0x1

    if-lt v7, v9, :cond_8

    .line 109
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f020047

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 111
    :cond_8
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->imageViewPotential:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f020046

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 120
    :cond_9
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewSeparatorPositionSecond:Landroid/widget/TextView;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 121
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewPositionSecond:Landroid/widget/TextView;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_3

    .line 129
    .restart local v5    # "posReserve":I
    .restart local v6    # "posTitular":I
    :cond_a
    if-eqz v5, :cond_0

    .line 130
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewAverageText:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f06002f

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 131
    iget-object v9, v2, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList$PlayerHolder;->textViewAverageValue:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/blank/bm15/activity/adapter/AdapterPlayerTradeList;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f06002f

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_1
.end method
