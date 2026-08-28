.class Lcom/blank/bm15/activity/fragment/TeamTacticFragment$3;
.super Ljava/lang/Object;
.source "TeamTacticFragment.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->createPage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/TeamTacticFragment;

.field private final synthetic val$team:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$3;->this$0:Lcom/blank/bm15/activity/fragment/TeamTacticFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 2
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 94
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    add-int/lit8 v1, p2, 0x23

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticShotIntPercent(Ljava/lang/Integer;)V

    .line 95
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 96
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 99
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 102
    return-void
.end method
