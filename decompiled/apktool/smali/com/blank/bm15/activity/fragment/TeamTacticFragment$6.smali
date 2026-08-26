.class Lcom/blank/bm15/activity/fragment/TeamTacticFragment$6;
.super Ljava/lang/Object;
.source "TeamTacticFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->onClickTacticStarPlayers(Landroid/widget/Button;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/TeamTacticFragment;

.field private final synthetic val$importance:I

.field private final synthetic val$team:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;ILcom/blank/bm15/model/object/crud/Team;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TeamTacticFragment;

    iput p2, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$6;->val$importance:I

    iput-object p3, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$6;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    const/4 v2, 0x0

    .line 179
    iget v0, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$6;->val$importance:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 180
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$6;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarOne(Ljava/lang/Integer;)V

    .line 186
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$6;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 187
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TeamTacticFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->access$1(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;)V

    .line 188
    return-void

    .line 181
    :cond_1
    iget v0, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$6;->val$importance:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 182
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$6;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarTwo(Ljava/lang/Integer;)V

    goto :goto_0

    .line 183
    :cond_2
    iget v0, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$6;->val$importance:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 184
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$6;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarThree(Ljava/lang/Integer;)V

    goto :goto_0
.end method
