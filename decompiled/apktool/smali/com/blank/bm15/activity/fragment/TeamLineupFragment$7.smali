.class Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;
.super Ljava/lang/Object;
.source "TeamLineupFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->onClickLineupPlayers(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V
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
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

.field private final synthetic val$isTitular:Ljava/lang/Boolean;

.field private final synthetic val$listView:Landroid/widget/ListView;

.field private final synthetic val$matchPosition:I

.field private final synthetic val$team:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;Landroid/widget/ListView;Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Boolean;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->this$0:Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$listView:Landroid/widget/ListView;

    iput-object p3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    iput-object p4, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$isTitular:Ljava/lang/Boolean;

    iput p5, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$matchPosition:I

    .line 179
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
    .line 182
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v1, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 183
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getIsTitular()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 184
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    new-instance v2, Lcom/blank/bm15/model/object/crud/Player;

    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setTitularPosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    .line 189
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$isTitular:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 190
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    iget v2, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$matchPosition:I

    invoke-virtual {v1, v0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->setTitularPosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    .line 195
    :goto_1
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 196
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->this$0:Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->access$0(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;)V

    .line 197
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->this$0:Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->access$2(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    iget-object v1, v1, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->cancel()V

    .line 198
    return-void

    .line 185
    :cond_1
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getIsReserve()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 186
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    new-instance v2, Lcom/blank/bm15/model/object/crud/Player;

    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePosition(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/blank/bm15/model/object/crud/Tactic;->setReservePosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto :goto_0

    .line 192
    :cond_2
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    iget v2, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$7;->val$matchPosition:I

    invoke-virtual {v1, v0, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->setReservePosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto :goto_1
.end method
