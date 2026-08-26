.class Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;
.super Ljava/lang/Object;
.source "PlayerSkillsFragment.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->loadSeekBar(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;Ljava/lang/Integer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;

.field private final synthetic val$player:Lcom/blank/bm15/model/object/crud/Player;

.field private final synthetic val$seekBarValueId:I

.field private final synthetic val$textViewValue:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;ILcom/blank/bm15/model/object/crud/Player;Landroid/widget/TextView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;

    iput p2, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$seekBarValueId:I

    iput-object p3, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    iput-object p4, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$textViewValue:Landroid/widget/TextView;

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 3
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 96
    add-int/lit8 v0, p2, 0x1

    .line 97
    .local v0, "newValue":I
    iget v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$seekBarValueId:I

    const v2, 0x7f0b004a

    if-ne v1, v2, :cond_1

    .line 98
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillPhysique(Ljava/lang/Integer;)V

    .line 114
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$textViewValue:Landroid/widget/TextView;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 116
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v1, v2}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->access$1(Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;Lcom/blank/bm15/model/object/crud/Player;)V

    .line 117
    return-void

    .line 99
    :cond_1
    iget v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$seekBarValueId:I

    const v2, 0x7f0b004d

    if-ne v1, v2, :cond_2

    .line 100
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillBlock(Ljava/lang/Integer;)V

    goto :goto_0

    .line 101
    :cond_2
    iget v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$seekBarValueId:I

    const v2, 0x7f0b0050

    if-ne v1, v2, :cond_3

    .line 102
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillRebound(Ljava/lang/Integer;)V

    goto :goto_0

    .line 103
    :cond_3
    iget v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$seekBarValueId:I

    const v2, 0x7f0b0053

    if-ne v1, v2, :cond_4

    .line 104
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillSteal(Ljava/lang/Integer;)V

    goto :goto_0

    .line 105
    :cond_4
    iget v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$seekBarValueId:I

    const v2, 0x7f0b003c

    if-ne v1, v2, :cond_5

    .line 106
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillPass(Ljava/lang/Integer;)V

    goto :goto_0

    .line 107
    :cond_5
    iget v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$seekBarValueId:I

    const v2, 0x7f0b003f

    if-ne v1, v2, :cond_6

    .line 108
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotInterior(Ljava/lang/Integer;)V

    goto :goto_0

    .line 109
    :cond_6
    iget v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$seekBarValueId:I

    const v2, 0x7f0b0042

    if-ne v1, v2, :cond_7

    .line 110
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotExterior(Ljava/lang/Integer;)V

    goto :goto_0

    .line 111
    :cond_7
    iget v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$seekBarValueId:I

    const v2, 0x7f0b0045

    if-ne v1, v2, :cond_0

    .line 112
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setSkillShotFree(Ljava/lang/Integer;)V

    goto/16 :goto_0
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 120
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 123
    return-void
.end method
