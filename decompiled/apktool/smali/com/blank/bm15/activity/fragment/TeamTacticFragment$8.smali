.class Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;
.super Ljava/lang/Object;
.source "TeamTacticFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->onClickTacticStarPlayers(Landroid/widget/Button;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/TeamTacticFragment;

.field private final synthetic val$importance:I

.field private final synthetic val$listView:Landroid/widget/ListView;

.field private final synthetic val$team:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;Landroid/widget/ListView;ILcom/blank/bm15/model/object/crud/Team;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->this$0:Lcom/blank/bm15/activity/fragment/TeamTacticFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$listView:Landroid/widget/ListView;

    iput p3, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$importance:I

    iput-object p4, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    .line 200
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "arg3"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    const/4 v3, 0x0

    .line 203
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v1, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 204
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    iget v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$importance:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_2

    .line 205
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarOne(Ljava/lang/Integer;)V

    .line 206
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarTwo()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarTwo()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 207
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarTwo(Ljava/lang/Integer;)V

    .line 226
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 227
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->this$0:Lcom/blank/bm15/activity/fragment/TeamTacticFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->access$2(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    iget-object v1, v1, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->cancel()V

    .line 228
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->this$0:Lcom/blank/bm15/activity/fragment/TeamTacticFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->access$1(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;)V

    .line 229
    return-void

    .line 208
    :cond_1
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarThree()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarThree()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 209
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarThree(Ljava/lang/Integer;)V

    goto :goto_0

    .line 211
    :cond_2
    iget v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$importance:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_4

    .line 212
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarTwo(Ljava/lang/Integer;)V

    .line 213
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarOne()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarOne()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_3

    .line 214
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarOne(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 215
    :cond_3
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarThree()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarThree()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 216
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarThree(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 218
    :cond_4
    iget v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$importance:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 219
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarThree(Ljava/lang/Integer;)V

    .line 220
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarOne()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarOne()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_5

    .line 221
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarOne(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 222
    :cond_5
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarTwo()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTacticStarTwo()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 223
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$8;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setTacticStarTwo(Ljava/lang/Integer;)V

    goto/16 :goto_0
.end method
