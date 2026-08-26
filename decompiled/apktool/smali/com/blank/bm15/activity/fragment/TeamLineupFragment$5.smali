.class Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;
.super Ljava/lang/Object;
.source "TeamLineupFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->onClickLineupPlayers(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

.field private final synthetic val$isTitular:Ljava/lang/Boolean;

.field private final synthetic val$matchPosition:I

.field private final synthetic val$team:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;Ljava/lang/Boolean;Lcom/blank/bm15/model/object/crud/Team;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;->this$0:Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;->val$isTitular:Ljava/lang/Boolean;

    iput-object p3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    iput p4, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;->val$matchPosition:I

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 162
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;->val$isTitular:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iget v2, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;->val$matchPosition:I

    invoke-virtual {v0, v1, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->setTitularPosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    .line 167
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 168
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;->this$0:Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->access$0(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;)V

    .line 169
    return-void

    .line 165
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iget v2, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$5;->val$matchPosition:I

    invoke-virtual {v0, v1, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->setReservePosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto :goto_0
.end method
