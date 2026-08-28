.class public Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;
.super Lcom/blank/bm15/activity/base/BaseFragment;
.source "PlayerSkillsFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;)V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->createPage()V

    return-void
.end method

.method static synthetic access$1(Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0

    .prologue
    .line 127
    invoke-direct {p0, p1}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->updateAll(Lcom/blank/bm15/model/object/crud/Player;)V

    return-void
.end method

.method private createPage()V
    .locals 10

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/base/BaseActivity;->getNavigation(Landroid/content/Context;)Lcom/blank/bm15/model/object/crud/Navigation;

    move-result-object v7

    .line 43
    .local v7, "navigation":Lcom/blank/bm15/model/object/crud/Navigation;
    new-instance v2, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 44
    .local v2, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Navigation;->getIdObject()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/blank/bm15/model/object/crud/Player;->setId(Ljava/lang/Integer;)V

    .line 45
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 47
    invoke-direct {p0, v2}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->loadHeader(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 49
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0b0039

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 50
    .local v8, "textViewAverageAttack":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAttack()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0b0047

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 52
    .local v9, "textViewAverageDefense":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillDefense()Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPhysique()Ljava/lang/Integer;

    move-result-object v3

    const v4, 0x7f0b0049

    const v5, 0x7f0b004a

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->loadSeekBar(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;Ljava/lang/Integer;II)V

    .line 55
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getSkillBlock()Ljava/lang/Integer;

    move-result-object v3

    const v4, 0x7f0b004c

    const v5, 0x7f0b004d

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->loadSeekBar(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;Ljava/lang/Integer;II)V

    .line 56
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getSkillRebound()Ljava/lang/Integer;

    move-result-object v3

    const v4, 0x7f0b004f

    const v5, 0x7f0b0050

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->loadSeekBar(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;Ljava/lang/Integer;II)V

    .line 57
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getSkillSteal()Ljava/lang/Integer;

    move-result-object v3

    const v4, 0x7f0b0052

    const v5, 0x7f0b0053

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->loadSeekBar(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;Ljava/lang/Integer;II)V

    .line 58
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getSkillPass()Ljava/lang/Integer;

    move-result-object v3

    const v4, 0x7f0b003b

    const v5, 0x7f0b003c

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->loadSeekBar(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;Ljava/lang/Integer;II)V

    .line 59
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotInterior()Ljava/lang/Integer;

    move-result-object v3

    const v4, 0x7f0b003e

    const v5, 0x7f0b003f

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->loadSeekBar(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;Ljava/lang/Integer;II)V

    .line 60
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotExterior()Ljava/lang/Integer;

    move-result-object v3

    const v4, 0x7f0b0041

    const v5, 0x7f0b0042

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->loadSeekBar(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;Ljava/lang/Integer;II)V

    .line 61
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getSkillShotFree()Ljava/lang/Integer;

    move-result-object v3

    const v4, 0x7f0b0044

    const v5, 0x7f0b0045

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->loadSeekBar(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;Ljava/lang/Integer;II)V

    .line 63
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0b0054

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    .line 64
    .local v6, "buttonExchangePositions":Landroid/widget/Button;
    new-instance v0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$1;

    invoke-direct {v0, p0, v2}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$1;-><init>(Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;Lcom/blank/bm15/model/object/crud/Player;)V

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 77
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 78
    invoke-virtual {p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 79
    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eqz v0, :cond_0

    .line 80
    const/4 v0, 0x0

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setVisibility(I)V

    .line 84
    :goto_0
    return-void

    .line 82
    :cond_0
    const/16 v0, 0x8

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0
.end method

.method private loadHeader(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 22
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 135
    sget-object v19, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    .line 136
    .local v7, "showTeamName":Z
    if-eqz p1, :cond_0

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v19

    if-eqz v19, :cond_0

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v19

    if-eqz v19, :cond_0

    .line 137
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_3

    const/4 v7, 0x1

    .line 140
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00bc

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 141
    .local v2, "imageViewPotential":Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00be

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    .line 142
    .local v13, "textViewName":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00c7

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 143
    .local v8, "textViewAge":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00bf

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/TextView;

    .line 144
    .local v14, "textViewPositionFirst":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00c0

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/widget/TextView;

    .line 145
    .local v18, "textViewSeparatorPositionSecond":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00c1

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/TextView;

    .line 146
    .local v16, "textViewPositionSecond":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00c2

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/TextView;

    .line 147
    .local v17, "textViewSeparatorPositionMatch":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00c3

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/TextView;

    .line 148
    .local v15, "textViewPositionMatch":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00ca

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    .line 149
    .local v12, "textViewForm":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00cd

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 150
    .local v11, "textViewEnergy":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00ce

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 151
    .local v9, "textViewAverageText":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b00cf

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 160
    .local v10, "textViewAverageValue":Landroid/widget/TextView;
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    if-lez v19, :cond_5

    .line 161
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f02003b

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 162
    const/16 v19, 0x8

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 163
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 164
    const/16 v19, 0x8

    move/from16 v0, v19

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 165
    const/16 v19, 0x8

    invoke-virtual/range {v18 .. v19}, Landroid/widget/TextView;->setVisibility(I)V

    .line 166
    const/16 v19, 0x8

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 168
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_4

    .line 169
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v20

    const v21, 0x7f05002b

    invoke-virtual/range {v20 .. v21}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v20

    const v21, 0x7f05002d

    invoke-virtual/range {v20 .. v21}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 228
    :cond_1
    :goto_1
    const-string v3, ""

    .line 229
    .local v3, "name":Ljava/lang/String;
    if-eqz v7, :cond_2

    .line 230
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v19

    if-nez v19, :cond_11

    .line 231
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, "("

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getContext()Landroid/content/Context;

    move-result-object v20

    const v21, 0x7f050029

    invoke-virtual/range {v20 .. v21}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ") "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 236
    :cond_2
    :goto_2
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 237
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 238
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getStateForm()Ljava/lang/Integer;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 239
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getStateEnergy()Ljava/lang/Integer;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 240
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    return-void

    .line 137
    .end local v2    # "imageViewPotential":Landroid/widget/ImageView;
    .end local v3    # "name":Ljava/lang/String;
    .end local v8    # "textViewAge":Landroid/widget/TextView;
    .end local v9    # "textViewAverageText":Landroid/widget/TextView;
    .end local v10    # "textViewAverageValue":Landroid/widget/TextView;
    .end local v11    # "textViewEnergy":Landroid/widget/TextView;
    .end local v12    # "textViewForm":Landroid/widget/TextView;
    .end local v13    # "textViewName":Landroid/widget/TextView;
    .end local v14    # "textViewPositionFirst":Landroid/widget/TextView;
    .end local v15    # "textViewPositionMatch":Landroid/widget/TextView;
    .end local v16    # "textViewPositionSecond":Landroid/widget/TextView;
    .end local v17    # "textViewSeparatorPositionMatch":Landroid/widget/TextView;
    .end local v18    # "textViewSeparatorPositionSecond":Landroid/widget/TextView;
    :cond_3
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 171
    .restart local v2    # "imageViewPotential":Landroid/widget/ImageView;
    .restart local v8    # "textViewAge":Landroid/widget/TextView;
    .restart local v9    # "textViewAverageText":Landroid/widget/TextView;
    .restart local v10    # "textViewAverageValue":Landroid/widget/TextView;
    .restart local v11    # "textViewEnergy":Landroid/widget/TextView;
    .restart local v12    # "textViewForm":Landroid/widget/TextView;
    .restart local v13    # "textViewName":Landroid/widget/TextView;
    .restart local v14    # "textViewPositionFirst":Landroid/widget/TextView;
    .restart local v15    # "textViewPositionMatch":Landroid/widget/TextView;
    .restart local v16    # "textViewPositionSecond":Landroid/widget/TextView;
    .restart local v17    # "textViewSeparatorPositionMatch":Landroid/widget/TextView;
    .restart local v18    # "textViewSeparatorPositionSecond":Landroid/widget/TextView;
    :cond_4
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v20

    const v21, 0x7f05002b

    invoke-virtual/range {v20 .. v21}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getStateInjury()Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v20

    const v21, 0x7f05002c

    invoke-virtual/range {v20 .. v21}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 174
    :cond_5
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPotential()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 175
    .local v6, "potential":I
    const/16 v19, 0x9

    move/from16 v0, v19

    if-lt v6, v0, :cond_6

    .line 176
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f02004b

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 189
    :goto_3
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    if-eqz v19, :cond_b

    .line 191
    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Landroid/widget/TextView;->setVisibility(I)V

    .line 192
    const/16 v19, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 193
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 199
    :goto_4
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 200
    .local v5, "posTitular":I
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 201
    .local v4, "posReserve":I
    if-nez v7, :cond_e

    if-eqz v5, :cond_e

    .line 202
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move/from16 v0, v19

    if-ne v5, v0, :cond_c

    .line 203
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002d

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 211
    :goto_5
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002d

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 212
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002d

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_1

    .line 177
    .end local v4    # "posReserve":I
    .end local v5    # "posTitular":I
    :cond_6
    const/16 v19, 0x7

    move/from16 v0, v19

    if-lt v6, v0, :cond_7

    .line 178
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f02004a

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 179
    :cond_7
    const/16 v19, 0x5

    move/from16 v0, v19

    if-lt v6, v0, :cond_8

    .line 180
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f020049

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 181
    :cond_8
    const/16 v19, 0x3

    move/from16 v0, v19

    if-lt v6, v0, :cond_9

    .line 182
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f020048

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 183
    :cond_9
    const/16 v19, 0x1

    move/from16 v0, v19

    if-lt v6, v0, :cond_a

    .line 184
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f020047

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 186
    :cond_a
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f020046

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 195
    :cond_b
    const/16 v19, 0x8

    invoke-virtual/range {v18 .. v19}, Landroid/widget/TextView;->setVisibility(I)V

    .line 196
    const/16 v19, 0x8

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_4

    .line 204
    .restart local v4    # "posReserve":I
    .restart local v5    # "posTitular":I
    :cond_c
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move/from16 v0, v19

    if-ne v5, v0, :cond_d

    .line 205
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002d

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_5

    .line 207
    :cond_d
    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 208
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 209
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_5

    .line 213
    :cond_e
    if-nez v7, :cond_1

    if-eqz v4, :cond_1

    .line 214
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move/from16 v0, v19

    if-ne v4, v0, :cond_f

    .line 215
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002f

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 223
    :goto_6
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002f

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 224
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002f

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_1

    .line 216
    :cond_f
    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move/from16 v0, v19

    if-ne v4, v0, :cond_10

    .line 217
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f06002f

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getColor(I)I

    move-result v19

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_6

    .line 219
    :cond_10
    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 220
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 221
    invoke-virtual/range {p0 .. p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->getHomeActivity()Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v19

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_6

    .line 233
    .end local v4    # "posReserve":I
    .end local v5    # "posTitular":I
    .end local v6    # "potential":I
    .restart local v3    # "name":Ljava/lang/String;
    :cond_11
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, "("

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ") "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_2
.end method

.method private loadSeekBar(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;Ljava/lang/Integer;II)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "player"    # Lcom/blank/bm15/model/object/crud/Player;
    .param p3, "value"    # Ljava/lang/Integer;
    .param p4, "textViewId"    # I
    .param p5, "seekBarValueId"    # I

    .prologue
    .line 87
    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 88
    .local v1, "textViewValue":Landroid/widget/TextView;
    invoke-static {p3}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    invoke-virtual {p1, p5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    .line 91
    .local v0, "seekBarValue":Landroid/widget/SeekBar;
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setEnabled(Z)V

    .line 92
    const/16 v2, 0x62

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setMax(I)V

    .line 93
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 94
    new-instance v2, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;

    invoke-direct {v2, p0, p5, p2, v1}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;-><init>(Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;ILcom/blank/bm15/model/object/crud/Player;Landroid/widget/TextView;)V

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 125
    return-void
.end method

.method public static final newInstance(I)Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;
    .locals 4
    .param p0, "fragmentLayout"    # I

    .prologue
    .line 25
    new-instance v1, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;

    invoke-direct {v1}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;-><init>()V

    .line 27
    .local v1, "fragment":Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 28
    .local v0, "args":Landroid/os/Bundle;
    sget-object v2, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->FRAGMENT_LAYOUT:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 29
    sget-object v2, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->NAVIGATION_MODE_NULL:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 30
    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 32
    return-object v1
.end method

.method private updateAll(Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 4
    .param p1, "player"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 128
    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    const v3, 0x7f0b0039

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 129
    .local v0, "textViewAverageAttack":Landroid/widget/TextView;
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAttack()Ljava/lang/Double;

    move-result-object v2

    invoke-static {v2}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->rootView:Landroid/view/View;

    const v3, 0x7f0b0047

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 131
    .local v1, "textViewAverageDefense":Landroid/widget/TextView;
    invoke-virtual {p1}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillDefense()Ljava/lang/Double;

    move-result-object v2

    invoke-static {v2}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    return-void
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 37
    invoke-super {p0, p1, p2}, Lcom/blank/bm15/activity/base/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 38
    invoke-direct {p0}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->createPage()V

    .line 39
    return-void
.end method
